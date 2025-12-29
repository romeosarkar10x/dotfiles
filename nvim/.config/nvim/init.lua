vim.cmd("set nocompatible")
vim.cmd("set wrap")
vim.cmd("set encoding=utf-8")
vim.cmd("set tabstop=4")
vim.cmd("set shiftwidth=4")
vim.cmd("set expandtab")
vim.cmd("set laststatus=2")
vim.cmd("set number")
vim.cmd("set relativenumber")
vim.cmd("set ruler")
vim.cmd("set autoindent")
vim.cmd("syntax on")
vim.cmd("set guicursor=i:block")

vim.cmd("nnoremap <C-h> <C-w>h")
vim.cmd("nnoremap <C-j> <C-w>j")
vim.cmd("nnoremap <C-k> <C-w>k")
vim.cmd("nnoremap <C-l> <C-w>l")

vim.cmd("inoremap <C-h> <C-w>")
-- print("hello world")

-- print("this is neovim!")


-- require("keymaps")
-- require("config.lazy")

-- vim.cmd.colorscheme "catppuccin"

vim.cmd("set shell=bash")
vim.cmd("set shellcmdflag=-c")
vim.cmd("set shellquote=")
vim.cmd("set shellxquote=")

vim.cmd("autocmd TermOpen * startinsert")



require("config.lazy")
