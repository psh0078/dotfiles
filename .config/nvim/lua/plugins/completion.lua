return {
  {
    'saghen/blink.cmp',
    dependencies = 'rafamadriz/friendly-snippets',

    version = '1.*',
    opts = {
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
  }
}
