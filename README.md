# dotfiles

## 目次

<!-- TOC -->

- [dotfiles](#dotfiles)
  - [目次](#目次)
  - [手動インストール方法](#手動インストール方法)
    - [1 レポジトリのクローン](#1-レポジトリのクローン)
    - [2 パッケージのダウンロード](#2-パッケージのダウンロード)
    - [3 ログインシェルを Bash のまま Fish に変更する](#3-ログインシェルを-bash-のまま-fish-に変更する)
    - [4 シンボリックリンクを貼る](#4-シンボリックリンクを貼る)
    - [5 キー割当を変更する](#5-キー割当を変更する)
    - [6 Git の設定を変更する](#6-git-の設定を変更する)
    - [7 ネットワークの設定を変更する](#7-ネットワークの設定を変更する)

<!-- /TOC -->

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

その後 `~/.ssh/config` のファイルに以下を追記してください。

```config
Host github github.com
  HostName github.com
  IdentityFile ~/.ssh/
  User git
```

### 2 パッケージのダウンロード

```Bash
sudo apt install -y fish curl vim network-manager-l2tp-gnome
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

Github の no-reply メールアドレス以外では Github にコミットできないようになっているのでそのメールアドレスを指定すること。

```Bash
git config --global user.name Azuki-bar
git config --global user.email 42642269+Azuki-bar@users.noreply.github.com
git config --global core.excludesfile ~/.gitignore_global # gitignore_global 
git config --global core.quatepath false # 日本語ファイル名を正常に表示する
```

[参考リンク](https://dev.classmethod.jp/articles/git-avoid-illegal-charactor-tips/)

### 7 ネットワークの設定を変更する

`nmcli`を用いて設定します。
何故か知りませんが Ubuntu20.04 では GUI で個別のプロキシ設定ができないので……

電通大への VPN 設定と UEC Wireless の接続設定を済ませておいてください。

`nmcli connection edit UECWireless`で`nmcli`の対話型設定モードに入ります。

その後`goto proxy`,`set proxy.method auto`,`set proxy.pac-url proxy.uec.ac.jp`
として設定を追記します。

最後に`save persistent`で恒久的に設定を保存します。

もし VPN 環境でも同様のことを実現したいときは`nmcli connection edit ****`
のアスタリスク部分に VPN の設定名を入れて同様のことを行ってください。
