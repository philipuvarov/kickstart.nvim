return {
  'zbirenbaum/copilot.lua',
  cmd = 'Copilot',
  event = 'InsertEnter',
  opts = {
    suggestion = {
      enabled = false, -- Disable inline suggestions (we'll use blink.cmp)
    },
    panel = {
      enabled = false, -- Disable panel (we'll use blink.cmp)
    },
    server_opts_overrides = {
      trace = 'verbose',
      settings = {
        advanced = {
          listCount = 10,
          inlineSuggestCount = 3,
        },
      },
    },
    filetypes = {
      yaml = false,
      markdown = false,
      help = false,
      gitcommit = false,
      gitrebase = false,
      hgcommit = false,
      svn = false,
      cvs = false,
      ['.'] = false,
    },
  },
}
