let $RTP=split(&runtimepath, ',')[0]
let $RC=$MYVIMRC

lua <<EOF
  require("user.plugins")
  require("user.options")
  require("user.autocommands")
  require("user.keymaps")
  --require("user.treesitter")
  require("user.lsp")
  require("user.cmp")
  require("user.gitsigns")
  require("user.nvim-tree")
  require("user.lualine")
  require("user.telescope")
  require("user.colorscheme")
  --require("user.neoclip")
  require("user.alpha")
  --require("user.neorg")
  
  require'hop'.setup { keys = 'etovxqpdygfblzhckisuran' }
  require('Comment').setup()
EOF

" TS Hint Textobject
omap     <silent> m :<C-U>lua require('tsht').nodes()<CR>
vnoremap <silent> m :lua require('tsht').nodes()<CR>

" Nvim Tree
nnoremap <C-n> :NvimTreeToggle<CR>
nnoremap <leader>r :NvimTreeRefresh<CR>
nnoremap <leader>n :NvimTreeFindFile<CR>

" Quickfix
nnoremap <C-j> :cnext<CR> 
nnoremap <C-k> :cprev<CR> 

" Telescope
nnoremap <leader>ff <cmd>Telescope find_files<cr>
nnoremap <leader>fl <cmd>Telescope live_grep<cr>
nnoremap <leader>fg <cmd>Telescope grep_string<cr>
nnoremap <leader>fo <cmd>Telescope oldfiles<cr>
nnoremap <leader>fj <cmd>Telescope jumplist<cr>
nnoremap <leader>fb <cmd>Telescope buffers<cr>
nnoremap <leader>fh <cmd>Telescope help_tags<cr>
nnoremap <leader>fr <cmd>Telescope resume<cr>
nnoremap <leader>fs <cmd>Telescope git_status<cr>

"autocmd User TelescopePreviewerLoaded setlocal number

" Copy current buffer path to clipboard
nnoremap <Leader>c :let @+=expand('%:p')<CR>  

" Vim-test
nmap <silent> t<C-n> :TestNearest<CR>
nmap <silent> t<C-f> :TestFile<CR>
nmap <silent> t<C-s> :TestSuite<CR>
nmap <silent> t<C-l> :TestLast<CR>
nmap <silent> t<C-g> :TestVisit<CR>

let test#ruby#use_binstubs = 0
let test#strategy = {
  \ 'nearest': 'harpoon',
  \ 'file':    'harpoon',
  \ 'suite':   'harpoon',
\}
let test#neovim#term_position = "vert"

" Map exit terminal mode to C-o
if has('nvim')
  tmap <C-o> <C-\><C-n>
endif

" Harpoon
nnoremap <leader>a :lua require("harpoon.mark").add_file()<CR>
nnoremap <leader>gh :lua require("harpoon.ui").toggle_quick_menu()<cr>
nnoremap <leader>gch :lua require("harpoon.cmd-ui").toggle_quick_menu()<CR>

nnoremap <leader>jf :lua require("harpoon.ui").nav_file(1)<CR>
nnoremap <leader>jd :lua require("harpoon.ui").nav_file(2)<CR>
nnoremap <leader>js :lua require("harpoon.ui").nav_file(3)<CR>
nnoremap <leader>ja :lua require("harpoon.ui").nav_file(4)<CR>
nnoremap <leader>tf :lua require("harpoon.term").gotoTerminal(1)<CR>
nnoremap <leader>td :lua require("harpoon.term").gotoTerminal(2)<CR>

" Hop
lua vim.api.nvim_set_keymap('n', 'f', "<cmd>lua require'hop'.hint_words()<cr>", {})
lua vim.api.nvim_set_keymap('v', 'f', "<cmd>lua require'hop'.hint_words()<cr>", {})
"normal
    "up
    nmap K :HopLineStartBC<CR>
    "down
    nmap J :HopLineStartAC<CR>
    " Line
    nmap F <cmd>HopLine<CR>
"visual
    "up
    vmap K <cmd>HopLineStartBC<CR>
    "down
    vmap J <cmd>HopLineStartAC<CR>
    " Line
    vmap F <cmd>HopLine<CR>

" Trouble
nnoremap <leader>xx <cmd>TroubleToggle<cr>
nnoremap <leader>xw <cmd>TroubleToggle lsp_workspace_diagnostics<cr>
nnoremap <leader>xd <cmd>TroubleToggle lsp_document_diagnostics<cr>
nnoremap <leader>xq <cmd>TroubleToggle quickfix<cr>
nnoremap <leader>xl <cmd>TroubleToggle loclist<cr>
nnoremap gR <cmd>TroubleToggle lsp_references<cr>

" Navigate properly when lines are wrapped
nnoremap j gj
nnoremap k gk

" Sideways 
 nnoremap <c-h> :SidewaysLeft<cr>
 nnoremap <c-l> :SidewaysRight<cr>

" Edit/Source init.vim
nnoremap <leader>ev :vsp $MYVIMRC<CR>
nnoremap <leader>sv :source $MYVIMRC <bar> :doautocmd BufRead<CR>

" Change the word for something new and then do the same with occurences by
" dot.
nnoremap cn *``cgn
nnoremap cN *``cgN

" Copy until the end
nnoremap Y yg$

" Have it all centered
nnoremap n nzzzv
nnoremap N Nzzzv

" SplitJoin
nmap sj :SplitjoinSplit<cr>
nmap sk :SplitjoinJoin<cr>

" Alternative ESC
noremap! kj <esc>

" Alternative Enter
noremap! jk <CR>

" vim-fugitive

nmap gb :Git blame<CR>
