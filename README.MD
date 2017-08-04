
#Apple rsync backup for home folders with launchagents integration


launchctl load ~/Library/LaunchAgents/pro.mchus.arb.plist
launchctl unload ~/Library/LaunchAgents/pro.mchus.arb.plist
launchctl start pro.mchus.arb
launchctl stop pro.mchus.arb
launchctl list

## Automate install

bash <(curl -s https://raw.githubusercontent.com/mchus/arb/master/install)
