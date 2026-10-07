require("conform").setup({
    formatters_by_ft = {
        go = { "gofumpt" },
        python = { "ruff_fix", "ruff_format" },
    },
    format_on_save = {
        timeout_ms = 500,
        lsp_fallback = true,
    },
})
