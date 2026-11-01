local jdtls = require("jdtls")
local jdtls_path = vim.fn.stdpath("data") .. "/mason/packages/jdtls"
local launcher = vim.fn.glob(jdtls_path .. "/plugins/org.eclipse.equinox.launcher_*.jar")


local function get_config_name()
    local unix_name = vim.uv.os_uname()
    local machine = unix_name.machine
    local system_name = unix_name.sysname
    local is_arm = machine == "arm64" or machine == "aarch64"

    if system_name == "Darwin" then
        return is_arm and "config_mac_arm" or "config_mac"
    elseif system_name == "Linux" then
        return is_arm and "config_linux_arm" or "config_linux"
    else
        return "config_win"
    end
end

local config_dir = jdtls_path .. "/" .. get_config_name() .. "/"
local root_dir = vim.fs.root(0, { ".project", ".git", "mvnw", "gradlew", "pom.xml", "build.gradle" }) or vim.fn.getcwd()
local project_name = vim.fn.fnamemodify(root_dir, ":t")
local project_id = vim.fn.sha256(root_dir):sub(1, 7)
local workspace_dir = vim.fn.stdpath("data") .. "/jdtls-workspace/" .. project_name .. "_" .. project_id .. "/"

local config = {
    cmd = {
        "java",
        "-Declipse.application=org.eclipse.jdt.ls.core.id1",
        "-Dosgi.bundles.defaultStartLevel=4",
        "-Declipse.product=org.eclipse.jdt.ls.core.product",
        "-Dlog.protocol=true",
        "-Dlog.level=ALL",
        "-Xmx1g",
        "--add-modules=ALL-SYSTEM",
        "--add-opens", "java.base/java.util=ALL-UNNAMED",
        "--add-opens", "java.base/java.lang=ALL-UNNAMED",
        "-jar", launcher,
        "-configuration", config_dir,
        "-data", workspace_dir,
    },
    root_dir = root_dir,
    settings = {
        java = {
            signatureHelp = { enabled = true },
            completion = {
                favoriteStaticMembers = {},
            },
        },
    },

    -- hook up your existing keymaps/capabilities here
    on_attach = function(_, bufnr)
        -- example keymaps
        local opts = { buffer = bufnr }
        vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
        vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
        vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, opts)
        vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)
        vim.keymap.set("n", "<leader>oi", jdtls.organize_imports, opts)
    end,
}

jdtls.start_or_attach(config)
