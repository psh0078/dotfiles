return {
  {
    "catppuccin/nvim",
    name = "catppuccin",
    enabled = false,
    priority = 1000,
    config = function()
      vim.cmd("colorscheme catppuccin-latte")
    end
  },
  {
    "rebelot/kanagawa.nvim",
    name = "kanagawa",
    enabled = false,
    priority = 1000,
    config = function()
      vim.cmd("colorscheme kanagawa-lotus")
    end
  },
  {
    "bluz71/vim-moonfly-colors",
    name = "moonfly",
    enabled = false,
    lazy = false,
    priority = 1000,
    config = function()
      vim.cmd("colorscheme moonfly")
    end
  },
  {
    "deparr/tairiki.nvim",
    name = "tairiki",
    enabled = true,
    lazy = false,
    priority = 1000,
    config = function()
      vim.cmd("colorscheme tairiki-dimmed")
    end
  },
}
