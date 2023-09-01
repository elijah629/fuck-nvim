return {
    -- UI
    {
        "nvim-neo-tree/neo-tree.nvim",
        keys = {
            -- focus
            { "<C-n>", "<cmd> Neotree <CR>", desc = "Focus NeoTree" },

            -- toggle
            { "<C-b>", "<cmd> Neotree toggle <CR>", desc = "Toggle NeoTree" },
        },
        dependencies = {
            "nvim-lua/plenary.nvim",
            "nvim-tree/nvim-web-devicons",
            "MunifTanjim/nui.nvim",
        },
        lazy = false, -- So on startup works
        config = function()
            require("neo-tree").setup{
                filesystem = {
                filtered_items = {
                    visible = true,
                        hide_dotfiles = false,
                        hide_gitignore = false
                    }
                },
				source_selector = {
					winbar = true,
					content_layout = "center",
					sources = {
						{ source = "filesystem", display_name = " Files" },
						{ source = "git_status", display_name = " Git" },
					},
				},
            }
            vim.cmd "Neotree" -- Open neo-tree on startup
        end,
    },
    {
        "nvim-lualine/lualine.nvim",
        event = "VeryLazy",
        opts = {
            options = {
                theme = "auto",
                globalstatus = true,
            }
        },
    },
    {
        "akinsho/bufferline.nvim",
        dependencies = "nvim-tree/nvim-web-devicons",
        opts = {}
    },
    -- EDITOR
    {
        "lukas-reineke/indent-blankline.nvim",
        opts = {
          buftype_exclude = {
            "nofile",
            "terminal",
          },
          filetype_exclude = {
            "help",
            "startify",
            "aerial",
            "alpha",
            "dashboard",
            "lazy",
            "neogitstatus",
            "NvimTree",
            "neo-tree",
            "Trouble",
          },
          context_patterns = {
            "class",
            "return",
            "function",
            "method",
            "^if",
            "^while",
            "jsx_element",
            "^for",
            "^object",
            "^table",
            "block",
            "arguments",
            "if_statement",
            "else_clause",
            "jsx_element",
            "jsx_self_closing_element",
            "try_statement",
            "catch_clause",
            "import_statement",
            "operation_type",
          },
          show_trailing_blankline_indent = false,
          use_treesitter = true,
          char = "▏",
          context_char = "▏",
          show_current_context = true,
        }
    },
    {
        "hrsh7th/nvim-cmp",
        version = false, -- last release is way too old
        event = "InsertEnter",
        dependencies = {
                "hrsh7th/cmp-nvim-lsp",
                "hrsh7th/cmp-buffer",
                "hrsh7th/cmp-path",
                "saadparwaiz1/cmp_luasnip",
        },
        opts = function()
            vim.api.nvim_set_hl(0, "CmpGhostText", { link = "Comment", default = true })
            local cmp = require("cmp")
            local defaults = require("cmp.config.default")()
            return {
                completion = {
                    completeopt = "menu,menuone,noinsert",
                },
                sources = cmp.config.sources({
                    { name = "nvim_lsp" },
                    { name = "buffer" },
                    { name = "path" },
                }),
                experimental = {
                    ghost_text = {
                        hl_group = "CmpGhostText",
                    },
                },
                sorting = defaults.sorting,
            }
  	    end,
    },
    {
        "nvim-treesitter/nvim-treesitter",
        version = false,
        build = ":TSUpdate",
        cmd = { "TSUpdateSync" },
        opts = {
            highlight = { enable = true },
            indent = { enable = true },
            ensure_installed = {
                "javascript",
                "json",
                "lua",
                "markdown",
                "python",
                "tsx",
                "typescript",
                "yaml",
                "rust",
                "tsx"
            }
        },
    },
    -- LSP
    {
        "williamboman/mason.nvim",
        opts = {}
    },
    {
        "nvim-treesitter/nvim-treesitter",
        opts = {}
    },
    {
        "neovim/nvim-lspconfig"
    },
    -- Extra
    {
        -- Pop-out Terminals
        "akinsho/toggleterm.nvim",
        version = "*",
        config = true
    },
    -- Theming
    {
        "monsonjeremy/onedark.nvim",
        lazy = false,
        branch = "treesitter",
        opts = {},
        config = function()
            vim.cmd[[colorscheme onedark]]
        end,
    }
}
