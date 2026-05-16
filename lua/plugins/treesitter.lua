return {
  'nvim-treesitter/nvim-treesitter',
  lazy = false,
  build = ':TSUpdate',
  config = function()
    local parsers = {
      'bash',
      'c',
      'diff',
      'go',
      'gomod',
      'gosum',
      'gowork',
      'html',
      'lua',
      'luadoc',
      'markdown',
      'markdown_inline',
      'python',
      'query',
      'vim',
      'vimdoc',
    }

    local treesitter = require 'nvim-treesitter'
    local installed = treesitter.get_installed()
    local missing = vim.tbl_filter(function(parser)
      return not vim.list_contains(installed, parser)
    end, parsers)
    if #missing > 0 then
      treesitter.install(missing)
    end

    vim.api.nvim_create_autocmd('FileType', {
      group = vim.api.nvim_create_augroup('kickstart-treesitter-start', { clear = true }),
      pattern = {
        'bash',
        'c',
        'diff',
        'go',
        'gomod',
        'gosum',
        'gowork',
        'html',
        'lua',
        'luadoc',
        'markdown',
        'python',
        'query',
        'sh',
        'vim',
        'vimdoc',
      },
      callback = function(event)
        pcall(vim.treesitter.start, event.buf)
        vim.bo[event.buf].indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
      end,
    })
  end,
}
