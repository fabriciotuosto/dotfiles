return {
    "lukas-reineke/indent-blankline.nvim",
    main = "ibl",
    opts = {},
    config = function()
        require("ibl").setup({
            indent = {
                char = "▏",
                tab_char = "▏",
            },
            scope = {
                show_start = false,
                show_end = false,
                show_exact_scope = false,
            }
        })
    end
}
