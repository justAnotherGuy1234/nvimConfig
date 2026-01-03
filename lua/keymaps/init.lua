local map = vim.keymap.set

map("n" , "<leader><leader>" , vim.cmd.Ex)

map("n" , '<leader>v' , ':vsplit<CR>' , {})
map("n" , '<leader>h' , ':split<CR>' , {})

map("n" , '<leader>sl' , '<C-w>h' , {})
map("n" , '<leader>sr' , '<C-w>l' , {})
map("n" , '<leader>sb' , '<C-w>j' , {})
map("n" , '<leader>sa' , '<C-w>k' , {})
