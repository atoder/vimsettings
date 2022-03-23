local opts = { noremap = true, silent = true }

local term_opts = { silent = true }

-- Shorten function name
local keymap = vim.api.nvim_set_keymap

--Remap space as leader key
keymap("", "<Space>", "<Nop>", opts)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Modes
--   normal_mode = "n",
--   insert_mode = "i",
--   visual_mode = "v",
--   visual_block_mode = "x",
--   term_mode = "t",
--   command_mode = "c",

-- Normal --
-- Better window navigation
keymap("n", "<C-h>", "<C-w>h", opts)
keymap("n", "<C-j>", "<C-w>j", opts)
keymap("n", "<C-k>", "<C-w>k", opts)
keymap("n", "<C-l>", "<C-w>l", opts)

-- Resize with arrows
keymap("n", "<C-Up>", ":resize -2<CR>", opts)
keymap("n", "<C-Down>", ":resize +2<CR>", opts)
keymap("n", "<C-Left>", ":vertical resize -2<CR>", opts)
keymap("n", "<C-Right>", ":vertical resize +2<CR>", opts)

-- Navigate buffers
keymap("n", "<S-l>", ":bnext<CR>", opts)
keymap("n", "<S-h>", ":bprevious<CR>", opts)

-- Move text up and down
keymap("n", "<A-j>", "<Esc>:m .+1<CR>==gi", opts)
keymap("n", "<A-k>", "<Esc>:m .-2<CR>==gi", opts)

-- Insert --
-- Press jk fast to enter
keymap("i", "jk", "<ESC>", opts)

-- Visual --
-- Stay in indent mode
keymap("v", "<", "<gv", opts)
keymap("v", ">", ">gv", opts)

-- Move text up and down
-- keymap("v", "<A-j>", ":m .+1<CR>==", opts)
-- keymap("v", "<A-k>", ":m .-2<CR>==", opts)

-- Paste without overwritting buffer
keymap("v", "p", '"_dP', opts)

-- Visual Block --
-- Move text up and down
keymap("x", "J", ":move '>+1<CR>gv-gv", opts)
keymap("x", "K", ":move '<-2<CR>gv-gv", opts)
-- keymap("x", "<A-j>", ":move '>+1<CR>gv-gv", opts)
-- keymap("x", "<A-k>", ":move '<-2<CR>gv-gv", opts)

-- Telescope --
-- Search for the keyword under the cursor using Control + s
keymap("n", "<C-s>", ":lua require(\'telescope.builtin\').grep_string { search = vim.fn.expand(\"<cword>\") }<CR>", opts)

-- If all that is wanted is to display the name of the current file,
-- type Ctrl-G (or press 1 then Ctrl-G for the full path).
--  put full path of current dir into vim file
keymap("n", "<leader><leader>dw", ":r! echo %:p<CR>", opts)

-- format to get rid of dos/windows carriage returns
keymap("n", "<leader><leader>f", ":e ++ff=dos<CR>", opts)

-- " toggle line numbers
keymap("n", "<C-ln>", ":set rnu!<CR>", opts)


-- " Control + C mapping to run :bp | bd #
-- " which moves to previous buffer and closes the buffer we just moved from
-- " this way you can close a buffer and still have a vsplit for example
keymap("n", "<C-c>", ":bp|bd #<CR>", opts)

-- " close all buffers
keymap("n", "<C-a>", ":bufdo bd<CR>", opts)

-- "space space y will copy all the text
keymap("n", "<Leader><Leader>y", ":%y+<CR>", opts)


-- "mapping buffer switching and closing to shortcuts
keymap("n", "bn", ":bn<cr>", opts)
keymap("n", "bp", ":bp<cr>", opts)
keymap("n", "bd", ":bd<cr>", opts)

-- Terminal --
-- Better terminal navigation
-- keymap("t", "<C-h>", "<C-\\><C-N><C-w>h", term_opts)
-- keymap("t", "<C-j>", "<C-\\><C-N><C-w>j", term_opts)
-- keymap("t", "<C-k>", "<C-\\><C-N><C-w>k", term_opts)
-- keymap("t", "<C-l>", "<C-\\><C-N><C-w>l", term_opts)



-- Possible other shortcuts --
--  PLUGIN: FZF - other things you can do below
-- nnoremap <silent> <Leader>b :Buffers<CR>
-- nnoremap <silent> <C-f> :Files<CR>
-- nnoremap <silent> <Leader>f :Rg<CR>
-- nnoremap <silent> <Leader>/ :BLines<CR>
-- nnoremap <silent> <Leader>' :Marks<CR>
-- nnoremap <silent> <Leader>g :Commits<CR>
-- nnoremap <silent> <Leader>H :Helptags<CR>
-- nnoremap <silent> <Leader>hh :History<CR>
-- nnoremap <silent> <Leader>h: :History:<CR>
-- nnoremap <silent> <Leader>h/ :History/<CR>



-- bind shift KK to grep word under cursor
-- Use Rg instead of grep (more advanced)
-- nnoremap KK :Rg <C-R><C-W><CR>

-- " Switch to buffer
-- noremap <leader>b :buffer #<CR>
-- 
-- " Switch working directory to current opened file
-- " Explanation:
-- "":cd change directory Vim command
-- " % - full path to current file
-- " %:h - full path to current file without filename itself.
-- " setting autochdir performs this automatically
-- noremap <leader><leader>cd :cd %:h<CR>
--
-- " Switch back to root directory
-- noremap <leader><leader>bcd :RooterToggle<CR>

-- "If all that is wanted is to display the name of the current file,
-- "type Ctrl-G (or press 1 then Ctrl-G for the full path).
-- " put full path of current dir into vim file
-- noremap <leader><leader>dw :r! echo %:p<CR>
--
-- "format to get rid of dos/windows carriage returns
-- noremap <leader><leader>f :e ++ff=dos<CR>
--
-- "" toggle line numbers
-- noremap <leader><leader>ln :set rnu!<CR>


-- "mapping buffer switching and closing to shortcuts
-- map bn :bn<cr>
-- map bp :bp<cr>
-- map bd :bd<cr>
--
--
-- " Control + C mapping to run :bp | bd #
-- " which moves to previous buffer and closes the buffer we just moved from
-- " this way you can close a buffer and still have a vsplit for example
-- nnoremap <C-c> :bp\|bd #<CR>
-- " close all buffers
-- nnoremap <C-a> :bufdo bd<CR>
--
-- "space space y will copy all the text
-- map <Leader><Leader>y :%y+<CR>
