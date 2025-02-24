return {
    "neovim/nvim-lspconfig",
    dependencies = {
        "williamboman/mason.nvim", "williamboman/mason-lspconfig.nvim"
    },
    config = function()
        require("mason").setup()
        require("mason-lspconfig").setup({
            ensure_installed = {"cmake", "lua_ls"}
        })
        require('lspconfig').clangd.setup({
            root_dir = function(fname)
                return require("lspconfig.util").root_pattern("CMakeLists.txt",
                                                              "Makefile",
                                                              "configure.ac",
                                                              "configure.in",
                                                              "config.h.in",
                                                              "meson.build",
                                                              "meson_options.txt",
                                                              "build.ninja")(
                           fname) or
                           require("lspconfig.util").root_pattern(
                               "compile_commands.json", "compile_flags.txt")(
                               fname) or
                           require("lspconfig.util").find_git_ancestor(fname)
            end,
            capabilities = {offsetEncoding = {"utf-16"}},
            cmd = {
                "clangd", "--background-index", "--clang-tidy",
                "--header-insertion=iwyu", "--completion-style=detailed",
                "--function-arg-placeholders", "--fallback-style=llvm"
            },
            init_options = {
                usePlaceholders = true,
                completeUnimported = true,
                clangdFileStatus = true
            }
        })

        vim.keymap.set("n", "<leader>o", "<cmd>ClangdSwitchSourceHeader<cr>")

        require('lspconfig').cmake.setup({})
        require('lspconfig').lua_ls.setup({
            settings = {completion = {callSnippet = 'Replace'}}
        })
    end
}
