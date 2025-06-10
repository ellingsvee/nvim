return {
  'preservim/vim-pencil',
  ft = { 'latex', 'tex' },
  init = function()
    vim.g['pencil#wrapModeDefault'] = 'soft'
    vim.api.nvim_create_autocmd('FileType', {
      pattern = { 'latex', 'tex' },
      callback = function()
        vim.cmd 'PencilSoft' -- Soft wrap mode (this auto starts Pencil and sets soft wrap)
      end,
    })
  end,
}
