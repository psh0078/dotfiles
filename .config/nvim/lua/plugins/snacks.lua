return {
  "folke/snacks.nvim",
  priority = 1000,
  lazy = false,
  keys = {
    { "<leader>e", 
      function() Snacks.explorer() end, 
      desc = "File Explorer" 
    },
    {
      "<leader>lg",
      function() Snacks.lazygit.open() end,
      desc = "LazyGit"
    }, {
      "<leader>gf",
      function() Snacks.picker.git_files() end,
      desc = "Git Files"
    },
    {
      "<leader>ps",
      function() Snacks.picker.grep() end,
      desc = "Live Grep"
    },
    {
      "<leader>pf",
      function() Snacks.picker.recent() end,
      desc = "Recent Files"
    },
    {
      "<leader><leader>",
      function() Snacks.picker.smart() end,
      desc = "Find Files"
    },
    { "<leader>b",
      function() Snacks.picker.buffers() end, 
      desc = "Buffers"
    },
    {
      "<leader>fb",
      function() Snacks.picker.buffers() end,
      desc = "Buffers"
    },
    {
      "<leader>fm",
      function() Snacks.picker.man() end,
      desc = "Man Pages"
    },
    {
      "<leader>fk",
      function() Snacks.picker.keymaps() end,
      desc = "Keymaps"
    },
    {
      "<leader>fh",
      function() Snacks.picker.help() end,
      desc = "Help Tags"
    }
  },
  opts = {
    dashboard = {
      preset = {
        keys = {
            {
                icon = "󰮗 ",
                key = "f",
                desc = "Find File",
                action = ":lua Snacks.dashboard.pick('files')"
            },
            {
                icon = " ",
                key = "e",
                desc = "New File",
                action = ":ene | startinsert"
            }, {
                icon = " ",
                key = "c",
                desc = "Configuration",
                action = ":e ~/.config/nvim/init.lua"
            },
            {
                icon = " ",
                key = "u",
                desc = "Update Plugins",
                action = ":Lazy sync"
            }, {
                icon = " ",
                key = "r",
                desc = "Recent Files",
                action = ":lua Snacks.dashboard.pick('oldfiles')"
            },
            -- { icon = " ", key = "s", desc = "Restore Session", section = "session" },
            {
                icon = "󰗼 ",
                key = "q",
                desc = "Quit",
                action = ":qa"
            }
        },
        header = [[
                                                            
██████   █████                   █████   █████  ███                  
░░██████ ░░███                   ░░███   ░░███  ░░░                   
░███░███ ░███   ██████   ██████  ░███    ░███  ████  █████████████   
░███░░███░███  ███░░███ ███░░███ ░███    ░███ ░░███ ░░███░░███░░███  
░███ ░░██████ ░███████ ░███ ░███ ░░███   ███   ░███  ░███ ░███ ░███  
░███  ░░█████ ░███░░░  ░███ ░███  ░░░█████░    ░███  ░███ ░███ ░███  
█████  ░░█████░░██████ ░░██████     ░░███      █████ █████░███ █████ 
░░░░░    ░░░░░  ░░░░░░   ░░░░░░       ░░░      ░░░░░ ░░░░░ ░░░ ░░░░░  
                                                            
          λ it be like that sometimes λ                     ]]
      },
      formats = {
        header = {"%s", align = "center", hl = "GruvboxYellow"},
        icon = {"%s", hl = "normal"},
        desc = {"%s", hl = "normal"},
        key = {"%s", hl = "GruvboxRed"}
      },
      sections = {
        {section = "header"},
        {section = "keys", gap = 1, padding = 1}, {
            section = "terminal",
            ttl = 0, -- disable cache
            cmd = "fortune -s",
            hl = "SnacksDashboardKey"
        }
      }
    },
    bigfile = {enabled = true},
    quickfile = {enabled = true},
    lazygit = {win = {width = 0, height = 0}},
    picker = {
        matcher = {
            cwd_bonus = true,
            frecency = true,
            history_bonus = true
        },
        layout = {preset = "ivy"},
        win = {
            input = {keys = {["<Esc>"] = {"close", mode = {"n", "i"}}}}
        }
    }
    -- picker = { enabled = true },
  }
}