-- load this before the plugins
vim.opt.termguicolors = true

-- pick background based on macOS appearance to avoid flashes
local function system_background()
  if vim.fn.has("mac") == 1 then
    vim.fn.system({ "defaults", "read", "-g", "AppleInterfaceStyle" })
    if vim.v.shell_error == 0 then
      return "dark"
    end
  end
  return "light"
end

vim.g.system_background = system_background()
vim.opt.background = vim.g.system_background

require("remap")
require("set")

-- package manager
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"

if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

vim.g.mapleader = " "

require("lazy").setup("plugins", {})
