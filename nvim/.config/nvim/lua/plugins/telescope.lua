return {
    'nvim-telescope/telescope.nvim',
    dependencies = {
        'nvim-lua/plenary.nvim',
        { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' }
    },
    config = function ()
        vim.keymap.set("n", "<leader>f", function ()
                require("telescope.builtin").find_files({
                    hidden = true,
                    file_ignore_patterns = { "%.git/" }
                })
            end
        )
    end
}
