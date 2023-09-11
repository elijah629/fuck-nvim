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
        opts = {
	options = {
    color_icons = true
  },
  highlights = {
    separator = {
      guifg = '#073642',
      guibg = '#002b36',
    },
    separator_selected = {
      guifg = '#073642',
    },
    background = {
      guifg = '#657b83',
      guibg = '#002b36'
    },
    buffer_selected = {
      guifg = '#fdf6e3',
      gui = "bold",
    },
    fill = {
      guibg = '#073642'
    }
  },

}
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
		"hrsh7th/cmp-nvim-lsp-signature-help",
                "saadparwaiz1/cmp_luasnip",
        },
        opts = function()
            local cmp = require("cmp")

	    return {
                completion = {
                    completeopt = "menu,menuone",
                },
                mapping = {
                    ["<S-Tab>"] = cmp.mapping.select_prev_item(),
                    ["<Tab>"] = cmp.mapping.select_next_item(),
                    ["<C-d>"] = cmp.mapping.scroll_docs(-4),
                    ["<C-f>"] = cmp.mapping.scroll_docs(4),
                    ["<C-Space>"] = cmp.mapping.complete(),
                    ["<C-e>"] = cmp.mapping.close(),
                    ["<CR>"] = cmp.mapping.confirm {
                        behavior = cmp.ConfirmBehavior.Insert,
                        select = true,
                    },
                },
                sources = {
                    { name = "nvim_lsp" },
                 -- { name = "luasnip" },
                    { name = "buffer" },
                    { name = "nvim_lua" },
                    { name = "path" },
		    { name = 'nvim_lsp_signature_help' },
                },
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
    },
    {
	"williamboman/mason-lspconfig.nvim",
    },
    {
        "neovim/nvim-lspconfig"
    },
    {
	"nvimdev/lspsaga.nvim",
	opts = {},
	event = 'LspAttach',
	dependencies = {
	        "nvim-tree/nvim-web-devicons",
	        "nvim-treesitter/nvim-treesitter"
	}
    },
    -- Extra
    {
        -- Pop-out Terminals
        "akinsho/toggleterm.nvim",
        version = "*",
        config = true
    },
    -- Theming
    --[[{
        "monsonjeremy/onedark.nvim",
        lazy = false,
        branch = "treesitter",
        opts = {},
        config = function()
            vim.cmd.colorsheme onedark
        end,
    },--]]
    {
	    'AlexvZyl/nordic.nvim',
	    lazy = false,
	    priority = 1000,
	    config = function()
        	require 'nordic' .load()
	end
    },
    -- Git
    {
	"lewis6991/gitsigns.nvim",
	opts = {}
    }
}
