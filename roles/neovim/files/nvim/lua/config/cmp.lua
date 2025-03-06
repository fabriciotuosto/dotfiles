local blink = require('blink.cmp')
blink.setup({
    completion = {
        list = {
            selection = {
                preselect = true,
                auto_insert = true,
            },
        },
        menu = {
            min_width = 20,
            max_height = 20,
            draw = {
                columns = { { 'kind_icon' }, { 'label', 'label_description', gap = 1 } },
            },
        },
    }
})
