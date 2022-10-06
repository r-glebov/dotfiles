-- Shorten function name
local keymap = vim.keymap.set
-- Silent keymap option
local opts = { silent = true }

--Remap space as leader key
keymap("", "<Space>", "<Nop>", opts)
vim.g.mapleader = " "

-- Modes
--   normal_mode = "n",
--   insert_mode = "i",
--   visual_mode = "v",
--   visual_block_mode = "x",
--   term_mode = "t",
--   command_mode = "c",


-- Nvim Tree
keymap("n", "<C-n>", ":NvimTreeToggle<cr>")
keymap("n", "<leader>r", ":NvimTreeRefresh<cr>")
keymap("n", "<leader>n", ":NvimTreeFindFile<cr>")

-- Quickfix
keymap("n", "<C-j>", ":cnext<CR>")
keymap("n", "<C-k>", ":cprev<CR>")

-- Telescope
keymap("n", "<leader>ff", ":Telescope find_files<cr>")
keymap("n", "<leader>fl", ":Telescope live_grep<cr>")
keymap("n", "<leader>fg", ":Telescope grep_string<cr>")
keymap("n", "<leader>fo", ":Telescope oldfiles<cr>")
keymap("n", "<leader>fj", ":Telescope jumplist<cr>")
keymap("n", "<leader>fb", ":Telescope buffers<cr>")
keymap("n", "<leader>fh", ":Telescope help_tags<cr>")
keymap("n", "<leader>fr", ":Telescope resume<cr>")
keymap("n", "<leader>fs", ":Telescope git_status<cr>")

-- Hop
keymap('n', 'f', "<cmd>lua require'hop'.hint_words()<cr>", {})
keymap('v', 'f', "<cmd>lua require'hop'.hint_words()<cr>", {})
-- normal
    -- up
    keymap("n", "K", ":HopLineStartBC<CR>")
    -- down
    keymap("n", "J", ":HopLineStartAC<CR>")
    -- Line
    keymap("n", "F", ":HopLine<CR>")
-- visual
    -- up
    keymap("v", "K", ":HopLineStartBC<CR>")
    -- down
    keymap("v", "J", ":HopLineStartAC<CR>")
    -- Line
    keymap("v", "F", ":HopLine<CR>")


-- Navigate properly when lines are wrapped
-- keymap("n", "i", "gi")
-- keymap("n", "k", "gk")


-- Copy until the end
keymap("n", "Y", "yg$")

-- Have it all centered
keymap("n", "n", "nzzzv")
keymap("n", "N", "Nzzzv")

-- Vim Fugitive
keymap("n", "gb", ":Git blame<CR>")

-- Vim-test
keymap("n", "t<C-n>", ":TestNearest<cr>")
keymap("n", "t<C-f>", ":TestFile<cr>")
keymap("n", "t<C-s>", ":TestSuite<cr>")
keymap("n", "t<C-l>", ":TestLast<cr>")
keymap("n", "t<C-g>", ":TestVisit<cr>")

vim.g['test#ruby#use_binstubs'] = 0
vim.g['test#strategy'] = {
  nearest = 'harpoon',
  file = 'harpoon',
  suite = 'harpoon'
}
vim.g['test#neovim#term_position'] = "vert"

-- Map exit terminal mode to C-o
keymap("t", "<C-o>", "<C-\\><C-n>")


-- Harpoon
keymap("n", "<leader>a", ":lua require('harpoon.mark').add_file()<CR>")
keymap("n", "<leader>gh", ":lua require('harpoon.ui').toggle_quick_menu()<CR>")
keymap("n", "<leader>gch", ":lua require('harpoon.cmd-ui').toggle_quick_menu()<CR>")

keymap("n", "<leader>jf", ":lua require('harpoon.ui').nav_file(1)<CR>")
keymap("n", "<leader>jd", ":lua require('harpoon.ui').nav_file(2)<CR>")
keymap("n", "<leader>js", ":lua require('harpoon.ui').nav_file(3)<CR>")
keymap("n", "<leader>ja", ":lua require('harpoon.ui').nav_file(4)<CR>")
keymap("n", "<leader>tf", ":lua require('harpoon.term').gotoTerminal(1)<CR>")
keymap("n", "<leader>td", ":lua require('harpoon.term').gotoTerminal(2)<CR>")

-- Have it all centered
keymap("n", "n", "nzzzv")
keymap("n", "N", "Nzzzv")

-- Vim-Fugitive
keymap("n", "gb", "Git blame<CR>")

-- Trouble
keymap("n", "<leader>xx", "<CMD>TroubleToggle<CR>")
keymap("n", "<leader>xw", "<CMD>TroubleToggle lsp_workspace_diagnostics<CR>")
keymap("n", "<leader>xd", "<CMD>TroubleToggle lsp_document_diagnostics<CR>")
keymap("n", "<leader>xq", "<CMD>TroubleToggle quickfix<CR>")
keymap("n", "<leader>xl", "<CMD>TroubleToggle loclist<CR>")
--keymap("n", "gR", "<CMD>TroubleToggle lsp_references<CR>")

-- Sideways 
keymap("n", "<c-h>", "<CMD>SidewaysLeftCR>")
keymap("n", "<c-l>", "<CMD>SidewaysRight<CR>")

-- SplitJoin
keymap("n", "sj", "<CMD>SplitjoinSplit<CR>")
keymap("n", "sk", "<CMD>SplitjoinJoin<CR>")


-- Alternative ESC
keymap("n", "kk", "<esc>")
--noremap! kj <esc>

-- Copy current buffer path to clipboard
keymap("n", "<leader>c", "<CMD>let @+=expand('%:p')<CR>")

