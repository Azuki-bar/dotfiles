vim.cmd [[packadd packer.nvim]]

require'packer'.startup(function()
    -- https://qiita.com/delphinus/items/8160d884d415d7425fcc
    -- 起動時に読み込むプラグインは名前を書くだけです
    --   use'tpope/vim-fugitive'
    --   use'tpope/vim-repeat'
    -- 
    --   -- opt オプションを付けると遅延読み込みになります。
    --   -- この場合は opt だけで読み込む契機を指定していないため、
    --   -- `packadd` コマンドを叩かない限り読み込まれることはありません。
    --   use{'wbthomason/packer.nvim', opt = true}
    --   -- packer.nvim 自体を遅延読み込みにする理由はまた後ほど。
    -- 
    --   -- コマンドを叩いたときに読み込む。
    --   use{'rhysd/git-messenger.vim', opt = true, cmd = {'GitMessenger'}}
    -- 
    --   -- 特定のイベントで読み込む
    --   use{'tpope/vim-unimpaired', opt = true, event = {'FocusLost', 'CursorHold'}}
    -- 
    --   -- 特定のファイルタイプのファイルを開いたら読み込む
    --   use{'fatih/vim-go', opt = true, ft = {'go'}}
    -- 
    --   -- 特定のキーを叩いたら読み込む
    --   -- この例ではノーマルモードの <CR> にマッピングしていますが、
    --   -- モードを指定する場合はテーブルを入れ子にします。
    --   -- keys = {
    --   --   {'n', '<CR>'},
    --   --   {'v', '<CR>'},
    --   -- }
    --   use{
    --     'arecarn/vim-fold-cycle',
    --     opt = true,
    --     keys = {'<CR>'},
    --   }
    -- 
    --   -- 特定の VimL 関数を呼ぶと読み込む
    --   -- この例だと、任意の場所で Artify('hoge', 'bold') のように呼び出された時に、
    --   -- このプラグインも読み込まれます。
    --   use{'sainnhe/artify.vim', opt = true, fn = {'Artify'}}
    -- 
    --   -- 実は opt = true は省略できます。読み込む契機（この例では cmd）を指定すると、
    --   -- 自動的に遅延読み込みとみなされます。
    --   use{
    --     'npxbr/glow.nvim',
    --     cmd = {'Glow', 'GlowInstall'},
    --     -- run オプションを指定すると、インストール時・更新時に
    --     -- 実行するコマンドを指定できます。
    --     run = [[:GlowInstall]],
    --     -- 先頭に : がついていないなら bash -c '...' で実行されます。
    --     -- run = [[npm install]],
    --     -- 関数も指定可能です。
    --     -- run = function() vim.cmd[[GlowInstall]] end,
    --   }
    -- 
    --   -- 条件が真の時のみ読み込みます。条件は起動時に毎回判定されます。
    --   use{
    --     'thinca/vim-fontzoom',
    --     cond = [[vim.fn.has'gui' == 1]], -- GUI の時のみ読み込む。
    --     -- 関数も指定できます。
    --     -- conf = function() return vim.fn.has'gui' == 1 end,
    --   }
    -- 
    --   -- 依存関係も管理できます。vim-prettyprint は
    --   -- capture.vim が読み込まれる前に、自動的に packadd されます。
    --   use{
    --     'tyru/capture.vim',
    --     requires = {
    --       {'thinca/vim-prettyprint', cmd = {'PP', 'PrettyPrint'}},
    --     },
    --     cmd = {'Capture'},
    --  }

    use {'vim-denops/denops.vim'}
    -- use{'vim-jp/vimdoc-ja'}
    use {'nekowasabi/nvimdoc-ja'}
    use {'airblade/vim-gitgutter'}
    use {'Shougo/context_filetype.vim'}
    -- use{'osyo-manga/vim-precious'}
    -- use{'bkad/CamelCaseMotion'}
    use {'tpope/vim-commentary'}
    use {'tpope/vim-fugitive'}
    use {'tpope/vim-repeat'}
    use {'tpope/vim-surround'}
    -- use{'monaqa/dps-dial.vim'}

    use {
        'cocopon/iceberg.vim',
        opt = true,
        config = function() vim.cmd("colorscheme iceberg") end
    }
    use {
        'nvim-treesitter/nvim-treesitter',
        opt = true,
        event = "VimEnter",
        config = function()
            require'nvim-treesitter'.setup {
                -- One of "all", "maintained" (parsers with maintainers), or a list of languages
                ensure_installed = "all",

                highlight = {
                    -- `false` will disable the whole extension
                    enable = true,

                    -- list of language that will be disabled

                    -- Setting this to true will run `:h syntax` and tree-sitter at the same time.
                    -- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
                    -- Using this option may slow down your editor, and you may see some duplicate highlights.
                    -- Instead of true it can also be a list of languages
                    additional_vim_regex_highlighting = false
                },
                rainbow = {
                    enable = true,
                    -- disable = { "jsx", "cpp" }, list of languages you want to disable the plugin for
                    extended_mode = true, -- Also highlight non-bracket delimiters like html tags, boolean or table: lang -> boolean
                    max_file_lines = nil -- Do not enable for files with more than n lines, int
                    -- colors = {}, -- table of hex strings
                    -- termcolors = {} -- table of colour name strings
                }
            }

        end
    }

    use 'neovim/nvim-lspconfig' -- Collection of configurations for the built-in LSP client
    use "williamboman/nvim-lsp-installer"
    use "hrsh7th/nvim-cmp"
    use "hrsh7th/cmp-nvim-lsp"
    use "hrsh7th/cmp-vsnip"
    use "hrsh7th/cmp-buffer"
    use "hrsh7th/vim-vsnip"

end)

