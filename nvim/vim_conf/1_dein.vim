" https://github.com/4513ECHO/dotfiles/blob/515d0026cc17bdbc6d693d61bca41a06c497a559/config/vim/dein/ddu.toml
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

"let g:dein#auto_recache = 1

" 設定開始
if dein#load_state(s:dein_dir)

  " プラグインリストを収めた TOML ファイル
  " 予め TOML ファイル（後述）を用意しておく
  let s:rc_dir    = expand('~/.config/nvim/dein-toml/')
  
  call dein#begin(s:dein_dir)
  " TOML を読み込み、キャッシュしておく
  call dein#load_toml(s:rc_dir . 'non-lazy/0_dein.toml', {'lazy': 0})
  call dein#load_toml(s:rc_dir . 'non-lazy/appearance.toml', {'lazy': 0})
  call dein#load_toml(s:rc_dir . 'lazy/lazy.toml', {'lazy': 1})
  call dein#load_toml(s:rc_dir . 'lazy/lsp-ts.toml', {'lazy': 1})
  call dein#load_toml(s:rc_dir . 'lazy/ddc.toml', {'lazy': 1})
  "call dein#load_toml(s:rc_dir . 'ddu.toml', {'lazy': 1})
  call dein#load_toml(s:rc_dir . 'lazy/ftplugins.toml', {'lazy': 1})

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

" https://knowledge.sakura.ad.jp/23248/
" plugin remove check {{{
let s:removed_plugins = dein#check_clean()
if len(s:removed_plugins) > 0
  call dein#recache_runtimepath()
endif
" }}}
