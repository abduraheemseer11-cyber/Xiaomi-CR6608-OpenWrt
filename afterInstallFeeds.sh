#!/bin/bash

# Modify default IP (تم التعليق عليها لأننا نستخدم uci-defaults)
# sed -i 's/192.168.1.1/172.31.3.1/g' package/base-files/files/bin/config_generate
# sed -i 's/255.255.255.0/255.255.0.0/g' package/base-files/files/bin/config_generate

#更换argon主题
rm -rf openwrt/package/lean/luci-theme-argon
rm -rf openwrt/package/feeds/kenzo/luci-theme-argon
git clone https://github.com/jerrykuku/luci-theme-argon.git package/luci-theme-argon
git clone https://github.com/NULLlnull/luci-theme-rosy.git package/luci-theme-rosy
