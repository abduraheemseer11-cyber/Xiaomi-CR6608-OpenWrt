# Alameer Software - OpenWrt for Xiaomi Mi Router CR6608

Custom OpenWrt 23.05.x firmware (ramips/mt7621, `xiaomi_mi-router-cr6608`) built with ImageBuilder on GitHub Actions.
Boots as a Dumb AP / bridge at **192.168.1.20**.

## Branding
Replace these files with your own and commit:
- `files/www/luci-static/argon/img/logo.png` (and the copy in `files/www/luci-static/resources/logo.png`)
- `files/www/luci-static/argon/img/favicon.ico` (auto-generated from logo if missing)
- `files/www/luci-static/argon/img/bg1.jpg` (login background; auto-generated if missing)

## Build
GitHub -> Actions -> **Build Alameer OpenWrt - Xiaomi CR6608** -> Run workflow.
Images appear in the run's artifacts and in Releases.
