vim.g.mapleader = " "

vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

vim.keymap.set("n", "J", "mzJ`z")
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

vim.keymap.set("x", "<leader>p", [["_dP]])

vim.keymap.set({"n", "v"}, "<leader>y", [["+y]])
vim.keymap.set("n", "<leader>Y", [["+Y]])

-- Remove <C-c> because it is not fast enough
vim.keymap.set({'n', 'i', 'v'}, '<C-c>', '<nop>')

-- Quickfix
vim.keymap.set("n", "<leader>q", function() vim.diagnostic.setqflist() end)
vim.keymap.set("n", "<M-j>", "<cmd>:cnext<CR>")
vim.keymap.set("n", "<M-k>", "<cmd>:cprev<CR>")
vim.keymap.set("n", "<M-f>", "<cmd>:cfirst<CR>")
vim.keymap.set("n", "<M-l>", "<cmd>:clast<CR>")
