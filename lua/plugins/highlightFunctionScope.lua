return {
  "echasnovski/mini.indentscope",
  version = false,
  event = { "BufReadPre", "BufNewFile" },
  init = function()
    vim.api.nvim_create_autocmd("FileType", {
      pattern = {
        "help",
        "alpha",
        "dashboard",
        "neo-tree",
        "Trouble",
        "trouble",
        "lazy",
        "mason",
        "notify",
        "toggleterm",
        "lazyterm",
      },
      callback = function()
        vim.b.miniindentscope_disable = true
      end,
    })
  end,
  config = function()
    -- 'require' is safe here because this function runs after the plugin loads
    require("mini.indentscope").setup({
      symbol = "│",
      draw = {
        delay = 100,
        animation = require("mini.indentscope").gen_animation.none(),
      },
      options = {
        border = "top",
        try_as_border = true,
      },
    })
  end,
}
