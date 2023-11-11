-- 行番号の表示
vim.o.number = true

-- 対応カッコ表示
vim.o.showmatch = true
vim.o.matchtime = 1

-- 入力中コマンド表示
vim.o.showcmd = true

-- 対応カッコ強調
vim.o.showmatch = true

-- タイトル表示
vim.o.title = true

-- ステータスバー常に表示
vim.o.laststatus = 2

-- 文字コードをutf-8に
vim.o.encoding = 'utf8'

-- 文字コード自動判別
vim.o.fileencodings = 'utf-8,sjis,iso2022-jp,euc-jp'

-- 改行コード自動認識
vim.o.fileformats = 'unix,dos,mac'

-- クリップボード有効化
vim.o.clipboard = 'unnamedplus'

vim.o.wrap = true

-- :eで開くときにファイル候補表示
vim.o.wildmenu = true

-- ヤンクしたときにクリップボードに入るようにする。
vim.o.clipboard = 'unnamedplus'

-- ★が崩れるのを解決
-- vim.o.ambiwidth = 'double'

-- カーソルラインハイライト
vim.o.cursorline = true

vim.o.inccommand = 'split'

vim.cmd('filetype plugin indent on')

vim.cmd('autocmd BufNewFile,BufRead *.toml setfiletype=toml')

-- 補完のときの挙動をIDEに揃える
vim.o.completeopt = 'menuone,noinsert'

-- https://qiita.com/Linda_pp/items/9e0c94eb82b18071db34
if vim.fn.has('vim_starting') then
    -- 挿入モード時に非点滅の縦棒タイプのカーソル
    vim.o.t_SI = vim.o.t_SI .. '\27[6 q'
    -- ノーマルモード時に非点滅のブロックタイプのカーソル
    vim.o.t_EI = vim.o.t_EI .. '\27[2 q'
    -- 置換モード時に非点滅の下線タイプのカーソル
    vim.o.t_SR = vim.o.t_SR .. '\27[4 q'
end
-- ここまで

vim.o.hidden = true
