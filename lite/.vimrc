"dein Scripts-----------------------------
if &compatible
  set nocompatible               " Be iMproved
endif

" Required:
set runtimepath+=~/.cache/dein/repos/github.com/Shougo/dein.vim

" Required:
if dein#load_state('~/.cache/dein/')
  call dein#begin('~/.cache/dein/')

  " Let dein manage dein
  " Required:
  call dein#add('~/.cache/dein/repos/github.com/Shougo/dein.vim')

  " Add or remove your plugins here like this:
  "call dein#add('Shougo/neosnippet.vim')
  "call dein#add('Shougo/neosnippet-snippets')

  " Required:
  call dein#end()
  call dein#save_state()
endif

" Required:
filetype plugin indent on
syntax enable

" If you want to install not installed plugins on startup.
"if dein#check_install()
"  call dein#install()
"endif

"End dein Scripts-------------------------


" thank you for https://qiita.com/reireias/items/230c77b3ff5575832654
" thank you for https://qiita.com/iwaseasahi/items/0b2da68269397906c14c

" 行番号の表示
set number

" 対応カッコ表示
set showmatch matchtime=1

" 入力中コマンド表示
set showcmd

" 行末のスペースを可視化
set listchars=tab:^\ ,trail:~

" 入力モードでTabキー押下時に半角スペースを挿入
set expandtab

" インデント幅
set shiftwidth=4

" タブキー押下時に挿入される文字幅を指定
set softtabstop=4

" 対応カッコ強調
set showmatch

" タイトル表示
set title

" シンタックスハイライト
syntax on

" 検索大文字小文字無視
set ignorecase

" インクリメンタルサーチ
set incsearch

" 検索パターン大文字含みの適用
set smartcase

" ステータスバー常に表示
set laststatus=2

" オートインデント
" set autoindent
set smartindent
" 文字コードをutf-8に"
set encoding=utf8

" インサートモードのESCの機能をjjにも
inoremap <silent> jj <ESC>

" クリップボード有効化
set clipboard=unnamedplus

" 行末折返し無効化
set nowrap

" 80列目に縦線を入れる
set colorcolumn=80

" :eで開くときにファイル候補表示
set wildmenu 

" ヤンクしたときにクリップボードに入るようにする。
set clipboard=unnamedplus

