return {
  "nvim-lualine/lualine.nvim",
  dependencies = { 'nvim-tree/nvim-web-devicons' },

  config = function()
    require('lualine').setup({
      options = {
        theme = 'auto',
        icons_enabled = true,
        separator = nil,
        always_divide_middle = true,
        always_show_tabline = true,
        section_separators = '',
        component_separators = '',
        globalstatus = false,
        refresh = {
          statusline = 100,
          tabline = 100,
          winbar = 100,
        }
      },
      sections = {},
      inactive_sections = {},
      winbar = {
        lualine_a = { 'mode' },
        lualine_b = { 'branch', 'diff', 'diagnostics' },
        lualine_c = { 'filename' },
        lualine_x = { 'searchcount', 'selectioncount', 'fileformat', 'filetype' },
        lualine_y = { 'progress' },
        lualine_z = { 'location' }
      },
      inactive_winbar = {
        lualine_a = {},
        lualine_b = {},
        lualine_c = { 'filename' },
        lualine_x = { 'location' },
        lualine_y = {},
        lualine_z = {}
      },
    })
    vim.o.laststatus = 0
  end,
}
