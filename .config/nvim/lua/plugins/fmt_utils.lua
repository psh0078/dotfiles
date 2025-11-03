return {
  {
    "Wansmer/treesj",
    keys = { "<space>m", "<space>j", "<space>s" },
    dependencies = { "nvim-treesitter/nvim-treesitter" },
    config = function()
      require("treesj").setup({})
    end,
  },
  {
    "windwp/nvim-autopairs",
    event = "InsertEnter",
    config = function()
      local npairs = require("nvim-autopairs")
      npairs.setup({
        enable_check_bracket_line = false,
      })
    end,
    opts = {},
  },
  {
    "echasnovski/mini.surround",
    opts = {
      mappings = {
        add = "<Space>s",             -- Add surrounding
        delete = "<Space>sd",         -- Delete surrounding
        find = "<Space>sf",           -- Find surrounding (right)
        find_left = "<Space>sF",      -- Find surrounding (left)
        highlight = "<Space>sh",      -- Highlight surrounding
        replace = "<Space>sr",        -- Replace surrounding
        update_n_lines = "<Space>sn", -- Update `n_lines`

        suffix_last = "l",            -- same suffixes are fine
        suffix_next = "n",
      },
    },
    n_lines = 20,
    respect_selection_type = false,
    search_method = "cover",
    silent = false,
  },
}
