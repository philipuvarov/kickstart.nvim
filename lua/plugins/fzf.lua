return {
  'ibhagwan/fzf-lua',
  -- optional for icon support
  -- or if using mini.icons/mini.nvim
  dependencies = { 'nvim-mini/mini.icons' },
  opts = {},
  config = function()
    -- require('fzf-lua').setup { 'telescope' }
    require 'fzf-lua'
    vim.keymap.set('n', '<leader>sk', FzfLua.keymaps, { desc = '[S]earch [K]eymaps' })
    vim.keymap.set('n', '<leader>sh', FzfLua.help_tags, { desc = '[S]earch [H]help' })
    -- vim.keymap.set('n', '<leader>sf', FzfLua.files, { desc = '[S]earch [F]iles' })
    vim.keymap.set('n', '<leader>sg', FzfLua.live_grep, { desc = '[S]earch by [G]rep' })
    vim.keymap.set('n', '<leader><leader>', FzfLua.files, { desc = '[ ] Search Files' })

    -- -- Slightly advanced example of overriding default behavior and theme
    -- vim.keymap.set('n', '<leader>/', function()
    --   -- You can pass additional configuration to Telescope to change the theme, layout, etc.
    --   builtin.current_buffer_fuzzy_find(require('telescope.themes').get_dropdown {
    --     winblend = 10,
    --     previewer = false,
    --   })
    -- end, { desc = '[/] Fuzzily search in current buffer' })
    --
    -- -- It's also possible to pass additional configuration options.
    -- --  See `:help telescope.builtin.live_grep()` for information about particular keys
    -- vim.keymap.set('n', '<leader>s/', function()
    --   builtin.live_grep {
    --     grep_open_files = true,
    --     prompt_title = 'Live Grep in Open Files',
    --   }
    -- end, { desc = '[S]earch [/] in Open Files' })
    --
    -- -- Shortcut for searching your Neovim configuration files
    -- vim.keymap.set('n', '<leader>sn', function()
    --   builtin.find_files { cwd = vim.fn.stdpath 'config' }
    -- end, { desc = '[S]earch [N]eovim files' })
  end,
}
