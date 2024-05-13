# Rockchip sample Makefile
LD_FLAGS += -L$(COMM_DIR)/lib -lsample_comm
LD_FLAGS += $(RK_MEDIA_OPTS) -L$(RK_MEDIA_OUTPUT)/lib

ifeq ($(RK_MEDIA_CHIP), rv1106)
LD_FLAGS += -lrockit_full
else
LD_FLAGS += -lrockit
endif

all:
	@$(SAMPLE_CC) $(SAMPLE_CFLAGS) sample_ai_aenc_adec_ao_stresstest.c -o sample_ai_aenc_adec_ao_stresstest $(LD_FLAGS)
	@$(SAMPLE_CC) $(SAMPLE_CFLAGS) sample_isp_stresstest.c -o sample_isp_stresstest $(LD_FLAGS) -lrkaiq
	@$(SAMPLE_CC) $(SAMPLE_CFLAGS) sample_venc_stresstest.c -o sample_venc_stresstest $(LD_FLAGS) -lrockchip_mpp -lrkaiq -lrtsp
	@$(SAMPLE_CC) $(SAMPLE_CFLAGS) sample_rgn_stresstest.c -o sample_rgn_stresstest $(LD_FLAGS) -lrockchip_mpp -lrkaiq -lrtsp
	@$(SAMPLE_CC) $(SAMPLE_CFLAGS) sample_mulit_isp_stresstest.c -o sample_mulit_isp_stresstest $(LD_FLAGS) -lrkaiq
ifeq ($(HAVE_AVS), y)
	@$(SAMPLE_CC) $(SAMPLE_CFLAGS) sample_avs_stresstest.c -o sample_avs_stresstest $(LD_FLAGS) -lrkaiq
	@$(SAMPLE_CC) $(SAMPLE_CFLAGS) sample_demo_vi_avs_venc_stresstest.c -o sample_demo_vi_avs_venc_stresstest $(LD_FLAGS) -lrockchip_mpp -lrkaiq -lrtsp
endif
	@$(SAMPLE_CC) $(SAMPLE_CFLAGS) sample_vpss_stresstest.c -o sample_vpss_stresstest $(LD_FLAGS) -lrkaiq
ifeq ($(CONFIG_RK_IVA) ,y)
	@$(SAMPLE_CC) $(SAMPLE_CFLAGS) sample_demo_vi_venc_stresstest.c -o sample_demo_vi_venc_stresstest $(LD_FLAGS) -lrockchip_mpp -lrkaiq -lrtsp -lrockiva
else
	@$(SAMPLE_CC) $(SAMPLE_CFLAGS) sample_demo_vi_venc_stresstest.c -o sample_demo_vi_venc_stresstest $(LD_FLAGS) -lrockchip_mpp -lrkaiq -lrtsp
endif


install:
	@mv -f sample_ai_aenc_adec_ao_stresstest $(SAMPLE_OUT_DIR)/bin
	@mv -f sample_isp_stresstest $(SAMPLE_OUT_DIR)/bin
	@mv -f sample_venc_stresstest $(SAMPLE_OUT_DIR)/bin
	@mv -f sample_rgn_stresstest $(SAMPLE_OUT_DIR)/bin
	@mv -f sample_mulit_isp_stresstest $(SAMPLE_OUT_DIR)/bin
ifeq ($(HAVE_AVS), y)
	@mv -f sample_avs_stresstest $(SAMPLE_OUT_DIR)/bin
	@mv -f sample_demo_vi_avs_venc_stresstest $(SAMPLE_OUT_DIR)/bin
endif
	@mv -f sample_vpss_stresstest $(SAMPLE_OUT_DIR)/bin
	@mv -f sample_demo_vi_venc_stresstest $(SAMPLE_OUT_DIR)/bin
	@mkdir -p ../../../../output/out/userdata/
	@cp -f source/ai_aenc_adec_ao_stresstes.sh ../../../../output/out/userdata/
	@cp -f source/160x96.bmp ../../../../output/out/userdata/
	@cp -f source/192x96.bmp ../../../../output/out/userdata/
	@cp -f source/rv1103_stresstest.sh ../../../../output/out/userdata/
	@cp -f source/rv1106_stresstest.sh ../../../../output/out/userdata/
	@cp -f source/avs_stresstest.sh ../../../../output/out/userdata/
	@cp -f source/vpss_stresstest.sh ../../../../output/out/userdata/
	@cp -f source/isp_stresstest.sh ../../../../output/out/userdata/
	@cp -f source/venc_stresstest.sh ../../../../output/out/userdata/
	@cp -f source/demo_vi_venc_stresstest.sh ../../../../output/out/userdata/
	@cp -f source/rgn_stresstest.sh ../../../../output/out/userdata/
	@cp -f source/rv1126_stresstest.sh ../../../../output/out/userdata/
	@cp -f source/demo_vi_avs_venc_stresstest.sh ../../../../output/out/userdata/
	@cp -f source/rv1106_multi_cam_stresstest.sh ../../../../output/out/userdata/
	@cp -f source/multi_isp_stresstest.sh ../../../../output/out/userdata/
	@cp -f source/rv1126_multi_cam_stresstest.sh ../../../../output/out/userdata/

clean:
	@echo "clean test"
