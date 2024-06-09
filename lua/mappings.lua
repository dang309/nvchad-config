local wk = require "which-key"
local map = vim.keymap.set

map("n", "<C-s>", "<cmd>w<CR>", { desc = "file save" })

map("n", "<Esc>", "<cmd>noh<CR>", { desc = "general clear highlights" })

map("n", "<C-h>", "<C-w>h", { desc = "switch window left" })
map("n", "<C-l>", "<C-w>l", { desc = "switch window right" })
map("n", "<C-j>", "<C-w>j", { desc = "switch window down" })
map("n", "<C-k>", "<C-w>k", { desc = "switch window up" })

map("n", "<tab>", function()
  require("nvchad.tabufline").next()
end, { desc = "buffer goto next" })

map("n", "<S-tab>", function()
  require("nvchad.tabufline").prev()
end, { desc = "buffer goto prev" })

map("n", "<leader>/", function()
  require("Comment.api").toggle.linewise.current()
end, { desc = "comment" })

-- terminal
map("t", "<C-x>", "<C-\\><C-N>", { desc = "terminal escape terminal mode" })

-- new terminals
map("n", "<leader>h", function()
  require("nvchad.term").new { pos = "sp" }
end, { desc = "terminal new horizontal term" })

map("n", "<leader>v", function()
  require("nvchad.term").new { pos = "vsp" }
end, { desc = "terminal new vertical window" })

map({ "n", "i", "s" }, "<c-f>", function()
  if not require("noice.lsp").scroll(4) then
    return "<c-f>"
  end
end, { silent = true, expr = true })

map({ "n", "i", "s" }, "<c-b>", function()
  if not require("noice.lsp").scroll(-4) then
    return "<c-b>"
  end
end, { silent = true, expr = true })

wk.register({
  q = { "<cmd>q<cr>", "Quit" },
  e = { "<cmd>NvimTreeToggle<cr>", "Explorer" },
  ["<leader>"] = { "<cmd>Telescope oldfiles<CR>", "Recent files" },
  c = {
    function()
      require("nvchad.tabufline").close_buffer()
    end,
    "Close buffer",
  },
  f = {
    name = "Telescope",
    b = { "<cmd>Telescope buffers<CR>", "telescope buffers" },
    h = { "<cmd>Telescope help_tags<CR>", "telescope help page" },
    m = { "<cmd>Telescope marks<CR>", "telescope find marks" },
    f = { "<cmd>Telescope find_files<CR>", "telescope find_files" },
    a = { "<cmd>Telescope find_files follow=true no_ignore=true hidden=true<CR>", "telescope find all files" },
  },
  s = {
    name = "Search",
    g = { "<cmd>Telescope live_grep<CR>", "Global search" },
  },
  l = {
    name = "LSP",
    f = {
      function()
        vim.lsp.buf.format()
      end,
      "format files",
    },
    a = {
      function()
        vim.lsp.buf.code_action()
      end,
      "code action",
    },
  },
}, { prefix = "<leader>" })
