vim.g.mapleader = " "
vim.keymap.set("n", "<leader>pv", vim.cmd.NERDTreeExplore)
vim.keymap.set("n", "<leader>nt", vim.cmd.NERDTreeToggle)
vim.keymap.set("n", "<C-n>", vim.cmd.bnext)
vim.keymap.set("n", "<C-b>", vim.cmd.bprevious)
vim.keymap.set("n", "<C-q>", vim.cmd.bdelete)
vim.keymap.set("n", "<leader>ut", vim.cmd.UndotreeToggle)
vim.keymap.set("n", "<C-s>", vim.cmd.w)

vim.keymap.set("n", "<C-h>", "<cmd>wincmd h<cr>")
vim.keymap.set("n", "<C-j>", "<cmd>wincmd j<cr>")
vim.keymap.set("n", "<C-k>", "<cmd>wincmd k<cr>")
vim.keymap.set("n", "<C-l>", "<cmd>wincmd l<cr>")

require("SomeArgentineCat.semi-colon-add")
