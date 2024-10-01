vim.cmd("colorscheme " .. "tokyonight-night")

require('lualine').setup({
    options = {
        theme = "tokyonight",
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
