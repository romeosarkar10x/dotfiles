return {
    "willothy/flatten.nvim",
    lazy = false,
    priority = 1001,
    opts = {
        window = { open = "tab" },
        hooks = {
            should_block = function ()
                return true
            end
        }
    }
}
