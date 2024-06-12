local theme = "rose-pine"
-- vim.cmd([[colorscheme catppuccin-mocha]])
-- vim.cmd("colorscheme rose-pine")
-- vim.cmd("colorscheme nordic")
vim.cmd("colorscheme " .. theme)

require('lualine').setup({
    options = {
        theme = theme,
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
