return {
    {
	"neovim/nvim-lspconfig",
	dependencies = {
	    -- Package Manager for LSPs (Installs the servers)
	    "williamboman/mason.nvim",
	    "williamboman/mason-lspconfig.nvim",

	    {
		"folke/lazydev.nvim",
		ft = "lua",
		opts = { library = { { path = "${3rd}/luv/library", words = { "vim%.uv" } } } }
	    },
	},
	config = function()
	    require("mason").setup()
	    require("mason-lspconfig").setup({
		-- List the servers you want explicitly here to auto-install them
		"lua_ls",
		"ts_ls",      -- TypeScript/JavaScript
		"gopls",      -- Go
		"angularls",  -- Angular
	    })

	    -- 3. Setup the servers
	    local lspconfig = require("lspconfig")

	    -- Setup Lua
	    lspconfig.lua_ls.setup({})

	    -- Setup TypeScript / JS
	    lspconfig.ts_ls.setup({})

	    -- Setup Go
	    lspconfig.gopls.setup({})

	    -- Setup Angular
	    lspconfig.angularls.setup({})
	end,
    }
}
