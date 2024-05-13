#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <errno.h>
#include <fcntl.h>
#include <sys/mman.h>
#include <sys/stat.h>
#include <sys/types.h>
#include <unistd.h>
#include <signal.h>
#include <semaphore.h>
#include <pthread.h>
#include <stdbool.h>

#include "rk_comm_ive.h"
#include "ivs_md.h"
#include "rk_ivs_cv_common.h"

#include "sample_comm_rve.h"
#include "sample_define.h"
#include "sample_assist.h"
#include "sample_file.h"

#define SAMPLE_IVE_MD_IMAGE_NUM 2

#define SAMPLE_PAUSE()\
    do {\
        printf("---------------press Enter key to exit!---------------\n");\
        (void)getchar();\
    } while (0)

RK_CHAR *pchAvi = "./test.yuv";
RK_CHAR *pchRes = "./out.yuv";

typedef struct rkSAMPLE_IVE_MD_S
{
    IVE_SRC_IMAGE_S astImg[SAMPLE_IVE_MD_IMAGE_NUM];
    IVE_DST_MEM_INFO_S stBlob;
    MD_ATTR_S stMdAttr;
    SAMPLE_RECT_ARRAY_S stRegion;

    RK_U32 u32totalFrame;
}SAMPLE_IVE_MD_S;

static bool s_bStopSignal = false;
static pthread_t s_hMdThread = 0;
static SAMPLE_IVE_MD_S s_stMd;

static void SAMPLE_IVS_Md_Uninit(SAMPLE_IVE_MD_S *pstMd)
{
    RK_S32 i;
    RK_S32 s32Ret = RK_SUCCESS;

    s32Ret = RK_IVS_MD_Exit();
    if(s32Ret != RK_SUCCESS)
    {
       printf("RK_IVS_MD_Exit fail,Error(%#x)\n",s32Ret);
       return ;
    }

}

static RK_S32 SAMPLE_IVS_Md_Init(SAMPLE_IVE_MD_S *pstMd, RK_U32 u32Width, RK_U32 u32Height)
{
    RK_S32 s32Ret = RK_SUCCESS;
    RK_S32 i ;
    RK_U32 u32Size;
    RK_U8 u8WndSz;

    //Set attr info
    /* 1: MD_ALG_MODE_BG  2: MD_ALG_MODE_REF */
    pstMd->stMdAttr.enAlgMode = MD_ALG_MODE_BG;

    pstMd->stMdAttr.enSadMode = IVE_SAD_MODE_MB_4X4;
    pstMd->stMdAttr.enSadOutCtrl = IVE_SAD_OUT_CTRL_THRESH;
    pstMd->stMdAttr.u16SadThr = 100 * (1 << 1);//100 * (1 << 2);
    pstMd->stMdAttr.u32Width = u32Width;
    pstMd->stMdAttr.u32Height = u32Height;
    pstMd->stMdAttr.stAddCtrl.u0q16X = 32768;
    pstMd->stMdAttr.stAddCtrl.u0q16Y = 32768;

    /* rk ccl config */
    pstMd->stMdAttr.stCclCtrl.enMode = IVE_CCL_MODE_8C;
    pstMd->stMdAttr.stCclCtrl.u16InitAreaThr = 4;
    pstMd->stMdAttr.stCclCtrl.u16Step = 2;

    u8WndSz = ( 1 << (2 + pstMd->stMdAttr.enSadMode));
    pstMd->stMdAttr.stCclCtrl.u16InitAreaThr = u8WndSz * u8WndSz;
    pstMd->stMdAttr.stCclCtrl.u16Step = u8WndSz;

    s32Ret = RK_IVS_MD_Init();
    SAMPLE_CHECK_EXPR_GOTO(RK_SUCCESS != s32Ret, MD_INIT_FAIL,
        "Error(%#x),RK_IVS_MD_Init failed!\n", s32Ret);

MD_INIT_FAIL:

    if(RK_SUCCESS != s32Ret)
    {
        SAMPLE_IVS_Md_Uninit(pstMd);
    }
    return s32Ret;

}

static void *SAMPLE_IVS_QUIT(void)
{
    SAMPLE_PAUSE();
    s_bStopSignal = true;
    s_hMdThread = 0;
}

static void *SAMPLE_IVS_MdProc(SAMPLE_IVE_MD_S *pstMd)
{
    RK_S32 s32Ret;
    MD_ATTR_S *pstMdAttr;
    IVE_VIDEO_FRAME_INFO_S stBaseFrmInfo;
    IVE_VIDEO_FRAME_INFO_S stExtFrmInfo;
    MD_CHN MdChn = 0;

    bool bInstant = true;
    RK_S32 s32CurIdx = 0;
    bool bFirstFrm = true;
    pstMdAttr = &(pstMd->stMdAttr);

    RK_U8 *showImg = RK_NULL;

#ifndef BUILD_SIMULATOR
    FILE *fp = NULL;
    FILE *fo_fg = NULL;
#endif

    RK_U32 s32FrmNum = 0;
    RK_S32 s32Key;
    RK_S32 s32OneFrmProcess = 0;

    RK_U32 u32Width = pstMd->stMdAttr.u32Width;
    RK_U32 u32Height = pstMd->stMdAttr.u32Height;

    IVE_IMAGE_S stCurImg;
    IVE_IMAGE_S stRefImg;
    IVE_DST_MEM_INFO_S stBlob;

    memset(&stCurImg, 0, sizeof(IVE_IMAGE_S));
    memset(&stRefImg, 0, sizeof(IVE_IMAGE_S));


    showImg = (RK_U8 *)malloc(u32Width * u32Height);

    //Create chn
    s32Ret = RK_IVS_MD_CreateChn(MdChn, &(pstMd->stMdAttr));
    if (RK_SUCCESS != s32Ret)
    {
        SAMPLE_PRT("RK_IVS_MD_CreateChn fail,Error(%#x)\n",s32Ret);
        return NULL;
    }

    s32Ret =
        IVS_CreateIveImage(&stCurImg, IVE_IMAGE_TYPE_U8C1, u32Width, u32Height);
    RK_CHECK_NET_GOTO_PRT(s32Ret, RK_SUCCESS, BASE_RELEASE,
                          "IVS_CreateIveImage stCurImg fail\n");

    s32Ret =
        IVS_CreateIveImage(&stRefImg, IVE_IMAGE_TYPE_U8C1, u32Width, u32Height);
    RK_CHECK_NET_GOTO_PRT(s32Ret, RK_SUCCESS, BASE_RELEASE,
                          "IVS_CreateIveImage stRefImg fail\n");

    stBlob.u32Size = sizeof(IVE_CCBLOB_S);
    s32Ret = IVS_CreateIveMem(&stBlob, stBlob.u32Size);
    RK_CHECK_NET_GOTO_PRT(s32Ret, RK_SUCCESS, BASE_RELEASE,
                          "IVS_CreateIveMem stBlob fail\n");

    printf("rk-debug (%s)%d\n", __FUNCTION__, __LINE__);

    //while (false == s_bStopSignal)
#ifdef BUILD_SIMULATOR
    {
        if (s32FrmNum == 0) {
            /* first frame to get Background */
            s32Ret = ivs_cv_read_frame((RK_U8 *)stRefImg.au64VirAddr[0], u32Width * u32Height, pchAvi);
            if (s32Ret < 0)
                return NULL;
#else
    {
        if (s32FrmNum == 0) {
            IVS_ReadFile(pchAvi, &stRefImg, &fp);
            s32FrmNum = 1;
#endif
        }

#ifdef BUILD_SIMULATOR
        for (s32FrmNum = 1; s32FrmNum < pstMd->u32totalFrame; s32FrmNum++) {
            ivs_cv_read_frame((RK_U8 *)stCurImg.au64VirAddr[0], u32Width * u32Height, pchAvi);
            ivs_cv_showimage((RK_U8 *)stCurImg.au64VirAddr[0], u32Width, u32Height, IVE_IMAGE_TYPE_U8C1, 1, "src-gray");
#else
        for (s32FrmNum = 1; s32FrmNum < 100; s32FrmNum++) {
            IVS_ReadFile(pchAvi, &stCurImg, &fp);
#endif //BUILD_SIMULATOR

            memcpy(showImg, (void *)stCurImg.au64VirAddr[0], u32Width * u32Height);

            if (s32FrmNum >= 2)
                s32Ret = RK_IVS_MD_Process(MdChn, &stCurImg, NULL, NULL, &stBlob);
            else
                s32Ret = RK_IVS_MD_Process(MdChn, &stCurImg, &stRefImg, NULL, &stBlob);
            SAMPLE_CHECK_EXPR_GOTO(RK_SUCCESS != s32Ret, BASE_RELEASE,
                            "RK_IVS_MD_Process fail,Error(%#x)\n",s32Ret);

            /* CCL blobs, this use cpu to draw rect, maybe you should use other IP to draw */
            IVE_CCBLOB_S *pstCCBlob = RK_NULL;

            pstCCBlob = (IVE_CCBLOB_S *)stBlob.u64VirAddr;

            int i, j, k;
            for (k = 0; k < IVE_MAX_REGION_NUM; k++) {
                int left, right, top, bottom, i, j;
                if (pstCCBlob->astRegion[k].u32Area == 0) continue;
                left = pstCCBlob->astRegion[k].u16Left;
                right = pstCCBlob->astRegion[k].u16Right;
                top = pstCCBlob->astRegion[k].u16Top;
                bottom = pstCCBlob->astRegion[k].u16Bottom;
                for (j = top; j <= bottom; j++) {
                    for (i = left; i <= right; i++) {
                        if (i == left || i == right || j == top || j == bottom) {
                            showImg[j * u32Width + i] = 255;
                        }
                    }
                }
            }

#ifdef BUILD_SIMULATOR
            ivs_cv_showimage((RK_U8 *)showImg, u32Width, u32Height, IVE_IMAGE_TYPE_U8C1, 1, "dst-ccl");

            if (NULL != pchRes) {
                ivs_cv_write_frame((RK_U8 *)showImg, u32Width, u32Height, IVE_IMAGE_TYPE_U8C1,
                            (s32FrmNum == pstMd->u32totalFrame - 1) ? 1 : 0, pchRes);
            }
        }
#else
            printf("proc frame: %d\n", s32FrmNum);
            IVS_WriteFile(pchRes, (void *)showImg,
                         u32Width * u32Height, &fo_fg);
        }
#endif
    }

BASE_RELEASE:
    free(showImg);
    IVS_DestroyIveImage(&stCurImg);
    IVS_DestroyIveImage(&stRefImg);
    IVS_DestroyIveMem(&stBlob);

     //destroy
     s32Ret = RK_IVS_MD_DestroyChn(MdChn);
     if (RK_SUCCESS != s32Ret)
     {
         SAMPLE_PRT("RK_IVS_MD_DestroyChn fail,Error(%#x)\n",s32Ret);
     }

#ifndef BUILD_SIMULATOR
     RK_FCLOSE(fp);
     RK_FCLOSE(fo_fg);
#endif

     printf("proc frame end\n");

     return NULL;
}

void SAMPLE_IVS_Md(void)
{
    RK_U32 u32Width;
    RK_U32 u32Height;
    RK_U32 u32totalFrame;
    RK_S32 s32Ret = RK_SUCCESS;
    char acThreadName[16] = {0};

    /* opencv */

    memset(&s_stMd,0,sizeof(s_stMd));
    /******************************************
     step 1: init md config
     ******************************************/

#ifdef BUILD_SIMULATOR
    /* opencv open avi */ 
    s32Ret = ivs_cv_query_frame(&u32Width, &u32Height, &u32totalFrame, pchAvi);
    SAMPLE_CHECK_EXPR_GOTO(RK_SUCCESS != s32Ret, FAILURE,
        " Error(%#x),SAMPLE_IVS_Md_Init failed!\n", s32Ret);

    s_stMd.u32totalFrame = u32totalFrame;
#else
    /* TODO: get by set */
    u32Width = 352;
    u32Height = 288;
#endif

    /******************************************
     step 2: Init Md
     ******************************************/
    s32Ret = SAMPLE_IVS_Md_Init(&s_stMd, u32Width, u32Height);
    SAMPLE_CHECK_EXPR_GOTO(RK_SUCCESS != s32Ret, FAILURE,
        " Error(%#x),SAMPLE_IVS_Md_Init failed!\n", s32Ret);
    s_bStopSignal = false;
    /******************************************
      step 3: Create work thread
     ******************************************/
    snprintf(acThreadName, 16, "IVE_MdProc");
#if BUILD_SIMULATOR
    pthread_setname_np(acThreadName);
#endif
    pthread_create(&s_hMdThread, 0, SAMPLE_IVS_QUIT, NULL);
#if BUILD_SDK_ENV
    pthread_setname_np(s_hMdThread, acThreadName);
#endif

    SAMPLE_IVS_MdProc(&s_stMd);

    //SAMPLE_PAUSE();
    s_bStopSignal = true;
    pthread_join(s_hMdThread, NULL);
    s_hMdThread = 0;

FAILURE:

    return;
}

/******************************************************************************
* function : Md sample signal handle
******************************************************************************/
void SAMPLE_IVS_Md_HandleSig(void)
{
    s_bStopSignal = true;
    if (0 != s_hMdThread)
    {
        pthread_join(s_hMdThread, NULL);
        s_hMdThread = 0;
    }
    SAMPLE_IVS_Md_Uninit(&(s_stMd));
    memset(&s_stMd,0,sizeof(s_stMd));

}

int main(int argc, char *argv[])
{
    SAMPLE_IVS_Md();

    return 0;
}

