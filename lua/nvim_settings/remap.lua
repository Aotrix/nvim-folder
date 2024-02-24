vim.g.mapleader = " "
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)

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

vim.keymap.set("n", "<leader>pf", function() require("telescope.builtin").find_files() end)
vim.keymap.set("n", "<leader>pg", function() require("telescope").extensions.live_grep_args.live_grep_args() end)

vim.keymap.set("n", "<leader>a", function() require("harpoon.mark").add_file() end)
vim.keymap.set("n", "<leader>hv", function() require("harpoon.ui").toggle_quick_menu() end)
vim.keymap.set("n", "<C-t>", function() require("harpoon.ui").nav_file(1) end)
vim.keymap.set("n", "<C-h>", function() require("harpoon.ui").nav_file(2) end)
vim.keymap.set("n", "<C-m>", function() require("harpoon.ui").nav_file(3) end)
vim.keymap.set("n", "<C-l>", function() require("harpoon.ui").nav_file(4) end)

vim.keymap.set('n', 'gD', function() vim.lsp.buf.declaration() end)
vim.keymap.set('n', 'gd', function() vim.lsp.buf.definition() end)
vim.keymap.set('n', 'K', function() vim.lsp.buf.hover() end)
vim.keymap.set('n', 'gr', function() require('telescope.builtin').lsp_references() end, { noremap = true, silent = true })
