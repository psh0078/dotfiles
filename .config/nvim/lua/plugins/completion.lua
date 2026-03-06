return {
  {
    'saghen/blink.cmp',
    event = { 'InsertEnter', 'CmdlineEnter' },
    dependencies = {
      'L3MON4D3/LuaSnip',
      'rafamadriz/friendly-snippets',
    },

    version = '1.*',
    opts = {
      snippets = { preset = 'luasnip' },
      completion = {
        list = {
          selection = {
            preselect = false,
            auto_insert = false,
          },
        },
      },
      keymap = {
        preset = 'default',
        ['<Tab>'] = { "select_next", "fallback" },
        ['<S-Tab>'] = { "select_prev", "fallback" },
        ['<CR>'] = { "accept", "fallback" },
        ['<C-e>'] = { "hide", "fallback" },
      },
      appearance = {
        use_nvim_cmp_as_default = true,
        nerd_font_variant = 'mono'
      },
      signature = {
        enabled = true,
        window = {
          show_documentation = false,
        }
      },
    },
    config = function(_, opts)
      local blink = require('blink.cmp')
      local ls = require('luasnip')

      require('luasnip.loaders.from_vscode').lazy_load()

      ls.add_snippets('markdown', {
        ls.snippet('bold', {
          ls.text_node('**'),
          ls.insert_node(1),
          ls.text_node('**'),
        }),
        ls.snippet('italic', {
          ls.text_node('*'),
          ls.insert_node(1),
          ls.text_node('*'),
        }),
        ls.snippet('bolditalics', {
          ls.text_node('___'),
          ls.insert_node(1),
          ls.text_node('___'),
        }),
        ls.snippet('code', {
          ls.text_node('`'),
          ls.insert_node(1),
          ls.text_node('`'),
        }),
        ls.snippet('link', {
          ls.text_node('['),
          ls.insert_node(1, 'text'),
          ls.text_node(']('),
          ls.insert_node(2, 'url'),
          ls.text_node(')'),
        }),
        ls.snippet('task', {
          ls.text_node('- [ ] '),
          ls.insert_node(1),
        }),
      })

      blink.setup(opts)
    end,
  }
}
