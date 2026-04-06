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
}
