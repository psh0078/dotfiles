return {
    "nvim-telescope/telescope.nvim",
    dependencies = { "nvim-lua/plenary.nvim", "sharkdp/fd" },
    config = function()
        local builtin = require("telescope.builtin")
        vim.keymap.set("n", "<leader>pf", function()
          require('telescope.builtin').find_files({ hidden = true, no_ignore = true }) end, {})
        vim.keymap.set("n", "<leader>ps", builtin.live_grep, {})
        vim.keymap.set('n', '<leader>pw', builtin.grep_string, { desc = '[S]earch current [W]ord'  })
        vim.keymap.set("n", "<leader>b", builtin.buffers, { noremap = true, silent = true})
    end,
}
