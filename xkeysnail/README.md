```
# https://qiita.com/yosmoc/items/2e1d779e806a7e8543d6
# https://ohmyenter.com/how-to-install-and-autostart-xkeysnail/
[Unit]
Description=xkeysnail
[Service]
KillMode=process
ExecStartPre=/usr/bin/xhost +si:localuser:azukibar
ExecStart=/usr/local/bin/xkeysnail -q /home/azukibar/.config/xkeysnail/config.py
Type=simple
Restart=always
RestartSec=10s

Environment=DISPLAY=:0
[Install]
WantedBy=default.target
```

please write this script to `~/.config/systemd/user/xkeysnail.service`

```bash
systemctl --user enable xkeysnail
systemctl --user start xkeysnail
```

参考にしたサイトからそのまま持ってきているのでそちらを見てください。
