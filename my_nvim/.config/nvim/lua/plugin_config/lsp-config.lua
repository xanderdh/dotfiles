local lspconfig = require "lspconfig"
local servers = { "lua_ls", "html", "cssls", "ts_ls", "jdtls", "yamlls" }

-- lsps with default config
for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup({})
end
