#!/bin/bash
#=================================================
# Description: DIY script
# Lisence: MIT
# Author: P3TERX
# Blog: https://p3terx.com
#=================================================
# Modify default IP
sed -i 's/192.168.1.1/192.168.100.254/g' package/base-files/files/bin/config_generate
sed -i "s/timezone='UTC'/timezone='CST-8'/" package/base-files/files/bin/config_generate
sed -i "/timezone='CST-8'/a \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ set system.@system[-1].zonename='Asia/Shanghai'" package/base-files/files/bin/config_generate
echo "src-git lienol https://github.com/Lienol/openwrt-package" >> feeds.conf.default
./scripts/feeds clean
./scripts/feeds update -a
rm -rf feeds/lienol/package/ipt2socks
rm -rf feeds/lienol/package/shadowsocksr-libev
rm -rf feeds/lienol/package/pdnsd-alt
rm -rf feeds/lienol/package/verysync
rm -rf feeds/lienol/others/luci-app-verysync
#rm -rf package/lean/kcptun
#rm -rf package/lean/trojan
rm -rf package/lean/luci-app-kodexplorer
rm -rf package/lean/luci-app-pppoe-relay
rm -rf package/lean/luci-app-pptp-server
rm -rf package/lean/luci-app-v2ray-server
./scripts/feeds install -a
