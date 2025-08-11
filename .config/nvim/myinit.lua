-- disable netrw at the very start of your init.lua
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1
-- set termguicolors to enable highlight groups
-- vim.opt.termguicolors = true
-- configure nvim-tree to still allow other netrw features
-- nvim-tree.disable_netrw = false
-- nvim-tree.hijack_netrw = true
-- empty setup using defaults
require("nvim-tree").setup()
require('lualine').setup()



-- config for completion ---
local cmp = require'cmp'

  cmp.setup({
    snippet = {
      -- REQUIRED - you must specify a snippet engine
      expand = function(args)
        -- vim.fn["vsnip#anonymous"](args.body) -- For `vsnip` users.
        require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
        -- require('snippy').expand_snippet(args.body) -- For `snippy` users.
        -- vim.fn["UltiSnips#Anon"](args.body) -- For `ultisnips` users.
      end,
    },
    window = {
      -- completion = cmp.config.window.bordered(),
      -- documentation = cmp.config.window.bordered(),
    },
    mapping = cmp.mapping.preset.insert({
      -- Navigate completion menu
      ["<C-j>"] = cmp.mapping(function(fallback)
        if cmp.visible() then
          cmp.select_next_item()
        elseif luasnip.expand_or_jumpable() then
          luasnip.expand_or_jump()
        else
          fallback()
        end
      end, { "i", "s" }),
    
      ["<C-k>"] = cmp.mapping(function(fallback)
        if cmp.visible() then
          cmp.select_prev_item()
        elseif luasnip.jumpable(-1) then
          luasnip.jump(-1)
        else
          fallback()
        end
      end, { "i", "s" }),
      ['<C-b>'] = cmp.mapping.scroll_docs(-4),
      ['<C-f>'] = cmp.mapping.scroll_docs(4),
      ['<C-Space>'] = cmp.mapping.complete(),
      ['<C-e>'] = cmp.mapping.abort(),
      ['<CR>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
    }),
    sources = cmp.config.sources({
      { name = 'nvim_lsp' },
      { name = 'vsnip' }, -- For vsnip users.
      { name = 'luasnip' }, -- For luasnip users.
      -- { name = 'ultisnips' }, -- For ultisnips users.
      -- { name = 'snippy' }, -- For snippy users.
    }, {
      { name = 'buffer' },
    })
  })

  -- Set configuration for specific filetype.
  cmp.setup.filetype('gitcommit', {
    sources = cmp.config.sources({
      { name = 'git' }, -- You can specify the `git` source if [you were installed it](https://github.com/petertriho/cmp-git).
    }, {
      { name = 'buffer' },
    })
  })

  -- Use buffer source for `/` and `?` (if you enabled `native_menu`, this won't work anymore).
  cmp.setup.cmdline({ '/', '?' }, {
    mapping = cmp.mapping.preset.cmdline(),
    sources = {
      { name = 'buffer' }
    }
  })

  -- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
  cmp.setup.cmdline(':', {
    mapping = cmp.mapping.preset.cmdline(),
    sources = cmp.config.sources({
      { name = 'path' }
    }, {
      { name = 'cmdline' }
    })
  })

-- Set up lspconfig.
--
-- This ensures hover, goto, etc. work for all LSPs
local on_attach = function(client, bufnr)
  local opts = { noremap=true, silent=true, buffer=bufnr }
  vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
  vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
end

-- Make diagnostics visible
vim.diagnostic.config({
  virtual_text = true,
  signs = true,
  underline = true,
  update_in_insert = false,
})

  local capabilities = require('cmp_nvim_lsp').default_capabilities()
  -- Replace <YOUR_LSP_SERVER> with each lsp server you've enabled.
  require('lspconfig')['terraformls'].setup {
    capabilities = capabilities
  }
  require('lspconfig')['tflint'].setup{
    capabilities = capabilities
  }
  require('lspconfig')['pylsp'].setup {
    capabilities = capabilities
  }
 -- require('lspconfig')['yamllint'].setup {
 --   capabilities = capabilities
 -- }
  require('lspconfig')['yamlls'].setup {
    capabilities = capabilities,
    cmd = { "/opt/yaml-language-server/bin/yaml-language-server", "--stdio" },
    settings = {
      redhat = { telemetry = { enabled = false } },
      yaml = {
        completion = true,
        validate = true,
        hover = true,
        format = {
          enable = true,
        },
        schemaStore = {
          enable = true,
        },
        schemas = {
          kubernetes = "*.yaml",
          ["https://www.schemastore.org/github-workflow.json"] = ".github/workflows/*",
          ["https://www.schemastore.org/github-action.json"] = ".github/action.{yml,yaml}",
          ["https://raw.githubusercontent.com/ansible/ansible-lint/main/src/ansiblelint/schemas/ansible.json#/$defs/tasks"] = "roles/tasks/*.{yml,yaml}",
          ["https://www.schemastore.org/prettierrc.json"] = ".prettierrc.{yml,yaml}",
          ["https://www.schemastore.org/kustomization.json"] = "kustomization.{yml,yaml}",
          ["https://raw.githubusercontent.com/ansible/ansible-lint/main/src/ansiblelint/schemas/ansible.json#/$defs/playbook"] = "*play*.{yml,yaml}",
          ["https://www.schemastore.org/chart.json"] = "Chart.{yml,yaml}",
          ["https://www.schemastore.org/dependabot-2.0.json"] = ".github/dependabot.{yml,yaml}",
          ["https://gitlab.com/gitlab-org/gitlab/-/raw/master/app/assets/javascripts/editor/schema/ci.json"] = "*gitlab-ci*.{yml,yaml}",
          ["https://raw.githubusercontent.com/compose-spec/compose-spec/master/schema/compose-spec.json"] = "*docker-compose*.{yml,yaml}",
          ["https://raw.githubusercontent.com/argoproj/argo-workflows/master/api/jsonschema/schema.json"] = "*flow*.{yml,yaml}",
          ["https://raw.githubusercontent.com/microsoft/azure-pipelines-vscode/master/service-schema.json"] = {
                  "/azure-pipeline*.y*l",
                  "/*.azure*",
                  "Azure-Pipelines/**/*.y*l",
                  "Pipelines/*.y*l",
            },
          },
        },
      },
    }

--  require('lspconfig')['azure_pipelines_ls'].setup {
--    settings = {
--      yaml = {
--          schemas = {
--              ["https://raw.githubusercontent.com/microsoft/azure-pipelines-vscode/master/service-schema.json"] = {
--                  "/azure-pipeline*.y*l",
--                  "/*.azure*",
--                  "Azure-Pipelines/**/*.y*l",
--                  "Pipelines/*.y*l",
--         },
--        },
--      },
--    },
--  }
-- see this guys code to help make snipits work https://github.com/msharma24/.dotfiles/blob/main/.config/nvim/nvim/lua/config
