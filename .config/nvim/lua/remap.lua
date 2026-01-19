--make leader space
vim.g.mapleader = " "

--Make Ctrl+C equivalent to ESC so that the exit hint doesn't come up over the status line
vim.keymap.set({ "n", "v", "i" }, "<C-c>", "<Esc>")

vim.keymap.set("i", "jj", "<ESC>", { silent = true })
vim.keymap.set("i", "jk", "<ESC>", { silent = true })

--open netrw
-- vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)

vim.keymap.set('n', 'H', '^') -- H goes to first non-blank character
vim.keymap.set('n', 'L', '$') -- L goes to end of the line

--when using these binds you can move a chunk of text and it will automatically indent
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

--makes search terms stay in the middle
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

--?
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "<C-f>", "<C-f>zz")
vim.keymap.set("n", "<C-b>", "<C-b>zz")

--copy to system clipboard
vim.keymap.set({ "n", "v" }, "<leader>y", '"+y')

--allows paste without removing current buffer
-- vim.keymap.set("x", "<leader>pp", '"_dP')
--allows ci without removing current paste buffer
vim.keymap.set("n", "ci(", '"_ci(')
vim.keymap.set("n", "ci(", '"_ci(')
vim.keymap.set("n", "ci)", '"_ci)')
vim.keymap.set("n", "ci{", '"_ci{')
vim.keymap.set("n", "ci}", '"_ci}')
vim.keymap.set("n", "ci'", "\"_ci'")
vim.keymap.set("n", "ci[", '"_ci[')
vim.keymap.set("n", "ci]", '"_ci]')
vim.keymap.set("n", 'ci"', '"_ci"')

vim.keymap.set("x", "<leader>p", [["_dP]])

--allows use of d without copying
vim.keymap.set("n", "D", '"_d')
vim.keymap.set("v", "D", '"_d')

--force you to use nvim binds!
vim.keymap.set("n", "<Left>", ':echoe "Use h"<CR>')
vim.keymap.set("n", "<Right>", ':echoe "Use l"<CR>')
vim.keymap.set("n", "<Up>", ':echoe "Use k"<CR>')
vim.keymap.set("n", "<Down>", ':echoe "Use j"<CR>')
vim.keymap.set("i", "<Left>", '<ESC>:echoe "Use h"<CR>')
vim.keymap.set("i", "<Right>", '<ESC>:echoe "Use l"<CR>')
vim.keymap.set("i", "<Up>", '<ESC>:echoe "Use k"<CR>')
vim.keymap.set("i", "<Down>", '<ESC>:echoe "Use j"<CR>')

--buffer (im finna use these as tabs) keybinds
vim.keymap.set("n", "<leader>t", ":enew<CR>")
vim.keymap.set("n", "<leader>d", ":bd<CR>")
vim.keymap.set("n", "<leader><Tab>", ":bnext<CR>")
vim.keymap.set("n", "<leader><S-Tab>", ":bprev<CR>")

--inverse tab in insert mode
vim.keymap.set("i", "<S-Tab>", "<C-d>")

--tabs in visual mode
vim.keymap.set("v", "<S-Tab>", "<<")
vim.keymap.set("v", "<Tab>", ">>")

vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR>", { silent = true })

-- write file on cmd+s
-- vim.keymap.set("n", "<C-s>", "w<CR>", { silent = true })

vim.opt.splitbelow = true -- split windows below
vim.opt.splitright = true -- split windows right

-- Movement
local keyset = vim.keymap.set

keyset("n", "<C-h>", ":split<CR>", { silent = true })  -- horizontal split
keyset("n", "<C-v>", ":vsplit<CR>", { silent = true }) -- vertical split

keyset("n", "<space>h", "<c-w>h")
keyset("n", "<space>j", "<c-w>j")
keyset("n", "<space>k", "<c-w>k")
keyset("n", "<space>l", "<c-w>l")

keyset("v", "J", ":m '>+1<cr>gv=gv") -- move line down
keyset("v", "K", ":m '<-2<cr>gv=gv") -- move line up

keyset("n", "<leader>wh", "<c-w>t<c-h>H")
keyset("n", "<leader>wk", "<c-w>t<c-h>K")
keyset("n", "<up>", ":resize +2<cr>")
keyset("n", "<down>", ":resize -2<cr>")
keyset("n", "<left>", ":vertical resize +2<cr>")
keyset("n", "<right>", ":vertical resize -2<cr>")
keyset("n", "j", "(v:count ? 'j' : 'gj')", { expr = true })
keyset("n", "k", "(v:count ? 'k' : 'gk')", { expr = true })
