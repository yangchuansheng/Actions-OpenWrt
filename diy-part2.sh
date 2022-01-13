#!/bin/bash
#============================================================
# https://github.com/P3TERX/Actions-OpenWrt
# File name: diy-part2.sh
# Description: OpenWrt DIY script part 2 (After Update feeds)
# Lisence: MIT
# Author: P3TERX
# Blog: https://p3terx.com
#============================================================

# Modify default IP
#sed -i 's/192.168.1.1/192.168.50.5/g' package/base-files/files/bin/config_generate

rm -rf feeds/small/ipt2socks
rm -rf feeds/small/pdnsd-alt
rm -rf package/lean/kcptun
rm -rf package/lean/trojan
rm -rf feeds/small/v2ray-plugin

sed -ri 's/luci-theme-\S+/luci-theme-ifit/g' feeds/luci/collections/luci/Makefile
sed -i "s/sys.hostname()/\"WEEXIANG\"/g" feeds/others/luci-theme-ifit/files/templates/header.htm
sed -i "/Powered by/ c\\ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ BAILIAN data ltd" feeds/others/luci-theme-ifit/files/templates/footer.htm
sed -i "/ver.distversion/d" feeds/others/luci-theme-ifit/files/templates/footer.htm

# netmaker
sed -i "/^PKG_VERSION/ c\PKG_VERSION:=0.9.3" feeds/netmaker/netmaker/Makefile
sed -i "/^PKG_SOURCE_VERSION/ c\PKG_SOURCE_VERSION:=106047243720605df6757ce706690a434d976c1a" feeds/netmaker/netmaker/Makefile
sed -i "/^PKG_SOURCE_DATE/ c\PKG_SOURCE_DATE:=20220107" feeds/netmaker/netmaker/Makefile
