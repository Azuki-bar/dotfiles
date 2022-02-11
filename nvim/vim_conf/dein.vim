" https://zaief.jp/vim/dein
"dein Scripts-----------------------------
if &compatible
  set nocompatible               " Be iMproved
endif
" プラグインが実際にインストールされるディレクトリ
let s:dein_dir = expand('~/.cache/dein')
" dein.vim 本体
let s:dein_repo_dir = s:dein_dir . '/repos/github.com/Shougo/dein.vim'

" dein.vim がなければ github から落としてくる
if &runtimepath !~# '/dein.vim'
  if !isdirectory(s:dein_repo_dir)
    execute '!git clone --depth=1 https://github.com/Shougo/dein.vim' s:dein_repo_dir
  endif
  execute 'set runtimepath^=' . fnamemodify(s:dein_repo_dir, ':p')
endif

" 設定開始
if dein#load_state(s:dein_dir)
  call dein#begin(s:dein_dir)

  " プラグインリストを収めた TOML ファイル
  " 予め TOML ファイル（後述）を用意しておく
  let g:rc_dir    = expand('~/.config/nvim/')

  " TOML を読み込み、キャッシュしておく
  call dein#load_toml(g:rc_dir . '0_dein.toml', {'lazy': 0})
  call dein#load_toml(g:rc_dir . '1_dein_lazy.toml', {'lazy': 1})
  call dein#load_toml(g:rc_dir . '2_dein_appearance.toml', {'lazy': 2})

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
call dein#call_hook('source')


"End dein Scripts-------------------------

