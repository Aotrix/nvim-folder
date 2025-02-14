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

vim.keymap.set("n", "<leader>pv", function() require("telescope").extensions.file_browser.file_browser() end)
vim.keymap.set("n", "<leader>pf", function() require("telescope.builtin").find_files() end)
vim.keymap.set("n", "<leader>s", function() require("telescope.builtin").treesitter() end)

vim.keymap.set("n", "<leader>a", function() require("harpoon.mark").add_file() end)
vim.keymap.set("n", "<leader>hv", function() require("harpoon.ui").toggle_quick_menu() end)
vim.keymap.set("n", "<C-t>", function() require("harpoon.ui").nav_file(1) end)
vim.keymap.set("n", "<C-h>", function() require("harpoon.ui").nav_file(2) end)
vim.keymap.set("n", "<C-m>", function() require("harpoon.ui").nav_file(3) end)
vim.keymap.set("n", "<C-l>", function() require("harpoon.ui").nav_file(4) end)

-- GoTo code navigation
vim.keymap.set("n", "gD", "<Plug>(coc-declaration)", {silent = true})
vim.keymap.set("n", "gd", "<Plug>(coc-definition)", {silent = true})
vim.keymap.set("n", "K", "<CMD>lua _G.show_docs()<CR>", {silent = true})
vim.keymap.set("n", "gr", "<CMD>Telescope coc references<CR>", {silent = true})
vim.keymap.set("n", "gy", "<Plug>(coc-type-definition)", {silent = true})
vim.keymap.set("n", "gi", "<Plug>(coc-implementation)", {silent = true})

-- Remove <C-c> because it is not fast enough
vim.keymap.set({'n', 'i', 'v'}, '<C-c>', '<nop>')

-- nvim-dap
vim.keymap.set("n", "<leader>b", function() require("dap").toggle_breakpoint() end)
vim.keymap.set("n", "<leader>gb", function() require("dap").run_to_cursor() end)
-- Eval var under cursor
vim.keymap.set("n", "<leader>?", function()
    require("dapui").eval(nil, { enter = true })
end)
vim.keymap.set("n", "<F1>", function() require("dap").continue() end)
vim.keymap.set("n", "<F2>", function() require("dap").step_into() end)
vim.keymap.set("n", "<F3>", function() require("dap").step_over() end)
vim.keymap.set("n", "<F4>", function() require("dap").step_out() end)
vim.keymap.set("n", "<F5>", function() require("dap").step_back() end)
vim.keymap.set("n", "<F13>", function() require("dap").restart() end)
