return {
    "neovim/nvim-lspconfig",
    priority = 1000,
    lazy = false,
    dependencies = { "mason-org/mason.nvim" },
    config = function ()
        vim.lsp.config("lua_ls", {
            settings = {
                Lua = {
                    runtime = { version = "LuaJIT" },
                    diagnostics = { globals = { "vim" } },
                    workspace = {
                        library = vim.api.nvim_get_runtime_file("", true),
                        checkThirdParty = false
                    },
                    telemetry = { enable = false },
                    hint = { enable = true },
                    completion = { callSnippet = "Replace" },
                }
            }
        })

        vim.lsp.enable("lua_ls")
    end
}

