alias pbcopy='xsel --clipboard --input'
alias pbpaste='xsel --clipboard --output'
alias view='nvim -R'
alias vvim='/usr/bin/vim'
alias vi='nvim'
alias vim='nvim'
alias ls='exa'
alias chmod='chmod --preserve-root'
alias ip='ip --color=auto'
alias cp='cp -i'
alias cat='bat'
alias diff='delta -s'
alias k='kubectl'
alias sudo='sudo '
#status --is-interactive; and source (rbenv init -|psub)

if test -n "$DESKTOP_SESSION"
    for env_var in (gnome-keyring-daemon --start)
        set -x (echo $env_var | string split "=")
    end
end

set -g theme_display_date no
set -g theme_display_cmd_duration no
#set -g theme_color_scheme solarized-light
set -gx GPG_TTY (tty)

# https://wiki.archlinux.org/title/GNOME/Keyring
# if test -n "$DESKTOP_SESSION"
#     set -x (gnome-keyring-daemon --start | string split "=")
# end

# set -xU LESS_TERMCAP_md (printf "\e[01;31m")
# set -xU LESS_TERMCAP_me (printf "\e[0m")
# set -xU LESS_TERMCAP_se (printf "\e[0m")
# set -xU LESS_TERMCAP_so (printf "\e[1;37;42m")
# set -xU LESS_TERMCAP_ue (printf "\e[0m")
# set -xU LESS_TERMCAP_us (printf "\e[01;32m")

set -gx PATH $PATH $HOME/.krew/bin (go env GOPATH)/bin
set -xU MANPAGER 'less -R --use-color -Dd+r -Du+b'
kubectl completion fish |source
kubectl krew completion fish |source

