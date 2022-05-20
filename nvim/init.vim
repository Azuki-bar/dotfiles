" https://zenn.dev/comamoca/articles/58aa4c48f56e95 
let splt = split(glob("~/.config/nvim/vim_conf/" . "*.vim"))
  
for file in splt
	" 読み込んだファイルを表示するもの消しても大丈夫
	" echo "load " . file
	" ファイルの読み込み
	execute 'source' file
endfor

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

" 対応カッコ強調
set showmatch

" タイトル表示
set title

" ステータスバー常に表示
set laststatus=2

" 文字コードをutf-8に"
set encoding=utf8

" 文字コード自動判別
set fileencodings=utf-8,sjis,iso2022-jp,euc-jp

" 改行コード自動認識
set fileformats=unix,dos,mac

" クリップボード有効化
set clipboard=unnamedplus

set wrap

" :eで開くときにファイル候補表示
set wildmenu 

" ヤンクしたときにクリップボードに入るようにする。
set clipboard=unnamedplus

" ★が崩れるのを解決
"set ambiwidth=double

" カーソルラインハイライト
set cursorline

set inccommand=split

filetype plugin indent on

autocmd BufNewFile,BufRead *.toml  setfiletype=toml
" ここからプラグイン依存設定
"
" 補完のときの挙動をIDEに揃える
set completeopt=menuone,noinsert
" ここまで

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
set hidden

