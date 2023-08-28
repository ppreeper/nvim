local global_opts = {
    mapleader = " ",
    maplocalleader = " ",
}

local opts = {
    guicursor = "",
    nu = true,
    relativenumber = true,
    colorcolumn = "80",
    tabstop = 4,
    softtabstop = 4,
    shiftwidth = 4,
    expandtab = true,
    smartindent = true,
    wrap = false,
    swapfile = false,
    backup = false,
    undodir = os.getenv("HOME") .. "/.cache/undodir",
    undofile = true,
    hlsearch = false,
    incsearch = true,
    termguicolors = true,
    scrolloff = 8,
    signcolumn = "yes",
    updatetime = 50,
}

-- vim.opt.isfname:append("@-@")

for k, v in pairs(global_opts) do
    vim.g[k] = v
end

for k, v in pairs(opts) do
    vim.opt[k] = v
end
