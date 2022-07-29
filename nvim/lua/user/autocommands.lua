-- Catch 'y' command and use OSCYankReg to copy stuff
vim.cmd "autocmd TextYankPost * if v:event.operator is 'y' && v:event.regname is '' | execute 'OSCYankReg \"' | endif"

-- Switch line numbers in telescope preview
vim.cmd "autocmd User TelescopePreviewerLoaded setlocal number"

-- File Handling --------------------------------

vim.cmd "autocmd FocusGained,BufEnter,CursorHold,CursorHoldI * if mode() != 'c' | checktime | endif"

-- notification after file change
vim.cmd [[
  autocmd FileChangedShellPost *
  \ echohl WarningMsg | echo "File changed on disk. Buffer reloaded." | echohl None
]]

-- Save automatically all the time
vim.cmd [[
  augroup auto_save
    autocmd!
    " Frequently save automatically
    autocmd BufLeave,FocusLost,InsertLeave,TextChanged * silent! wall
    " Check for file changes
    autocmd BufEnter,BufWinEnter,CursorHold,FocusGained * silent! checktime
  augroup END
]]

--------------------------------------------------

-- Users of packer.nvim have reported that when using treesitter for folds,
-- they sometimes receive an error "No folds found",
-- or that treesitter highlighting does not apply.
-- A workaround for this is to set the folding options in an autocmd:

-- vim.opt.foldmethod     = 'expr'
-- vim.opt.foldexpr       = 'nvim_treesitter#foldexpr()'
---WORKAROUND
vim.api.nvim_create_autocmd({'BufEnter','BufAdd','BufNew','BufNewFile','BufWinEnter'}, {
  group = vim.api.nvim_create_augroup('TS_FOLD_WORKAROUND', {}),
  callback = function()
    vim.opt.foldmethod     = 'expr'
    vim.opt.foldexpr       = 'nvim_treesitter#foldexpr()'
  end
})
---ENDWORKAROUND
