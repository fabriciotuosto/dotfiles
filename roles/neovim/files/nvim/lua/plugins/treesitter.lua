return {
    {
        "nvim-treesitter/nvim-treesitter",
        dependencies = {
            "nvim-treesitter/nvim-treesitter-textobjects"
        },
        build = ":TSUpdate",
        config = function()
            require('config.treesitter')
        end
    },
    {
        "nvim-treesitter/nvim-treesitter-textobjects"
    }
}
