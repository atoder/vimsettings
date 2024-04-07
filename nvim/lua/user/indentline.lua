local status_ok, ibl = pcall(require, "ibl")
local hooks = require('ibl.hooks')
if not status_ok then
  return
end

ibl.setup({
  indent = {
    char = "▏",
  },
  exclude = {
    buftypes = { "terminal", "nofile" },
    filetypes = {
      "help",
      "dashboard",
      "packer",
      "NvimTree",
      "Trouble",
      "startify",
      "neogitstatus"
    },
  },
  whitespace = { highlight = { "Whitespace", "NonText" } },
  scope = {
    enabled = true,
    show_start = false,
    show_end = false,
    show_exact_scope = false,
  },
})
hooks.register(hooks.type.WHITESPACE, hooks.builtin.hide_first_space_indent_level)
