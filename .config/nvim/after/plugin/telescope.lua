local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>pf', builtin.find_files, {})
vim.keymap.set('n', '<leader>pg', builtin.git_files, {})
vim.keymap.set('n', '<leader>pw', builtin.grep_string, {})
vim.keymap.set('n', '<leader>ps', builtin.live_grep, {})

-- INFO: grep_string can be turned on, if live_grep is too slow
-- vim.keymap.set('n', '<leader>ps', function()
-- 	builtin.grep_string({ search = vim.fn.input("Grep > ") })
-- end)

require('telescope').setup{
  pickers = {
      find_files = {
          find_command = { "rg", "--files", "--hidden", "--glob", "!**/.git/*" },
      },
  },
}
