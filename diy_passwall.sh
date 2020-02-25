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
cat > package/base-files/files/etc/banner <<EOF
        ´´´´´´´´██´´´´´´´
        ´´´´´´´████´´´´´´
        ´´´´´████████´´´´
        ´´`´███▒▒▒▒███´´´´´
        ´´´███▒●▒▒●▒██´´´
        ´´´███▒▒▒▒▒▒██´´´´´
        ´´´███▒▒▒▒██´                      apiVersion: v1
        ´´██████▒▒███´´´´´                 kind: Router
        ´██████▒▒▒▒███´´                   metadata:
        ██████▒▒▒▒▒▒███´´´´                  name: openwrt
        ´´▓▓▓▓▓▓▓▓▓▓▓▓▓▒´´                   labels:
        ´´▒▒▒▒▓▓▓▓▓▓▓▓▓▒´´´´´                  kernel: 4.19
        ´.▒▒▒´´▓▓▓▓▓▓▓▓▒´´´´´              spec:
        ´.▒▒´´´´▓▓▓▓▓▓▓▒                     platform:
        ..▒▒.´´´´▓▓▓▓▓▓▓▒                    - name: pve
        ´▒▒▒▒▒▒▒▒▒▒▒▒                          resources:
        ´´´´´´´´´███████´´´´´                    limits:
        ´´´´´´´´████████´´´´´´´                    cpu: 2
        ´´´´´´´█████████´´´´´´                     mem: 2Gi
        ´´´´´´██████████´´´´             
        ´´´´´´██████████´´´              大部分人都在关注你飞的高不高，却没人在乎你飞的累不累，这就是现实！
        ´´´´´´´█████████´´                      我从不相信梦想，我，只，相，信，自，己！
        ´´´´´´´█████████´´´
        ´´´´´´´´████████´´´´´
        ________▒▒▒▒▒
        _________▒▒▒▒
        _________▒▒▒▒
        ________▒▒_▒▒
        _______▒▒__▒▒
        _____ ▒▒___▒▒
        _____▒▒___▒▒
        ____▒▒____▒▒
        ___▒▒_____▒▒
        ███____ ▒▒
        ████____███
        █ _███_ _█_███
——————————————————————————女神保佑，代码无bug——————————————————————
EOF
mkdir package/my
echo "src-git lienol https://github.com/Lienol/openwrt-package" >> feeds.conf.default
./scripts/feeds clean
./scripts/feeds update -a
rm -rf feeds/lienol/package/ipt2socks
rm -rf feeds/lienol/package/shadowsocksr-libev
rm -rf feeds/lienol/package/pdnsd-alt
rm -rf feeds/lienol/package/verysync
rm -rf feeds/lienol/others/luci-app-verysync
rm -rf package/lean/kcptun
rm -rf package/lean/trojan
rm -rf package/lean/luci-app-kodexplorer
rm -rf package/lean/luci-app-pppoe-relay
rm -rf package/lean/luci-app-pptp-server
rm -rf package/lean/luci-app-v2ray-server
./scripts/feeds install -a
