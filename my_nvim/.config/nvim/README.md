# Neovim Configuration

This directory contains a minimal Neovim setup managed by `lazy.nvim`.

## Structure

- `init.lua` – bootstrap lazy.nvim and load core modules
- `lua/options.lua` – global editor options
- `lua/keymaps.lua` – custom key mappings
- `lua/plugins.lua` – plugin specifications for lazy.nvim
- `lua/plugin_config/` – per‑plugin configuration modules
- `lua/plugin_config/lspconfig.lua` – LSP client configuration (migrated to new API)

## LSP Migration Notes

Neovim 0.11+ introduces `vim.lsp.config` / `vim.lsp.enable` which deprecates the legacy:

```lua
require('lspconfig').<server>.setup{ ... }
```

Current `lspconfig.lua` uses feature detection:

```lua
if vim.lsp and vim.lsp.config and vim.lsp.enable then
  vim.lsp.config('lua_ls', {...})
  vim.lsp.enable('lua_ls')
  -- repeats for other servers
else
  -- legacy fallback
  require('lspconfig').lua_ls.setup{...}
end
```

### When Can You Remove the Fallback?

Once you are certain all environments running this config use **Neovim ≥ 0.11** (and a recent `nvim-lspconfig`), you can safely delete the entire `else` branch. (Suggestion point 2 from follow‑ups.) This simplifies the file and avoids loading the deprecated `require('lspconfig')` framework.

### Minimal Steps To Drop Fallback
1. Verify `:echo has('nvim-0.11')` returns `1` on every target machine.
2. Update Neovim if needed (e.g. via Homebrew: `brew upgrade neovim`).
3. Remove the legacy block and keep only the new API calls.
4. Restart Neovim and run `:checkhealth vim.lsp` to confirm no warnings.

## Updating / Adding Servers

Using new API:

```lua
vim.lsp.config('pyright', {})
vim.lsp.enable('pyright')
```

For more advanced per‑server overrides, you can create `lsp/<server>.lua` files somewhere on your `runtimepath` and Neovim will merge them automatically.

## Diagnostics Configuration

Diagnostics are customized in `lspconfig.lua` via:

```lua
vim.diagnostic.config({
  virtual_text = true,
  signs = false,
  float = { border = 'rounded' },
})
```

Adjust these to taste.

## Quick Commands

- `:LspInfo` / `:checkhealth vim.lsp` – Status of LSP configs
- `:LspStart <name>` – Manually start a server
- `:LspStop` / `:LspRestart` – Manage running clients

---
Feel free to extend this README as the setup grows.
