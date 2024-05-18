# blacksilk-alpine-rv1106

RV1106 1.6.0 SDK，支持sololinker-a开发板

- [开箱](https://www.bilibili.com/video/BV1Dm411y7nM/?vd_source=4e6e40bc200c6fc912f05c90aa730d42)
- [固件编译](https://www.bilibili.com/video/BV1wb42187Lj/?vd_source=4e6e40bc200c6fc912f05c90aa730d42)

## 启动容器

```bash
docker run -it --privileged -v $PWD:/home -v /tmp:/tmp ubuntu:22.04
```

## 安装依赖

```bash
# 移动home目录
cd /home
# 替换源，安装必备组建
./develop_init_for_docker.sh
# 安装系统依赖
./develop_init_for_ubuntu22.04.sh
```

## 编译固件

```bash
# 选择配置
./build.sh lunch
# 编译固件
./build.sh
# 清除环境
./build.sh clean
```

## 固件下载

```bash
# 需要进入MaskRom模式
./tools/downloader/rockchip.sh ./output/image
```