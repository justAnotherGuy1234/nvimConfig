return {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",
    dependencies = {
        "nvim-lua/plenary.nvim",
        "nvim-tree/nvim-web-devicons",
        "MunifTanjim/nui.nvim",
    },
    config = function()
        require("neo-tree").setup({
            close_if_last_window = true,
            filesystem = {
		filtered_items = {
		    visible = true,
		    hide_dotfiles = false,
		    hide_gitignored = false
		},
                follow_current_file = { enabled = false },
                hijack_netrw_behavior = "disabled",
            },
        })
        vim.keymap.set('n', '<leader>e', ':Neotree toggle position=left<CR>', { desc = "Toggle File Tree" })
    end
}
