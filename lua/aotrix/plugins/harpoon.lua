return {
    'ThePrimeagen/harpoon',
    dependencies = {'nvim-lua/plenary.nvim'},
    config = function()
        vim.keymap.set("n", "<leader>a", function() require("harpoon.mark").add_file() end)
        vim.keymap.set("n", "<leader>hv", function() require("harpoon.ui").toggle_quick_menu() end)
        vim.keymap.set("n", "<C-t>", function() require("harpoon.ui").nav_file(1) end)
        vim.keymap.set("n", "<C-h>", function() require("harpoon.ui").nav_file(2) end)
        vim.keymap.set("n", "<C-m>", function() require("harpoon.ui").nav_file(3) end)
        vim.keymap.set("n", "<C-l>", function() require("harpoon.ui").nav_file(4) end)
    end
}
