vim.cmd [[
try
  colorscheme darkplus
  " colorscheme carbonfox
  " colorscheme nightfox
  " colorscheme dayfox
  " colorscheme humanoid
  " colorscheme darker
  " colorscheme enfocado
catch /^Vim\%((\a\+)\)\=:E185/
  colorscheme default
  set background=dark
endtry
]]

-- Load a random colorscheme
vim.cmd [[
  autocmd VimEnter * RandomColorScheme
]]

