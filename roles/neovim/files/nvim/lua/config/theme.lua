vim.cmd("colorscheme " .. "oldworld")

require('lualine').setup({
    options = {
        theme = "auto",
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
