local options = {
  shell = "/bin/zsh",
  number = true,                           -- set numbered lines
  cursorline = true,                       -- highlight the current line
  expandtab = true,                        -- tabs are spaces
  shiftwidth = 2,                          -- the number of spaces inserted for each indentation
  tabstop = 2,                             -- insert 2 spaces for a tab
  softtabstop = 2,
  colorcolumn = "120",
  -- nohlsearch = true,                       -- do not highlight search results
  inccommand = "split",                    -- Live preview for search and replace
  splitright = true,                       -- always open vsplit right
  splitbelow = true,                       -- always open splits below
  scrolloff = 10,                          -- keep at least 10 lines above/below
  sidescrolloff = 5,                       -- keep at least 5 lines right/left
  cmdheight = 2,                           -- Give more space for displaying messages
  undofile = true,                         -- local history, enable persistent undo
  termguicolors = true,                    -- set term gui colors (most terminals support this)
}

for k, v in pairs(options) do
  vim.opt[k] = v
end
