-- Catch 'y' command and use OSCYankReg to copy stuff
vim.cmd "autocmd TextYankPost * if v:event.operator is 'y' && v:event.regname is '' | execute 'OSCYankReg \"' | endif"

-- Switch line numbers in telescope preview
vim.cmd "autocmd User TelescopePreviewerLoaded setlocal number"
