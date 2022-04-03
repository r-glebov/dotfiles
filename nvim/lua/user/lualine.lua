require('lualine').setup {
  --options = {
  --  theme = 'catppuccino'
  --},
  --extensions = {'nvim-tree', 'quickfix'},
  sections = {
    lualine_a = {"mode"},
    lualine_b = {"branch", "diff"},
    lualine_c = {"filename"},
    lualine_x = {
      {"diagnostics", sources = {"nvim_lsp"}},
      "encoding",
      "fileformat",
      "filetype"
    },
    lualine_y = {"progress"},
    lualine_z = {"location"},
  }
}
