return {
  'ibhagwan/fzf-lua',
  opts = {},
  config = function()
    local fzf = require 'fzf-lua'
    local function pick_theme()
      fzf.colorschemes {
        prompt = 'Theme> ',
        live_preview = true,
        colors = {
          'aura-dark',
          'cyberdream',
          'oxocarbon',
          'tokyonight',
          'tokyonight-night',
          'tokyonight-storm',
          'tokyonight-moon',
          'tokyonight-day',
        },
      }
    end

    vim.api.nvim_create_user_command('Theme', pick_theme, { desc = 'Pick colorscheme' })
    vim.keymap.set('n', 'gr', '<cmd>FzfLua lsp_references      jump1=true ignore_current_line=true<cr>', { desc = 'LSP: References', nowait = true })
    vim.keymap.set('n', 'gd', '<cmd>FzfLua lsp_definitions     jump1=true ignore_current_line=true<cr>', { desc = 'LSP: Goto Definition' })
    vim.keymap.set('n', 'gI', '<cmd>FzfLua lsp_implementations jump1=true ignore_current_line=true<cr>', { desc = 'LSP: Goto Implementation' })
    vim.keymap.set('n', 'gy', '<cmd>FzfLua lsp_typedefs        jump1=true ignore_current_line=true<cr>', { desc = 'LSP: Goto T[y]pe Definition' })
    vim.keymap.set('n', '<leader>sk', fzf.keymaps, { desc = '[S]earch [K]eymaps' })
    vim.keymap.set('n', '<leader>sh', fzf.help_tags, { desc = '[S]earch [H]help' })
    vim.keymap.set('n', '<leader>sg', fzf.live_grep, { desc = '[S]earch by [G]rep' })
    vim.keymap.set('n', '<leader>st', pick_theme, { desc = '[S]earch [T]hemes' })
    vim.keymap.set('n', '<leader><leader>', fzf.files, { desc = '[ ] Search Files' })
  end,
}
