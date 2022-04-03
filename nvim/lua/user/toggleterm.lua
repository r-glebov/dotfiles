local Terminal  = require('toggleterm.terminal').Terminal
local tig = Terminal:new({
  cmd = "tig status",
  dir = "git_dir",
  direction = "float",
  float_opts = {
    border = "double",
  },
  on_open = function(term)
    vim.cmd("startinsert!")
    vim.api.nvim_buf_set_keymap(term.bufnr, "n", "q", "<cmd>close<CR>", {noremap = true, silent = true})
  end,
  on_close = function(term)
  end,
})

function _tig_toggle()
  tig:toggle()
end

local lazygit = Terminal:new({
  cmd = "lazygit",
  dir = "git_dir",
  direction = "float",
  float_opts = {
    border = "double",
  },
  on_open = function(term)
    vim.cmd("startinsert!")
    vim.api.nvim_buf_set_keymap(term.bufnr, "n", "q", "<cmd>close<CR>", {noremap = true, silent = true})
  end,
  on_close = function(term)
  end,
})

function _lazygit_toggle()
  lazygit:toggle()
end

vim.api.nvim_set_keymap("n", "<leader>gt", "<cmd>lua _tig_toggle()<CR>", {noremap = true, silent = true})
vim.api.nvim_set_keymap("n", "<leader>gl", "<cmd>lua _lazygit_toggle()<CR>", {noremap = true, silent = true})


require("toggleterm").setup {
  -- size can be a number or function which is passed the current terminal
  -- size = 20 | function(term)
  --   if term.direction == "horizontal" then
  --     return 15
  --   elseif term.direction == "vertical" then
  --     return vim.o.columns * 0.4
  --   end
  -- end,
  open_mapping = [[<c-/>]],
  --on_open = fun(t: Terminal), -- function to run when the terminal opens
  --on_close = fun(t: Terminal), -- function to run when the terminal closes
  hide_numbers = true, -- hide the number column in toggleterm buffers
  shade_filetypes = {},
  shade_terminals = true,
  shading_factor = '1', -- the degree by which to darken to terminal colour, default: 1 for dark backgrounds, 3 for light
  start_in_insert = true,
  insert_mappings = true, -- whether or not the open mapping applies in insert mode
  terminal_mappings = true, -- whether or not the open mapping applies in the opened terminals
  persist_size = true,
  direction = 'float',
  close_on_exit = true, -- close the terminal window when the process exits
  shell = 'fish', -- change the default shell
  -- This field is only relevant if direction is set to 'float'
  float_opts = {
    border = 'curved',
    winblend = 0,
    highlights = {
      border = "Normal",
      background = "Normal",
    },
  },
}
