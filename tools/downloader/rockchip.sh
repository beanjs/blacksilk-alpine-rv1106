#! /bin/sh

os=$(uname -s)
root=$(dirname $(realpath $0))
dir=$1

case $os in
  Linux)
  tool=$root/linux/upgrade_tool
  sudo chmod +x $tool
  tool="sudo $tool"
  ;;
  Darwin)
  tool=$root/drawin/upgrade_tool
  chmod +x $tool
  ;;
  *)
  echo "$os not support"
  exit 1
  ;;
esac

if [ ! -n "${dir}" ]; then
  echo "error: image path not exist"
  echo "  please use: rockchip.sh <image path>"
  exit 0
fi

download_image(){
  addr=$1
  name=$(echo $2 | tr -d '\r')

  case $name in
  env|idblock|uboot|boot|rootfs)
    $tool wl $addr ${dir}/$name.img
    ;;
  *);;
  esac
}

$tool db ${dir}/download.bin
$tool pl | awk '{print $2, $4}' | while read line
do
  download_image $line
done
$tool rd