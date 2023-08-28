require('telescope').setup({
    pickers = {
        find_files = {
            follow = true,
        },
        live_grep = {
            additional_args = {
                "--follow",
            },
        },

    },

})
-- Enable telescope fzf native, if installed
pcall(require('telescope').load_extension, 'fzf')

local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>ff', builtin.find_files, { desc = '[F]ind [F]iles' })
vim.keymap.set("n", "<leader>fg", builtin.live_grep, { desc = '[F]ind by [G]rep' })
vim.keymap.set("n", "<leader>fb", builtin.buffers, { desc = '[F]ind [B]uffer' })
vim.keymap.set("n", "<leader>fh", builtin.help_tags, { desc = '[F]ind [H]elp' })
-- vim.keymap.set('n', '<leader>sd', builtin.diagnostics, { desc = '[S]earch [D]iagnostics' })
-- vim.keymap.set('n', '<leader>gf', builtin.git_files, { desc = 'Search [G]it [F]iles' })
-- vim.keymap.set('n', '<leader>/', function()
-- 	builtin.grep_string({ search = vim.fn.input("Grep > ") })
-- end, {})
-- vim.keymap.set('n', '<leader>sw', require('telescope.builtin').grep_string, { desc = '[S]earch current [W]ord' })
