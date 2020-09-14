# dotfiles
# インストール方法
## 1 レポジトリのクローン
```Bash
sudo apt update -y && sudo apt upgrade -y
sudo apt install -y git

git clone git@github.com:Azuki-bar/dotfiles.git
```
## 2 必要設定のダウンロード
```Bash
sudo apt install zsh curl vim
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
```

## 3 デフォルトのシェルを zsh に変更する
まず `which zsh` で`zsh`のファイルアドレスを確認する。

```Bash
sudo echo $(which zsh) >> /etc/shells

chsh -s $(which zsh)
```

## 4 シンボリックリンクを貼る
```Bash
cd ~/

mv ~/.zshrc ~/.zshrc.old

for file in .vimrc .zshrc .gitignore_global 
do
ln -s ~/dotfiles/"$file"
done 

```
## 5 キー割当を変更する
```Bash
ln -s ~/dotfiles/.xkb 
```
を実行してシンボリックリンクを貼る。

その後`.bashrc`などの実行時呼び出しファイルに
```Bash
xkbcomp -I$HOME/.xkb ~/.xkb/keymap/mykbd $DISPLAY 2> /dev/null  
```
を追記する。

[参考リンク](https://honmushi.com/2019/01/18/ubuntu-xkb/)
