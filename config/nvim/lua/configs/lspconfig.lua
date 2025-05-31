require("nvchad.configs.lspconfig").defaults()

local servers = { "html", "cssls", "tsserver", "clangd", "zls", "rust_analyzer", "gopls" }
vim.lsp.enable(servers)

-- read :h vim.lsp.config for changing options of lsp servers
