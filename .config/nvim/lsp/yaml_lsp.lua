-- Resolved by `vim.lsp.enable('yaml_lsp')` in myinit.lua.
-- Global capabilities/on_attach come from the `vim.lsp.config("*", {...})` block,
-- so they are intentionally omitted here.
return {
  cmd = { "/opt/yaml-language-server/bin/yaml-language-server", "--stdio" },
  filetypes = { "yaml", "yaml.docker-compose", "yaml.gitlab" },
  root_markers = { ".git" },
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
          "/ado-pipelines/*.y*l",
          "/pipelines/*.y*l",
          "/azure-pipeline*.y*l",
          "/*.azure*",
          "Azure-Pipelines/**/*.y*l",
          "Pipelines/*.y*l",
        },
      },
    },
  },
}
