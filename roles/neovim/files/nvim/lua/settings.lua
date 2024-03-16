vim.g.mapleader = " "
vim.opt.clipboard = "unnamedplus"
vim.opt.cursorline = true
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.expandtab = true
vim.opt.shiftwidth = 4
vim.opt.smartindent = true
vim.opt.copyindent = true
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.scrolloff = 10
vim.opt.sidescrolloff = 10
vim.opt.wrap = false
vim.opt.smartindent = true
vim.opt.autoindent = true
vim.opt.smarttab = true
vim.opt.encoding = 'utf-8'
vim.opt.fileencoding = 'utf-8'
vim.opt.swapfile = false
vim.opt.backup = false

vim.opt.hlsearch = false
vim.opt.incsearch = true
vim.opt.termguicolors = true
vim.opt.completeopt = "menu,preview,popup"
vim.opt.updatetime = 100

vim.opt.hidden = true
vim.opt.list = true
vim.opt.cmdheight = 1
vim.opt.ruler = true
vim.opt.title = true
vim.opt.termguicolors = true
vim.g.have_nerd_font = true
vim.opt.showmode = false
vim.opt.smartcase = true
---------------------------------
-- Floating diagnostics message
---------------------------------
vim.diagnostic.config({
    float = false,
    virtual_text = true,
    update_in_insert = false,
    signs = true,
})
