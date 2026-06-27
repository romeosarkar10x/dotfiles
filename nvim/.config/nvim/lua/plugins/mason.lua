return {
    { "mason-org/mason.nvim", opts = {} },
    {
        "mason-org/mason-lspconfig.nvim",
        dependencies = { "mason-org/mason.nvim", "neovim/nvim-lspconfig" },
        opts = {
            ensure_installed = { "lua_ls", "jsonls", "ts_ls", "yamlls", "jdtls", "lemminx", "pyright", "ruff", "html", "cssls", "astro" },
            automatic_enable = false
        }
    }
}
