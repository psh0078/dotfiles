local bg = vim.g.system_background or "light"

-- pick your light/dark theme in one place
local themes = {
  dark = {
    package = "deparr/tairiki.nvim",
    colorscheme = "tairiki-dimmed",
  },
  -- light = {
  --   package = "catppuccin/nvim",
  --   name = "catppuccin",
  --   colorscheme = "catppuccin-latte",
  -- },
  light = {
    package = "thesimonho/kanagawa-paper.nvim",
    name = "kanagawa-paper",
    colorscheme = "kanagawa-paper-canvas",
  },
}

local function theme_spec(variant)
  local theme = themes[variant]
  return {
    theme.package,
    name = theme.name,
    lazy = false,
    priority = 1000,
    enabled = bg == variant,
    config = function()
      vim.opt.background = variant
      vim.cmd("colorscheme " .. theme.colorscheme)
    end,
  }
end

return {
  theme_spec("dark"),
  theme_spec("light"),
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
    "rose-pine/neovim",
    name = "rose-pine",
    enabled = false,
    config = function()
      vim.cmd("colorscheme rose-pine")
    end
  },
  {
    "RRethy/base16-nvim",
    lazy = false,
    enabled = false,
    priority = 1000,
    config = function()
      vim.cmd("colorscheme base16-black-metal-gorgoroth")
      vim.api.nvim_set_hl(0, "NvimTreeHidden", { fg = "#777777" })
      vim.api.nvim_set_hl(0, "DiagnosticVirtualTextError", { fg = "#912222" })
      vim.api.nvim_set_hl(0, "TSComment", { fg = "#6f7b68", gui = nil })
      vim.api.nvim_set_hl(0, "Comment", { fg = "#6f7b68", gui = nil })
      vim.api.nvim_set_hl(0, "Visual", { bg = "#9b8d7f", fg = "#1e1e1e" })
      vim.api.nvim_set_hl(0, "Search", { bg = "#9b8d7f", fg = "#1e1e1e" })
      vim.api.nvim_set_hl(0, "PmenuSel", { bg = "#9b8d7f", fg = "#1e1e1e" })
      vim.api.nvim_set_hl(0, "LineNrAbove", { fg = "#888888", bg = "#222222" })
      vim.api.nvim_set_hl(0, "LineNrBelow", { fg = "#888888", bg = "#222222" })
      vim.api.nvim_set_hl(0, "LineNr", { fg = "#d6d2c8" })
    end
  },
  {
    "vague2k/vague.nvim",
    enabled = false,
    config = function()
      require("vague").setup({
        -- optional configuration here
        -- transparent = true,
        vim.cmd("colorscheme vague"),
        style = {
          -- "none" is the same thing as default. But "italic" and "bold" are also valid options
          boolean = "none",
          number = "none",
          float = "none",
          error = "none",
          comments = "none",
          conditionals = "none",
          functions = "none",
          headings = "bold",
          operators = "none",
          strings = "none",
          variables = "none",

          -- keywords
          keywords = "none",
          keyword_return = "none",
          keywords_loop = "none",
          keywords_label = "none",
          keywords_exception = "none",

          -- builtin
          builtin_constants = "none",
          builtin_functions = "none",
          builtin_types = "none",
          builtin_variables = "none",
        },
        colors = {
          -- func = "#bc96b0",
          -- keyword = "#787bab",
          -- -- string = "#d4bd98",
          -- string = "#8a739a",
          -- -- string = "#f2e6ff",
          -- -- number = "#f2e6ff",
          -- -- string = "#d8d5b1",
          -- number = "#8f729e",
          -- -- type = "#dcaed7",
        },
      })
    end,
  },
}
