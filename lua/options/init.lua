local opt = vim.opt

opt.relativenumber = true
opt.number = true
opt.shiftwidth = 4


vim.diagnostic.config({
  virtual_text = true,
  signs = true,
  underline = true,
  update_in_insert = true,
})

