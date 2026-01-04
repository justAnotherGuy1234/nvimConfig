return {
    "nvim-telescope/telescope.nvim",
    keys = {
        {
            "<leader>gl",
            function() require('telescope.builtin').git_commits() end,
            desc = "Git Log"
        },
        {
            "<leader>gb",
            function() require('telescope.builtin').git_branches() end,
            desc = "Git Branches"
        },
        {
            "<leader>gs",
            function() require('telescope.builtin').git_status() end,
            desc = "Git Status"
        },
    },

    config = function()
        require('telescope').setup({
        })
    end
}
