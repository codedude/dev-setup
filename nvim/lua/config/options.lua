-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here
-- This file is automatically loaded by plugins.core

-- LazyVim picker to use.
-- Can be one of: telescope, fzf
-- Leave it to "auto" to automatically use the picker
-- enabled with `:LazyExtras`
vim.g.lazyvim_picker = "fzf"

-- LazyVim completion engine to use.
-- Can be one of: nvim-cmp, blink.cmp
-- Leave it to "auto" to automatically use the completion engine
-- enabled with `:LazyExtras`
vim.g.lazyvim_cmp = "blink.cmp"

-- if the completion engine supports the AI source,
-- use that instead of inline suggestions
vim.g.ai_cmp = false

local opt = vim.opt

vim.opt.colorcolumn = "80,100,120"

opt.autowrite = true -- Enable auto write
opt.conceallevel = 0 -- Hide * markup for bold and italic, but not markers with substitutions
opt.ruler = false -- Disable the default ruler
opt.smoothscroll = false

vim.lsp.inlay_hint.enable(false)

vim.lsp.config["zls"] = {
    -- Set to 'zls' if `zls` is in your PATH
    cmd = { "/opt/homebrew/bin/zls" },
    filetypes = { "zig" },
    root_markers = { "build.zig" },
    -- There are two ways to set config options:
    --   - edit your `zls.json` that applies to any editor that uses ZLS
    --   - set in-editor config options with the `settings` field below.
    --
    -- Further information on how to configure ZLS:
    -- https://zigtools.org/zls/configure/
    settings = {
        zls = {
            -- enable_build_on_save = true,
            inlay_hints_show_variable_type_hints = false,
            inlay_hints_show_struct_literal_field_type = false,
            inlay_hints_show_parameter_name = false,
            inlay_hints_show_builtin = false,
            inlay_hints_exclude_single_argument = false,
            inlay_hints_hide_redundant_param_names = true,
            inlay_hints_hide_redundant_param_names_last_token = true,
        },
    },
}
vim.lsp.enable("zls")

vim.lsp.config["gopls"] = {
    cmd = { "gopls" },
    settings = {
        gopls = {
            experimentalPostfixCompletions = true,
            analyses = {
                fieldalignment = true,
                nilness = true, -- default on
                shadow = true,
                unusedparams = true, -- default on
                unusedvariable = false,
                unusedwrite = true, -- default on
                useany = true,
            },
            staticcheck = false,
            semanticTokens = true,
            codelenses = {
                gc_details = true,
                upgrade_dependency = true,
                run_govulncheck = true,
                tidy = true,
                vendor = true,
                test = true,
            },
            hints = {
                assignVariableTypes = false,
                compositeLiteralFields = false,
                compositeLiteralTypes = false,
                constantValues = false,
                functionTypeParameters = false,
                parameterNames = false,
                rangeVariableTypes = false,
            },
            gofumpt = false,
        },
    },
}
vim.lsp.enable("gopls")
