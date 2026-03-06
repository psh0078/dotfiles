return {
  {
    'projekt0n/github-nvim-theme',
    enabled = true,
    priority = 1000,
    config = function()
      local function macos_is_dark()
        if vim.fn.has("mac") == 1 then
          vim.fn.system({ "defaults", "read", "-g", "AppleInterfaceStyle" })
          return vim.v.shell_error == 0
        end
        return false
      end

      local function apply_colorscheme()
        local scheme = macos_is_dark() and "github_dark_default" or "github_light_default"
        vim.cmd.colorscheme(scheme)
      end

      apply_colorscheme()

      vim.api.nvim_create_autocmd("FocusGained", {
        group = vim.api.nvim_create_augroup("MacOSAppearanceTheme", { clear = true }),
        callback = apply_colorscheme,
      })
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
    enabled = false,
    lazy = false,
    priority = 1000,
    config = function()
      vim.cmd("colorscheme tairiki-dimmed")
    end
  },
}
