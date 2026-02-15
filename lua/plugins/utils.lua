return {
    {
	"Wansmer/treesj",
	keys = {
	    { "<leader>m", function() require('treesj').toggle() end, desc = "Toggle TreeSJ" },
	},
	dependencies = { "nvim-treesitter/nvim-treesitter" },
	opts = {
	    use_default_keymaps = false
	}
    },
    {
	"mikavilpas/yazi.nvim",
	version = "*", -- use the latest stable version
	event = "VeryLazy",
	dependencies = {
	    { "nvim-lua/plenary.nvim", lazy = true },
	},
	keys = {
	    {
		"<leader>y",
		mode = { "n", "v" },
		"<cmd>Yazi<cr>",
		desc = "Open yazi at the current file",
	    },
	    {
		"<leader>yn",
		"<cmd>Yazi cwd<cr>",
		desc = "Open the file manager in nvim's working directory",
	    },
	    {
		"<c-up>",
		"<cmd>Yazi toggle<cr>",
		desc = "Resume the last yazi session",
	    },
	},
	opts = {
	    open_for_directories = false,
	    keymaps = {
		show_help = "<f1>",
	    },
	},
	-- 👇 if you use `open_for_directories=true`, this is recommended
	init = function()
	    -- mark netrw as loaded so it's not loaded at all.
	    --
	    -- More details: https://github.com/mikavilpas/yazi.nvim/issues/802
	end,
    }
}
