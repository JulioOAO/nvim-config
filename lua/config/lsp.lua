vim.lsp.enable('pyright')
require('lspconfig').lua_ls.setup {
    settings = {
        Lua = {
            runtime = {
                version = 'Lua51',
            },
            diagnostics = {
                globals = { 'vim' },
            },
            workspace = {
                library = vim.api.nvim_get_runtime_file("", true),
                checkThirdParty = false,
            },
            telemetry = {
                enable = false,
            },
        },
    },
}
