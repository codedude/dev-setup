return {
    {
        "folke/snacks.nvim",
        opts = {
            explorer = {
                trash = true,
                jump = { close = true },
            },
            picker = {
                sources = {
                    files = {
                        hidden = true,
                        ignored = true,
                    },
                    explorer = {
                        hidden = true,
                        ignored = false,
                    },
                },
            },
        },
    },
    {
        "neovim/nvim-lspconfig",
        opts = {
            inlay_hints = { enabled = false },
            servers = {
                gopls = {
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
                            staticcheck = true,
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
                            gofumpt = true,
                        },
                    },
                },
            },
        },
    },
}
