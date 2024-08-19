vim.cmd("colorscheme " .. "rose-pine")

require('lualine').setup({
    options = {
        theme = "rose-pine",
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
