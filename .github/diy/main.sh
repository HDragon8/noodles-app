#!/bin/bash
function git_clone() {
  git clone --depth 1 $1 $2 || true
 }
function git_sparse_clone() {
  branch="$1" rurl="$2" localdir="$3" && shift 3
  git clone -b $branch --depth 1 --filter=blob:none --sparse $rurl $localdir
  cd $localdir
  git sparse-checkout init --cone
  git sparse-checkout set $@
  mv -n $@ ../
  cd ..
  rm -rf $localdir
  }
function mvdir() {
mv -n `find $1/* -maxdepth 0 -type d` ./
rm -rf $1
}
git_sparse_clone master "https://github.com/coolsnowwolf/packages" "leanpkg" net/miniupnpd net/mwan3 multimedia/UnblockNeteaseMusic-Go \
multimedia/UnblockNeteaseMusic net/amule net/antileech net/baidupcs-web net/frp multimedia/gmediarender net/go-aliyundrive-webdav \
net/qBittorrent-static net/qBittorrent net/transmission net/phtunnel libs/qtbase libs/qttools libs/rblibtorrent \
net/uugamebooster net/verysync net/vlmcsd net/dnsforwarder net/nps net/tcpping net/netatalk net/pgyvpn
mv -f miniupnpd miniupnpd-iptables

git_sparse_clone master "https://github.com/immortalwrt/packages" "immpkgs" net/mwol \
net/sub-web net/dnsproxy net/haproxy net/v2raya net/cdnspeedtest net/keepalived \
net/subconverter net/ngrokc net/oscam net/njitclient net/scutclient net/gost net/gowebdav \
admin/bpytop libs/jpcre2 libs/wxbase libs/rapidjson libs/libcron libs/quickjspp libs/toml11 \
utils/cpulimit utils/filebrowser utils/cups net/udp2raw net/msd_lite net/xfrpc
git_sparse_clone master "https://github.com/xiaoqingfengATGH/feeds-xiaoqingfeng" "xiaoqingfeng" homeredirect luci-app-homeredirect

git_sparse_clone develop "https://github.com/Ysurac/openmptcprouter-feeds" "openmptcp" luci-app-snmpd \
luci-app-packet-capture luci-app-mail msmtp
git_sparse_clone master "https://github.com/immortalwrt/immortalwrt" "immortal" package/kernel/rtl88x2bu \
package/kernel/r8168 package/kernel/rtl8821cu package/kernel/rtl8189es package/emortal/autocore  package/emortal/automount package/network/utils/fullconenat \
package/utils/mhz

git_sparse_clone master "https://github.com/coolsnowwolf/luci" "leluci" applications libs/luci-lib-fs
mv -f applications luciapp
#rm -rf luciapp/{luci-app-qbittorrent,luci-app-cpufreq}
git_sparse_clone master "https://github.com/immortalwrt/luci" "immluci" applications protocols/luci-proto-minieap
mv -n applications/* luciapp/; rm -rf applications

git_sparse_clone master "https://github.com/x-wrt/com.x-wrt" "x-wrt" natflow lua-ipops luci-app-macvlan

git_sparse_clone master "https://github.com/coolsnowwolf/lede" "leanlede" package/lean package/network/services/shellsync
mv -f lean luciapp
rm -rf luciapp/default-settings

rm -rf LingTiGameAcc
rm -rf luci-app-LingTiGameAcc
git_sparse_clone LingTiGameAcc "https://github.com/linkease/istore-packages" "LingTi" LingTiGameAcc luci-app-LingTiGameAcc

mv -n luciapp/* ./ ; rm -Rf luciapp
mv -n openwrt-passwall/* ./ ; rm -Rf openwrt-passwall
mv -n openwrt-package/* ./ ; rm -Rf openwrt-package
mv -n openwrt-app-actions/applications/* ./;rm -rf openwrt-app-actions
sed -i \
-e 's?include \.\./\.\./\(lang\|devel\)?include $(TOPDIR)/feeds/packages/\1?' \
-e 's?2. Clash For OpenWRT?3. Applications?' \
-e 's?\.\./\.\./luci.mk?$(TOPDIR)/feeds/luci/luci.mk?' \
-e 's/ca-certificates/ca-bundle/' \
*/Makefile

sed -i 's/luci-lib-ipkg/luci-base/g' luci-app-store/Makefile
sed -i "/minisign:minisign/d" luci-app-dnscrypt-proxy2/Makefile
sed -i 's/+dockerd/+dockerd +cgroupfs-mount/' luci-app-docker*/Makefile
sed -i '$i /etc/init.d/dockerd restart &' luci-app-docker*/root/etc/uci-defaults/*
sed -i 's/+libcap /+libcap +libcap-bin /' luci-app-openclash/Makefile
sed -i 's/\(+luci-compat\)/\1 +luci-theme-argon/' luci-app-argon-config/Makefile
sed -i 's/\(+luci-compat\)/\1 +luci-theme-argonne/' luci-app-argonne-config/Makefile
sed -i 's/ +uhttpd-mod-ubus//' luci-app-packet-capture/Makefile
sed -i 's/	ip.neighbors/	luci.ip.neighbors/' luci-app-wifidog/luasrc/model/cbi/wifidog/wifidog_cfg.lua
sed -i -e 's/nas/system/g' -e 's/NAS/System/g' $(grep -rl 'nas\|NAS' luci-app-fileassistant)
sed -i 's/pkg_web_version:=.*/pkg_web_version:=$pkg_version/' alist/Makefile
#rm -rf luci-app-adguardhome/root/etc/AdGuardHome.yaml
rm -rf luci-app-adguardhome/po/zh_Hans
cp -Rf luci-app-adguardhome/po/zh-cn luci-app-adguardhome/po/zh_Hans
exit 0

