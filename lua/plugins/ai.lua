return {
  'folke/sidekick.nvim',
  opts = {
    debug = true,
    cli = {
      -- picker = 'fzf-lua',
      -- picker = "snacks",
      tools = {
        debug = {
          -- print env and read -p "any key to continue"
          cmd = { 'bash', '-c', 'env | sort | bat -l env' },
        },
      },
    },
  },
  keys = {
    {
      '<tab>',
      function()
        -- if there is a next edit, jump to it, otherwise apply it if any
        if require('sidekick').nes_jump_or_apply() then
          return -- jumped or applied
        end
        return '<tab>'
      end,
      mode = { 'i', 'n' },
      expr = true,
      desc = 'Goto/Apply Next Edit Suggestion',
    },
  },
}
