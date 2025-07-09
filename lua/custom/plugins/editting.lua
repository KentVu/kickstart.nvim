return {
  {
    "max397574/better-escape.nvim",
    enabled = true,
    config = function()
      require("better_escape").setup()
    end,
  },
  {
    "zk-org/zk-nvim",
    config = function()
      require("zk").setup({
        -- Can be "telescope", "fzf", "fzf_lua", "minipick", "snacks_picker",
        -- or select" (`vim.ui.select`).
        --picker = "fzf_lua",
        lsp = {
          -- `config` is passed to `vim.lsp.start(config)`
          config = {
            name = "zk",
            cmd = { "zk", "lsp" },
            filetypes = { "markdown" },
            on_attach = function()
              -- stylua: ignore
              local function map(...) vim.api.nvim_buf_set_keymap(0, ...) end
              local opts = { noremap = true, silent = false }

              -- Open the link under the caret.
              map("n", "<CR>", "<Cmd>lua vim.lsp.buf.definition()<CR>", opts)

              -- Preview a linked note.
              --map("n", "K", "<Cmd>lua vim.lsp.buf.hover()<CR>", opts)--LazyVim default
              -- Open the code actions for a visual selection.
              map("v", "<leader>za", ":'<,'>lua vim.lsp.buf.range_code_action()<CR>", opts)
              -- Open the code actions for a visual selection.
              map("v", "<leader>zi", ":'<,'>ZkInsertLinkAtSelection<CR>", opts)
            end,
            -- etc, see `:h vim.lsp.start()`
          },

          -- automatically attach buffers in a zk notebook that match the given filetypes
          auto_attach = {
            enabled = true,
          },
        },
      })
    end,
  },
}
