vim.cmd [[
try
  colorscheme darkplus
  " colorscheme sonokai
  " colorscheme kanagawa
  " colorscheme artesanal
  " colorscheme mirror
  " colorscheme rigel
  " colorscheme nordfox
  " colorscheme carbonfox
  " colorscheme embark
  " colorscheme nightfox
  " colorscheme darkfrost
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


