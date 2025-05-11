return {
	"mbbill/undotree",
	config = function()
    local keyset = vim.keymap.set
		vim.keymap.set("n", "<leader>u", vim.cmd.UndotreeToggle)
    vim.opt.undofile = true -- save undo history
    keyset("i", ",", ",<C-g>U")
    keyset("i", ".", ".<C-g>U")
    keyset("i", "!", "!<C-g>U")
    keyset("i", "?", "?<C-g>U")
  end,
}
