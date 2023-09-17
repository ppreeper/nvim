require("formatter").setup({
    logging = false,
    filetype = {
        ['*'] = {
            require("formatter.filetypes.any").remove_trailing_whitespace
        },
        go = {
            function()
                return {
                    exe = "goimports",
                    args = { "-w" },
                    stdin = false
                }
            end,
            function()
                return {
                    exe = "gofumpt",
                    args = { "-w" },
                    stdin = false
                }
            end
        },
        python = {
            function()
                return {
                    exe = "isort",
                    args = { "-q", "-" },
                    stdin = true,
                }
            end,
            function()
                return {
                    exe = "black",
                    args = { "-q", "-" },
                    stdin = true,
                }
            end
        },
        xml = {
            function()
                return {
                    exe = "xmlformat",
                    args = { "--overwrite" },
                    stdin = false,
                }
            end
        }
    }
})
