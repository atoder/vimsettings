vim.cmd [[
  augroup _general_settings
    autocmd!
    autocmd FileType qf,help,man,lspinfo nnoremap <silent> <buffer> q :close<CR>
    autocmd TextYankPost * silent!lua require('vim.highlight').on_yank({higroup = 'Visual', timeout = 200})
    autocmd BufWinEnter * :set formatoptions-=cro
    autocmd FileType qf set nobuflisted
  augroup end

  augroup _git
    autocmd!
    autocmd FileType gitcommit setlocal wrap
    autocmd FileType gitcommit setlocal spell
  augroup end

  augroup _markdown
    autocmd!
    autocmd FileType markdown setlocal wrap
    autocmd FileType markdown setlocal spell
  augroup end

  augroup _auto_resize
    autocmd!
    autocmd VimResized * tabdo wincmd =
  augroup end

  augroup _alpha
    autocmd!
    autocmd User AlphaReady set showtabline=0 | autocmd BufUnload <buffer> set showtabline=2
  augroup end

  augroup _filetypes
    autocmd Filetype html setlocal ts=2 sts=2 sw=2 expandtab
    autocmd Filetype ruby setlocal ts=2 sts=2 sw=2 expandtab
    autocmd Filetype php setlocal ts=4 sts=4 sw=4 expandtab
    autocmd Filetype javascript setlocal ts=2 sts=2 sw=2 expandtab
    autocmd Filetype c setlocal ts=4 sts=4 sw=4 expandtab
    autocmd Filetype cpp setlocal ts=4 sts=4 sw=4 expandtab
  augroup end

]]
-- Automatically run RooterToggle
vim.cmd [[
  autocmd VimEnter * RooterToggle
]]

  -- Automatically load a random colorscheme
vim.cmd [[
  autocmd VimEnter * RandomColorScheme
]]



-- Autoformat
-- augroup _lsp
--   autocmd!
--   autocmd BufWritePre * lua vim.lsp.buf.formatting()
-- augroup end
