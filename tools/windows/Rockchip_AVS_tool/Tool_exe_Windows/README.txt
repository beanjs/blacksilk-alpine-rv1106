//程序用法
rkAVS_calibDemo.exe -h
//模型标定
rkAVS_calibDemo.exe -m=0 -c=./calibModelConfig.txt
//产线标定
rkAVS_calibDemo.exe -m=1 -c=./calibProductConfig.txt
//产线验证
rkAVS_calibDemo.exe -m=2 -c=./verifyProductConfig.txt

-c对应的配置文件需要根据实际相机参数、标定板参数进行修改。

/*********************************************************************/
*************************calibModelConfig*****************************
/*********************************************************************/
srcPath: ./calibModel/all_calib_images/
dstPath: ./calibModel/rk_calib_result/
imageNameFormat: .yuv                                        //.jpg、.png、.bmp，.bin、.yuv
cameraNum: 2                                                 //camera number（2-8）
cameraType: 1                                                //0-pinhole、1-omn、2-fisheye
cameraFov: 120                                               //horizontal fov
boardWidth: 15                                               //number of chessboard corners in horizontal direction
boardHeight: 8                                               //number of chessboard corners in vertical direction
squareSize: 30                                               //size of chessboard(mm)
imageWidth: 1920                                             //image width
imageHeight: 1080                                            //image height
imageStride: 1920                                            //image stride
imageFormat: 2                                               //0-gray、1-rgb、2-yuv
isSaveCornersImage: 0                                        //draw corners and save
useAcurateMode: 0                                        	 //Optimize by Stitch


demo工程中main.cpp中使用opencv仅用于读取非yuv图像，不做任何处理
/*********************************************************************/
*************************calibProductConfig*****************************
/*********************************************************************/
leftImagePath: ./calibProduct/src/left.yuv
rightImagePath: ./calibProduct/src/right.yuv
dstPath: ./calibProduct/rk_calib_result/
calibTorrentPath: ./calibProduct/src/rk_2_camera_result.xml
cameraNum: 2                                                 //camera number（2）
cameraType: 1                                                //0-pinhole、1-omn、2-fisheye
cameraFov: 120                                               //horizontal fov
boardWidth: 15                                               //number of chessboard corners in horizontal direction
boardHeight: 8                                              //number of chessboard corners in vertical direction
squareSize: 30                                               //size of chessboard(mm)
leftImageWidth: 1920                                         // camera0 image width
leftImageHeight: 1080                                        // camera0 image height
leftImageStride: 1920                                        // camera0 image stride
rightImageWidth: 1920                                        // camera1 image width
rightImageHeight: 1080                                       // camera1 image height
rightImageStride: 1920                                       // camera1 image stride
imageFormat: 2                                               //0-gray、1-rgb、2-yuv
isSaveCornersImage: 1                                        //draw corners and save
useAccurateMode: 1                                        	 //optimize by stitch

/*********************************************************************/
*************************verifyProductConfig*****************************
/*********************************************************************/
leftImagePath: ./calibVerify/src/1920x1080_camera_0_verify.yuv           //verify image from cam0
rightImagePath: ./calibVerify/src/1920x1080_camera_1_verify.yuv          //verify image from cam1
dstPath: ./calibVerify/dst/
calibTorrentPath: ./calibVerify/src/rk_2_camera_result.xml
cameraNum: 2                                                 //camera number（2）
cameraType: 1                                                //0-pinhole、1-omn、2-fisheye
cameraFov: 120                                               //horizontal fov
boardWidth: 24                                               //number of chessboard corners in horizontal direction
boardHeight: 13                                              //number of chessboard corners in vertical direction
squareSize: 20                                               //size of chessboard(mm)
leftImageWidth: 1920                                         // camera0 image width
leftImageHeight: 1080                                        // camera0 image height
leftImageStride: 1920                                        // camera0 image stride
rightImageWidth: 1920                                        // camera1 image width
rightImageHeight: 1080                                       // camera1 image height
rightImageStride: 1920                                       // camera1 image stride
imageFormat: 2                                               //0-gray、1-rgb、2-yuv
isSaveCornersImage: 0                                        //draw corners and save
useAccurateMode: 0                                        	 //optimize by stitch

/*********************************************************************/
*************************findPointsConfig*****************************
/*********************************************************************/
srcPath: ./findPoints/camera0_01_000.yuv
dstPath: ./findPoints/camera0_01_000.jpg
boardWidth: 15                                               //number of chessboard corners in horizontal direction
boardHeight: 8                                               //number of chessboard corners in vertical direction
squareSize: 30                                               //size of chessboard(mm)
imageWidth: 1920                                             //image width
imageHeight: 1080                                            //image height
imageStride: 1920                                            //image stride
imageFormat: 2                                               //0-gray、1-rgb、2-yuv