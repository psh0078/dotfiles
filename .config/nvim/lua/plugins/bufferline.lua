return {
  "akinsho/bufferline.nvim",
  version = "*",
  event = "UIEnter",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  opts = {
    options = {
      mode = "buffers",
      numbers = "none",

      diagnostics = "nvim_lsp",
      diagnostics_indicator = function(count, level)
        local icon = level:match("error") and " "
            or level:match("warning") and " "
            or " "
        return icon .. count
      end,

      indicator = { style = "icon", icon = "▎" },
      separator_style = "thin",

      show_buffer_icons = true,
      show_buffer_close_icons = true,
      show_close_icon = true,
      show_tab_indicators = true,
      always_show_bufferline = false,

      offsets = {
        {
          filetype = "NvimTree",
          text = "File Explorer",
          text_align = "center",
          separator = false,
        },
      },

      hover = { enabled = true, delay = 200, reveal = { "close" } },
      sort_by = "insert_at_end",
    },
  },
}
