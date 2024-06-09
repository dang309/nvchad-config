-- EXAMPLE
local on_attach = require("nvchad.configs.lspconfig").on_attach
local on_init = require("nvchad.configs.lspconfig").on_init
local capabilities = require("nvchad.configs.lspconfig").capabilities

local lspconfig = require "lspconfig"
local servers = { "html", "cssls", "tsserver", "emmet_language_server" }

-- lsps with default config
for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup {
    on_attach = on_attach,
    on_init = on_init,
    capabilities = capabilities,
  }
end

local orig_util_open_floating_preview = vim.lsp.util.open_floating_preview
function vim.lsp.util.open_floating_preview(contents, syntax, opts, ...)
  opts = opts or {}
  opts.border = opts.border or 'single'
  opts.max_width = opts.max_width or 64
  opts.max_height = opts.max_height or 64
  opts.wrap_at = opts.wrap_at or 64
  return orig_util_open_floating_preview(contents, syntax, opts, ...)
end

local orig_util_make_floating_popup_options = vim.lsp.util.make_floating_popup_options
function vim.lsp.util.make_floating_popup_options(width, height, opts)
  opts = opts or {}
  opts.offset_x = opts.offset_x or 16
  opts.offset_y = opts.offset_y or 16
  opts.anchor_bias = opts.anchor_bias or 'below'
  return orig_util_make_floating_popup_options(width, height, opts)
end

vim.api.nvim_open_win(0, false,
  {relative='win', row=3, col=3, width=12, height=3})

require("ufo").setup()
