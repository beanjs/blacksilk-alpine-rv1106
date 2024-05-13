// Copyright 2021 Rockchip Electronics Co., Ltd. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.
#include "isp.h"
#include "common.h"
#include "rk_gpio.h"

#include <rk_aiq_user_api_camgroup.h>
#include <rk_aiq_user_api_imgproc.h>
#include <rk_aiq_user_api_sysctl.h>
#ifndef COMPILE_FOR_RV1126_RKMEDIA
#include <rk_mpi_vi.h>
#endif

#ifdef LOG_TAG
#undef LOG_TAG
#endif
#define LOG_TAG "isp.c"

#define MAX_SCENARIO_NUM 2
#define MAX_AIQ_CTX 4
#define FPS 30

static int current_scenario_id = 0;
char g_iq_file_dir_[256];
char main_scene[32];
char sub_scene[32];
static int rkipc_aiq_use_group = 0;
static rk_aiq_sys_ctx_t *g_aiq_ctx[MAX_AIQ_CTX];
static rk_aiq_camgroup_ctx_t *g_camera_group_ctx[MAX_AIQ_CTX];
rk_aiq_working_mode_t g_WDRMode[MAX_AIQ_CTX];
rk_aiq_wb_gain_t gs_wb_gain = {2.083900, 1.000000, 1.000000, 2.018500};
rk_aiq_working_mode_t g_aiq_mode = RK_AIQ_WORKING_MODE_NORMAL;

#define RK_ISP_CHECK_CAMERA_ID(CAMERA_ID)                                                          \
	do {                                                                                           \
		if (rkipc_aiq_use_group) {                                                                 \
			if (CAMERA_ID >= MAX_AIQ_CTX || !g_camera_group_ctx[CAMERA_ID]) {                      \
				LOG_ERROR("camera_group_id is over 3 or not init\n");                              \
				return -1;                                                                         \
			}                                                                                      \
		} else {                                                                                   \
			if (CAMERA_ID >= MAX_AIQ_CTX || !g_aiq_ctx[CAMERA_ID]) {                               \
				LOG_ERROR("camera_id is over 3 or not init\n");                                    \
				return -1;                                                                         \
			}                                                                                      \
		}                                                                                          \
	} while (0)

rk_aiq_sys_ctx_t *rkipc_aiq_get_ctx(int cam_id) {
	if (rkipc_aiq_use_group)
		return (rk_aiq_sys_ctx_t *)g_camera_group_ctx[cam_id];

	return g_aiq_ctx[cam_id];
}

int rkipc_get_scenario_id(int cam_id) {
	int scenario_id = cam_id * MAX_SCENARIO_NUM + current_scenario_id;
	return scenario_id;
}

int sample_common_isp_init(int cam_id, rk_aiq_working_mode_t WDRMode, bool MultiCam,
                           const char *iq_file_dir) {
	if (cam_id >= MAX_AIQ_CTX) {
		LOG_ERROR("%s : cam_id is over 3\n", __FUNCTION__);
		return -1;
	}
	setlinebuf(stdout);
	if (iq_file_dir == NULL) {
		LOG_ERROR("rk_isp_init : not start.\n");
		g_aiq_ctx[cam_id] = NULL;
		return 0;
	}

	// must set HDR_MODE, before init
	g_WDRMode[cam_id] = WDRMode;
	char hdr_str[16];
	snprintf(hdr_str, sizeof(hdr_str), "%d", (int)WDRMode);
	setenv("HDR_MODE", hdr_str, 1);

	rk_aiq_sys_ctx_t *aiq_ctx;
	rk_aiq_static_info_t aiq_static_info;
	rk_aiq_uapi_sysctl_enumStaticMetas(cam_id, &aiq_static_info);

	LOG_INFO("ID: %d, sensor_name is %s, iq_file_dir is %s\n", cam_id,
	         aiq_static_info.sensor_info.sensor_name, iq_file_dir);

	aiq_ctx =
	    rk_aiq_uapi_sysctl_init(aiq_static_info.sensor_info.sensor_name, iq_file_dir, NULL, NULL);
	if (MultiCam)
		rk_aiq_uapi_sysctl_setMulCamConc(aiq_ctx, true);

	g_aiq_ctx[cam_id] = aiq_ctx;

	return 0;
}

int sample_common_isp_run(int cam_id) {
	RK_ISP_CHECK_CAMERA_ID(cam_id);
	if (rk_aiq_uapi_sysctl_prepare(g_aiq_ctx[cam_id], 0, 0, g_WDRMode[cam_id])) {
		LOG_ERROR("rkaiq engine prepare failed !\n");
		g_aiq_ctx[cam_id] = NULL;
		return -1;
	}
	LOG_INFO("rk_aiq_uapi_sysctl_init/prepare succeed\n");
	if (rk_aiq_uapi_sysctl_start(g_aiq_ctx[cam_id])) {
		LOG_ERROR("rk_aiq_uapi_sysctl_start  failed\n");
		return -1;
	}
	LOG_INFO("rk_aiq_uapi_sysctl_start succeed\n");
	return 0;
}

int sample_common_isp_stop(int cam_id) {
	RK_ISP_CHECK_CAMERA_ID(cam_id);
	LOG_INFO("rk_aiq_uapi_sysctl_stop enter\n");
	rk_aiq_uapi_sysctl_stop(g_aiq_ctx[cam_id], false);
	LOG_INFO("rk_aiq_uapi_sysctl_deinit enter\n");
	rk_aiq_uapi_sysctl_deinit(g_aiq_ctx[cam_id]);
	LOG_INFO("rk_aiq_uapi_sysctl_deinit exit\n");
	g_aiq_ctx[cam_id] = NULL;
	return 0;
}

int isp_camera_group_init(int cam_group_id, rk_aiq_working_mode_t WDRMode, bool MultiCam,
                          const char *iq_file_dir) {
	int ret;
	rk_aiq_static_info_t aiq_static_info;
	char sensor_name_array[MAX_AIQ_CTX][128];
	rk_aiq_camgroup_instance_cfg_t camgroup_cfg;
	memset(&camgroup_cfg, 0, sizeof(camgroup_cfg));

	camgroup_cfg.sns_num = rk_param_get_int("avs:sensor_num", 6);
	LOG_INFO("camgroup_cfg.sns_num is %d\n", camgroup_cfg.sns_num);
	for (int i = 0; i < camgroup_cfg.sns_num; i++) {
		rk_aiq_uapi_sysctl_enumStaticMetasByPhyId(i, &aiq_static_info);
		LOG_INFO("cam_group_id:%d, cam_id: %d, sensor_name is %s, iqfiles is %s\n", cam_group_id, i,
		         aiq_static_info.sensor_info.sensor_name, iq_file_dir);
		memcpy(sensor_name_array[i], aiq_static_info.sensor_info.sensor_name,
		       strlen(aiq_static_info.sensor_info.sensor_name) + 1);
		camgroup_cfg.sns_ent_nm_array[i] = sensor_name_array[i];
		LOG_INFO("camgroup_cfg.sns_ent_nm_array[%d] is %s\n", i, camgroup_cfg.sns_ent_nm_array[i]);
		// rk_aiq_uapi_sysctl_preInit_devBufCnt(aiq_static_info.sensor_info.sensor_name, "rkraw_rx",
		//                                       2);
		// if (WDRMode == RK_AIQ_WORKING_MODE_NORMAL)
		// 	ret = rk_aiq_uapi_sysctl_preInit_scene(aiq_static_info.sensor_info.sensor_name,
		// 	                                        "normal", "day");
		// else
		// 	ret = rk_aiq_uapi_sysctl_preInit_scene(aiq_static_info.sensor_info.sensor_name, "hdr",
		// 	                                        "day");
		if (ret < 0)
			LOG_ERROR("%s: failed to set scene\n", aiq_static_info.sensor_info.sensor_name);
	}

	camgroup_cfg.config_file_dir = iq_file_dir;
	g_camera_group_ctx[cam_group_id] = rk_aiq_uapi_camgroup_create(&camgroup_cfg);
	if (!g_camera_group_ctx[cam_group_id]) {
		LOG_ERROR("create camgroup ctx error!\n");
		return -1;
	}
	LOG_INFO("rk_aiq_uapi_camgroup_create over\n");
	LOG_INFO("g_camera_group_ctx[cam_group_id] is %p\n", g_camera_group_ctx[cam_group_id]);

	// rv1126 must enable Ldch if you want to dymamic open and close.
	rk_aiq_ldch_attrib_t ldchAttr;
	memset(&ldchAttr, 0, sizeof(rk_aiq_ldch_attrib_t));
	ret = rk_aiq_user_api_aldch_GetAttrib((rk_aiq_sys_ctx_t *)g_camera_group_ctx[cam_group_id],
	                                      &ldchAttr);
	if (ret != RK_SUCCESS) {
		LOG_ERROR("rk_aiq_user_api_aldch_GetAttrib fail:%d", ret);
	}
	ldchAttr.en = true;
	ldchAttr.correct_level = 1;
	ret = rk_aiq_user_api_aldch_SetAttrib((rk_aiq_sys_ctx_t *)g_camera_group_ctx[cam_group_id],
	                                      ldchAttr);
	if (ret != RK_SUCCESS) {
		LOG_ERROR("rk_aiq_user_api_aldch_SetAttrib fail:%d", ret);
	}

	ret = rk_aiq_uapi_camgroup_prepare((rk_aiq_camgroup_ctx_t *)g_camera_group_ctx[cam_group_id],
	                                   WDRMode);
	LOG_INFO("rk_aiq_uapi_camgroup_prepare over\n");
	ret |= rk_aiq_uapi_camgroup_start((rk_aiq_camgroup_ctx_t *)g_camera_group_ctx[cam_group_id]);
	LOG_INFO("rk_aiq_uapi_camgroup_start over\n");

	return ret;
}

int isp_camera_group_stop(int cam_group_id) {
	RK_ISP_CHECK_CAMERA_ID(cam_group_id);
	LOG_INFO("rk_aiq_uapi_camgroup_stop enter\n");
	rk_aiq_uapi_camgroup_stop((rk_aiq_camgroup_ctx_t *)g_camera_group_ctx[cam_group_id]);
	LOG_INFO("rk_aiq_uapi_camgroup_destroy enter\n");
	rk_aiq_uapi_camgroup_destroy((rk_aiq_camgroup_ctx_t *)g_camera_group_ctx[cam_group_id]);
	LOG_INFO("rk_aiq_uapi_camgroup_destroy exit\n");
	g_camera_group_ctx[cam_group_id] = NULL;

	return 0;
}

int rk_isp_get_frame_rate(int cam_id, int *value) {
	RK_ISP_CHECK_CAMERA_ID(cam_id);
	char entry[128] = {'\0'};
	snprintf(entry, 127, "isp.%d.adjustment:fps", cam_id);
	*value = rk_param_get_int(entry, -1);

	return 0;
}

int rk_isp_set_frame_rate(int cam_id, int value) {
	RK_ISP_CHECK_CAMERA_ID(cam_id);
	int ret = 0;
	char entry[128] = {'\0'};

	LOG_DEBUG("start %d\n", value);
	frameRateInfo_t info;
	info.mode = OP_MANUAL;
	info.fps = value;
	ret = rk_aiq_uapi_setFrameRate(rkipc_aiq_get_ctx(cam_id), info);
	LOG_DEBUG("end, %d\n", value);

	snprintf(entry, 127, "isp.%d.adjustment:fps", rkipc_get_scenario_id(cam_id));
	rk_param_set_int(entry, value);

	return ret;
}

int rk_isp_set_frame_rate_without_ini(int cam_id, int value) {
	RK_ISP_CHECK_CAMERA_ID(cam_id);
	int ret;

	LOG_DEBUG("start %d\n", value);
	frameRateInfo_t info;
	info.mode = OP_MANUAL;
	info.fps = value;
	ret = rk_aiq_uapi_setFrameRate(rkipc_aiq_get_ctx(cam_id), info);
	LOG_DEBUG("end, %d\n", value);

	return 0;
}

// isp scenario

int rk_isp_get_scenario(int cam_id, const char **value) {
	*value = rk_param_get_string("isp:scenario", NULL);

	return 0;
}

int rk_isp_set_scenario(int cam_id, const char *value) {
	if (!strcmp(value, "normal")) {
		current_scenario_id = 0;
		strcpy(sub_scene, rk_param_get_string("isp:normal_scene", "day"));
	} else if (!strcmp(value, "custom1")) {
		current_scenario_id = 1;
		strcpy(sub_scene, rk_param_get_string("isp:custom1_scene", "night"));
	}
	LOG_INFO("main_scene is %s, sub_scene is %s\n", main_scene, sub_scene);
	// rk_aiq_uapi2_sysctl_switch_scene(rkipc_aiq_get_ctx(cam_id), main_scene, sub_scene);

	if (rk_param_get_int("isp:init_form_ini", 1))
		rk_isp_set_from_ini(0);
	rk_param_set_string("isp:scenario", value);

	return 0;
}

// image adjustment

int rk_isp_get_contrast(int cam_id, int *value) {
	RK_ISP_CHECK_CAMERA_ID(cam_id);
	// int ret = rk_aiq_uapi_getContrast(rkipc_aiq_get_ctx(cam_id), value);
	// *value = (int)(*value / 2.55);
	char entry[128] = {'\0'};
	snprintf(entry, 127, "isp.%d.adjustment:contrast", cam_id);
	*value = rk_param_get_int(entry, -1);

	return 0;
}

int rk_isp_set_contrast(int cam_id, int value) {
	RK_ISP_CHECK_CAMERA_ID(cam_id);
	int ret =
	    rk_aiq_uapi_setContrast(rkipc_aiq_get_ctx(cam_id), (int)(value * 2.55)); // value[0,255]
	char entry[128] = {'\0'};
	snprintf(entry, 127, "isp.%d.adjustment:contrast", cam_id);
	rk_param_set_int(entry, value);

	return ret;
}

int rk_isp_get_brightness(int cam_id, int *value) {
	RK_ISP_CHECK_CAMERA_ID(cam_id);
	// int ret = rk_aiq_uapi_getBrightness(rkipc_aiq_get_ctx(cam_id), value);
	// *value = (int)(*value / 2.55);
	char entry[128] = {'\0'};
	snprintf(entry, 127, "isp.%d.adjustment:brightness", cam_id);
	*value = rk_param_get_int(entry, -1);

	return 0;
}

int rk_isp_set_brightness(int cam_id, int value) {
	RK_ISP_CHECK_CAMERA_ID(cam_id);
	int ret =
	    rk_aiq_uapi_setBrightness(rkipc_aiq_get_ctx(cam_id), (int)(value * 2.55)); // value[0,255]
	char entry[128] = {'\0'};
	snprintf(entry, 127, "isp.%d.adjustment:brightness", cam_id);
	rk_param_set_int(entry, value);

	return ret;
}

int rk_isp_get_saturation(int cam_id, int *value) {
	RK_ISP_CHECK_CAMERA_ID(cam_id);
	// int ret = rk_aiq_uapi_getSaturation(rkipc_aiq_get_ctx(cam_id), value);
	// *value = (int)(*value / 2.55);
	char entry[128] = {'\0'};
	snprintf(entry, 127, "isp.%d.adjustment:saturation", cam_id);
	*value = rk_param_get_int(entry, -1);

	return 0;
}

int rk_isp_set_saturation(int cam_id, int value) {
	RK_ISP_CHECK_CAMERA_ID(cam_id);
	int ret =
	    rk_aiq_uapi_setSaturation(rkipc_aiq_get_ctx(cam_id), (int)(value * 2.55)); // value[0,255]
	char entry[128] = {'\0'};
	snprintf(entry, 127, "isp.%d.adjustment:saturation", cam_id);
	rk_param_set_int(entry, value);

	return ret;
}

int rk_isp_get_sharpness(int cam_id, int *value) {
	RK_ISP_CHECK_CAMERA_ID(cam_id);
	// int ret = rk_aiq_uapi_getSharpness(rkipc_aiq_get_ctx(cam_id), value);
	char entry[128] = {'\0'};
	snprintf(entry, 127, "isp.%d.adjustment:sharpness", cam_id);
	*value = rk_param_get_int(entry, -1);

	return 0;
}

int rk_isp_set_sharpness(int cam_id, int value) {
	RK_ISP_CHECK_CAMERA_ID(cam_id);
	int ret = rk_aiq_uapi_setSharpness(rkipc_aiq_get_ctx(cam_id), value); // value[0,100]
	char entry[128] = {'\0'};
	snprintf(entry, 127, "isp.%d.adjustment:sharpness", cam_id);
	rk_param_set_int(entry, value);

	return ret;
}

int rk_isp_get_hue(int cam_id, int *value) {
	RK_ISP_CHECK_CAMERA_ID(cam_id);
	// int ret = rk_aiq_uapi_getHue(rkipc_aiq_get_ctx(cam_id), value);
	// *value = (int)(*value / 2.55);
	char entry[128] = {'\0'};
	snprintf(entry, 127, "isp.%d.adjustment:hue", cam_id);
	*value = rk_param_get_int(entry, -1);

	return 0;
}

int rk_isp_set_hue(int cam_id, int value) {
	RK_ISP_CHECK_CAMERA_ID(cam_id);
	int ret = rk_aiq_uapi_setHue(rkipc_aiq_get_ctx(cam_id), (int)(value * 2.55)); // value[0,255]
	char entry[128] = {'\0'};
	snprintf(entry, 127, "isp.%d.adjustment:hue", cam_id);
	rk_param_set_int(entry, value);

	return ret;
}

// exposure
int rk_isp_get_exposure_mode(int cam_id, const char **value) {
	RK_ISP_CHECK_CAMERA_ID(cam_id);
	char entry[128] = {'\0'};
	snprintf(entry, 127, "isp.%d.exposure:exposure_mode", cam_id);
	*value = rk_param_get_string(entry, NULL);

	return 0;
}

int rk_isp_set_exposure_mode(int cam_id, const char *value) {
	RK_ISP_CHECK_CAMERA_ID(cam_id);
	Uapi_ExpSwAttr_t stExpSwAttr;
	rk_aiq_user_api_ae_getExpSwAttr(rkipc_aiq_get_ctx(cam_id), &stExpSwAttr);
	if (!strcmp(value, "auto")) {
		stExpSwAttr.AecOpType = RK_AIQ_OP_MODE_AUTO;
	} else {
		if (g_WDRMode[cam_id] != RK_AIQ_WORKING_MODE_NORMAL) {
			stExpSwAttr.AecOpType = RK_AIQ_OP_MODE_MANUAL;
			stExpSwAttr.stManual.stHdrMe.ManualGainEn = true;
			stExpSwAttr.stManual.stHdrMe.ManualTimeEn = true;
		} else {
			stExpSwAttr.AecOpType = RK_AIQ_OP_MODE_MANUAL;
			stExpSwAttr.stManual.stLinMe.ManualGainEn = true;
			stExpSwAttr.stManual.stLinMe.ManualTimeEn = true;
		}
	}
	int ret = rk_aiq_user_api_ae_setExpSwAttr(rkipc_aiq_get_ctx(cam_id), stExpSwAttr);
	char entry[128] = {'\0'};
	snprintf(entry, 127, "isp.%d.exposure:exposure_mode", cam_id);
	rk_param_set_string(entry, value);

	return 0;
}

int rk_isp_get_gain_mode(int cam_id, const char **value) {
	RK_ISP_CHECK_CAMERA_ID(cam_id);
	char entry[128] = {'\0'};
	snprintf(entry, 127, "isp.%d.exposure:gain_mode", cam_id);
	*value = rk_param_get_string(entry, NULL);

	return 0;
}

int rk_isp_set_gain_mode(int cam_id, const char *value) {
	RK_ISP_CHECK_CAMERA_ID(cam_id);
	Uapi_ExpSwAttr_t stExpSwAttr;

	rk_aiq_user_api_ae_getExpSwAttr(rkipc_aiq_get_ctx(cam_id), &stExpSwAttr);
	if (!strcmp(value, "auto")) {
		stExpSwAttr.stManual.stLinMe.ManualGainEn = false;
		stExpSwAttr.stManual.stHdrMe.ManualGainEn = false;
	} else {
		stExpSwAttr.stManual.stLinMe.ManualGainEn = true;
		stExpSwAttr.stManual.stHdrMe.ManualGainEn = true;
	}
	int ret = rk_aiq_user_api_ae_setExpSwAttr(rkipc_aiq_get_ctx(cam_id), stExpSwAttr);
	char entry[128] = {'\0'};
	snprintf(entry, 127, "isp.%d.exposure:gain_mode", cam_id);
	rk_param_set_string(entry, value);

	return ret;
}

int rk_isp_get_exposure_time(int cam_id, const char **value) {
	RK_ISP_CHECK_CAMERA_ID(cam_id);
	char entry[128] = {'\0'};
	snprintf(entry, 127, "isp.%d.exposure:exposure_time", cam_id);
	*value = rk_param_get_string(entry, NULL);

	return 0;
}

int rk_isp_set_exposure_time(int cam_id, const char *value) {
	RK_ISP_CHECK_CAMERA_ID(cam_id);
	Uapi_ExpSwAttr_t stExpSwAttr;
	float den, num, result;
	if (strchr(value, '/') == NULL) {
		den = 1;
		sscanf(value, "%f", &result);
	} else {
		sscanf(value, "%f/%f", &num, &den);
		result = num / den;
	}
	rk_aiq_user_api_ae_getExpSwAttr(rkipc_aiq_get_ctx(cam_id), &stExpSwAttr);
	stExpSwAttr.stManual.stLinMe.TimeValue = result;
	stExpSwAttr.stManual.stHdrMe.TimeValue.fCoeff[0] = result;
	stExpSwAttr.stManual.stHdrMe.TimeValue.fCoeff[1] = result;
	stExpSwAttr.stManual.stHdrMe.TimeValue.fCoeff[2] = result;
	int ret = rk_aiq_user_api_ae_setExpSwAttr(rkipc_aiq_get_ctx(cam_id), stExpSwAttr);
	char entry[128] = {'\0'};
	snprintf(entry, 127, "isp.%d.exposure:exposure_time", cam_id);
	rk_param_set_string(entry, value);

	return ret;
}

int rk_isp_get_exposure_gain(int cam_id, int *value) {
	RK_ISP_CHECK_CAMERA_ID(cam_id);
	char entry[128] = {'\0'};
	snprintf(entry, 127, "isp.%d.exposure:exposure_gain", cam_id);
	*value = rk_param_get_int(entry, -1);

	return 0;
}

int rk_isp_set_exposure_gain(int cam_id, int value) {
	RK_ISP_CHECK_CAMERA_ID(cam_id);
	Uapi_ExpSwAttr_t stExpSwAttr;
	float gain_set = (value * 1.0f);
	rk_aiq_user_api_ae_getExpSwAttr(rkipc_aiq_get_ctx(cam_id), &stExpSwAttr);
	stExpSwAttr.stManual.stLinMe.GainValue = gain_set;
	stExpSwAttr.stManual.stHdrMe.GainValue.fCoeff[0] = gain_set;
	stExpSwAttr.stManual.stHdrMe.GainValue.fCoeff[1] = gain_set;
	stExpSwAttr.stManual.stHdrMe.GainValue.fCoeff[2] = gain_set;
	int ret = rk_aiq_user_api_ae_setExpSwAttr(rkipc_aiq_get_ctx(cam_id), stExpSwAttr);
	char entry[128] = {'\0'};
	snprintf(entry, 127, "isp.%d.exposure:exposure_gain", cam_id);
	rk_param_set_int(entry, value);

	return ret;
}

int rk_isp_enable_ircut(bool on) {
	int ret, open_gpio, close_gpio;

	open_gpio = rk_param_get_int("isp:ircut_open_gpio", -1);
	close_gpio = rk_param_get_int("isp:ircut_close_gpio", -1);
	if ((open_gpio < 0) || (close_gpio < 0)) {
		LOG_ERROR("fail get gpio form ini file\n");
		return -1;
	}
	ret = rk_gpio_export_direction(open_gpio, false);
	ret |= rk_gpio_export_direction(close_gpio, false);

	if (on) {
		rk_gpio_set_value(open_gpio, 1);
		usleep(100 * 1000);
		rk_gpio_set_value(open_gpio, 0);

	} else {
		rk_gpio_set_value(close_gpio, 1);
		usleep(100 * 1000);
		rk_gpio_set_value(close_gpio, 0);
	}

	rk_gpio_unexport(open_gpio);
	rk_gpio_unexport(close_gpio);

	return ret;
}

// night_to_day
int rk_isp_get_night_to_day(int cam_id, const char **value) {
	RK_ISP_CHECK_CAMERA_ID(cam_id);
	char entry[128] = {'\0'};
	snprintf(entry, 127, "isp.%d.night_to_day:night_to_day", cam_id);
	*value = rk_param_get_string(entry, NULL);

	return 0;
}

int rk_isp_set_night_to_day(int cam_id, const char *value) {
	int ret;
	RK_ISP_CHECK_CAMERA_ID(cam_id);
	rk_aiq_gray_mode_t gray_mode;
	if (!strcmp(value, "day")) {
		gray_mode = RK_AIQ_GRAY_MODE_OFF;
		rk_isp_enable_ircut(true);
		ret = rk_aiq_uapi_setGrayMode(rkipc_aiq_get_ctx(cam_id), gray_mode);
	} else if (!strcmp(value, "night")) {
		gray_mode = RK_AIQ_GRAY_MODE_ON;
		ret = rk_aiq_uapi_setGrayMode(rkipc_aiq_get_ctx(cam_id), gray_mode);
		rk_isp_enable_ircut(false);
	}
	LOG_INFO("gray_mode is %d\n", gray_mode);
	char entry[128] = {'\0'};
	snprintf(entry, 127, "isp.%d.night_to_day:night_to_day", cam_id);
	rk_param_set_string(entry, value);

	return ret;
}

int rk_isp_get_fill_light_mode(int cam_id, const char **value) {
	RK_ISP_CHECK_CAMERA_ID(cam_id);
	char entry[128] = {'\0'};
	snprintf(entry, 127, "isp.%d.night_to_day:fill_light_mode", cam_id);
	*value = rk_param_get_string(entry, NULL);

	return 0;
}

int rk_isp_set_fill_light_mode(int cam_id, const char *value) {
	int ret;
	RK_ISP_CHECK_CAMERA_ID(cam_id);
	rk_aiq_cpsl_cfg_t cpsl_cfg;
	if (!strcmp(value, "IR")) {
		cpsl_cfg.lght_src = RK_AIQ_CPSLS_IR;
	} else if (!strcmp(value, "LED")) {
		cpsl_cfg.lght_src = RK_AIQ_CPSLS_LED;
	}
	ret = rk_aiq_uapi_sysctl_setCpsLtCfg(rkipc_aiq_get_ctx(cam_id), &cpsl_cfg);
	char entry[128] = {'\0'};
	snprintf(entry, 127, "isp.%d.night_to_day:fill_light_mode", cam_id);
	rk_param_set_string(entry, value);

	return ret;
}

int rk_isp_get_light_brightness(int cam_id, int *value) {
	RK_ISP_CHECK_CAMERA_ID(cam_id);
	char entry[128] = {'\0'};
	snprintf(entry, 127, "isp.%d.night_to_day:light_brightness", cam_id);
	*value = rk_param_get_int(entry, -1);

	return 0;
}

int rk_isp_set_light_brightness(int cam_id, int value) {
	int ret;
	RK_ISP_CHECK_CAMERA_ID(cam_id);
	rk_aiq_cpsl_cfg_t cpsl_cfg;
	cpsl_cfg.u.m.strength_led = value;
	cpsl_cfg.u.m.strength_ir = value;
	ret = rk_aiq_uapi_sysctl_setCpsLtCfg(rkipc_aiq_get_ctx(cam_id), &cpsl_cfg);
	char entry[128] = {'\0'};
	snprintf(entry, 127, "isp.%d.night_to_day:light_brightness", cam_id);
	rk_param_set_int(entry, value);

	return ret;
}

int rk_isp_get_night_to_day_filter_level(int cam_id, int *value) {
	RK_ISP_CHECK_CAMERA_ID(cam_id);
	char entry[128] = {'\0'};
	snprintf(entry, 127, "isp.%d.night_to_day:night_to_day_filter_level",
	         rkipc_aiq_get_ctx(cam_id));
	*value = rk_param_get_int(entry, -1);

	return 0;
}

int rk_isp_set_night_to_day_filter_level(int cam_id, int value) {
	int ret;
	RK_ISP_CHECK_CAMERA_ID(cam_id);
	// TODO
	char entry[128] = {'\0'};
	snprintf(entry, 127, "isp.%d.night_to_day:night_to_day_filter_level",
	         rkipc_aiq_get_ctx(cam_id));
	rk_param_set_int(entry, value);

	return ret;
}

int rk_isp_get_night_to_day_filter_time(int cam_id, int *value) {
	RK_ISP_CHECK_CAMERA_ID(cam_id);
	char entry[128] = {'\0'};
	snprintf(entry, 127, "isp.%d.night_to_day:night_to_day_filter_time", rkipc_aiq_get_ctx(cam_id));
	*value = rk_param_get_int(entry, -1);

	return 0;
}

int rk_isp_set_night_to_day_filter_time(int cam_id, int value) {
	int ret;
	RK_ISP_CHECK_CAMERA_ID(cam_id);
	// TODO
	char entry[128] = {'\0'};
	snprintf(entry, 127, "isp.%d.night_to_day:night_to_day_filter_time", rkipc_aiq_get_ctx(cam_id));
	rk_param_set_int(entry, value);

	return ret;
}

// blc
int rk_isp_get_hdr(int cam_id, const char **value) {
	RK_ISP_CHECK_CAMERA_ID(cam_id);
	char entry[128] = {'\0'};
	snprintf(entry, 127, "isp.%d.blc:hdr", cam_id);
	*value = rk_param_get_string(entry, NULL);

	return 0;
}

int rk_isp_set_hdr(int cam_id, const char *value) {
	int ret;
	RK_ISP_CHECK_CAMERA_ID(cam_id);
	const char *old_value = NULL;
	rk_isp_get_hdr(cam_id, &old_value);
	LOG_INFO("cam_id is %d, value is %s, old_value is %s\n", cam_id, value, old_value);

	if (!strcmp(value, old_value))
		return 0;

	if (!strcmp(value, "close")) {
		ret = rk_aiq_uapi_sysctl_swWorkingModeDyn(rkipc_aiq_get_ctx(cam_id),
		                                          RK_AIQ_WORKING_MODE_NORMAL);
	} else if (!strcmp(value, "HDR2")) {
		ret = rk_aiq_uapi_sysctl_swWorkingModeDyn(rkipc_aiq_get_ctx(cam_id),
		                                          RK_AIQ_WORKING_MODE_ISP_HDR2);
	} else if (!strcmp(value, "HDR3")) {
		ret = rk_aiq_uapi_sysctl_swWorkingModeDyn(rkipc_aiq_get_ctx(cam_id),
		                                          RK_AIQ_WORKING_MODE_ISP_HDR3);
	}

	char entry[128] = {'\0'};
	snprintf(entry, 127, "isp.%d.blc:hdr", cam_id);
	rk_param_set_string(entry, value);

	return ret;
}

int rk_isp_get_blc_region(int cam_id, const char **value) {
	RK_ISP_CHECK_CAMERA_ID(cam_id);
	char entry[128] = {'\0'};
	snprintf(entry, 127, "isp.%d.blc:blc_region", cam_id);
	*value = rk_param_get_string(entry, NULL);

	return 0;
}

int rk_isp_set_blc_region(int cam_id, const char *value) {
	int ret;
	RK_ISP_CHECK_CAMERA_ID(cam_id);
	if (!strcmp(value, "close")) {
		ret = rk_aiq_uapi_setBLCMode(rkipc_aiq_get_ctx(cam_id), false, AE_MEAS_AREA_AUTO);
	} else if (!strcmp(value, "open")) {
		ret = rk_aiq_uapi_setBLCMode(rkipc_aiq_get_ctx(cam_id), true, AE_MEAS_AREA_AUTO);
	}

	char entry[128] = {'\0'};
	snprintf(entry, 127, "isp.%d.blc:blc_region", cam_id);
	rk_param_set_string(entry, value);

	return ret;
}

int rk_isp_get_hlc(int cam_id, const char **value) {
	RK_ISP_CHECK_CAMERA_ID(cam_id);
	char entry[128] = {'\0'};
	snprintf(entry, 127, "isp.%d.blc:hlc", cam_id);
	*value = rk_param_get_string(entry, NULL);

	return 0;
}

int rk_isp_set_hlc(int cam_id, const char *value) {
	int ret;
	RK_ISP_CHECK_CAMERA_ID(cam_id);
	if (!strcmp(value, "close")) {
		ret = rk_aiq_uapi_setHLCMode(rkipc_aiq_get_ctx(cam_id), false);
	} else if (!strcmp(value, "open")) {
		ret = rk_aiq_uapi_setHLCMode(rkipc_aiq_get_ctx(cam_id), true);
	}

	char entry[128] = {'\0'};
	snprintf(entry, 127, "isp.%d.blc:hlc", cam_id);
	rk_param_set_string(entry, value);

	return ret;
}

int rk_isp_get_hdr_level(int cam_id, int *value) {
	RK_ISP_CHECK_CAMERA_ID(cam_id);
	char entry[128] = {'\0'};
	snprintf(entry, 127, "isp.%d.blc:hdr_level", cam_id);
	*value = rk_param_get_int(entry, -1);

	return 0;
}

int rk_isp_set_hdr_level(int cam_id, int value) {
	int ret;
	RK_ISP_CHECK_CAMERA_ID(cam_id);
	if (value)
		ret = rk_aiq_uapi_setMHDRStrth(rkipc_aiq_get_ctx(cam_id), true, value);
	else
		ret = rk_aiq_uapi_setMHDRStrth(rkipc_aiq_get_ctx(cam_id), true, 1);

	char entry[128] = {'\0'};
	snprintf(entry, 127, "isp.%d.blc:hdr_level", cam_id);
	rk_param_set_int(entry, value);

	return ret;
}

int rk_isp_get_blc_strength(int cam_id, int *value) {
	RK_ISP_CHECK_CAMERA_ID(cam_id);
	char entry[128] = {'\0'};
	snprintf(entry, 127, "isp.%d.blc:blc_strength", cam_id);
	*value = rk_param_get_int(entry, -1);

	return 0;
}

int rk_isp_set_blc_strength(int cam_id, int value) {
	int ret;
	RK_ISP_CHECK_CAMERA_ID(cam_id);
	ret = rk_aiq_uapi_setBLCStrength(rkipc_aiq_get_ctx(cam_id), value); // [0, 100]

	char entry[128] = {'\0'};
	snprintf(entry, 127, "isp.%d.blc:blc_strength", cam_id);
	rk_param_set_int(entry, value);

	return ret;
}

int rk_isp_get_hlc_level(int cam_id, int *value) {
	RK_ISP_CHECK_CAMERA_ID(cam_id);
	char entry[128] = {'\0'};
	snprintf(entry, 127, "isp.%d.blc:hlc_level", cam_id);
	*value = rk_param_get_int(entry, -1);

	return 0;
}

int rk_isp_set_hlc_level(int cam_id, int value) {
	int ret;
	RK_ISP_CHECK_CAMERA_ID(cam_id);
	if (value == 0)
		value = 1;
	ret = rk_aiq_uapi_setHLCStrength(rkipc_aiq_get_ctx(cam_id), value); // level[1, 100]

	char entry[128] = {'\0'};
	snprintf(entry, 127, "isp.%d.blc:hlc_level", cam_id);
	rk_param_set_int(entry, value);

	return ret;
}

int rk_isp_get_dark_boost_level(int cam_id, int *value) {
	RK_ISP_CHECK_CAMERA_ID(cam_id);
	char entry[128] = {'\0'};
	snprintf(entry, 127, "isp.%d.blc:dark_boost_level", cam_id);
	*value = rk_param_get_int(entry, -1);

	return 0;
}

int rk_isp_set_dark_boost_level(int cam_id, int value) {
	int ret;
	RK_ISP_CHECK_CAMERA_ID(cam_id);
	ret = rk_aiq_uapi_setDarkAreaBoostStrth(rkipc_aiq_get_ctx(cam_id), value); // [1, 100]

	char entry[128] = {'\0'};
	snprintf(entry, 127, "isp.%d.blc:dark_boost_level", cam_id);
	rk_param_set_int(entry, value);

	return ret;
}

// white_blance
int rk_isp_get_white_blance_style(int cam_id, const char **value) {
	RK_ISP_CHECK_CAMERA_ID(cam_id);
	char entry[128] = {'\0'};
	snprintf(entry, 127, "isp.%d.white_blance:white_blance_style", cam_id);
	*value = rk_param_get_string(entry, NULL);

	return 0;
}

int rk_isp_set_white_blance_style(int cam_id, const char *value) {
	int ret;
	RK_ISP_CHECK_CAMERA_ID(cam_id);
	if (!strcmp(value, "autoWhiteBalance")) {
		ret = rk_aiq_uapi_setWBMode(rkipc_aiq_get_ctx(cam_id), OP_AUTO);
	} else if (!strcmp(value, "manualWhiteBalance")) {
		ret = rk_aiq_uapi_setWBMode(rkipc_aiq_get_ctx(cam_id), OP_MANUAL);
	}

	char entry[128] = {'\0'};
	snprintf(entry, 127, "isp.%d.white_blance:white_blance_style", cam_id);
	rk_param_set_string(entry, value);

	return ret;
}

int rk_isp_get_white_blance_red(int cam_id, int *value) {
	RK_ISP_CHECK_CAMERA_ID(cam_id);
	char entry[128] = {'\0'};
	snprintf(entry, 127, "isp.%d.white_blance:white_blance_red", cam_id);
	*value = rk_param_get_int(entry, -1);

	return 0;
}

int rk_isp_set_white_blance_red(int cam_id, int value) {
	RK_ISP_CHECK_CAMERA_ID(cam_id);
	rk_aiq_wb_gain_t gain;
	opMode_t mode;

	rk_aiq_uapi_getWBMode(rkipc_aiq_get_ctx(cam_id), &mode);
	if (mode == OP_AUTO) {
		LOG_WARN("white blance is auto, not support set gain\n");
		return 0;
	}
	rk_aiq_uapi_getMWBGain(rkipc_aiq_get_ctx(cam_id), &gain);
	value = (value == 0) ? 1 : value;
	gain.rgain = value / 50.0f * gs_wb_gain.rgain; // [0, 100]->[1.0, 4.0]
	int ret = rk_aiq_uapi_setMWBGain(rkipc_aiq_get_ctx(cam_id), &gain);

	char entry[128] = {'\0'};
	snprintf(entry, 127, "isp.%d.white_blance:white_blance_red", cam_id);
	rk_param_set_int(entry, value);

	return ret;
}

int rk_isp_get_white_blance_green(int cam_id, int *value) {
	RK_ISP_CHECK_CAMERA_ID(cam_id);
	char entry[128] = {'\0'};
	snprintf(entry, 127, "isp.%d.white_blance:white_blance_green", cam_id);
	*value = rk_param_get_int(entry, -1);

	return 0;
}

int rk_isp_set_white_blance_green(int cam_id, int value) {
	RK_ISP_CHECK_CAMERA_ID(cam_id);
	rk_aiq_wb_gain_t gain;
	opMode_t mode;

	rk_aiq_uapi_getWBMode(rkipc_aiq_get_ctx(cam_id), &mode);
	if (mode == OP_AUTO) {
		LOG_WARN("white blance is auto, not support set gain\n");
		return 0;
	}
	rk_aiq_uapi_getMWBGain(rkipc_aiq_get_ctx(cam_id), &gain);
	value = (value == 0) ? 1 : value;
	gain.grgain = value / 50.0f * gs_wb_gain.grgain; // [0, 100]->[1.0, 4.0]
	gain.gbgain = value / 50.0f * gs_wb_gain.gbgain; // [0, 100]->[1.0, 4.0]
	int ret = rk_aiq_uapi_setMWBGain(rkipc_aiq_get_ctx(cam_id), &gain);

	char entry[128] = {'\0'};
	snprintf(entry, 127, "isp.%d.white_blance:white_blance_green", cam_id);
	rk_param_set_int(entry, value);

	return ret;
}

int rk_isp_get_white_blance_blue(int cam_id, int *value) {
	RK_ISP_CHECK_CAMERA_ID(cam_id);
	char entry[128] = {'\0'};
	snprintf(entry, 127, "isp.%d.white_blance:white_blance_blue", cam_id);
	*value = rk_param_get_int(entry, -1);

	return 0;
}

int rk_isp_set_white_blance_blue(int cam_id, int value) {
	RK_ISP_CHECK_CAMERA_ID(cam_id);
	rk_aiq_wb_gain_t gain;
	opMode_t mode;

	rk_aiq_uapi_getWBMode(rkipc_aiq_get_ctx(cam_id), &mode);
	if (mode == OP_AUTO) {
		LOG_WARN("white blance is auto, not support set gain\n");
		return 0;
	}
	rk_aiq_uapi_getMWBGain(rkipc_aiq_get_ctx(cam_id), &gain);
	value = (value == 0) ? 1 : value;
	gain.bgain = value / 50.0f * gs_wb_gain.bgain; // [0, 100]->[1.0, 4.0]
	int ret = rk_aiq_uapi_setMWBGain(rkipc_aiq_get_ctx(cam_id), &gain);

	char entry[128] = {'\0'};
	snprintf(entry, 127, "isp.%d.white_blance:white_blance_blue", cam_id);
	rk_param_set_int(entry, value);

	return ret;
}

// enhancement

int rk_isp_get_noise_reduce_mode(int cam_id, const char **value) {
	RK_ISP_CHECK_CAMERA_ID(cam_id);
	char entry[128] = {'\0'};
	snprintf(entry, 127, "isp.%d.enhancement:noise_reduce_mode", cam_id);
	*value = rk_param_get_string(entry, NULL);

	return 0;
}

// Turn off noise reduction, the actual default value is set to 50,
// and it is done in the interface of setting level
int rk_isp_set_noise_reduce_mode(int cam_id, const char *value) {
	int ret;
	RK_ISP_CHECK_CAMERA_ID(cam_id);
	char entry[128] = {'\0'};
	snprintf(entry, 127, "isp.%d.enhancement:noise_reduce_mode", cam_id);
	rk_param_set_string(entry, value);

	return ret;
}

int rk_isp_get_dehaze(int cam_id, const char **value) {
	RK_ISP_CHECK_CAMERA_ID(cam_id);
	char entry[128] = {'\0'};
	snprintf(entry, 127, "isp.%d.enhancement:dehaze", cam_id);
	*value = rk_param_get_string(entry, NULL);

	return 0;
}

int rk_isp_set_dehaze(int cam_id, const char *value) {
	int ret;
	RK_ISP_CHECK_CAMERA_ID(cam_id);
	if (!strcmp(value, "close")) {
		rk_aiq_uapi_disableDhz(rkipc_aiq_get_ctx(cam_id));
	} else if (!strcmp(value, "open")) {
		rk_aiq_uapi_enableDhz(rkipc_aiq_get_ctx(cam_id));
		ret = rk_aiq_uapi_setDhzMode(rkipc_aiq_get_ctx(cam_id), OP_MANUAL);
		// rk_aiq_uapi_setMDhzStrth(db_aiq_ctx, true, level);
	} else if (!strcmp(value, "auto")) {
		rk_aiq_uapi_enableDhz(rkipc_aiq_get_ctx(cam_id));
		ret = rk_aiq_uapi_setDhzMode(rkipc_aiq_get_ctx(cam_id), OP_AUTO);
		// rk_aiq_uapi_setMDhzStrth(db_aiq_ctx, true, level);
	}

	char entry[128] = {'\0'};
	snprintf(entry, 127, "isp.%d.enhancement:dehaze", cam_id);
	rk_param_set_string(entry, value);

	return ret;
}

int rk_isp_get_gray_scale_mode(int cam_id, const char **value) {
	RK_ISP_CHECK_CAMERA_ID(cam_id);
	char entry[128] = {'\0'};
	snprintf(entry, 127, "isp.%d.enhancement:gray_scale_mode", cam_id);
	*value = rk_param_get_string(entry, NULL);

	return 0;
}

int rk_isp_set_gray_scale_mode(int cam_id, const char *value) {
	int ret;
	char entry[128] = {'\0'};
	RK_ISP_CHECK_CAMERA_ID(cam_id);
	// 1126 should set by venc
	// rk_aiq_uapi_acsm_attrib_t attr;
	// rk_aiq_user_api_acsm_GetAttrib(rkipc_aiq_get_ctx(cam_id), &attr);
	// if (!strcmp(value, "[16-235]"))
	// 	attr.param.full_range = false;
	// else
	// 	attr.param.full_range = true;
	// rk_aiq_user_api_acsm_SetAttrib(rkipc_aiq_get_ctx(cam_id), attr);
	snprintf(entry, 127, "isp.%d.enhancement:gray_scale_mode", cam_id);
	rk_param_set_string(entry, value);

	return ret;
}

int rk_isp_get_distortion_correction(int cam_id, const char **value) {
	RK_ISP_CHECK_CAMERA_ID(cam_id);
	char entry[128] = {'\0'};
	snprintf(entry, 127, "isp.%d.enhancement:distortion_correction", cam_id);
	*value = rk_param_get_string(entry, NULL);

	return 0;
}

int rk_isp_set_distortion_correction(int cam_id, const char *value) {
	int ret;
	RK_ISP_CHECK_CAMERA_ID(cam_id);
	const char *old_value = NULL;
	rk_isp_get_distortion_correction(cam_id, &old_value);
	LOG_INFO("cam_id is %d, value is %s, old_value is %s\n", cam_id, value, old_value);
	if (!strcmp(value, old_value)) {
		return 0;
	}
	int enable_jpeg = rk_param_get_int("video.source:enable_jpeg", 1);
	int enable_venc_0 = rk_param_get_int("video.source:enable_venc_0", 1);
	int enable_venc_1 = rk_param_get_int("video.source:enable_venc_1", 1);
	int enable_venc_2 = rk_param_get_int("video.source:enable_venc_2", 1);
	int enable_vo = rk_param_get_int("video.source:enable_vo", 1);

	if (rkipc_aiq_use_group) {
#ifndef COMPILE_FOR_RV1126_RKMEDIA
		RK_MPI_VI_PauseChn(0, 1);
		RK_MPI_VI_PauseChn(1, 1);
#endif
		LOG_INFO("rk_aiq_uapi_camgroup_stop\n");
		rk_aiq_uapi_camgroup_stop((rk_aiq_camgroup_ctx_t *)rkipc_aiq_get_ctx(cam_id));
	} else {
#ifndef COMPILE_FOR_RV1126_RKMEDIA
		if (enable_venc_0 || enable_jpeg)
			RK_MPI_VI_PauseChn(0, 0);
		if (enable_venc_1 || enable_venc_2)
			RK_MPI_VI_PauseChn(0, 1);
		if (enable_vo) // TODO: md od npu
			RK_MPI_VI_PauseChn(0, 2);
#endif
		LOG_INFO("rk_aiq_uapi_sysctl_stop\n");
		rk_aiq_uapi_sysctl_stop(rkipc_aiq_get_ctx(cam_id), false);
	}

	LOG_INFO("rk_aiq_uapi_setFecEn and rk_aiq_uapi_setLdchEn\n");
	if (!strcmp(value, "close")) {
		rk_aiq_uapi_setFecEn(rkipc_aiq_get_ctx(cam_id), false);
		rk_aiq_uapi_setLdchEn(rkipc_aiq_get_ctx(cam_id), false);
	} else if (!strcmp(value, "FEC")) {
		rk_aiq_uapi_setFecEn(rkipc_aiq_get_ctx(cam_id), true);
		rk_aiq_uapi_setLdchEn(rkipc_aiq_get_ctx(cam_id), false);
	} else if (!strcmp(value, "LDCH")) {
		rk_aiq_uapi_setFecEn(rkipc_aiq_get_ctx(cam_id), false);
		rk_aiq_uapi_setLdchEn(rkipc_aiq_get_ctx(cam_id), true);
	}
	if (rkipc_aiq_use_group) {
		ret = rk_aiq_uapi_camgroup_prepare((rk_aiq_camgroup_ctx_t *)rkipc_aiq_get_ctx(cam_id),
		                                   g_WDRMode[cam_id]);
		LOG_INFO("rk_aiq_uapi_camgroup_prepare over\n");
		ret |= rk_aiq_uapi_camgroup_start((rk_aiq_camgroup_ctx_t *)rkipc_aiq_get_ctx(cam_id));
		LOG_INFO("rk_aiq_uapi_camgroup_start over\n");
#ifndef COMPILE_FOR_RV1126_RKMEDIA
		LOG_INFO("RK_MPI_VI_ResumeChn\n");
		RK_MPI_VI_ResumeChn(0, 1);
		RK_MPI_VI_ResumeChn(1, 1);
#endif
	} else {
		if (rk_aiq_uapi_sysctl_prepare(rkipc_aiq_get_ctx(cam_id), 0, 0, g_WDRMode[cam_id])) {
			printf("rkaiq engine prepare failed !\n");
			return -1;
		}
		LOG_INFO("rk_aiq_uapi_sysctl_init/prepare succeed\n");
		if (rk_aiq_uapi_sysctl_start(rkipc_aiq_get_ctx(cam_id))) {
			printf("rk_aiq_uapi_sysctl_start  failed\n");
			return -1;
		}
		LOG_INFO("rk_aiq_uapi_sysctl_start succeed\n");
#ifndef COMPILE_FOR_RV1126_RKMEDIA
		LOG_INFO("RK_MPI_VI_ResumeChn\n");
		if (enable_venc_0 || enable_jpeg)
			RK_MPI_VI_ResumeChn(0, 0);
		if (enable_venc_1 || enable_venc_2)
			RK_MPI_VI_ResumeChn(0, 1);
		if (enable_vo) // TODO: md od npu
			RK_MPI_VI_ResumeChn(0, 2);
#endif
	}

	char entry[128] = {'\0'};
	snprintf(entry, 127, "isp.%d.enhancement:distortion_correction", cam_id);
	rk_param_set_string(entry, value);

	return ret;
}

int rk_isp_get_spatial_denoise_level(int cam_id, int *value) {
	RK_ISP_CHECK_CAMERA_ID(cam_id);
	char entry[128] = {'\0'};
	snprintf(entry, 127, "isp.%d.enhancement:spatial_denoise_level", cam_id);
	*value = rk_param_get_int(entry, -1);

	return 0;
}

int rk_isp_set_spatial_denoise_level(int cam_id, int value) {
	RK_ISP_CHECK_CAMERA_ID(cam_id);
	const char *noise_reduce_mode;
	rk_isp_get_noise_reduce_mode(cam_id, &noise_reduce_mode);
	LOG_DEBUG("noise_reduce_mode is %s, value is %d\n", noise_reduce_mode, value);
	if ((!strcmp(noise_reduce_mode, "close")) || (!strcmp(noise_reduce_mode, "3dnr"))) {
		value = 50;
		LOG_DEBUG("noise_reduce_mode is %s, value is %d\n", noise_reduce_mode, value);
	}
	int ret = rk_aiq_uapi_setMSpaNRStrth(rkipc_aiq_get_ctx(cam_id), true, value); //[0,100]
	char entry[128] = {'\0'};
	snprintf(entry, 127, "isp.%d.enhancement:spatial_denoise_level", cam_id);
	rk_param_set_int(entry, value);

	return ret;
}

int rk_isp_get_temporal_denoise_level(int cam_id, int *value) {
	RK_ISP_CHECK_CAMERA_ID(cam_id);
	char entry[128] = {'\0'};
	snprintf(entry, 127, "isp.%d.enhancement:temporal_denoise_level", cam_id);
	*value = rk_param_get_int(entry, -1);

	return 0;
}

int rk_isp_set_temporal_denoise_level(int cam_id, int value) {
	RK_ISP_CHECK_CAMERA_ID(cam_id);
	const char *noise_reduce_mode;
	rk_isp_get_noise_reduce_mode(cam_id, &noise_reduce_mode);
	LOG_DEBUG("noise_reduce_mode is %s, value is %d\n", noise_reduce_mode, value);
	if ((!strcmp(noise_reduce_mode, "close")) || (!strcmp(noise_reduce_mode, "2dnr"))) {
		value = 50;
		LOG_DEBUG("noise_reduce_mode is %s, value is %d\n", noise_reduce_mode, value);
	}
	int ret = rk_aiq_uapi_setMTNRStrth(rkipc_aiq_get_ctx(cam_id), true, value); //[0,100]
	char entry[128] = {'\0'};
	snprintf(entry, 127, "isp.%d.enhancement:temporal_denoise_level", cam_id);
	rk_param_set_int(entry, value);

	return ret;
}

int rk_isp_get_dehaze_level(int cam_id, int *value) {
	RK_ISP_CHECK_CAMERA_ID(cam_id);
	char entry[128] = {'\0'};
	snprintf(entry, 127, "isp.%d.enhancement:dehaze_level", cam_id);
	*value = rk_param_get_int(entry, -1);

	return 0;
}

int rk_isp_set_dehaze_level(int cam_id, int value) {
	RK_ISP_CHECK_CAMERA_ID(cam_id);
	int ret = rk_aiq_uapi_setMDhzStrth(rkipc_aiq_get_ctx(cam_id), true, value);
	char entry[128] = {'\0'};
	snprintf(entry, 127, "isp.%d.enhancement:dehaze_level", cam_id);
	rk_param_set_int(entry, value);

	return ret;
}

int rk_isp_get_fec_level(int cam_id, int *value) {
	RK_ISP_CHECK_CAMERA_ID(cam_id);
	char entry[128] = {'\0'};
	snprintf(entry, 127, "isp.%d.enhancement:fec_level", cam_id);
	*value = rk_param_get_int(entry, -1);

	return 0;
}

int rk_isp_set_fec_level(int cam_id, int value) {
	RK_ISP_CHECK_CAMERA_ID(cam_id);
	int ret = rk_aiq_uapi_setFecCorrectLevel(rkipc_aiq_get_ctx(cam_id),
	                                         (int)(value * 2.55)); // [0-100] -> [0->255]
	char entry[128] = {'\0'};
	snprintf(entry, 127, "isp.%d.enhancement:fec_level", cam_id);
	rk_param_set_int(entry, value);

	return ret;
}

int rk_isp_get_ldch_level(int cam_id, int *value) {
	RK_ISP_CHECK_CAMERA_ID(cam_id);
	char entry[128] = {'\0'};
	snprintf(entry, 127, "isp.%d.enhancement:ldch_level", cam_id);
	*value = rk_param_get_int(entry, -1);

	return 0;
}

int rk_isp_set_ldch_level(int cam_id, int value) {
	if (rk_param_get_int("isp:group_ldch", 0)) {
		LOG_INFO("group ldch open for avs, not set ldch level\n");
		return 0;
	}

	RK_ISP_CHECK_CAMERA_ID(cam_id);
	value = value < 0 ? 0 : value;
	int set_value = (int)(value * 2.53 + 2);
	int ret = rk_aiq_uapi_setLdchCorrectLevel(rkipc_aiq_get_ctx(cam_id),
	                                          set_value); // [0, 100] -> [2 , 255]
	char entry[128] = {'\0'};
	snprintf(entry, 127, "isp.%d.enhancement:ldch_level", cam_id);
	rk_param_set_int(entry, value);

	return ret;
}

int rk_isp_set_group_ldch_level_form_file(int cam_id) {
	int ret;
	rk_aiq_camgroup_camInfos_t camInfos;
#if 0
	memset(&camInfos, 0, sizeof(camInfos));
	if (rk_aiq_uapi_camgroup_getCamInfos(rkipc_aiq_get_ctx(cam_id), &camInfos) !=
	    XCAM_RETURN_NO_ERROR) {
		LOG_ERROR("rk_aiq_uapi_camgroup_getCamInfos fail\n");
		return -1;
	}
	for (int i = 0; i < camInfos.valid_sns_num; i++) {
		rk_aiq_sys_ctx_t *aiq_ctx = NULL;
		rk_aiq_ldch_attrib_t ldchAttr;
		memset(&ldchAttr, 0, sizeof(ldchAttr));
		aiq_ctx = rk_aiq_uapi_camgroup_getAiqCtxBySnsNm(rkipc_aiq_get_ctx(cam_id),
		                                                 camInfos.sns_ent_nm[i]);
		if (!aiq_ctx)
			continue;
		LOG_INFO("aiq_ctx sns name: %s, camPhyId %d\n", camInfos.sns_ent_nm[i],
		         camInfos.sns_camPhyId[i]);
		ret = rk_aiq_user_api_aldch_GetAttrib(aiq_ctx, &ldchAttr);
		if (ret != XCAM_RETURN_NO_ERROR) {
			LOG_ERROR("rk_aiq_user_api_aldch_GetAttrib fail\n");
			return -1;
		}
		ldchAttr.en = true;
		ldchAttr.lut.flag = true;
		strcpy(ldchAttr.lut.config_file_dir,
		       rk_param_get_string("avs:middle_lut_path", "/oem/usr/share/middle_lut/5m/"));
		if (camInfos.sns_camPhyId[i] > 0) {
			strcpy(ldchAttr.lut.mesh_file, "cam1_ldch_mesh.bin");
		} else {
			strcpy(ldchAttr.lut.mesh_file, "cam0_ldch_mesh.bin");
		}

		LOG_INFO("sns name %s, camPhyId %d\n", camInfos.sns_ent_nm[i], camInfos.sns_camPhyId[i]);
		LOG_INFO("lut file_dir %s, mesh_file %s\n", ldchAttr.lut.config_file_dir,
		         ldchAttr.lut.mesh_file);

		ret = rk_aiq_user_api_aldch_SetAttrib(aiq_ctx, &ldchAttr);
		if (ret != XCAM_RETURN_NO_ERROR) {
			LOG_ERROR("Failed to set ldch attrib : %d\n", ret);
			return -1;
		}
	}
#endif
	return 0;
}

int rk_isp_set_group_ldch_level_form_buffer(int cam_id, void *ldch_0, void *ldch_1, int ldch_size_0,
                                            int ldch_size_1) {
	int ret;
	rk_aiq_camgroup_camInfos_t camInfos;
	memset(&camInfos, 0, sizeof(camInfos));
	if (rk_aiq_uapi_camgroup_getCamInfos((rk_aiq_camgroup_ctx_t *)rkipc_aiq_get_ctx(cam_id),
	                                     &camInfos) != XCAM_RETURN_NO_ERROR) {
		LOG_ERROR("rk_aiq_uapi_camgroup_getCamInfos fail\n");
		return -1;
	}
	LOG_INFO("camInfos.valid_sns_num is %d\n", camInfos.valid_sns_num);
	for (int i = 0; i < camInfos.valid_sns_num; i++) {
		rk_aiq_sys_ctx_t *aiq_ctx = NULL;
		rk_aiq_ldch_attrib_t ldchAttr;
		memset(&ldchAttr, 0, sizeof(ldchAttr));
		aiq_ctx = rk_aiq_uapi_camgroup_getAiqCtxBySnsNm(
		    (rk_aiq_camgroup_ctx_t *)rkipc_aiq_get_ctx(cam_id), camInfos.sns_ent_nm[i]);
		if (!aiq_ctx)
			continue;
		LOG_INFO("aiq_ctx sns name: %s, camPhyId %d\n", camInfos.sns_ent_nm[i],
		         camInfos.sns_camPhyId[i]);
		ret = rk_aiq_user_api_aldch_GetAttrib(aiq_ctx, &ldchAttr);
		if (ret != XCAM_RETURN_NO_ERROR) {
			LOG_ERROR("rk_aiq_user_api_aldch_GetAttrib fail\n");
			return -1;
		}
		ldchAttr.en = true;
		ldchAttr.lut.update_flag = true;
		ldchAttr.update_lut_mode = RK_AIQ_LDCH_UPDATE_LUT_FROM_EXTERNAL_BUFFER;
		if (i == 0) {
			ldchAttr.lut.u.buffer.addr = ldch_0;
			ldchAttr.lut.u.buffer.size = ldch_size_0;
		} else {
			ldchAttr.lut.u.buffer.addr = ldch_1;
			ldchAttr.lut.u.buffer.size = ldch_size_1;
		}

		LOG_INFO("sns name %s, camPhyId %d\n", camInfos.sns_ent_nm[i], camInfos.sns_camPhyId[i]);

		ret = rk_aiq_user_api_aldch_SetAttrib(aiq_ctx, ldchAttr);
		if (ret != XCAM_RETURN_NO_ERROR) {
			LOG_ERROR("Failed to set ldch attrib : %d\n", ret);
			return -1;
		}
	}

	return 0;
}

// video_adjustment
int rk_isp_get_power_line_frequency_mode(int cam_id, const char **value) {
	RK_ISP_CHECK_CAMERA_ID(cam_id);
	char entry[128] = {'\0'};
	snprintf(entry, 127, "isp.%d.video_adjustment:power_line_frequency_mode", cam_id);
	*value = rk_param_get_string(entry, NULL);

	return 0;
}

int rk_isp_set_power_line_frequency_mode(int cam_id, const char *value) {
	RK_ISP_CHECK_CAMERA_ID(cam_id);
	int ret;
	char entry[128] = {'\0'};
	if (!strcmp(value, "NTSC(60HZ)"))
		ret = rk_aiq_uapi_setExpPwrLineFreqMode(rkipc_aiq_get_ctx(cam_id), EXP_PWR_LINE_FREQ_60HZ);
	else
		ret = rk_aiq_uapi_setExpPwrLineFreqMode(rkipc_aiq_get_ctx(cam_id), EXP_PWR_LINE_FREQ_50HZ);
	snprintf(entry, 127, "isp.%d.video_adjustment:power_line_frequency_mode", cam_id);
	rk_param_set_string(entry, value);

	return ret;
}

int rk_isp_get_image_flip(int cam_id, const char **value) {
	RK_ISP_CHECK_CAMERA_ID(cam_id);
	char entry[128] = {'\0'};
	snprintf(entry, 127, "isp.%d.video_adjustment:image_flip", cam_id);
	*value = rk_param_get_string(entry, NULL);

	return 0;
}

int rk_isp_set_image_flip(int cam_id, const char *value) {
	RK_ISP_CHECK_CAMERA_ID(cam_id);
	int ret, mirror, flip;
	char entry[128] = {'\0'};
	if (!strcmp(value, "close")) {
		mirror = 0;
		flip = 0;
	}
	if (!strcmp(value, "flip")) {
		mirror = 0;
		flip = 1;
	}
	if (!strcmp(value, "mirror")) {
		mirror = 1;
		flip = 0;
	}
	if (!strcmp(value, "centrosymmetric")) {
		mirror = 1;
		flip = 1;
	}
	rk_aiq_uapi_setMirroFlip(rkipc_aiq_get_ctx(cam_id), mirror, flip, 4); // skip 4 frame
	snprintf(entry, 127, "isp.%d.video_adjustment:image_flip", cam_id);
	rk_param_set_string(entry, value);

	return ret;
}

// auto focus

int rk_isp_get_af_mode(int cam_id, const char **value) {
	RK_ISP_CHECK_CAMERA_ID(cam_id);
	char entry[128] = {'\0'};
	snprintf(entry, 127, "isp.%d.auto_focus:af_mode", cam_id);
	*value = rk_param_get_string(entry, "auto");

	return 0;
}

int rk_isp_set_af_mode(int cam_id, const char *value) {
	RK_ISP_CHECK_CAMERA_ID(cam_id);
	int ret = 0;
	char entry[128] = {'\0'};
	opMode_t af_mode = OP_AUTO;
	if (value == NULL)
		return -1;
	if (!strcmp(value, "auto")) {
		af_mode = OP_AUTO;
	} else if (!strcmp(value, "semi-auto")) {
		af_mode = OP_SEMI_AUTO;
	} else if (!strcmp(value, "manual")) {
		af_mode = OP_MANUAL;
	} else {
		return -1;
	}
	ret = rk_aiq_uapi_setFocusMode(rkipc_aiq_get_ctx(cam_id), af_mode);
	LOG_INFO("set af mode: %s, ret: %d\n", value, ret);
	snprintf(entry, 127, "isp.%d.auto_focus:af_mode", cam_id);
	rk_param_set_string(entry, value);

	return 0;
}

int rk_isp_get_zoom_level(int cam_id, int *value) {
	RK_ISP_CHECK_CAMERA_ID(cam_id);
	char entry[128] = {'\0'};
	snprintf(entry, 127, "isp.%d.auto_focus:zoom_level", cam_id);
	*value = rk_param_get_int(entry, -1);

	return 0;
}

int rk_isp_get_focus_level(int cam_id, int *value) {
	RK_ISP_CHECK_CAMERA_ID(cam_id);
	char entry[128] = {'\0'};
	snprintf(entry, 127, "isp.%d.auto_focus:focus_level", cam_id);
	*value = rk_param_get_int(entry, -1);

	return 0;
}

int rk_isp_af_zoom_change(int cam_id, int change) {
	RK_ISP_CHECK_CAMERA_ID(cam_id);
	int ret = 0;
	int code = 0;
	char entry[128] = {'\0'};

	rk_aiq_af_zoomrange af_zoom_range = {0};
	ret = rk_aiq_uapi_getZoomRange(rkipc_aiq_get_ctx(cam_id), &af_zoom_range);
	if (ret) {
		LOG_ERROR("get zoom range fail: %d\n", ret);
		return ret;
	}
	rk_aiq_uapi_getOpZoomPosition(rkipc_aiq_get_ctx(cam_id), &code);
	code += change;
	if ((code < af_zoom_range.min_pos) || (code > af_zoom_range.max_pos)) {
		LOG_ERROR("set zoom: %d over range [%d, %d]\n", code, af_zoom_range.min_pos,
		          af_zoom_range.max_pos);
		ret = -1;
	}
	ret = rk_aiq_uapi_setOpZoomPosition(rkipc_aiq_get_ctx(cam_id), code);
	LOG_INFO("set zoom: %d, ret: %d\n", code, ret);
	snprintf(entry, 127, "isp.%d.auto_focus:zoom_level", cam_id);
	rk_param_set_int(entry, code);

	return ret;
}

int rk_isp_af_focus_change(int cam_id, int change) {
	RK_ISP_CHECK_CAMERA_ID(cam_id);
	int ret = 0;
	short code = 0;
	char entry[128] = {'\0'};
	snprintf(entry, 127, "isp.%d.auto_focus:af_mode", cam_id);
	const char *af_mode = rk_param_get_string(entry, "auto");
	if (!strcmp(af_mode, "auto"))
		return 0;

	rk_aiq_af_focusrange af_focus_range = {0};
	ret = rk_aiq_uapi_getFocusRange(rkipc_aiq_get_ctx(cam_id), &af_focus_range);
	if (ret) {
		LOG_ERROR("get focus range fail: %d\n", ret);
		return ret;
	}
	rk_aiq_uapi_getFixedModeCode(rkipc_aiq_get_ctx(cam_id), &code);
	code += change;
	if ((code < af_focus_range.min_pos) || (code > af_focus_range.max_pos)) {
		LOG_ERROR("before set getFocusPosition: %d over range (%d, %d)\n", code,
		          af_focus_range.min_pos, af_focus_range.max_pos);
		return -1;
	}
	ret = rk_aiq_uapi_setFixedModeCode(rkipc_aiq_get_ctx(cam_id), code);
	LOG_INFO("set setFocusPosition: %d, ret: %d\n", code, ret);
	snprintf(entry, 127, "isp.%d.auto_focus:focus_level", cam_id);
	rk_param_set_int(entry, code);

	return ret;
}

int rk_isp_af_zoom_in(int cam_id) { return rk_isp_af_zoom_change(cam_id, 20); }

int rk_isp_af_zoom_out(int cam_id) { return rk_isp_af_zoom_change(cam_id, -20); }

int rk_isp_af_focus_in(int cam_id) { return rk_isp_af_focus_change(cam_id, 1); }

int rk_isp_af_focus_out(int cam_id) { return rk_isp_af_focus_change(cam_id, -1); }

int rk_isp_af_focus_once(int cam_id) {
	LOG_INFO("af_focus_once\n");
	return rk_aiq_uapi_endOpZoomChange(rkipc_aiq_get_ctx(cam_id));
}

int rk_isp_set_from_ini(int cam_id) {
	RK_ISP_CHECK_CAMERA_ID(cam_id);
	int ret = 0;
	char value[128];
	char entry[128] = {'\0'};
	LOG_DEBUG("start\n");
	snprintf(entry, 127, "isp.%d.adjustment:fps", rkipc_get_scenario_id(cam_id));
	rk_isp_set_frame_rate(cam_id, rk_param_get_int(entry, 30));
	// image adjustment
	LOG_DEBUG("image adjustment\n");
	snprintf(entry, 127, "isp.%d.adjustment:contrast", rkipc_get_scenario_id(cam_id));
	rk_isp_set_contrast(cam_id, rk_param_get_int(entry, 50));
	snprintf(entry, 127, "isp.%d.adjustment:brightness", rkipc_get_scenario_id(cam_id));
	rk_isp_set_brightness(cam_id, rk_param_get_int(entry, 50));
	snprintf(entry, 127, "isp.%d.adjustment:saturation", rkipc_get_scenario_id(cam_id));
	rk_isp_set_saturation(cam_id, rk_param_get_int(entry, 50));
	snprintf(entry, 127, "isp.%d.adjustment:sharpness", rkipc_get_scenario_id(cam_id));
	rk_isp_set_sharpness(cam_id, rk_param_get_int(entry, 50));
	snprintf(entry, 127, "isp.%d.adjustment:hue", rkipc_get_scenario_id(cam_id));
	rk_isp_set_hue(cam_id, rk_param_get_int(entry, 50));
	// exposure
	LOG_DEBUG("exposure\n");
	snprintf(entry, 127, "isp.%d.exposure:exposure_mode", rkipc_get_scenario_id(cam_id));
	strcpy(value, rk_param_get_string(entry, "auto"));
	rk_isp_set_exposure_mode(cam_id, value);
	snprintf(entry, 127, "isp.%d.exposure:gain_mode", rkipc_get_scenario_id(cam_id));
	strcpy(value, rk_param_get_string(entry, "auto"));
	rk_isp_set_gain_mode(cam_id, value);
	snprintf(entry, 127, "isp.%d.exposure:exposure_time", rkipc_get_scenario_id(cam_id));
	strcpy(value, rk_param_get_string(entry, "1/6"));
	rk_isp_set_exposure_time(cam_id, value);
	snprintf(entry, 127, "isp.%d.exposure:exposure_gain", rkipc_get_scenario_id(cam_id));
	rk_isp_set_exposure_gain(cam_id, rk_param_get_int(entry, 1));
	// night_to_day
	LOG_DEBUG("night_to_day\n");
	snprintf(entry, 127, "isp.%d.night_to_day:night_to_day", rkipc_get_scenario_id(cam_id));
	strcpy(value, rk_param_get_string(entry, "day"));
	rk_isp_set_night_to_day(cam_id, value);
	snprintf(entry, 127, "isp.%d.night_to_day:fill_light_mode", rkipc_get_scenario_id(cam_id));
	strcpy(value, rk_param_get_string(entry, "IR"));
	rk_isp_set_fill_light_mode(cam_id, value);
	snprintf(entry, 127, "isp.%d.night_to_day:light_brightness", rkipc_get_scenario_id(cam_id));
	rk_isp_set_light_brightness(cam_id, rk_param_get_int(entry, 1));
	// rk_isp_set_night_to_day_filter_level
	// rk_isp_set_night_to_day_filter_time
	// blc
	LOG_DEBUG("blc\n");
	// rk_isp_set_hdr will loop infinitely, and it has been set during init
	snprintf(entry, 127, "isp.%d.blc:blc_region", rkipc_get_scenario_id(cam_id));
	strcpy(value, rk_param_get_string(entry, "close"));
	rk_isp_set_blc_region(cam_id, value);
	snprintf(entry, 127, "isp.%d.blc:hlc", rkipc_get_scenario_id(cam_id));
	strcpy(value, rk_param_get_string(entry, "close"));
	rk_isp_set_hlc(cam_id, value);
	snprintf(entry, 127, "isp.%d.blc:hdr_level", rkipc_get_scenario_id(cam_id));
	rk_isp_set_hdr_level(cam_id, rk_param_get_int(entry, 1));
	snprintf(entry, 127, "isp.%d.blc:blc_strength", rkipc_get_scenario_id(cam_id));
	rk_isp_set_blc_strength(cam_id, rk_param_get_int(entry, 1));
	snprintf(entry, 127, "isp.%d.blc:hlc_level", rkipc_get_scenario_id(cam_id));
	rk_isp_set_hlc_level(cam_id, rk_param_get_int(entry, 0));
	snprintf(entry, 127, "isp.%d.blc:dark_boost_level", rkipc_get_scenario_id(cam_id));
	rk_isp_set_dark_boost_level(cam_id, rk_param_get_int(entry, 0));
	// white_blance
	LOG_DEBUG("white_blance\n");
	snprintf(entry, 127, "isp.%d.white_blance:white_blance_style", rkipc_get_scenario_id(cam_id));
	strcpy(value, rk_param_get_string(entry, "autoWhiteBalance"));
	rk_isp_set_white_blance_style(cam_id, value);
	snprintf(entry, 127, "isp.%d.white_blance:white_blance_red", rkipc_get_scenario_id(cam_id));
	rk_isp_set_white_blance_red(cam_id, rk_param_get_int(entry, 50));
	snprintf(entry, 127, "isp.%d.white_blance:white_blance_green", rkipc_get_scenario_id(cam_id));
	rk_isp_set_white_blance_green(cam_id, rk_param_get_int(entry, 50));
	snprintf(entry, 127, "isp.%d.white_blance:white_blance_blue", rkipc_get_scenario_id(cam_id));
	rk_isp_set_white_blance_blue(cam_id, rk_param_get_int(entry, 50));
	// enhancement
	LOG_DEBUG("enhancement\n");
	snprintf(entry, 127, "isp.%d.enhancement:noise_reduce_mode", rkipc_get_scenario_id(cam_id));
	strcpy(value, rk_param_get_string(entry, "close"));
	rk_isp_set_noise_reduce_mode(cam_id, value);
	snprintf(entry, 127, "isp.%d.enhancement:dehaze", rkipc_get_scenario_id(cam_id));
	strcpy(value, rk_param_get_string(entry, "close"));
	rk_isp_set_dehaze(cam_id, value);
	snprintf(entry, 127, "isp.%d.enhancement:gray_scale_mode", rkipc_get_scenario_id(cam_id));
	strcpy(value, rk_param_get_string(entry, "[0-255]"));
	rk_isp_set_gray_scale_mode(cam_id, value);
	snprintf(entry, 127, "isp.%d.enhancement:distortion_correction", rkipc_get_scenario_id(cam_id));
	strcpy(value, rk_param_get_string(entry, "close"));
	rk_isp_set_distortion_correction(cam_id, value);
	snprintf(entry, 127, "isp.%d.enhancement:spatial_denoise_level", rkipc_get_scenario_id(cam_id));
	rk_isp_set_spatial_denoise_level(cam_id, rk_param_get_int(entry, 50));
	snprintf(entry, 127, "isp.%d.enhancement:temporal_denoise_level",
	         rkipc_get_scenario_id(cam_id));
	rk_isp_set_temporal_denoise_level(cam_id, rk_param_get_int(entry, 50));
	snprintf(entry, 127, "isp.%d.enhancement:dehaze_level", rkipc_get_scenario_id(cam_id));
	rk_isp_set_dehaze_level(cam_id, rk_param_get_int(entry, 50));
	snprintf(entry, 127, "isp.%d.enhancement:ldch_level", rkipc_get_scenario_id(cam_id));
	rk_isp_set_ldch_level(cam_id, rk_param_get_int(entry, 0));
	// video_adjustment
	LOG_DEBUG("video_adjustment\n");
	snprintf(entry, 127, "isp.%d.video_adjustment:power_line_frequency_mode",
	         rkipc_get_scenario_id(cam_id));
	strcpy(value, rk_param_get_string(entry, "PAL(50HZ)"));
	rk_isp_set_power_line_frequency_mode(cam_id, value);
	snprintf(entry, 127, "isp.%d.video_adjustment:image_flip", rkipc_get_scenario_id(cam_id));
	strcpy(value, rk_param_get_string(entry, "close"));
	rk_isp_set_image_flip(cam_id, value);
	// auto focus
	// LOG_DEBUG("auto focus\n");
	// rk_isp_set_af_mode(cam_id, const char *value);
	LOG_DEBUG("end\n");

	return ret;
}

int rk_isp_init(int cam_id, char *iqfile_path) {
	LOG_INFO("%s, cam_id is %d\n", __func__, cam_id);
	int ret;
	char entry[128] = {'\0'};
	if (iqfile_path)
		memcpy(g_iq_file_dir_, iqfile_path, strlen(iqfile_path));
	else
		memcpy(g_iq_file_dir_, "/etc/iqfiles", strlen("/etc/iqfiles"));
	LOG_INFO("g_iq_file_dir_ is %s\n", g_iq_file_dir_);

	snprintf(entry, 127, "isp.%d.blc:hdr", cam_id);
	const char *value = rk_param_get_string(entry, "close");
	LOG_INFO("hdr mode is %s\n", value);
	if (!strcmp(value, "close"))
		g_aiq_mode = RK_AIQ_WORKING_MODE_NORMAL;
	else if (!strcmp(value, "HDR2"))
		g_aiq_mode = RK_AIQ_WORKING_MODE_ISP_HDR2;
	else if (!strcmp(value, "HDR3"))
		g_aiq_mode = RK_AIQ_WORKING_MODE_ISP_HDR3;

	ret = sample_common_isp_init(cam_id, g_aiq_mode, false, g_iq_file_dir_);
	rk_isp_get_distortion_correction(cam_id, &value);
	if (!strcmp(value, "close")) {
		rk_aiq_uapi_setFecEn(g_aiq_ctx[cam_id], false);
		rk_aiq_uapi_setLdchEn(g_aiq_ctx[cam_id], false);
		rk_aiq_user_api_ais_SetEnable(g_aiq_ctx[cam_id], false);
	} else if (!strcmp(value, "FEC")) {
		rk_aiq_uapi_setFecEn(g_aiq_ctx[cam_id], true);
		rk_aiq_uapi_setLdchEn(g_aiq_ctx[cam_id], false);
		rk_aiq_user_api_ais_SetEnable(g_aiq_ctx[cam_id], false);
	} else if (!strcmp(value, "LDCH")) {
		rk_aiq_uapi_setFecEn(g_aiq_ctx[cam_id], false);
		rk_aiq_uapi_setLdchEn(g_aiq_ctx[cam_id], true);
		rk_aiq_user_api_ais_SetEnable(g_aiq_ctx[cam_id], false);
	} else if (!strcmp(value, "DIS")) {
		rk_aiq_uapi_setFecEn(g_aiq_ctx[cam_id], false);
		rk_aiq_uapi_setLdchEn(g_aiq_ctx[cam_id], false);
		rk_aiq_user_api_ais_SetEnable(g_aiq_ctx[cam_id], true);
	}

	ret |= sample_common_isp_run(cam_id);

	if (rk_param_get_int("isp:init_form_ini", 1))
		rk_isp_set_from_ini(cam_id);

	return ret;
}

int rk_isp_deinit(int cam_id) {
	LOG_INFO("%s\n", __func__);
	return sample_common_isp_stop(cam_id);
}

int rk_isp_group_init(int cam_group_id, char *iqfile_path) {
	LOG_INFO("cam_group_id is %d\n", cam_group_id);
	int ret;
	rkipc_aiq_use_group = 1;
	if (iqfile_path)
		memcpy(g_iq_file_dir_, iqfile_path, strlen(iqfile_path));
	else
		memcpy(g_iq_file_dir_, "/etc/iqfiles", strlen("/etc/iqfiles"));
	LOG_INFO("g_iq_file_dir_ is %s\n", g_iq_file_dir_);

	char entry[128] = {'\0'};
	snprintf(entry, 127, "isp.%d.blc:hdr", cam_group_id);
	const char *hdr_mode = rk_param_get_string(entry, "close");
	LOG_INFO("cam_group_id is %d, hdr_mode is %s\n", cam_group_id, hdr_mode);
	if (!strcmp(hdr_mode, "HDR2")) {
		ret = isp_camera_group_init(cam_group_id, RK_AIQ_WORKING_MODE_ISP_HDR2, false,
		                            g_iq_file_dir_);
	} else {
		ret =
		    isp_camera_group_init(cam_group_id, RK_AIQ_WORKING_MODE_NORMAL, false, g_iq_file_dir_);
	}
	// ret |= rk_isp_set_from_ini(cam_group_id);

	return ret;
}

int rk_isp_group_deinit(int cam_group_id) {
	LOG_INFO("cam_group_id is %d\n", cam_group_id);
	return isp_camera_group_stop(cam_group_id);
}