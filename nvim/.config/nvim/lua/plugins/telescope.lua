return {
    'nvim-telescope/telescope.nvim',
    dependencies = {
        'nvim-lua/plenary.nvim',
        { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' }
    },
    config = function ()
        local telescope = require("telescope.builtin")
        vim.keymap.set("n", "<leader>ff", function ()
                telescope.find_files({
                    hidden = true,
                    file_ignore_patterns = { "%.git/" }
                })
            end
        )

        vim.keymap.set("n", "<leader>fg", telescope.live_grep)
        vim.keymap.set("n", "<leader>fd", telescope.diagnostics)
    end
}
