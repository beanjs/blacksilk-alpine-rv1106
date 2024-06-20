# blacksilk-alpine-rv1106

RV1106 1.6.0 SDK，支持sololinker-a开发板

- [开箱](https://www.bilibili.com/video/BV1Dm411y7nM)
- [固件编译](https://www.bilibili.com/video/BV1wb42187Lj)
- [固件烧写](https://www.bilibili.com/video/BV16142117TV)
- [提取文件系统](https://www.bilibili.com/video/BV1pi421i7hw)

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

| 模式    | 文件                                              |
| ------- | ------------------------------------------------- |
| Maskrom | download.bin                                      |
| Loader  | env.img idblock.img uboot.img boot.img rootfs.img |

```bash
# 需要进入MaskRom模式(仅支持linux和mac)
./tools/downloader/rockchip.sh ./output/image
```
