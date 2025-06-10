vim.api.nvim_create_user_command('ReloadSnippets', function()
  package.loaded['snippets.my_snippets'] = nil -- replace with your actual module
  require('luasnip.loaders.from_lua').lazy_load { paths = './lua/luasnip/' }
  print 'Snippets reloaded!'
end, {})
