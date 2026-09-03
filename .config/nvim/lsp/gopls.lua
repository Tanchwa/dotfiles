-- Resolved by `vim.lsp.enable('gopls')` in myinit.lua.
-- cmd/filetypes/root_markers come from nvim-lspconfig's shipped defaults;
-- global capabilities/on_attach come from the `vim.lsp.config("*", {...})` block.
return {
  settings = {
    gopls = {
      gofumpt = true,
      analyses = {
        unusedparams = true,
      },
      staticcheck = true,
    },
  },
}
