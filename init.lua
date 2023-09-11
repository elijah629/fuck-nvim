-- Bootstrap lazy.nvim

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

-- Config

-- 8 tabs are the worst thing to ever exist oh my god they suck so bad. i dont care that mr linux torvalds does this.
vim.opt.tabstop = 4
vim.g.mapleader = " "
vim.wo.number = true
vim.wo.relativenumber = true

-- Core

require"lazy".setup"core.plugins"
require"core.mappings".setup"config.mappings"

-- LSP

require"mason".setup()
require"mason-lspconfig".setup()
require"core.lspconfig".setup{
	"tsserver",
	"lua_ls",
	"tailwindcss",
	"rust_analyzer",
}

vim.cmd.highlight"EndOfBuffer guifg=bg"
