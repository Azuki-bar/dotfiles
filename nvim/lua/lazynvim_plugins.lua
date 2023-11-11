require("lazy").setup({
    "wbthomason/packer.nvim",
    "Shougo/context_filetype.vim",
    {
        "osyo-manga/vim-precious",
        lazy = true,
        dependencies = {"Shougo/context_filetype.vim"}
    },
    "tpope/vim-fugitive",
    "tpope/vim-surround",
    "tpope/vim-commentary",
    -------------------------------------------------
    -- UI
    -------------------------------------------------
    "airblade/vim-gitgutter",
    {
        "projekt0n/github-nvim-theme",
        config = function()
            require("github-theme").setup({
            options = {
                styles = {
                    functions = "Italic"
                },
                darken = {
                    sidebars = {
                        list = {"qf", "vista_kind", "terminal", "packer"}
                    }
                }
            }}
            )
            vim.cmd.colorscheme("github_dark_dimmed")
        end
    },
    "ryanoasis/vim-devicons",
    { 
        "nvim-tree/nvim-web-devicons",
        lazy = true,
    },
    {
        "lukas-reineke/indent-blankline.nvim",
        main = "ibl",
        dependencies = {"nvim-treesitter/nvim-treesitter"},
        opts = {},
    },
    {
        "SmiteshP/nvim-gps",
        dependencies = {"nvim-lualine/lualine.nvim"},
        config = function()
            local gps = require("nvim-gps")
            require("lualine").setup({
                sections = {
                    lualine_c = {
                        {gps.get_location, cond = gps.is_available},
                    }
                }
            })
        end
    },
    {
        "nvim-lualine/lualine.nvim",
        config = function()
            require('lualine').setup {
                options = {
                    theme = 'auto'
                }
            }
            function dump(o)
                if type(o) == 'table' then
                    local s = '{ '
                    for k,v in pairs(o) do
                        if type(k) ~= 'number' then k = '"'..k..'"' end
                        s = s .. '['..k..'] = ' .. dump(v) .. ','
                    end
                    return s .. '} '
                else
                    return tostring(o)
                end
            end
            -- print(dump(require('lualine').get_config()))
        end
    },
    {
        "j-hui/fidget.nvim",
        config = function()
            require"fidget".setup{}
        end
    },
    {
        "folke/todo-comments.nvim",
        dependencies = {"nvim-lua/plenary.nvim"},
        config = function()
            require("todo-comments").setup{}
        end
    },
    {
        "akinsho/bufferline.nvim",
        dependencies = {"nvim-tree/nvim-web-devicons"},
        config = function()
            vim.opt.termguicolors = true
            require("bufferline").setup{
            options = {
                buffer_close_icon = '',
                diagnostics = "nvim_lsp",
                numbers = "buffer_id",
                diagnostics_indicator = function(count, level, diagnostics_dict, context)
                local icon = level:match("error") and " " or " "
                return " " .. icon .. count
                end
            }
            }
            vim.g.mouse = "a"
        end
    },
    {
        "RRethy/vim-illuminate",
        config = function()
            vim.g.Illuminate_delay = 0
            vim.g.Illuminate_ftblacklist = {'nerdtree', 'NvimTree', 'yaml'}
        end
    },
    {
        "folke/lsp-colors.nvim",
        config = function()
            require("lsp-colors").setup({
            Error = "#db4b4b",
            Warning = "#e0af68",
            Information = "#0db9d7",
            Hint = "#10B981"
            })
        end
    },
    -------------------------------------------------
    -- Editing
    -------------------------------------------------
    {
        "windwp/nvim-autopairs",
        config = function()
            require("nvim-autopairs").setup()
        end,
        lazy = true,
    },
    {
        "907th/vim-auto-save",
        config = function()
	    if vim.fn.expand("%:p") == 'COMMIT_EDITMSG' then
	        vim.g.auto_save = 0
	    else
	        vim.g.auto_save = 1
	    end
            -- insertモードのときは無効
            vim.g.auto_save_in_insert_mode = 0
        end
    },
    {
        'mbbill/undotree',
        config = function()
            vim.api.nvim_set_keymap('n', '<F5>', ':UndotreeToggle<CR>', {noremap = true})
        end,
        cmd = {"UndotreeToggle"},
    },
    {
        'kyazdani42/nvim-tree.lua',
        config = function()
            require('nvim-tree').setup({
                actions = {
                    open_file = {
                        quit_on_open = true,
                    }
                }
            })

            vim.api.nvim_create_autocmd("BufEnter", {
            nested = true,
            callback = function()
                if #vim.api.nvim_list_wins() == 1 and vim.api.nvim_buf_get_name(0):match("NvimTree_") ~= nil then
                vim.cmd "quit"
                end
            end
            })
        end,
        cmd = {"NvimTreeToggle", "NvimTreeOpen"},
	vim.api.nvim_set_keymap('n', '<M-1>',':NvimTreeToggle<CR>', {noremap = true})
    },
    -------------------------------------------------
    -- treesitter
    -------------------------------------------------

    {
        'nvim-treesitter/nvim-treesitter',
        run = ':TSUpdate',
        config = function()
            require("nvim-treesitter.configs").setup {
                ensure_installed = "all",
                highlight = {
                    enable = true,
                    disable = {"vim", "lua"},
                    -- Setting this to true will run `:h syntax` and tree-sitter at the same time.
                    -- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
                    -- Using this option may slow down your editor, and you may see some duplicate highlights.
                    -- Instead of true it can also be a list of languages
                    -- additional_vim_regex_highlighting = false
                    additional_vim_regex_highlighting = false
                },
                rainbow = {
                    enable = true,
                    -- disable = {'html'}, -- list of languages you want to disable the plugin for
                    extended_mode = true, -- Also highlight non-bracket delimiters like html tags, boolean or table: lang -> boolean
                    max_file_lines = 100 -- Do not enable for files with more than n lines, int
                    -- colors = {}, -- table of hex strings
                    -- termcolors = {} -- table of colour name strings
                },
                -- indent = {enable = false},
                yati = {enable = true}
            }
        end,
        dependencies = {"yioneko/nvim-yati", "p00f/nvim-ts-rainbow"},
    },
    {
        "yioneko/nvim-yati",
        lazy = true,
    },
    {
        "p00f/nvim-ts-rainbow",
        lazy = true,
    },
    {
        "nvim-treesitter/nvim-treesitter-context",
        config = function()
            require("treesitter-context").setup({
                enable = true, -- Enable this plugin (Can be enabled/disabled later via commands)
                max_lines = 0, -- How many lines the window should span. Values <= 0 mean no limit.
                trim_scope = 'outer', -- Which context lines to discard if `max_lines` is exceeded. Choices: 'inner', 'outer'
                patterns = { -- Match patterns for TS nodes. These get wrapped to match at word boundaries.
                    -- For all filetypes
                    -- Note that setting an entry here replaces all other patterns for this entry.
                    -- By setting the 'default' entry below, you can control which nodes you want to
                    -- appear in the context window.
                    default = {
                        'class',
                        'function',
                        'method',
                        -- 'for', -- These won't appear in the context
                        -- 'while',
                        -- 'if',
                        -- 'switch',
                        -- 'case',
                    },
                    -- Example for a specific filetype.
                    -- If a pattern is missing, *open a PR* so everyone can benefit.
                    --   rust = {
                    --       'impl_item',
                    --   },
                },
                exact_patterns = {
                    -- Example for a specific filetype with Lua patterns
                    -- Treat patterns.rust as a Lua pattern (i.e "^impl_item$" will
                    -- exactly match "impl_item" only)
                    -- rust = true,
                },

                -- [!] The options below are exposed but shouldn't require your attention,
                --     you can safely ignore them.

                zindex = 20, -- The Z-index of the context window
                mode = 'cursor',  -- Line used to calculate context. Choices: 'cursor', 'topline'
            })
        end,
        lazy = true,
    },
    {
        "nvim-treesitter/nvim-treesitter-refactor",
        lazy = true,
    },
    --------------------------------------
    -- LSP
    --------------------------------------
    {
        "williamboman/mason.nvim"
    },
    {
        "williamboman/mason-lspconfig.nvim",
        lazy = true,
        dependencies = {"williamboman/mason.nvim"},
    },
    {
        "hrsh7th/nvim-cmp",
        dependencies = {
            "windwp/nvim-autopairs",
            "hrsh7th/cmp-nvim-lsp",
            "quangnguyen30192/cmp-nvim-ultisnips",
            "hrsh7th/cmp-nvim-lsp-signature-help",
            "hrsh7th/cmp-path",
            "hrsh7th/cmp-buffer",
            "petertriho/cmp-git",
	    "hrsh7th/cmp-cmdline",
        },
        config = function()
            -- Setup nvim-cmp.
            local cmp = require'cmp'
            cmp.setup({
                snippet = {
                -- REQUIRED - you must specify a snippet engine
                expand = function(args)
                    vim.fn["UltiSnips#Anon"](args.body) -- For `ultisnips` users.
                end,
                },
                window = {
                -- completion = cmp.config.window.bordered(),
                -- documentation = cmp.config.window.bordered(),
                },
                mapping = cmp.mapping.preset.insert({
                -- ['<C-b>'] = cmp.mapping.scroll_docs(-4),
                -- ['<C-f>'] = cmp.mapping.scroll_docs(4),
                ['<C-Space>'] = cmp.mapping.complete(),
                ['<C-e>'] = cmp.mapping.abort(),
                ['<CR>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
                ['<Tab>'] = cmp.mapping(function(fallback)
                if cmp.visible() then
                    cmp.select_next_item()
                else
                    fallback()
                end
                end, { 'i', 's' }),
                ['<S-Tab>'] = cmp.mapping(function(fallback)
                if cmp.visible() then
                    cmp.select_prev_item()
                else
                    fallback()
                end
                end, { 'i', 's' }),
                }),
                sources = cmp.config.sources({
                { name = 'nvim_lsp' },
                { name = 'ultisnips' }, -- For ultisnips users.
                { name = 'nvim_lsp_signature_help' },
                { name = 'path' },
                }, {
                { name = 'buffer' },

                })
            })

            -- Set configuration for specific filetype.
            cmp.setup.filetype('gitcommit', {
                sources = cmp.config.sources({
                { name = 'git' }, -- You can specify the `cmp_git` source if you were installed it.
                }, {
                { name = 'buffer' },
                })
            })

            -- Use buffer source for `/` (if you enabled `native_menu`, this won't work anymore).
            cmp.setup.cmdline('/', {
                mapping = cmp.mapping.preset.cmdline(),
                sources = {
                { name = 'buffer' }
                }
            })

            -- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
            cmp.setup.cmdline(':', {
                mapping = cmp.mapping.preset.cmdline(),
                sources = cmp.config.sources({
                    { name = 'path' }
                }, {
                    { name = 'cmdline' }
                })
            })

            -- Setup lspconfig.
            -- Replace <YOUR_LSP_SERVER> with each lsp server you've enabled.
            -- https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md
            -- require('lspconfig')['YOUR_LSP_SERVER'].setup {
            --   capabilities = capabilities
            -- }
            -- require('lspconfig')['taplo'].setup {}
            -- end
            -- end

            -- https://github.com/windwp/nvim-autopairs#you-need-to-add-mapping-cr-on-nvim-cmp-setupcheck-readmemd-on-nvim-cmp-repo
            local cmp_autopairs = require("nvim-autopairs.completion.cmp")
            cmp.event:on('confirm_done',
                        cmp_autopairs.on_confirm_done({map_char = {tex = ''}}))
            -- add a lisp filetype (wrap my-function), FYI: Hardcoded = { "clojure", "clojurescript", "fennel", "janet" }
            -- cmp_autopairs.lisp[#cmp_autopairs.lisp + 1] = "racket"

        end
    },
    {
        "hrsh7th/cmp-nvim-lsp",
        lazy = true,
    },
    {
        "quangnguyen30192/cmp-nvim-ultisnips",
        lazy = true,
        dependencies = {"SirVer/ultisnips"}
    },
    {
        "petertriho/cmp-git",
        lazy = true,
        config = function()
            require("cmp_git").setup()
        end
    },
    {
        "neovim/nvim-lspconfig",
        dependencies = {"williamboman/mason.nvim", "hrsh7th/nvim-cmp", "hrsh7th/cmp-nvim-lsp", "williamboman/mason-lspconfig.nvim"},
        config = function()
            -- Mappings.
            -- See `:help vim.diagnostic.*` for documentation on any of the below functions
            local opts = {noremap = true, silent = false}
            -- vim.api.nvim_set_keymap('n', '<space>e', '<cmd>lua vim.diagnostic.open_float()<CR>', opts)
            vim.api.nvim_set_keymap('n', '[d', '<cmd>lua vim.diagnostic.goto_prev()<CR>', opts)
            vim.api.nvim_set_keymap('n', ']d', '<cmd>lua vim.diagnostic.goto_next()<CR>', opts)
            -- vim.api.nvim_set_keymap('n', '<space>q', '<cmd>lua vim.diagnostic.setloclist()<CR>', opts)

            -- Use an on_attach function to only map the following keys
            -- after the language server attaches to the current buffer
            local on_attach = function(client, bufnr)
                require 'illuminate'.on_attach(client)
                -- Enable completion triggered by <c-x><c-o>
                -- vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

                -- Mappings.
                -- See `:help vim.lsp.*` for documentation on any of the below functions
                vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<CR>', opts)
                vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>', opts)
                vim.api.nvim_buf_set_keymap(bufnr, 'n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>', opts)
                vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
                -- vim.api.nvim_buf_set_keymap(bufnr, 'n', '<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
                -- vim.api.nvim_buf_set_keymap(bufnr, 'n', '<space>wa', '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>', opts)
                -- vim.api.nvim_buf_set_keymap(bufnr, 'n', '<space>wr', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>', opts)
                -- vim.api.nvim_buf_set_keymap(bufnr, 'n', '<space>wl', '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>', opts)
                -- vim.api.nvim_buf_set_keymap(bufnr, 'n', '<space>D', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
                vim.api.nvim_buf_set_keymap(bufnr, 'n', '<F18>', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
                vim.api.nvim_buf_set_keymap(bufnr, 'n', '<M-CR>', '<cmd>lua vim.lsp.buf.code_action()<CR>', opts)
                -- vim.api.nvim_buf_set_keymap(bufnr, 'n', '<space>ca', '<cmd>lua vim.lsp.buf.code_action()<CR>', opts)
                vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
                -- vim.api.nvim_buf_set_keymap(bufnr, 'n', '<space>f', '<cmd>lua vim.lsp.buf.formatting()<CR>', opts)
                -- vim.api.nvim_buf_set_keymap(bufnr, 'n', '<M-l>', '<cmd>lua vim.lsp.buf.format({async = true})<CR>', opts)
            end
            -- Use a loop to conveniently call 'setup' on multiple servers and
            -- map buffer local keybindings when the language server attaches

            -- Add additional capabilities supported by nvim-cmp
            local capabilities = require('cmp_nvim_lsp').default_capabilities()

            local installer = require("mason")
            installer.setup{}
            local lspconfig = require("lspconfig")

            local mason_lspconfig = require("mason-lspconfig")
                mason_lspconfig.setup_handlers({ function(server_name)
                lspconfig[server_name].setup {
                    on_attach = on_attach,
                    capabilities = capabilities
                }
                end
                })

            lspconfig.yamlls.setup {
            on_attach = on_attach,
            capabilities = capabilities,
            settings = {
                yaml = { 
                schemas = {
                    kubernetes = "/*.yaml",
                    ["https://json.schemastore.org/kustomization.json"]="*/kustomization.ya?ml",
                    ["https://json.schemastore.org/github-workflow.json"]= "*/.github/workflow/*.ya?ml",
                    ["https://raw.githubusercontent.com/compose-spec/compose-spec/master/schema/compose-spec.json"] = "(docker-)?compose.*.ya?ml",
                },
                }
            }
            }
            lspconfig.denols.setup {
            root_dir = lspconfig.util.root_pattern("deno.json"),
            init_options = {
                lint = true,
                unstable = true,
                suggest = {
                imports = {
                    hosts = {
                    ["https://deno.land"] = true,
                    ["https://cdn.nest.land"] = true,
                    ["https://crux.land"] = true,
                    },
                },
                },
            },
            }
            lspconfig.tsserver.setup {
            root_dir = lspconfig.util.root_pattern("package.json"),
            }
        end
    },
    {
        "scalameta/nvim-metals",
        dependencies = {"nvim-lua/plenary.nvim", "hrsh7th/cmp-nvim-lsp"},
        ft = {"scala", "sbt"},
        config = function()
            local metals_config = require("metals").bare_config()
            metals_config.capabilities = require("cmp_nvim_lsp").default_capabilities()
            metals_config.init_options.statusBarProvider = "on"
            local nvim_metals_group = vim.api.nvim_create_augroup("nvim-metals", { clear = true })
            vim.api.nvim_create_autocmd("FileType", {
                pattern = { "scala", "sbt", "java" },
                callback = function()
                require("metals").initialize_or_attach({})
                end,
                group = nvim_metals_group,
            })
        end
    },
    {
        "quangnguyen30192/cmp-nvim-ultisnips",
        dependencies = {'SirVer/ultisnips'}
    },
    {
        'stevearc/aerial.nvim',
        -- Optional dependencies
        dependencies = {
            "nvim-treesitter/nvim-treesitter",
            "nvim-tree/nvim-web-devicons",
        },
        config = function()
            vim.api.nvim_set_keymap('n', '<M-2>', '<cmd>AerialToggle left<CR>', { noremap = true })

        end
    },
    {
        'nvim-telescope/telescope.nvim', 
        -- tag = '0.1.4',
        dependencies = { 'nvim-lua/plenary.nvim' },
        config = function()
            require('telescope').setup {
                defaults = {
                    mappings = {
                        i = {["<esc>"] ="close"}
                    },
                    -- https://github.com/nvim-telescope/telescope.nvim/issues/938
                    themes = require("telescope.themes").get_dropdown
                    },
                extensions = {
                    fzf = {
                        fuzzy = true, -- false will only do exact matching
                        override_generic_sorter = true, -- override the generic sorter
                        override_file_sorter = true, -- override the file sorter
                        case_mode = "smart_case" -- or "ignore_case" or "respect_case"
                        -- the default case_mode is "smart_case"
                    },
                },
                lsp_references = {
                    theme = cursor,
                    layout_config = {
                        vertical = {width=0.5}
                    }
                }
            }
            -- To get fzf loaded and working with telescope, you need to call
            -- load_extension, somewhere after setup function:
            require('telescope').load_extension('fzf')

            vim.api.nvim_set_keymap('n', '<M-f>', '<cmd>Telescope<CR>', {noremap = true})
            vim.api.nvim_set_keymap('n', '<M-g>', '<cmd>Telescope live_grep theme=dropdown<CR>', {noremap = true})
            vim.api.nvim_set_keymap('n', '<M-b>', '<cmd>Telescope lsp_references theme=cursor<CR>', {noremap = true})
	    vim.api.nvim_set_keymap('n', "<M-p>", '<cmd>Telescope find_files theme=dropdown<CR>', {noremap = true})
        end
    },
    "BurntSushi/ripgrep",
    "sharkdp/fd",
    {
        "nvim-telescope/telescope-fzf-native.nvim",
        build = "make"
    },
    {
        "numToStr/Comment.nvim",
        config = function()
            require('Comment').setup()
        end
    },
    {
        "folke/trouble.nvim",
        config = function()
            require("trouble").setup {
                -- your configuration comes here
                -- or leave it empty to use the default settings
                -- refer to the configuration section below
            }
            vim.api.nvim_set_keymap('n', '<M-3>', '<cmd>TroubleToggle<CR>', {noremap = true})
        end
    },
    {
        "sbdchd/neoformat",
        config = function()
            vim.g.neoformat_enabled_markdown = {'prettier'}
            vim.api.nvim_set_keymap('n', '<M-l>', '<cmd>Neoformat<CR>', {noremap = true})
        end
    },
    {
        "akinsho/toggleterm.nvim",
        config = function()
            require("toggleterm").setup{
                open_mapping = [[<M-0>]],
            }
        end
    },
})
