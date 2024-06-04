return {
    'nvim-lualine/lualine.nvim',
    dependencies = {
        {
            'nvim-tree/nvim-web-devicons',
        }
    },
    config = function()
        require('lualine').setup({
            options = {
                theme = "catppuccin",
                globalstatus = true,
            },
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
