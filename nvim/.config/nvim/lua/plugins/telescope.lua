return {
    'nvim-telescope/telescope.nvim', tag = '0.1.8',
    dependencies = {
        'nvim-lua/plenary.nvim',
        { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' }
    },
    config = function ()
        vim.keymap.set("n", "<leader>f", function ()
                require("telescope.builtin").find_files()
            end
        )
    end
}
