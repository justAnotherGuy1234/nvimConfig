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
		ensure_installed = {
		    "lua_ls",
		    "ts_ls",      -- TypeScript/JavaScript
		    "gopls",      -- Go
		    "angularls",  -- Angular
		    "jdtls",
		}
	    })

	    local lspconfig = require("lspconfig")
	    local capabilities = require("cmp_nvim_lsp").default_capabilities()
	    -- Setup Lua
	    lspconfig.lua_ls.setup({
		capabilities = capabilities
	    })

	    -- Setup TypeScript / JS
	    lspconfig.ts_ls.setup({
		capabilities = capabilities
	    })

	    -- Setup Go
	    lspconfig.gopls.setup({
		capabilities = capabilities
	    })

	    -- Setup Angular
	    lspconfig.angularls.setup({
		capabilities = capabilities
	    })

	    lspconfig.jdtls.setup({
		capabilities = capabilities
	    })
	end,
    }
}
