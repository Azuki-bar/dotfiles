function update-all() {
  # ANSIエスケープコードを変数に格納
  RED='\033[0;31m'
  GREEN='\033[0;32m'
  NC='\033[0m'  # No Color

  command_list=(
    # require sudo
    yay='yay -Syu'
    apt='sudo apt update && sudo apt upgrade -y'
    snap='sudo snap refresh'

    # not require sudo
    asdf='asdf update'
    asdf='asdf plugin update --all'
    rtx='rtx upgrade'
    rtx='rtx self-update'
    mise='mise upgrade'
    mise='mise self-update'
    brew='brew update'
    # npm='npm update -g'
    rustup='rustup update'
    cargo-install-update='cargo-install-update install-update -a'
    rye='rye self update'
    go='go run github.com/nao1215/gup@latest update'
    flatpak='flatpak update'
    # gem='gem update --system'
  )

  for cmd in ${(k)command_list}; do
    # echo "Running $command"
    IFS='=' read -r cmd_name exec_command <<< "$cmd"
    echo "${GREEN}running $cmd_name${NC}"
    
    # コマンドが存在するか確認
    if ! command -v $cmd_name > /dev/null; then
      # 赤色でエラーメッセージを出力
      echo "${RED}$cmd_name is not installed${NC}"
      continue
    fi

    eval "$exec_command"
  done
}

