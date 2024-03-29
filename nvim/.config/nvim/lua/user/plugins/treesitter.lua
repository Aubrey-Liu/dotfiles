return {
    {
        "nvim-treesitter/nvim-treesitter",
        event = "VeryLazy",
        build = ":TSUpdate",
        dependencies = { "nvim-treesitter/nvim-treesitter-textobjects" },
        config = function()
            -- Looks better (especially with inlay hints)
            vim.api.nvim_set_hl(0, "@variable", { link = "@parameter", default = false })

            local treesitter = require("nvim-treesitter.configs")
            treesitter.setup({
                ensure_installed = {
                    "vimdoc",
                    "javascript",
                    "typescript",
                    "regex",
                    "bash",
                    "markdown",
                    "markdown_inline",
                    "c",
                    "lua",
                    "rust",
                    "toml",
                },
                sync_install = false,
                auto_install = true,
                indent = { enable = true },
                highlight = {
                    enable = true,
                    additional_vim_regex_highlighting = false, -- catppuccin requires this
                },
                incremental_selection = {
                    enable = true,
                    keymaps = {
                        -- Don't have to use "init selction", just use any textobjects
                        node_incremental = "=",
                        node_decremental = "-",
                    },
                },
                textobjects = {
                    enable = true,
                    select = {
                        enable = true,
                        lookahead = true,
                        -- stylua: ignore
                        keymaps = {
                            ["am"] = "@function.outer", ["im"] = "@function.inner",
                            ["ac"] = "@class.outer", ["ic"] = "@class.inner",
                        },
                    },
                },
            })
        end,
    },
    {
        "Wansmer/treesj",
        dependencies = { "nvim-treesitter/nvim-treesitter" },
        -- stylua: ignore
        keys = {
            { "<leader>cz", function() require("treesj").toggle() end, desc = "Toggle Scope" },
        },
        opts = {
            use_default_keymaps = false,
        },
    },
}
