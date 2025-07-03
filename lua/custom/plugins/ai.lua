return {
  {
    'zbirenbaum/copilot.lua',
    cmnd = 'Copilot',
    event = 'InsertEnter',
    config = function()
      require('copilot').setup {
        suggestion = {
          -- enabled = true,
          enabled = not vim.g.ai_cmp,
          auto_trigger = true,
          hide_during_completion = vim.g.ai_cmp,
          debounce = 75,
          -- trigger_on_accept = true,
          keymap = {
            accept = false,
            -- accept = '<M-l>',
            -- accept_word = false,
            -- accept_line = false,
            -- next = '<M-]>',
            -- prev = '<M-[>',
            -- dismiss = '<C-]>',
          },
        },
        panel = { enabled = false },
      }
    end,
  },
  -- {
  --   'giuxtaposition/blink-cmp-copilot',
  -- },
  -- vim.g.ai_cmp
  --   and {
  --     'saghen/blink.cmp',
  --     optional = true,
  --     dependencies = { 'giuxtaposition/blink-cmp-copilot' },
  --     opts = {
  --       sources = {
  --         default = { 'copilot' },
  --         providers = {
  --           copilot = {
  --             name = 'copilot',
  --             module = 'blink-cmp-copilot',
  --             kind = 'Copilot',
  --             score_offset = 100,
  --             async = true,
  --           },
  --         },
  --       },
  --     },
  --   },
}
