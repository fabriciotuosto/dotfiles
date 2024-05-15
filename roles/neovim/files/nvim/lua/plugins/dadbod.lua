return {
    {
        "tpope/vim-dadbod"
    },
    {

        "kristijanhusak/vim-dadbod-ui",
        config = function()
            vim.g.db_ui_use_nerd_fonts = 1
            require('keymaps.dadbod')
        end,
    },
    {
        "kristijanhusak/vim-dadbod-completion",
        ft = { 'sql', 'mysql', 'plsql' },
        lazy = true,
    }

}
