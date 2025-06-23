local status_ok, nvim_tree = pcall(require, "nvim-tree")
if not status_ok then
  print("Failed to load nvim-tree")
  return
end

local function on_attach(bufnr)
  local api = require('nvim-tree.api')
  api.config.mappings.default_on_attach(bufnr)
  vim.keymap.set('n', 'l', api.node.open.edit, { buffer = bufnr, noremap = true, silent = true, nowait = true })
  vim.keymap.set('n', '<CR>', api.node.open.edit, { buffer = bufnr, noremap = true, silent = true, nowait = true })
  vim.keymap.set('n', 'o', api.node.open.edit, { buffer = bufnr, noremap = true, silent = true, nowait = true })
  vim.keymap.set('n', 'h', api.node.navigate.parent_close, { buffer = bufnr, noremap = true, silent = true, nowait = true })
  vim.keymap.set('n', 'v', api.node.open.vertical, { buffer = bufnr, noremap = true, silent = true, nowait = true })
end

nvim_tree.setup {
  on_attach = on_attach,
  disable_netrw = true,
  hijack_netrw = true,
  open_on_tab = false,
  hijack_cursor = false,
  update_cwd = true,
  diagnostics = {
    enable = true,
    icons = {
      hint = "",
      info = "",
      warning = "",
      error = "",
    },
  },
  update_focused_file = {
    enable = true,
    update_cwd = true,
    ignore_list = {},
  },
  system_open = {
    cmd = nil,
    args = {},
  },
  filters = {
    dotfiles = false,
    custom = {},
  },
  git = {
    enable = true,
    ignore = true,
    timeout = 500,
  },
  view = {
    width = 30,
    side = "left",
    number = false,
    relativenumber = false,
  },
  trash = {
    cmd = "trash",
    require_confirm = true,
  },
  actions = {
    open_file = {
      resize_window = true,
      quit_on_open = false,
    }
  },
  renderer = {
    icons = {
      glyphs = {
        default = "",
        symlink = "",
        folder = {
          default = "",
          open = "",
          empty = "",
          empty_open = "",
          symlink = "",
        },
        git = {
          unstaged = "",
          staged = "S",
          unmerged = "",
          renamed = "➜",
          deleted = "",
          untracked = "U",
          ignored = "◌",
        },
      },
    },
  },
}
