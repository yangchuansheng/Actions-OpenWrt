#!/bin/bash
#=============================================================
# https://github.com/P3TERX/Actions-OpenWrt
# File name: diy-part1.sh
# Description: OpenWrt DIY script part 1 (Before Update feeds)
# Lisence: MIT
# Author: P3TERX
# Blog: https://p3terx.com
#=============================================================

# Uncomment a feed source
#sed -i 's/^#\(.*helloworld\)/\1/' feeds.conf.default

# Add a feed source
#sed -i '$a src-git lienol https://github.com/Lienol/openwrt-package' feeds.conf.default

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

# Modify default IP
sed -i 's/192.168.1.1/192.168.100.254/g' package/base-files/files/bin/config_generate
sed -i "s/timezone='UTC'/timezone='CST-8'/" package/base-files/files/bin/config_generate
sed -i "/timezone='CST-8'/a \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ set system.@system[-1].zonename='Asia/Shanghai'" package/base-files/files/bin/config_generate

echo "src-git small https://github.com/kenzok8/small" >> feeds.conf.default
echo "src-git others https://github.com/kenzok8/openwrt-packages" >> feeds.conf.default
