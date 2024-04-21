return {
    "jiaoshijie/undotree",
    dependencies = "nvim-lua/plenary.nvim",
    config = function()
        require('undotree').setup({})
    end,
    keys = {
        { "<leader>U", "<cmd>lua require('undotree').toogle()<cr>" }
    }
}
