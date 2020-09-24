# dotfiles

## 手動インストール方法

### 1 レポジトリのクローン

```Bash
sudo apt update -y && sudo apt upgrade -y
sudo apt install -y git ssh

ssh-keygen -t ed25519 -C 'Your Comment'
```

Github に対して作成した公開鍵を登録してください。

```Bash
git clone git@github.com:Azuki-bar/dotfiles.git
```

### 2 パッケージのダウンロード

```Bash
sudo apt install -y fish curl vim
```

### 3 ログインシェルを Bash のまま Fish に変更する

`.bashrc`の冒頭部に`exec fish`を追加する。

下は`.bashrc`の冒頭を引用したものです。

```Bash
# If not running interactively, don't do anything
case $- in
    *i*)
        exec fish #<- これが追記した部分です。
    ;;
      *) return;;
esac
```

### 4 シンボリックリンクを貼る

fish で実行してください。

```Bash
for file in .vimrc .gitignore_global .latexmkrc;
ln -s ~/{dotfiles/lite/,}$file;
end

```

### 5 キー割当を変更する

```Bash
ln -s ~/{dotfiles/,}.xkb
```

を実行してシンボリックリンクを貼る。

その後デスクトップ環境の実行時呼び出しファイルに

```Bash
xkbcomp -I$HOME/.xkb ~/.xkb/keymap/mykbd $DISPLAY 2> /dev/null
```

を追記する。

[参考リンク](https://honmushi.com/2019/01/18/ubuntu-xkb/)

### 6 Git の設定を変更する

工事中
