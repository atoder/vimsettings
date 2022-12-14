vim.cmd [[
try
  colorscheme darkplus
  " colorscheme artesanal
  " colorscheme mirror
  " colorscheme rigel
  " colorscheme nordfox
  " colorscheme carbonfox
  " colorscheme embark
  " colorscheme nightfox
  " colorscheme duskfox
  " colorscheme humanoid
  " colorscheme darker
  " colorscheme enfocado
  " light scheme
  " colorscheme dayfox
  " colorscheme duskfox
  " colorscheme forestbones
catch /^Vim\%((\a\+)\)\=:E185/
  colorscheme default
  set background=dark
endtry
]]


