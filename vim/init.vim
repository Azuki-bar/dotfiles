"dein Scripts-----------------------------
if &compatible
  set nocompatible               " Be iMproved
endif

" Required:
set runtimepath+=$HOME/.config/dein//repos/github.com/Shougo/dein.vim

" Required:
if dein#load_state('$HOME/.config/dein/')
  call dein#begin('$HOME/.config/dein/')

  " Let dein manage dein
  " Required:
  call dein#add('$HOME/.config/dein/repos/github.com/Shougo/dein.vim')

  " Add or remove your plugins here like this:
  "call dein#add('Shougo/neosnippet.vim')
  "call dein#add('Shougo/neosnippet-snippets')

  call dein#load_toml('$HOME/.config/nvim/dein.toml', {'lazy': 0})
  call dein#load_toml('$HOME/.config/nvim/dein_lazy.toml', {'lazy': 1})

  " Required:
  call dein#end()
  call dein#save_state()
endif

" Required:
filetype plugin indent on
syntax enable

" If you want to install not installed plugins on startup.
if dein#check_install()
  call dein#install()
endif

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

" ★が崩れるのを解決
set ambiwidth=double

" 検索結果ハイライト
set hlsearch

" ハイライトをESC二度押しで解除
nnoremap <silent><Esc><Esc> :<C-u>set nohlsearch!<CR>

" カーソルラインハイライト
set cursorline

set incsearch
set inccommand=split


" 
filetype plugin indent on

"https://qiita.com/itmammoth/items/312246b4b7688875d023#10x%E3%82%84s%E3%81%A7%E3%81%AF%E3%83%A4%E3%83%B3%E3%82%AF%E3%81%97%E3%81%AA%E3%81%84
" xキーでヤンクしないようにする
nnoremap x "_x
nnoremap s "_s

autocmd BufNewFile,BufRead *.toml  setfiletype=toml
" ここからプラグイン依存設定
"
" かっこの補完をするcoc-pairsの設定
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm() : "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

" 補完のときの挙動をIDEに揃える
set completeopt=menuone,noinsert

" お借りしてきた https://note.com/yasukotelin/n/na87dc604e042
" 補完表示時のEnterで改行をしない
inoremap <expr><CR>  pumvisible() ? "<C-y>" : "<CR>"

set completeopt=menuone,noinsert
inoremap <expr><C-n> pumvisible() ? "<Down>" : "<C-n>"
inoremap <expr><C-p> pumvisible() ? "<Up>" : "<C-p>"
" ここまで

" https://github.com/neoclide/coc.nvim/wiki/Completion-with-sources#use-tab-and-s-tab-to-navigate-the-completion-list
inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"


" https://qiita.com/Linda_pp/items/9e0c94eb82b18071db34
if has('vim_starting')
    " 挿入モード時に非点滅の縦棒タイプのカーソル
    let &t_SI .= "\e[6 q"
    " ノーマルモード時に非点滅のブロックタイプのカーソル
    let &t_EI .= "\e[2 q"
    " 置換モード時に非点滅の下線タイプのカーソル
    let &t_SR .= "\e[4 q"
endif
" ここまで
"


