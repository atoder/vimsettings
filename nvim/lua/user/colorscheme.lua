vim.cmd [[
try
  colorscheme darkplus
catch /^Vim\%((\a\+)\)\=:E185/
  colorscheme default
  set background=dark
endtry
]]

-- Load a random colorscheme
vim.cmd [[
  autocmd VimEnter * RandomColorScheme
]]

