return {
    {
        "nvim-telescope/telescope.nvim",
        tag = "0.1.5",
        dependencies = { "nvim-lua/plenary.nvim" },
        config = function()
            require("config.telescope")
        end
    },
    {
        "nvim-telescope/telescope-ui-select.nvim",
        config = function()
        end
    }
}
