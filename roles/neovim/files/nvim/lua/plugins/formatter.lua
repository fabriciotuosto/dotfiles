return {
    {
        "mhartington/formatter.nvim",
        event = "VeryLazy",
        config = function()
            require('formatter').setup({
                filetype = {
                    javascript = {
                        require('formatter.filetypes.javascript').prettier
                    },
                    typescript = {
                        require('formatter.filetypes.typescript').prettier
                    },
                    ["*"] = {
                        require('formatter.filetypes.any').remove_trailing_whitespace
                    }
                }
            })
        end
    },
}
