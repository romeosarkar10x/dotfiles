return {
    "nvim-treesitter/nvim-treesitter",
    lazy = false,
    build = ":TSUpdate",
    config = function ()
        require("nvim-treesitter").setup()
        require("nvim-treesitter").install({
            "bash", "astro", "c", "dockerfile",
            "git_commit", "git_config", "git_rebase", "gitattributes", "gitignore",
            "html", "java", "javascript", "json", "lua", "python", "scss",
            "typescript", "tsx", "xml", "yaml"
        })
    end
}
