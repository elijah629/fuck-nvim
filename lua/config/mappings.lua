return {
    i = {
        ["<C-s>"] = { "<ESC><cmd> w <CR>i<Right>", "Save file" },

        ["<A-Up>"] = { "<ESC><cmd> :m -2 <CR>i", "Move line up" },
        ["<A-Down>"] = {"<ESC><cmd> :m +1 <CR>i", "Move line down"},

        ["<C-T>"] = { "<ESC><cmd> ToggleTerm <CR>", "Toggle Terminal" },
    },
    n = {
        ["<C-s>"] = { "<cmd> w <CR>", "Save file" },

        ["<A-Up>"] = { "<cmd> :m -2 <CR>", "Move line up" },
        ["<A-Down>"] = {"<cmd> :m +1 <CR>", "Move line down"},

        ["<C-T>"] = { "<cmd> ToggleTerm <CR>", "Toggle Terminal" },
    },
}