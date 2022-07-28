let $RTP=split(&runtimepath, ',')[0]
let $RC=$MYVIMRC

" File Handling {{{

autocmd FocusGained,BufEnter,CursorHold,CursorHoldI * if mode() != 'c' | checktime | endif
" notification after file change
autocmd FileChangedShellPost *
\ echohl WarningMsg | echo "File changed on disk. Buffer reloaded." | echohl None

" Save automatically all the time
augroup auto_save
  autocmd!
  " Frequently save automatically
  autocmd BufLeave,FocusLost,InsertLeave,TextChanged * silent! wall
  " Check for file changes
  autocmd BufEnter,BufWinEnter,CursorHold,FocusGained * silent! checktime
augroup END


" }}}

call plug#begin(stdpath('data') . '/plugged')
  Plug 'nvim-lua/plenary.nvim'
  Plug 'nvim-lua/popup.nvim'
  Plug 'ojroques/vim-oscyank'
  Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
  Plug 'mfussenegger/nvim-ts-hint-textobject'
  Plug 'kyazdani42/nvim-web-devicons' " for file icons
  Plug 'kyazdani42/nvim-tree.lua'
  Plug 'kevinhwang91/nvim-bqf'
  Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
  Plug 'junegunn/fzf.vim'
  Plug 'nvim-telescope/telescope.nvim'
  " LSP
  Plug 'neovim/nvim-lspconfig'
  Plug 'folke/lua-dev.nvim'
  Plug 'williamboman/nvim-lsp-installer'

  " Colorscheme
  Plug 'folke/tokyonight.nvim', { 'branch': 'main' }
  Plug 'NTBBloodbath/doom-one.nvim'
  Plug 'catppuccin/nvim', {'as': 'catppuccin'}
  
  " Autocomplete
  Plug 'hrsh7th/cmp-nvim-lsp'
  Plug 'hrsh7th/cmp-nvim-lua'
  Plug 'hrsh7th/cmp-buffer'
  Plug 'hrsh7th/nvim-cmp'
  Plug 'saadparwaiz1/cmp_luasnip'

  " GIT
  Plug 'lewis6991/gitsigns.nvim'
  Plug 'TimUntersberger/neogit'
  Plug 'sindrets/diffview.nvim'
  Plug 'tpope/vim-fugitive'
  " Undo
  Plug 'mbbill/undotree'
  " Database
  Plug 'tpope/vim-dadbod'
  Plug 'kristijanhusak/vim-dadbod-ui'
  " Status Line
  Plug 'hoob3rt/lualine.nvim'
  " Testing
  Plug 'vim-test/vim-test'
  Plug 'ThePrimeagen/harpoon'
  " Utilities
  Plug 'phaazon/hop.nvim'
  Plug 'lukas-reineke/indent-blankline.nvim'
  Plug 'folke/trouble.nvim'
  Plug 'ThePrimeagen/git-worktree.nvim'
  Plug 'AndrewRadev/splitjoin.vim'
  Plug 'AndrewRadev/sideways.vim'
  Plug 'AndrewRadev/switch.vim'
  Plug 'AndrewRadev/tagalong.vim'
  Plug 'andymass/vim-matchup'
  Plug 'tpope/vim-projectionist'
  Plug 'ray-x/guihua.lua'  "lua GUI lib
  Plug 'ray-x/sad.nvim'
  Plug 'nvim-neorg/neorg'
  Plug 'tami5/sqlite.lua'
  Plug 'AckslD/nvim-neoclip.lua'
  Plug 'natecraddock/telescope-zf-native.nvim'

  "Plug 'sidebar-nvim/sidebar.nvim'
  Plug 'numToStr/Comment.nvim'
  Plug 'akinsho/toggleterm.nvim'

  " Debugging
  Plug 'mfussenegger/nvim-dap'

  " Snippets
  Plug 'L3MON4D3/LuaSnip'
  Plug 'rafamadriz/friendly-snippets'
call plug#end()

lua <<EOF
  require("user.options")
  require("user.autocommands")
  require("user.keymaps")
  require("user.treesitter")
  require("user.lsp")
  require("user.cmp")
  require("user.gitsigns")
  require("user.nvim-tree")
  require("user.neorg")
  require("user.lualine")
  require("user.telescope")
  require("user.neogit")
  require("user.colorscheme")
  require("user.toggleterm")
  require("user.neoclip")
  
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

" Ripgrep instead of vimgrep search
" if executable('rg')
"   set grepprg=rg\ --no-heading\ --vimgrep
"   set grepformat=%f:%l:%c:%m
" endif

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
    "nmap K :HopLineStartBC<CR>
    "down
    nmap J :HopLineStartAC<CR>
    "left
    "nmap H :HopWordCurrentLineBC<CR>
    "right
    "nmap L :HopWordCurrentLineAC<CR>
    "char anywhere
    "nmap f :HopChar1<CR>
    "pattern anywhere
    "nmap s :HopPattern<CR>
    " Line
    nmap F <cmd>HopLine<CR>
"visual
    "up
    vmap K <cmd>HopLineStartBC<CR>
    "down
    vmap J <cmd>HopLineStartAC<CR>
    "left
    "vmap H <cmd>HopWordCurrentLineBC<CR>
    "right
    "vmap L <cmd>HopWordCurrentLineAC<CR>
    "char anywhere
    "vmap f <cmd>HopChar1<CR>
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

" Move up/down
"vnoremap J :m '>+1<CR>gv=gv
"vnoremap K :m '<-2<CR>gv=gv

" SplitJoin
nmap sj :SplitjoinSplit<cr>
nmap sk :SplitjoinJoin<cr>

" Alternative ESC
noremap! kj <esc>

" vim-fugitive

nmap gb :Git blame<CR>
