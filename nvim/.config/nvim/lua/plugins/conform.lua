return {
    "stevearc/conform.nvim",
    opts = {
        formatters = {
            palantir = {
                command = "palantir-java-format",
                args = { "-", "--palantir" },
                stdin = true
            }
        },
        formatters_by_ft = { java = { "palantir" } },
    }
}
