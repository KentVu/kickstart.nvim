return {
  {
    'nvim-telescope/telescope.nvim',
    keys = {
      {
        "<leader>,",
        "<cmd>Telescope buffers sort_mru=true sort_lastused=true<cr>",
        desc = "Switch Buffer",
      },
      { "<leader>:", "<cmd>Telescope command_history<cr>", desc = "Command History" },
      { "<leader>fb", "<cmd>Telescope buffers sort_mru=true sort_lastused=true<cr>", desc = "Buffers" },
      { "<leader>fr", "<cmd>Telescope oldfiles<cr>", desc = "Recent" },
      { "<leader>sb", "<cmd>Telescope current_buffer_fuzzy_find<cr>", desc = "Buffer" },
      { "<leader>sh", "<cmd>Telescope help_tags<cr>", desc = "Help Pages" },
    },
  },
  -- Make Telescope sort most recent items first.
  { "prochri/telescope-all-recent.nvim",
    dependencies = {
      "nvim-telescope/telescope.nvim",
      "kkharji/sqlite.lua",
      -- optional, if using telescope for vim.ui.select
      -- "stevearc/dressing.nvim"
    },
    opts={
      database = {
        folder = vim.fn.stdpath("data"),
        file = "telescope-all-recent.sqlite3",
        max_timestamps = 10,
      },
      debug = false,
      scoring = {
        recency_modifier = { -- also see telescope-frecency for these settings
          [1] = { age = 240, value = 100 }, -- past 4 hours
          [2] = { age = 1440, value = 80 }, -- past day
          [3] = { age = 4320, value = 60 }, -- past 3 days
          [4] = { age = 10080, value = 40 }, -- past week
          [5] = { age = 43200, value = 20 }, -- past month
          [6] = { age = 129600, value = 10 }, -- past 90 days
        },
        -- how much the score of a recent item will be improved.
        boost_factor = 0.0001,
      },
      default = {
        disable = true, -- disable any unkown pickers (recommended)
        use_cwd = true, -- differentiate scoring for each picker based on cwd
        sorting = "recent", -- sorting: options: 'recent' and 'frecency'
      },
      pickers = { -- allows you to overwrite the default settings for each picker
        man_pages = { -- enable man_pages picker. Disable cwd and use frecency sorting.
          disable = false,
          use_cwd = false,
          sorting = "frecency",
        },

        -- change settings for a telescope extension.
        -- To find out about extensions, you can use `print(vim.inspect(require'telescope'.extensions))`
        -- ["extension_name#extension_method"] = {
        -- [...]
        -- },
      },
    },
    config = function(opts)
      require("telescope-all-recent").setup(opts)
      local builtin = require 'telescope.builtin'
      -- vim.keymap.set('n', '<leader><leader>', builtin.buffers, { desc = '[ ] Find existing buffers' })
      -- vim.keymap.set('n', '<leader>sh', builtin.help_tags, { desc = '[S]earch [H]elp' })
      -- vim.keymap.set('n', '<leader>ss', builtin.builtin, { desc = '[S]earch [S]elect Telescope' })
      -- vim.keymap.set('n', '<leader>s.', builtin.oldfiles, { desc = '[S]earch Recent Files ("." for repeat)' })
      -- vim.keymap.set('n', '<leader>sg', builtin.live_grep, { desc = '[S]earch by [G]rep' })
      return 
    end,
  },
}
