vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)
vim.keymap.set("n", "<leader>w", ":w<CR>")
vim.keymap.set("n", "<leader>q", ":q<CR>")

vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

vim.keymap.set("n", "Y", "yg$")
vim.keymap.set("n", "J", "mzJ`z")
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

vim.keymap.set("n", "<leader>vwm", function()
    require("vim-with-me").StartVimWithMe()
end)
vim.keymap.set("n", "<leader>svwm", function()
    require("vim-with-me").StopVimWithMe()
end)

-- greatest remap ever
vim.keymap.set("x", "<leader>p", "\"_dP")

-- next greatest remap ever : asbjornHaland
vim.keymap.set({ "n", "v" }, "<leader>y", "\"+y")
vim.keymap.set("n", "<leader>Y", "\"+Y")

vim.keymap.set({ "n", "v" }, "<leader>d", "\"_d")

vim.keymap.set("i", "<C-c>", "<Esc>")

vim.keymap.set("n", "Q", "<nop>")
vim.keymap.set("n", "<C-f>", "<cmd>silent !tmux neww tmux-sessionizer<CR>")
vim.keymap.set("n", "<leader>f", function()
    vim.lsp.buf.format()
end)

-- vim.keymap.set("n", "<C-k>", "<cmd>cnext<CR>zz")
-- vim.keymap.set("n", "<C-j>", "<cmd>cprev<CR>zz")
vim.keymap.set("n", "<leader>k", "<cmd>lnext<CR>zz")
vim.keymap.set("n", "<leader>j", "<cmd>lprev<CR>zz")

vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])
vim.keymap.set("n", "<leader>x", "<cmd>!chmod +x %<CR>", { silent = true })

-- Y yank until the end of line
vim.keymap.set("n", "Y", "y$", {})

-- text spelling <leader>ss toggles spellcheck
vim.keymap.set("n", "<leader>ss", ":setlocal spell!<cr>", {})
vim.keymap.set("n", "<leader>sn", "]s", {})
vim.keymap.set("n", "<leader>sp", "[s", {})
vim.keymap.set("n", "<leader>sa", "zg", {})
vim.keymap.set("n", "<leader>s?", "z=", {})

-- navigate buffers
vim.keymap.set("n", "<C-h>", "<C-w>h", {}) -- window left
vim.keymap.set("n", "<C-l>", "<C-w>l", {}) -- window right
vim.keymap.set("n", "<C-j>", "<C-w>j", {}) -- window down
vim.keymap.set("n", "<C-k>", "<C-w>k", {}) -- window up

-- split screen
vim.keymap.set("n", "<C-J>", "<C-W><C-J>", {})
vim.keymap.set("n", "<C-K>", "<C-W><C-K>", {})
vim.keymap.set("n", "<C-L>", "<C-W><C-L>", {})
vim.keymap.set("n", "<C-H>", "<C-W><C-H>", {})
vim.keymap.set("n", "<leader>o", ":split :enew<cr>", {})  -- new window right
vim.keymap.set("n", "<leader>e", ":vsplit :enew<cr>", {}) -- new window below

-- vim.keymap.set("n", "<leader><leader>", function()
--     vim.cmd("so")
-- end)
-------------------------------------------------
-- local M = {}
-- M.setup = function()
--     local opts = { noremap = true, silent = true }
--     local keymap = vim.api.nvim_set_keymap
--       -- NORMAL mode mappings
--     local normal_maps = {
--         { '<leader>w', ':w<cr>' },
--         { '<leader>q', ':q<cr>' },
--         { '<leader>x', ':xa<cr>' },
--         { '<C-h>', '<C-w>h' },
--         { '<C-j>', '<C-w>j' },
--         { '<C-k>', '<C-w>k' },
--         { '<C-l>', '<C-w>l' },
--         { '<leader>h', ':nohl<cr>' },
--         { '<S-l>', ':bnext<CR>' },
--         { '<S-h>', ':bprevious<CR>' },
--         { '<S-k>', ':lua require("user.keymaps").show_documentation()<CR>' },
--         {"<leader>pv", vim.cmd.Ex},
--     }

--     -- VISUAL mode mappings
--     local visual_maps = {
--         { '<', '<gv' },
--         { '>', '>gv' },
--     }

--     for _, map in ipairs(normal_maps) do
--         keymap('n', map[1], map[2], opts)
--     end

--     for _, map in ipairs(visual_maps) do
--         keymap('v', map[1], map[2], opts)
--     end
-- end
-- M.setup()
-- return M
