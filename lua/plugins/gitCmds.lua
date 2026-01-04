return {
    "nvim-telescope/telescope.nvim",
    config = function()
	local builtin = require('telescope.builtin')

	-- Check Git Logs (Commits)
	vim.keymap.set('n', '<leader>gl', builtin.git_commits, { desc = "Git Log" })

	-- Check Git Branches
	vim.keymap.set('n', '<leader>gb', builtin.git_branches, { desc = "Git Branches" })

	-- Check Git Status (Changed files)
	vim.keymap.set('n', '<leader>gs', builtin.git_status, { desc = "Git Status" })
    end
}
