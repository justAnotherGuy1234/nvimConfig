return {
  "sindrets/diffview.nvim",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  cmd = { 
    "DiffviewOpen", 
    "DiffviewClose", 
    "DiffviewToggleFiles", 
    "DiffviewFocusFiles" 
  },
  keys = {
    { "<leader>gd", "<cmd>DiffviewOpen<cr>", desc = "Open Git Diffview" },
    { "<leader>gx", "<cmd>DiffviewClose<cr>", desc = "Close Git Diffview" },
  },
  opts = function()
    local actions = require("diffview.actions")
    
    return {
      enhanced_diff_hl = true,
      view = {
        merge_tool = {
          layout = "diff3_mixed",
          disable_diagnostics = true,
        },
      },
      keymaps = {
        -- These keymaps will only be active when you are inside a Diffview window
        view = {
          -- Conflict Resolution (Change the keys in the brackets to your liking)
          ["<leader>go"] = actions.conflict_choose("ours"),   -- Accept YOUR changes
          ["<leader>gt"] = actions.conflict_choose("theirs"), -- Accept INCOMING changes
          ["<leader>gba"] = actions.conflict_choose("base"),   -- Revert to original
          ["<leader>ga"] = actions.conflict_choose("all"),    -- Keep both
          ["<leader>x"] = actions.conflict_choose("none"),   -- Delete the conflicted block
          
          -- Conflict Navigation
          ["]x"] = actions.next_conflict(), -- Jump to the next conflict
          ["[x"] = actions.prev_conflict(), -- Jump to the previous conflict
        },
      },
    }
  end,
}
