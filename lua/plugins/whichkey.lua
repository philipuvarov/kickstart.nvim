-- return { -- Useful plugin to show you pending keybinds.
--   'folke/which-key.nvim',
--   event = 'VimEnter', -- Sets the loading event to 'VimEnter'
--   opts = {
--     -- delay between pressing a key and opening which-key (milliseconds)
--     -- this setting is independent of vim.o.timeoutlen
--     delay = 16,
--     icons = {
--       -- set icon mappings to true if you have a Nerd Font
--       -- If you are using a Nerd Font: set icons.keys to an empty table which will use the
--       -- default which-key.nvim defined Nerd Font icons, otherwise define a string table
--       keys = vim.g.have_nerd_font and {} or {
--         Up = '<Up> ',
--         Down = '<Down> ',
--         Left = '<Left> ',
--         Right = '<Right> ',
--         C = '<C-…> ',
--         M = '<M-…> ',
--         D = '<D-…> ',
--         S = '<S-…> ',
--         CR = '<CR> ',
--         Esc = '<Esc> ',
--         ScrollWheelDown = '<ScrollWheelDown> ',
--         ScrollWheelUp = '<ScrollWheelUp> ',
--         NL = '<NL> ',
--         BS = '<BS> ',
--         Space = '<Space> ',
--         Tab = '<Tab> ',
--         F1 = '<F1>',
--         F2 = '<F2>',
--         F3 = '<F3>',
--         F4 = '<F4>',
--         F5 = '<F5>',
--         F6 = '<F6>',
--         F7 = '<F7>',
--         F8 = '<F8>',
--         F9 = '<F9>',
--         F10 = '<F10>',
--         F11 = '<F11>',
--         F12 = '<F12>',
--       },
--     },
--
--     -- Document existing key chains
--     spec = {
--       { '<leader>s', group = '[S]earch' },
--       { '<leader>t', group = '[T]oggle' },
--       { '<leader>h', group = 'Git [H]unk', mode = { 'n', 'v' } },
--     },
--   },
-- }
return {
  {
    'folke/which-key.nvim',
    event = 'VeryLazy',
    opts_extend = { 'spec' },
    opts = {
      preset = 'helix',
      defaults = {},
      spec = {
        {
          mode = { 'n', 'x' },
          { '<leader>c', group = 'code' },
          { '<leader>g', group = 'git' },
          { '<leader>q', group = 'quit/session' },
          { '<leader>s', group = 'search' },
          { '<leader>x', group = 'diagnostics/quickfix' },
          { '<leader>t', group = '[T]oggle' },
          { '[', group = 'prev' },
          { ']', group = 'next' },
          { 'g', group = 'goto' },
          { 'gs', group = 'surround' },
          { 'z', group = 'fold' },
          {
            '<leader>b',
            group = 'buffer',
            expand = function()
              return require('which-key.extras').expand.buf()
            end,
          },
          {
            '<leader>w',
            group = 'windows',
            proxy = '<c-w>',
            expand = function()
              return require('which-key.extras').expand.win()
            end,
          },
          -- better descriptions
          { 'gx', desc = 'Open with system app' },
        },
      },
    },
    keys = {
      {
        '<leader>?',
        function()
          require('which-key').show { global = false }
        end,
        desc = 'Buffer Keymaps (which-key)',
      },
      {
        '<c-w><space>',
        function()
          require('which-key').show { keys = '<c-w>', loop = true }
        end,
        desc = 'Window Hydra Mode (which-key)',
      },
    },
    config = function(_, opts)
      local wk = require 'which-key'
      wk.setup(opts)
      if not vim.tbl_isempty(opts.defaults) then
        LazyVim.warn 'which-key: opts.defaults is deprecated. Please use opts.spec instead.'
        wk.register(opts.defaults)
      end
    end,
  },
}
