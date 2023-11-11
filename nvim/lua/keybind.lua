-- check with C-k and key result
-- vim help key-notaion

-- インサートモードのESCの機能をjjにも
vim.keymap.set('i', 'jj', '<ESC>', {silent = true, noremap = true})

-- ハイライトをESC二度押しで解除
vim.keymap.set('n', '<ESC><ESC>', ':set nohlsearch!<CR>', {silent = true, noremap = true})

-- https://qiita.com/itmammoth/items/312246b4b7688875d023#10x%E3%82%84s%E3%81%A7%E3%81%AF%E3%83%A4%E3%83%B3%E3%82%AF%E3%81%97%E3%81%AA%E3%81%84
-- xキーでヤンクしないようにする
vim.keymap.set('n', 'x', '"_x', {})
vim.keymap.set('n', 's', '"_s', {})

-- https://github.com/neoclide/coc.nvim/wiki/Completion-with-sources#use-tab-and-s-tab-to-navigate-the-completion-list
vim.keymap.set('i', '<Tab>', function()
    return vim.fn.pumvisible() == 1 and '<C-n>' or '<Tab>'
end, {expr = true, noremap = true})
vim.keymap.set('i','<S-Tab>', function()
    return vim.fn.pumvisible() == 1 and '<C-p>' or "<S-Tab>"
end, {expr = true, noremap = true})

-- お借りしてきた https://note.com/yasukotelin/n/na87dc604e042
-- 補完表示時のEnterで改行をしない
vim.keymap.set('i', '<CR>', function()
    return vim.fn.pumvisible() == 1 and '<C-y>' or '<CR>'
end, {expr = true, noremap = true})

vim.keymap.set('i', '<C-n>', function()
    return vim.fn.pumvisible() == 1 and '<Down>' or '<C-n>'
end, {expr = true, noremap = true})
vim.keymap.set('i', '<C-p>', function()
    return vim.fn.pumvisible() == 1 and '<Up>' or '<C-p>'
end, {expr = true, noremap = true})

vim.keymap.set('n', 'ZQ', '<nop>', {})
vim.keymap.set('n', 'Q', '<Nop>', {})

vim.keymap.set('n', 'j', 'gj', {silent = true, noremap = true})
vim.keymap.set('n', 'k', 'gk', {silent = true, noremap = true})
vim.keymap.set('n', 'gj', 'j', {silent = true, noremap = true})
vim.keymap.set('n', 'gk', 'k', {silent = true, noremap = true})
