目标检测模型（根据设备和目标类型选择一个）
object_detection_ipc_cls7.data		目标检测（人形、人脸、机动车、非机动车）输入图像为横形(需要配置detModel=ROCKIVA_DET_MODEL_CLS7)
object_detection_pfp.data       	目标检测（人形、人脸、宠物）(需要配置detModel=ROCKIVA_DET_MODEL_PFP)
object_detection_pfp_lite_512x288.data  目标检测（人形、人脸、宠物）轻量模型，输入为512x288适合近距离场景使用(需要配置detModel=ROCKIVA_DET_MODEL_PFP，并模型文件重命名为object_detection_pfp.data)
object_detection_pfp_lite_896x512.data  目标检测（人形、人脸、宠物）轻量模型，输入为896x512适合人脸抓拍场景使用(需要配置detModel=ROCKIVA_DET_MODEL_PFP，并模型文件重命名为object_detection_pfp.data)


人脸抓拍分析模型
face_quality_v2.data			人脸质量评分模型
face_mask_classify.data			人脸口罩判断模型

