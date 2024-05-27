-- You can add your own plugins here or in other files in this directory!
--  I promise not to create any merge conflicts in this directory :)
--
-- See the kickstart.nvim README for more information
return {
  -- Download LazyVim for reference only.
  { -- LazyVim
    'LazyVim/LazyVim', --lazy = true,
    config = function(opts)
      ---- Everything that depends on LazyVim is here.
      require 'lazyvim.config' --.setup(opts)
      -- local LazyVim = require("lazyvim.util")
      -- Mimic keymaps:
      local map = vim.keymap.set
      -- buffers
      map('n', '<leader>bd', LazyVim.ui.bufremove, { desc = 'Delete Buffer' })
      -- lazygit
      map('n', '<leader>gg', function()
        LazyVim.lazygit { cwd = LazyVim.root.git() }
      end, { desc = 'Lazygit (Root Dir)' })
      map('n', '<leader>uf', function()
        LazyVim.format.toggle()
      end, { desc = 'Toggle Auto Format (Global)' })
      map('n', '<leader>uF', function()
        LazyVim.format.toggle(true)
      end, { desc = 'Toggle Auto Format (Buffer)' })
    end,
  },
  { 'wakatime/vim-wakatime' },
  { 'tpope/vim-fugitive' },
  -- { "kana/vim-textobj-entire" }, -- error
  { -- substitute
    'gbprod/substitute.nvim',
    opts = function()
      local substitute = require 'substitute'
      local exchange = require 'substitute.exchange'
      -- vim.keymap.set("n", "<leader>ex", require("substitute").operator, { noremap = true, desc = "Substitute" }),
      vim.keymap.set('n', 'gr', substitute.operator, { noremap = true, desc = 'ReplaceWithReg@Substitute' })
      vim.keymap.set('x', 'gr', substitute.visual, { noremap = true, desc = 'ReplaceWithReg@Substitute' })
      vim.keymap.set('n', 'cx', exchange.operator, { noremap = true, desc = 'Substitute.Exchange' })
      vim.keymap.set('n', 'cxx', exchange.line, { noremap = true, desc = 'Substitute.Exchange line' })
      vim.keymap.set('x', 'X', exchange.operator, { noremap = true, desc = 'Substitute.Exchange' })
      return {
        -- your configuration comes here
        -- or leave it empty to use the default settings
        -- refer to the configuration section below
      }
    end,
  },
  { -- flash
    'folke/flash.nvim',
    -- stylua: ignore
    keys = {
      {
        "s", mode = { "n", "x", "o" },
        function()
          require("flash").jump({
            search = {
              mode = function(str)
                return "\\<" .. str
              end,
            },
          })
        end, desc = "Flash beginning of words only" },
      { "S", mode = { "x", "o" }, false },
    },
  },
  -- require("custom.plugins.LazyVimLike"),
  { import = 'custom.plugins.telescope' },
  { import = 'custom.plugins.LazyVimLike' },
  -- { import = 'custom.plugins.treesitter' },
  -- { import = 'custom.plugins.mini' },
  -- Performance
  { 'LunarVim/bigfile.nvim' },

  -- Session management. This saves your session in the background,
  -- keeping track of open buffers, window arrangement, and more.
  -- You can restore sessions when returning through the dashboard.
  {
    'folke/persistence.nvim',
    event = 'BufReadPre',
    opts = { options = vim.opt.sessionoptions:get() },
    -- stylua: ignore
    keys = {
      { "<leader>qs", function() require("persistence").load() end, desc = "Restore Session" },
      { "<leader>ql", function() require("persistence").load({ last = true }) end, desc = "Restore Last Session" },
      { "<leader>qd", function() require("persistence").stop() end, desc = "Don't Save Current Session" },
    },
  },
}
