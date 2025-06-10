-- Use the following for starting dbus:
-- dbus-daemon --fork --session --address=$DBUS_SESSION_BUS_ADDRESS
return {
  'lervag/vimtex',
  lazy = false, -- we don't want to lazy load VimTeX
  init = function()
    vim.g.vimtex_mappings_enabled = 1
    vim.g.vimtex_syntax_conceal_disable = 1 -- Disable math conceal
    -- vim.g.vimtex_tex_conceal = 'abdmg'

    --vimtex_view_settings
    vim.g.vimtex_view_method = 'zathura'
    -- vim.g.vimtex_view_method = 'skim'
    vim.g.vimtex_view_general_options = '-reuse-instance -forward-search @tex @line @pdf'

    --quickfix settings
    vim.g.vimtex_quickfix_open_on_warning = 0 --  don't open quickfix if there are only warnings
    vim.g.vimtex_quickfix_ignore_filters =
      { 'Underfull', 'Overfull', 'LaTeX Warning: .\\+ float specifier changed to', 'Package hyperref Warning: Token not allowed in a PDF string' }

    -- Disable matchparen for better LaTeX experience
    vim.g.loaded_matchparen = 1
  end,
  config = function()
    vim.api.nvim_create_autocmd('FileType', {
      pattern = { 'tex', 'latex' },
      callback = function()
        vim.opt_local.spell = true
        vim.opt_local.spelllang = 'en_us'

        -- This is insead handled through the VimPencil-plugin
        -- vim.opt_local.wrap = true
        -- vim.opt_local.linebreak = true

        -- mapping: Ctrl+. to correct previous spelling mistake
        vim.api.nvim_buf_set_keymap(0, 'i', '<C-.>', '<c-g>u<Esc>[s1z=`]a<c-g>u', { noremap = true, silent = true })

        -- Operator-pending and visual mode mappings for $...$
        -- vim.api.nvim_buf_set_keymap(0, 'o', 'i$', ':<C-u>normal! T$vt$<CR>', { noremap = true, silent = true })
        -- vim.api.nvim_buf_set_keymap(0, 'x', 'i$', 'T$ot$', { noremap = true, silent = true })
        -- vim.api.nvim_buf_set_keymap(0, 'o', 'a$', ':<C-u>normal! F$vf$<CR>', { noremap = true, silent = true })
        -- vim.api.nvim_buf_set_keymap(0, 'x', 'a$', 'F$of$', { noremap = true, silent = true })

        -- Mappings for gj / gk movement
        -- This is insead handled through the VimPencil-plugin
        -- vim.api.nvim_buf_set_keymap(0, 'n', '<C-j>', 'gj', { noremap = true, silent = true })
        -- vim.api.nvim_buf_set_keymap(0, 'n', '<C-k>', 'gk', { noremap = true, silent = true })umbers
        --
        vim.opt_local.cursorline = false
        vim.opt_local.relativenumber = false
      end,
    })
  end,
}
