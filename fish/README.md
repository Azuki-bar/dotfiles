現在のconfig.fish
```fish
alias pbcopy='xsel --clipboard --input'
alias pbpaste='xsel --clipboard --output'
alias view='nvim -R'
alias vvim='/usr/bin/vim'
alias vi='nvim'
status --is-interactive; and source (rbenv init -|psub)

set -g theme_display_date no
set -g theme_display_cmd_duration no
set -g theme_color_scheme solarized-light

# https://wiki.archlinux.org/title/GNOME/Keyring
if test -n "$DESKTOP_SESSION"
    set -x (gnome-keyring-daemon --start | string split "=")
end

```
