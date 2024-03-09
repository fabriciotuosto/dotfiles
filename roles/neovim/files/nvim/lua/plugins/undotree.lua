return {
    "jiaoshijie/undotree",
    dependencies = "nvim-lua/plenary.nvim",
    config = true,
    keys = {
        { "<'<leader>U'", "<cmd>lua require('undotree').toogle()<cr>" }
    }
}
