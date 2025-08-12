return {
  'preservim/vim-pencil',
  ft = { 'latex', 'tex', 'typ', 'typst' },
  init = function()
    vim.g['pencil#wrapModeDefault'] = 'soft'
    vim.api.nvim_create_autocmd('FileType', {
      pattern = { 'latex', 'tex', 'typ', 'typst' },
      callback = function()
        vim.cmd 'PencilSoft' -- Soft wrap mode (this auto starts Pencil and sets soft wrap)
      end,
    })
  end,
}
