return {
  'stevearc/oil.nvim',
  opts = {},
  dependencies = {
    { 'echasnovski/mini.icons', opts = {} },
  },
  lazy = false,
  config = function()
    require('oil').setup {
      columns = { 'icon' },
      keymaps = {
        ['<C-h>'] = false,
        ['<C-l>'] = false,
        ['<C-k>'] = false,
        ['<C-j>'] = false,
        -- ['<M-h>'] = 'actions.select_split',
      },

      view_options = {
        show_hidden = true,
      },
    }

    -- vim.keymap.set('n', '-', '<CMD>Oil --float<CR>', { desc = 'Open Oil (float)' })
    -- Open parent directory in floating window
    vim.keymap.set('n', '-', require('oil').toggle_float)

    -- Map `q` to close the Oil buffer with `:bd`
    vim.api.nvim_create_autocmd('FileType', {
      pattern = 'oil',
      callback = function()
        vim.keymap.set('n', 'q', '<CMD>bd<CR>', { buffer = true, desc = 'Close Oil buffer' })
      end,
    })
  end,
}
