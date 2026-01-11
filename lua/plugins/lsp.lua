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
	    vim.api.nvim_create_autocmd('LspAttach', {
		group = vim.api.nvim_create_augroup('UserLspConfig', {}),
		callback = function(ev)
		    local opts = { buffer = ev.buf }

		    -- We import telescope builtin functions
		    local builtin = require('telescope.builtin')

		    vim.keymap.set('n', '<leader>d', function()
			vim.diagnostic.open_float(nil, { focus = false, scope = "cursor" })
		    end, opts)

		    -- [TELESCOPE] Go to Definition
		    -- If there are multiple definitions, it opens a previewer.
		    vim.keymap.set('n', 'gd', builtin.lsp_definitions, opts)

		    -- [TELESCOPE] Find References
		    -- Shows a list of every place the variable is used.
		    vim.keymap.set('n', 'gr', builtin.lsp_references, opts)

		    -- [TELESCOPE] Go to Implementation
		    -- Useful for interfaces in Go/TS.
		    vim.keymap.set('n', 'gi', builtin.lsp_implementations, opts)

		    -- [TELESCOPE] Type Definition
		    vim.keymap.set('n', 'gt', builtin.lsp_type_definitions, opts)

		    -- [STANDARD] Documentation (Hover)
		    -- Telescope isn't needed here; a simple popup is faster.
		    vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)

		    -- [STANDARD] Rename Symbol
		    vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, opts)

		    -- [STANDARD] Code Action
		    -- (You can use 'builtin.lsp_code_actions' if you prefer Telescope for this too)
		    vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action, opts)

		    -- show errors with telescope
		    vim.keymap.set('n', '<leader>fe', function()
			builtin.diagnostics({ bufnr = 0 })
		    end, opts)
		end,
	    })
	    vim.diagnostic.config({
		float = {
		    border = "rounded",
		    source = true
		},
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
