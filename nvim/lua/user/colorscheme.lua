vim.cmd [[
try
  colorscheme darkplus
  " colorscheme carbonfox
  " colorscheme humanoid
  " colorscheme earlysummer
  " colorscheme github_dark
  " colorscheme vimbones
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

