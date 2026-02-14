local map = vim.keymap.set

map("n" , "<leader><leader>" , vim.cmd.Ex)

map("n" , '<leader>v' , ':vsplit<CR>' , {})
map("n" , '<leader>h' , ':split<CR>' , {})

map("n" , '<leader>sl' , '<C-w>h' , {})
map("n" , '<leader>sr' , '<C-w>l' , {})
map("n" , '<leader>sb' , '<C-w>j' , {})
map("n" , '<leader>sa' , '<C-w>k' , {})

map("n", "<leader>ct", function()
    local builtin = require('telescope.builtin')
    local actions = require('telescope.actions')
    local action_state = require('telescope.actions.state')

    -- CHANGE THIS to the absolute path of your global TODO repo
    -- 'vim.fn.expand' allows you to use the '~' symbol for your home directory
    local todo_repo_path = vim.fn.expand("/home/mubeen/Desktop/todos")

    builtin.find_files({
        prompt_title = "Global TODOs (Opens in Right Split)",
        cwd = todo_repo_path, -- <--- This forces Telescope to search your global repo
        hidden = true,        -- Optional: Set to true if you want to search hidden files
        attach_mappings = function(prompt_bufnr, _)
            actions.select_default:replace(function()
                actions.close(prompt_bufnr)
                local selection = action_state.get_selected_entry()
                if selection then
                    -- Because we used 'cwd', selection.path will correctly point to the global file
                    vim.cmd("botright 50vsplit " .. selection.path)
                end
            end)
            return true
        end,
    })
end, { desc = "Search Global TODOs -> Right Split" })
