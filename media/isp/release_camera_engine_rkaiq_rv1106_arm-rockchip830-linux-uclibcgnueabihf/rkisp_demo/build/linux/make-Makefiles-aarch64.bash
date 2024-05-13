#!/bin/bash
# Run this from within a bash shell
# x86_64 is for simulation do not enable RK platform
export AIQ_BUILD_HOST_DIR=/data/project_codes/gcc-arm-8.3-2019.03-x86_64-aarch64-linux-gnu
export AIQ_BUILD_TOOLCHAIN_TRIPLE=aarch64-linux-gnu
export AIQ_BUILD_SYSROOT=libc
export AIQ_BUILD_ARCH=aarch64
TOOLCHAIN_FILE=$(pwd)/../../cmake/toolchains/gcc.cmake
OUTPUT=$(pwd)/output/${AIQ_BUILD_ARCH}
SOURCE_PATH=$(pwd)/../../

mkdir -p $OUTPUT
pushd $OUTPUT

cmake -G "Ninja" \
    -DCMAKE_BUILD_TYPE=MinSizeRel \
    -DARCH=${AIQ_BUILD_ARCH} \
    -DCMAKE_TOOLCHAIN_FILE=$TOOLCHAIN_FILE \
    -DCMAKE_SKIP_RPATH=TRUE \
    -DCMAKE_EXPORT_COMPILE_COMMANDS=YES \
    -DISP_HW_VERSION=${ISP_HW_VERSION} \
    -DCMAKE_INSTALL_PREFIX="installed" \
    $SOURCE_PATH \
&& ninja -j$(nproc) \
&& ninja install

popd
