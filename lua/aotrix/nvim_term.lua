vim.api.nvim_create_autocmd("TermOpen",
                            {callback = function() vim.cmd "startinsert!" end})
vim.api.nvim_create_autocmd('TermOpen', {
    callback = function()
        vim.opt_local.relativenumber = false
        vim.opt_local.number = false
    end
})
