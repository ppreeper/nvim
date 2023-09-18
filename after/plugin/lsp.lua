local augroup = vim.api.nvim_create_augroup("LspFormatting", {})
vim.api.nvim_clear_autocmds({ group = augroup })
vim.api.nvim_create_autocmd("BufWritePre", {
    group = augroup,
    callback = function()
        -- vim.lsp.buf.code_action({ apply = true })
        vim.lsp.buf.format()
        vim.cmd('Format')
    end
})


require('mason').setup()
require('mason-lspconfig').setup({
    ensure_installed = {
        "lua_ls",
        "gopls",
        "pyright",
        "eslint",
        "emmet_ls",
        "tsserver",
        "html",
        "cssls",
        "tailwindcss",
        "yamlls",
        "sqlls",
        "jsonls",
        "lemminx",
        "bashls"
    }
})

local on_attach = function(client, bufnr)
    local opts = { buffer = bufnr, remap = false }
    vim.keymap.set("n", "gd", function() vim.lsp.buf.definition() end, opts)
    vim.keymap.set("n", "K", function() vim.lsp.buf.hover() end, opts)
    vim.keymap.set("n", "<leader>vws", function() vim.lsp.buf.workspace_symbol() end, opts)
    vim.keymap.set("n", "<leader>vd", function() vim.diagnostic.open_float() end, opts)
    vim.keymap.set("n", "[d", function() vim.diagnostic.goto_next() end, opts)
    vim.keymap.set("n", "]d", function() vim.diagnostic.goto_prev() end, opts)
    vim.keymap.set("n", "<leader>vca", function() vim.lsp.buf.code_action() end, opts)
    vim.keymap.set("n", "<leader>vrr", function() vim.lsp.buf.references() end, opts)
    vim.keymap.set("n", "<leader>vrn", function() vim.lsp.buf.rename() end, opts)
    vim.keymap.set("n", "<C-i>", function() vim.lsp.buf.signature_help() end, opts)
    vim.keymap.set("n", "<leader>f", function()
        vim.lsp.buf.format()
        vim.cmd('Format')
    end, opts)
    -- vim.defer_fn(lsp_format_on_save(bufnr), 3000)
end

local lspconfig = require('lspconfig')
local configs = require('lspconfig/configs')
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require('cmp_nvim_lsp').default_capabilities(capabilities)
capabilities.textDocument.completion.completionItem.snippetSupport = true

lspconfig.lua_ls.setup({
    on_attach = on_attach,
    capabilities = capabilities,
})
lspconfig.gopls.setup({
    on_attach = on_attach,
    capabilities = capabilities,
    gopls = {
        completeUnimported = true,
        usePlaceholders = true,
        analyses = {
            unusedparams = true,
        }
    }
})
lspconfig.pyright.setup {
    on_attach = on_attach,
    capabilities = capabilities,
    root_dir = lspconfig.util.root_pattern("pyrightconfig.json", "pyproject.toml", "Pipfile"),
    pyright = {
        autoImportCompletion = true,
    },
    python = {
        analysis = {
            autoSearchPaths = true,
            diagnosticMode = "workspace",
            useLibraryCodeForTypes = true,
        }
    }
}
lspconfig.eslint.setup({
    on_attach = on_attach,
    capabilities = capabilities,
})
lspconfig.emmet_ls.setup({
    on_attach = on_attach,
    capabilities = capabilities,
    filetypes = { "html", "css", "scss", "sass", "less", "javascript", "svelte" },
})
lspconfig.tsserver.setup({
    on_attach = on_attach,
    capabilities = capabilities,
})
lspconfig.html.setup({
    on_attach = on_attach,
    capabilities = capabilities,
})
lspconfig.cssls.setup({
    on_attach = on_attach,
    capabilities = capabilities,
})
lspconfig.tailwindcss.setup({
    on_attach = on_attach,
    capabilities = capabilities,
})
lspconfig.yamlls.setup({
    on_attach = on_attach,
    capabilities = capabilities,
})
lspconfig.sqlls.setup({
    on_attach = on_attach,
    capabilities = capabilities,
})
lspconfig.jsonls.setup({
    on_attach = on_attach,
    capabilities = capabilities,
})
lspconfig.lemminx.setup({
    on_attach = on_attach,
    capabilities = capabilities,
})
lspconfig.bashls.setup({
    on_attach = on_attach,
    capabilities = capabilities,
})
