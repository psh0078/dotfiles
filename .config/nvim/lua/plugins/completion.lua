return {
  {
    'saghen/blink.cmp',
    dependencies = 'rafamadriz/friendly-snippets',

    version = '1.*',

    opts = {
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
