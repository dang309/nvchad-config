require "nvchad.options"

-- add yours here!

local o = vim.o
local g = vim.g
-- o.cursorlineopt ='both' -- to enable cursorline!

-- disable netrw at the very start of your init.lua
g.loaded_netrw = 1
g.loaded_netrwPlugin = 1

o.wrap = false
o.nowrap = true
o.textwidth = 0
o.wrapmargin = 0

o.foldcolumn = "1" -- '0' is not bad
o.foldlevel = 99   -- Using ufo provider need a large value, feel free to decrease the value
o.foldlevelstart = 99
o.foldenable = true


