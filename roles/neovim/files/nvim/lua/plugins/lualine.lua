return {
    'nvim-lualine/lualine.nvim',
    dependencies = {
        {
            'nvim-tree/nvim-web-devicons',
            "linrongbin16/lsp-progress.nvim",
        }
    },
    config = function()
        require('lualine').setup({
            options = { theme = "catppuccin" },
            sections = {
                lualine_c = {
                    {
                        'filename',
                        file_status = true,
                        path = 1,
                        shorting_target = 40,
                    },
                },
            }
        })
    end
}
