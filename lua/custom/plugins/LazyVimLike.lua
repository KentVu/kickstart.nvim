-- All things that depends on LazyVim.
require 'lazyvim.config' --.setup(opts)
local folderOfThisFile = (...):match '(.-)[^%.]+$'
return {
  -- Can use the LazyVim global here!
  {
    'nvim-telescope/telescope.nvim',
    keys = {
      { '<leader>/', LazyVim.telescope 'live_grep', desc = 'Grep (Root Dir)' },
      { '<leader><space>', LazyVim.telescope 'files', desc = 'Find Files (Root Dir)' },
      { '<leader>ff', LazyVim.telescope 'files', desc = 'Find Files (Root Dir)' },
    },
  },
  require(folderOfThisFile .. 'lsp'),
  -- require(folderOfThisFile .. 'treesitter'),
  { import = folderOfThisFile .. 'treesitter' },
  -- require(folderOfThisFile .. 'mini'),
  { import = folderOfThisFile .. 'mini' },
  -- require(folderOfThisFile .. 'formatting'),
  { import = folderOfThisFile .. 'formatting' },
  -- require('custom.plugins.lsp')
}
