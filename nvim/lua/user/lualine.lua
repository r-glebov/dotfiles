require('lualine').setup {
  options = {
   theme = 'catppuccin'
  },
  extensions = {'nvim-tree', 'quickfix'},
  sections = {
    lualine_a = {"mode"},
    lualine_b = {"branch", "diff"},
    lualine_c = {
      {
        'filename',
        path = 3
      },
    },
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
