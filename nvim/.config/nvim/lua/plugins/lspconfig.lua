return {
    "neovim/nvim-lspconfig",
    priority = 1000,
    lazy = false,
    dependencies = { "mason-org/mason.nvim", "saghen/blink.cmp" },
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
        vim.lsp.enable("jsonls")
        vim.lsp.enable("ts_ls")

        vim.lsp.config("yamlls", {
            settings = {
                yaml = {
                    schemas = {
                        ["https://json.schemastore.org/github-workflow.json"] = "/.github/workflows/*",
                        ["https://raw.githubusercontent.com/compose-spec/compose-spec/master/schema/compose-spec.json"] = { "docker-compose*.yml", "compose*.yml" },
                        ["https://json.schemastore.org/kustomization.json"] = "kustomization.yaml",
                    },
                    validate = true,
                    completion = true,
                    hover = true
                }
            }
        })

        vim.lsp.enable("yamlls")
        vim.lsp.enable("lemminx")
        vim.lsp.enable("pyright")
        vim.lsp.enable("ruff")

        vim.keymap.set("n", "<leader>lf", function() vim.lsp.buf.format() end)
    end
}
