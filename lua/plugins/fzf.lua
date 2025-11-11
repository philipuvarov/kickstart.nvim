return {
  'ibhagwan/fzf-lua',
  -- optional for icon support
  -- or if using mini.icons/mini.nvim
  dependencies = { 'nvim-mini/mini.icons' },
  opts = {},
  config = function()
    require 'fzf-lua'
    vim.keymap.set('n', 'gr', '<cmd>FzfLua lsp_references      jump1=true ignore_current_line=true<cr>', { desc = 'LSP: References', nowait = true })
    vim.keymap.set('n', 'gd', '<cmd>FzfLua lsp_definitions     jump1=true ignore_current_line=true<cr>', { desc = 'LSP: Goto Definition' })
    vim.keymap.set('n', 'gI', '<cmd>FzfLua lsp_implementations jump1=true ignore_current_line=true<cr>', { desc = 'LSP: Goto Implementation' })
    vim.keymap.set('n', 'gy', '<cmd>FzfLua lsp_typedefs        jump1=true ignore_current_line=true<cr>', { desc = 'LSP: Goto T[y]pe Definition' })
    vim.keymap.set('n', '<leader>sk', FzfLua.keymaps, { desc = '[S]earch [K]eymaps' })
    vim.keymap.set('n', '<leader>sh', FzfLua.help_tags, { desc = '[S]earch [H]help' })
    vim.keymap.set('n', '<leader>sg', FzfLua.live_grep, { desc = '[S]earch by [G]rep' })
    vim.keymap.set('n', '<leader><leader>', FzfLua.files, { desc = '[ ] Search Files' })
  end,
}
