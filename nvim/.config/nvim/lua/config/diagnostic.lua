vim.diagnostic.config({
    virtual_text = {
        prefix = "◆",
        spacing = 4,
        source = "if_many", -- only show source name if multiple LSPs report
    },
    signs = true,
    underline = true,
    update_in_insert = false,
    severity_sort = true,
    float = {
        border = "rounded",
        source = "if_many",
    },
})
