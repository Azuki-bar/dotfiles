" check with C-k and key result
" vim help key-notaion

" インサートモードのESCの機能をjjにも
inoremap <silent> jj <ESC>

" ハイライトをESC二度押しで解除
nnoremap <silent><Esc><Esc> :<C-u>set nohlsearch!<CR>

"https://qiita.com/itmammoth/items/312246b4b7688875d023#10x%E3%82%84s%E3%81%A7%E3%81%AF%E3%83%A4%E3%83%B3%E3%82%AF%E3%81%97%E3%81%AA%E3%81%84
" xキーでヤンクしないようにする
nnoremap x "_x
nnoremap s "_s

" https://github.com/neoclide/coc.nvim/wiki/Completion-with-sources#use-tab-and-s-tab-to-navigate-the-completion-list
inoremap <expr> <Tab> pumvisible() ? "<C-n>" : ""<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "<C-p>" : "<S-Tab>"

" お借りしてきた https://note.com/yasukotelin/n/na87dc604e042
" 補完表示時のEnterで改行をしない
inoremap <expr><CR>  pumvisible() ? "<C-y>" : "<CR>"

inoremap <expr><C-n> pumvisible() ? "<Down>" : "<C-n>"
inoremap <expr><C-p> pumvisible() ? "<Up>" : "<C-p>"


nnoremap ZQ <nop>
nnoremap Q <Nop>

nnoremap <silent> j gj
nnoremap <silent> k gk
nnoremap gj j
nnoremap gk k

