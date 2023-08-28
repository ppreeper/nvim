-- function utils.create_augroup(autocmds, name)
--     vim.cmd("augroup " .. name)
--     vim.cmd("autocmd!")
--     for _, autocmd in ipairs(autocmds) do
--         vim.cmd("autocmd " .. table.concat(autocmd, " "))
--     end
--     vim.cmd("augroup END")
-- end

-- Highlight on yank
-- utils.create_augroup(
--   {
--     {
--       "TextYankPost",
--       "*",
--       "silent! lua vim.highlight.on_yank()"
--     }
--   },
--   "YankHighlight"
-- )

local augroup = vim.api.nvim_create_augroup("LspFormatting", {})

vim.api.nvim_clear_autocmds({
    group = augroup,
})
vim.api.nvim_create_autocmd("BufWritePre", {
    group = augroup,
    callback = function()
        vim.lsp.buf.format()
        vim.cmd('Format')
    end
})
