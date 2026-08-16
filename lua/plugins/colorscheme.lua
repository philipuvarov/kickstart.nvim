return {
  {
    'baliestri/aura-theme',
    lazy = false,
    priority = 900,
    config = function(plugin)
      vim.opt.rtp:append(plugin.dir .. '/packages/neovim')
    end,
  },
  {
    'folke/tokyonight.nvim',
    lazy = false,
    priority = 1000,
    opts = {
      transparent = false,
      styles = {
        comments = { italic = true },
      },
    },
  },
  {
    'scottmckendry/cyberdream.nvim',
    lazy = false,
    priority = 1000,
    opts = {
      transparent = false,
      italic_comments = true,
    },
    config = function(_, opts)
      require('cyberdream').setup(opts)
      vim.cmd.colorscheme 'cyberdream'
    end,
  },
  {
    'nyoom-engineering/oxocarbon.nvim',
    lazy = false,
    priority = 1000,
  },
}
