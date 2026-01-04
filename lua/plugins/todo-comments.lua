return {
    "folke/todo-comments.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    opts = {
        keywords = {
            FIX = {
                icon = " ", -- icon used for the sign, and in search results
                color = "error", -- can be a hex color, or a named color (see below)
                alt = { "FIXME", "BUG", "FIXIT", "ISSUE" }, -- a set of other keywords that all map to this FIX keywords
            },
            TODO = { color = "info" },
            HACK = { color = "warning" },
            WARN = {  color = "warning", alt = { "WARNING", "XXX" } },
            PERF = { alt = { "OPTIM", "PERFORMANCE", "OPTIMIZE" } },
            NOTE = { color = "hint", alt = { "INFO" } },
            TEST = { color = "test", alt = { "TESTING", "PASSED", "FAILED" } },
        },
    },
    config = function(_, opts)
        require("todo-comments").setup(opts)

        -- Keymap: Search all TODOs using Telescope
        vim.keymap.set("n", "<leader>ft", ":TodoTelescope<CR>", { desc = "Find TODOs" })
    end
}
