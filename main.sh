
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
git_clone https://github.com/kiddin9/luci-theme-edge
git_clone https://github.com/sbwml/openwrt-alist && mvdir openwrt-alist
git_clone https://github.com/sirpdboy/luci-app-ddns-go ddns-go && mvdir ddns-go
git_clone https://github.com/xiaorouji/openwrt-passwall && mvdir openwrt-passwall
git_clone https://github.com/xiaorouji/openwrt-passwall2 passwall2 && mv -n passwall2/luci-app-passwall2 ./;rm -rf passwall2
git clone --depth 1 -b luci https://github.com/xiaorouji/openwrt-passwall passwall && mv -n passwall/luci-app-passwall ./;rm -rf passwall
git_clone https://github.com/destan19/OpenAppFilter && mvdir OpenAppFilter
git_clone https://github.com/linkease/nas-packages && mv -n nas-packages/{network/services/*,multimedia/*} ./; rm -rf nas-packages
git_clone https://github.com/linkease/nas-packages-luci && mv -n nas-packages-luci/luci/* ./; rm -rf nas-packages-luci
git_clone https://github.com/linkease/istore && mv -n istore/luci/* ./; rm -rf istore
git_clone https://github.com/linkease/openwrt-app-actions
git_clone https://github.com/tty228/luci-app-serverchan
git_clone https://github.com/esirplayground/LingTiGameAcc
git_clone https://github.com/esirplayground/luci-app-LingTiGameAcc
git_clone https://github.com/riverscn/openwrt-iptvhelper && mvdir openwrt-iptvhelper
git_clone https://github.com/messense/aliyundrive-webdav aliyundrive && mv -n aliyundrive/openwrt/* ./ ; rm -rf aliyundrive
git_clone https://github.com/messense/aliyundrive-fuse aliyundrive && mv -n aliyundrive/openwrt/* ./;rm -rf aliyundrive
git_clone https://github.com/jerrykuku/luci-theme-argon
git_clone https://github.com/jerrykuku/luci-app-argon-config
#git_clone https://github.com/jerrykuku/luci-app-vssr
#git_clone https://github.com/jerrykuku/luci-app-ttnode
git_clone https://github.com/jerrykuku/luci-app-jd-dailybonus
git_clone https://github.com/sirpdboy/luci-app-advanced
git_clone https://github.com/sirpdboy/luci-app-autotimeset
git_clone https://github.com/sirpdboy/luci-app-lucky oplucky && mv -f oplucky/*/ ./ && rm -rf oplucky
git_clone https://github.com/jerrykuku/luci-app-go-aliyundrive-webdav
git_clone https://github.com/lisaac/luci-app-dockerman dockerman && mv -n dockerman/applications/* ./; rm -rf dockerman
git_clone https://github.com/vernesong/OpenClash && mv -n OpenClash/luci-app-openclash ./; rm -rf OpenClash
git_clone https://github.com/frainzy1477/luci-app-clash
git_clone https://github.com/Erope/openwrt_nezha nezha && mvdir nezha
git_clone https://github.com/HDragon8/default-settings
git_clone https://github.com/fw876/helloworld

#svn export https://github.com/fw876/helloworld/trunk/v2raya
#svn export https://github.com/fw876/helloworld/trunk/luci-app-ssr-plus
#svn export https://github.com/fw876/helloworld/trunk/lua-neturl
#svn export https://github.com/fw876/helloworld/trunk/redsocks2
#svn export https://github.com/fw876/helloworld/trunk/microsocks
svn export https://github.com/Lienol/openwrt-package/trunk/luci-app-timecontrol
svn export https://github.com/Lienol/openwrt-package/trunk/luci-app-control-timewol
svn export https://github.com/Lienol/openwrt-package/trunk/luci-app-control-webrestriction
svn export https://github.com/Lienol/openwrt-package/trunk/luci-app-control-weburl
svn export https://github.com/coolsnowwolf/lede/trunk/package/lean/mt
svn export https://github.com/coolsnowwolf/lede/trunk/package/lean/vsftpd-alt
svn export https://github.com/coolsnowwolf/lede/trunk/package/lean/upx
svn export https://github.com/coolsnowwolf/lede/trunk/package/lean/shortcut-fe
svn export https://github.com/coolsnowwolf/lede/trunk/package/lean/adbyby
svn export https://github.com/coolsnowwolf/lede/trunk/package/lean/ucl

git_sparse_clone master "https://github.com/coolsnowwolf/luci" "leluci" applications/luci-app-accesscontrol applications/luci-app-adbyby-plus \
applications/luci-app-airplay2 applications/luci-app-arpbind applications/luci-app-autoreboot \
applications/luci-app-cifs-mount applications/luci-app-cifsd applications/luci-app-diskman \
applications/luci-app-easymesh applications/luci-app-filetransfer applications/luci-app-guest-wifi \
applications/luci-app-kodexplorer \
applications/luci-app-music-remote-center applications/luci-app-netdata \
applications/luci-app-pgyvpn applications/luci-app-phtunnel \
applications/luci-app-pushbot applications/luci-app-ramfree \
applications/luci-app-rclone applications/luci-app-socat applications/luci-app-turboacc \
applications/luci-app-unblockmusic applications/luci-app-usb-printer applications/luci-app-uugamebooster applications/luci-app-verysync \
applications/luci-app-vlmcsd applications/luci-app-vsftpd applications/luci-app-webadmin applications/luci-app-wrtbwmon \
applications/luci-app-xlnetacc applications/luci-app-zerotier libs/luci-lib-fs

git_sparse_clone master "https://github.com/coolsnowwolf/packages" "leanpkg" multimedia/UnblockNeteaseMusic-Go multimedia/UnblockNeteaseMusic \
net/go-aliyundrive-webdav net/phtunnel net/uugamebooster net/verysync net/vlmcsd net/dnsforwarder net/pgyvpn
#git_sparse_clone master "https://github.com/coolsnowwolf/packages" "leanpkg" net/miniupnpd multimedia/UnblockNeteaseMusic-Go \
#multimedia/UnblockNeteaseMusic net/amule net/antileech net/baidupcs-web net/frp multimedia/gmediarender net/go-aliyundrive-webdav \
#net/qBittorrent-static net/qBittorrent net/transmission net/phtunnel libs/qtbase libs/qttools libs/rblibtorrent devel/go-rice \
#net/uugamebooster net/verysync net/vlmcsd net/dnsforwarder net/nps net/n2n net/mosdns net/tcpping net/netatalk net/pgyvpn libs/wxbase
#mv -f miniupnpd miniupnpd-iptables

git_sparse_clone master "https://github.com/immortalwrt/luci" "immluci" applications/luci-app-cpufreq applications/luci-app-advancedsetting applications/luci-app-cd8021x \
applications/luci-app-filebrowser applications/luci-app-fileassistant applications/luci-app-timewol \
applications/luci-app-unblockneteasemusic-go applications/luci-app-unblockneteasemusic applications/luci-app-usb3disable applications/luci-app-cpulimit

git_sparse_clone master "https://github.com/immortalwrt/immortalwrt" "immortal" package/kernel/rtl88x2bu \
package/kernel/r8168 package/kernel/rtl8821cu package/kernel/rtl8189es package/utils/mhz  \
package/emortal/autocore package/emortal/automount package/emortal/autosamba package/emortal/ipv6-helper

git_sparse_clone master "https://github.com/immortalwrt/packages" "immpkgs" net/cdnspeedtest utils/filebrowser utils/cpulimit

mv -n openwrt-app-actions/applications/* ./;rm -rf openwrt-app-actions
rm -Rf */.git

rm -rf ./*/.git & rm -f ./*/.gitattributes
rm -rf ./*/.svn & rm -rf ./*/.github & rm -rf ./*/.gitignore

sed -i \
-e 's?include \.\./\.\./\(lang\|devel\)?include $(TOPDIR)/feeds/packages/\1?' \
-e 's?2. Clash For OpenWRT?3. Applications?' \
-e 's?\.\./\.\./luci.mk?$(TOPDIR)/feeds/luci/luci.mk?' \
-e 's/ca-certificates/ca-bundle/' \
*/Makefile

sed -i 's/luci-lib-ipkg/luci-base/g' luci-app-store/Makefile
sed -i "/minisign:minisign/d" luci-app-dnscrypt-proxy2/Makefile
#sed -i 's/+dockerd/+dockerd +cgroupfs-mount/' luci-app-docker*/Makefile
#sed -i '$i /etc/init.d/dockerd restart &' luci-app-docker*/root/etc/uci-defaults/*
sed -i 's/+libcap /+libcap +libcap-bin /' luci-app-openclash/Makefile
sed -i 's/\(+luci-compat\)/\1 +luci-theme-argon/' luci-app-argon-config/Makefile
#sed -i 's/\(+luci-compat\)/\1 +luci-theme-argonne/' luci-app-argonne-config/Makefile
sed -i 's/ +uhttpd-mod-ubus//' luci-app-packet-capture/Makefile
sed -i 's/	ip.neighbors/	luci.ip.neighbors/' luci-app-wifidog/luasrc/model/cbi/wifidog/wifidog_cfg.lua
sed -i "s/nas/services/g" `grep nas -rl luci-app-fileassistant`
sed -i "s/NAS/Services/g" `grep NAS -rl luci-app-fileassistant`
find -type f -name Makefile -exec sed -ri  's#mosdns[-_]neo#mosdns#g' {} \;

bash diy/create_acl_for_luci.sh -a >/dev/null 2>&1
bash diy/convert_translation.sh -a >/dev/null 2>&1

rm -rf create_acl_for_luci.err & rm -rf create_acl_for_luci.ok
rm -rf create_acl_for_luci.warn

exit 0
