return {
  "bluz71/vim-moonfly-colors",
  name = "moonfly",
  -- enabled = false,
  lazy = false,
  priority = 1000,
  config = function()
    vim.cmd("colorscheme moonfly")
  end
}

--[[
return {
  "vague2k/vague.nvim",
  config = function()
		vim.cmd("colorscheme vague")
  end
}
--]]
