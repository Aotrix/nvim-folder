return {
    "stevearc/conform.nvim",
    opts = {
        notify_on_error = false,
        format_on_save = {timeout_ms = 500, lsp_fallback = true},
        formatters_by_ft = {
            lua = {"lua-format"},
            python = {"black", "pyink"},
            cpp = {"clang_format"},
            cmake = {"cmake_format"}
        },
        formatters = {
            clang_format = {
                prepend_args = {'--style={BasedOnStyle: LLVM, IndentWidth: 4}'}
            },
            shfmt = {prepend_args = {'-i', '4'}}
        }
    }
}
