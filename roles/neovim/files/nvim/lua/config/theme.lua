require('onedark').setup({ style = "warmer" })
vim.cmd("colorscheme " .. "onedark")

require('lualine').setup({
    options = {
        theme = "onedark",
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
