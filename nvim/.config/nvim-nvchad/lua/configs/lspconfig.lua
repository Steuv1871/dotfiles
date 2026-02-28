require("nvchad.configs.lspconfig").defaults()

local servers = { "ruff", "lua-language-server", "bash-language-server" }
vim.lsp.enable(servers)

-- to configure lsps further read :h vim.lsp.config
