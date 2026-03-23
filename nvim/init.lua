-- ~/.config/nvim/init.lua

-- Set leader key BEFORE loading lazy
vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

-- Basic editor settings (optional but recommended)
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.clipboard = "unnamedplus"
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true

-- Load lazy.nvim
require("lazy_init")