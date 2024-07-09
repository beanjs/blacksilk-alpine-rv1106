#! /bin/sh

root=$(dirname $(realpath $0))

# 切换源
sed -i 's/dl-cdn.alpinelinux.org/mirrors.aliyun.com/g' /etc/apk/repositories

# 安装基础包
apk update
apk add --no-cache openrc openntpd agetty alpine-conf openssh util-linux bash bash-completion e2fsprogs-extra
apk add --no-cache wpa_supplicant gzip
# apk add --no-cache apk-tools zfs
apk cache clean

# 设置root密码
echo root:password|chpasswd

# 复制启动项
cp ${root}/patch/etc/init.d/* /etc/init.d

# 添加启动项
rc-update add cgroups boot
rc-update add devfs boot
rc-update add procfs boot
rc-update add sysfs boot
rc-update add diskresize default
rc-update add networking default
rc-update add sshd default

# 创建导出目录
mkdir -p ${root}/.rootfs && rm -rf ${root}/.rootfs/*

# 准备文件系统
for d in bin etc lib media sbin usr var; do tar c "$d" | tar x -C ${root}/.rootfs; done
for dir in dev opt proc root run sys tmp; do mkdir -p ${root}/.rootfs/${dir}; done

# 合并修改项
echo merge patch
cp -rf ${root}/patch/* ${root}/.rootfs
rm -rf ${root}/.rootfs/var/cache/apk/*

# 导出文件系统
echo export rootfs
cd ${root}/.rootfs/ && tar czf rootfs_alpine.tar.gz * && mv rootfs_alpine.tar.gz ..
rm -rf ${root}/.rootfs

# 退出
exit
