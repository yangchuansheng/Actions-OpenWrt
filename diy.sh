#!/bin/bash
#=================================================
# Description: DIY script
# Lisence: MIT
# Author: P3TERX
# Blog: https://p3terx.com
#=================================================
# Modify default IP
sed -i 's/192.168.1.1/192.168.100.254/g' package/base-files/files/bin/config_generate
mkdir package/my
git clone https://github.com/Leo-Jo-My/luci-app-ssr-plus-Jo package/my/luci-app-ssr-plus-Jo
./scripts/feeds update -a
./scripts/feeds install -a
