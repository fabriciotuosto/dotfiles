-- Leader
vim.g.mapleader = " "
vim.g.maplocalleader = " "
-- Some nice defaults
vim.opt.clipboard = "unnamedplus"
vim.opt.cmdheight = 1
vim.opt.list = true
vim.opt.ruler = true
vim.opt.title = true
vim.opt.hidden = true
vim.opt.smartcase = true
vim.opt.cursorline = true
vim.g.have_nerd_font = true
vim.opt.updatetime = 250
-- Side numbers
vim.opt.number = true
vim.opt.relativenumber = true
-- Indent
vim.opt.expandtab = true
vim.opt.smarttab = true
vim.opt.shiftwidth = 4
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.scrolloff = 10
vim.opt.wrap = false
vim.opt.breakindent = true
vim.opt.smartindent = true
vim.opt.autoindent = true
vim.opt.copyindent = true
-- Encoding
vim.opt.encoding = 'utf-8'
vim.opt.fileencoding = 'utf-8'
-- Search
vim.opt.hlsearch = true
vim.opt.incsearch = true
vim.opt.termguicolors = true
-- Popups
vim.opt.completeopt = "menu,menuone,noinsert,noselect,popup"
-- Splits
vim.opt.inccommand = 'split'
vim.opt.splitright = true
vim.opt.splitbelow = true
-- Undo
vim.opt.undofile = true
vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
vim.opt.swapfile = false
vim.opt.backup = false

---------------------------------
-- Diagnostic configurations
---------------------------------
vim.diagnostic.config({
    float = false, -- { border = 'rounded' }
    virtual_text = false,
    update_in_insert = false,
    signs = true,
    underline = true,
})
vim.cmd [[autocmd CursorHold * lua vim.diagnostic.open_float(nil, {focus=false})]]

---------------------------------
-- Highlight on Yank
---------------------------------
vim.api.nvim_create_autocmd("TextYankPost", {
    desc = "Highlight when yanking (copying) text",
    group = vim.api.nvim_create_augroup("highlight-yank", { clear = true }),
    callback = function()
        vim.highlight.on_yank()
    end
})
