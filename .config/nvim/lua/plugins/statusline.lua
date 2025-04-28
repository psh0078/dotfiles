return {
  "nvim-lualine/lualine.nvim",
    dependencies = { 'nvim-tree/nvim-web-devicons'  },

    config = function()
      -- Moonfly theme integration
    local custom_nordic = {
      normal = {
        a = { fg = "#2E3440", bg = "#88C0D0", gui = "bold"  },
        b = { fg = "#D8DEE9", bg = "#4C566A"  },
        c = { fg = "#D8DEE9", bg = "#3B4252"  },
      },
      insert = {
        a = { fg = "#2E3440", bg = "#A3BE8C", gui = "bold"  },
        b = { fg = "#D8DEE9", bg = "#4C566A"  },
        c = { fg = "#D8DEE9", bg = "#3B4252"  },
      },
      visual = {
        a = { fg = "#2E3440", bg = "#EBCB8B", gui = "bold"  },
        b = { fg = "#D8DEE9", bg = "#4C566A"  },
        c = { fg = "#D8DEE9", bg = "#3B4252"  },
      },
      replace = {
        a = { fg = "#2E3440", bg = "#BF616A", gui = "bold"  },
        b = { fg = "#D8DEE9", bg = "#4C566A"  },
        c = { fg = "#D8DEE9", bg = "#3B4252"  },
      },
      command = {
        a = { fg = "#2E3440", bg = "#8FBCBB", gui = "bold"  },
        b = { fg = "#D8DEE9", bg = "#4C566A"  },
        c = { fg = "#D8DEE9", bg = "#3B4252"  },
      },
      inactive = {
        a = { fg = "#D8DEE9", bg = "#4C566A", gui = "bold"  },
        b = { fg = "#D8DEE9", bg = "#3B4252"  },
        c = { fg = "#D8DEE9", bg = "#3B4252"  },
      },
    }

  require('lualine').setup({
      sections = {
      lualine_a = { 'mode'  },
      lualine_b = { 'diagnostics'  },
      lualine_c = { 'filename'  },
      lualine_x = { 'searchcount', 'selectioncount', 'fileformat', 'filetype'  },
      lualine_y = { 'progress'  },
      lualine_z = { 'location'  }
      },
      options = {
      separator = nil,
      section_separators = '',
      component_separators = '',
      theme = custom_moonfly,
      },
      })
  end,
}

