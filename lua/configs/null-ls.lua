local null_ls = require("null-ls")

-- register any number of sources simultaneously
local sources = {
  null_ls.builtins.formatting.prettier.with({
    filetypes = { "html", "json", "yaml", "markdown", 'jsx', 'tsx', 'css', 'scss' }
  }),
  null_ls.builtins.diagnostics.eslint_d,
  null_ls.builtins.code_actions.eslint_d,
}

null_ls.setup({ sources = sources })
