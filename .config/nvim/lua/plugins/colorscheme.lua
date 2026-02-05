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
    "Mofiqul/vscode.nvim",
    lazy = false,
    priority = 1000,
    opts = {},
    config = function()
      vim.cmd("colorscheme vscode")
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
}
