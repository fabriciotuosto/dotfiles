return {
    {
        "tpope/vim-dadbod"
    },
    {

        "kristijanhusak/vim-dadbod-ui",
        config = function()
            vim.keymap.set('n', '<leader>db', ":DBUIToggle<cr>")
        end,
        init = function()
            vim.g.db_ui_use_nerd_fonts = 1
        end,
        lazy = true,
    },
    {
        "kristijanhusak/vim-dadbod-completion",
        ft = { 'sql', 'mysql', 'plsql' },
        lazy = true,
    }

}
