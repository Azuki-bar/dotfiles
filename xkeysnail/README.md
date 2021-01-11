```
# https://ohmyenter.com/how-to-install-and-autostart-xkeysnail/
[Unit]
Description=xkeysnail
[Service]
KillMode=process
ExecStartPre=/usr/bin/xhost +si:localuser:azukibar
ExecStart=/usr/local/bin/xkeysnail /home/azukibar/.config/xkeysnail/config.py
Type=simple
Restart=always
RestartSec=10s
# たぶん :0 で問題ないと思いますが環境にもよります。`echo $DISPLAY`の値を設定してください
Environment=DISPLAY=:0
[Install]
WantedBy=default.target
```
please write this script to `~/.config/systemd/user/xkeysnail.service`

```bash
systemctl --user enable xkeysnail
systemctl --user start xkeysnail
```
