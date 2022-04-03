  require'nvim-tree'.setup {
    view = {
      -- width of the window, can be either a number (columns) or a string in `%`, for left or right side placement
      width = 50,
      -- side of the tree, can be one of 'left' | 'right' | 'top' | 'bottom'
      side = 'right',
      -- if true the tree will resize itself after opening a file
      auto_resize = true,
    }
  }
