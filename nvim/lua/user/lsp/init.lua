local status_ok, _ = pcall(require, "lspconfig")
if not status_ok then
  return
end

-- -- require "user.lsp.lsp-installer"
-- require("mason").setup {
--     ui = {
--         icons = {
--             package_installed = "✓"
--         }
--     }
-- }
-- require("mason-lspconfig").setup {
--     --ensure_installed = { "sumneko_lua" },
--
-- }
-- require("mason-lspconfig").setup_handlers {
--     -- The first entry (without a key) will be the default handler
--     -- and will be called for each installed server that doesn't have
--     -- a dedicated handler.
--     function (server_name) -- default handler (optional)
--         require("lspconfig")[server_name].setup {}
--     end,
--     -- Next, you can provide a dedicated handler for specific servers.
--     -- For example, a handler override for the `rust_analyzer`:
--     -- ["rust_analyzer"] = function ()
--     --     require("rust-tools").setup {}
--     -- end
-- }
-- -- old lsp handlers setup
-- --require("user.lsp.handlers").setup()
-- require "user.lsp.null-ls"
--
local status_ok, _ = pcall(require, "lspconfig")
if not status_ok then
  return
end

require("mason").setup {
    ui = {
        icons = {
            package_installed = "✓"
        }
    }
}

require("mason-lspconfig").setup {
    --ensure_installed = { "sumneko_lua" }, -- Uncomment if you want specific LSP servers installed
    handlers = {
        -- Default handler for all installed servers
        function(server_name)
            require("lspconfig")[server_name].setup {}
        end,
        -- Optional: Add specific handlers for certain servers
        -- Example for rust_analyzer:
        -- ["rust_analyzer"] = function()
        --     require("rust-tools").setup {}
        -- end
    }
}

require "user.lsp.null-ls"


local function setup_buffer_keymaps(bufnr)
  -- See `:help vim.lsp.*` for documentation on any of the below functions
  local opts = { noremap = true, silent = true }
  vim.api.nvim_buf_set_keymap(bufnr, "n", "gD", "<cmd>lua vim.lsp.buf.declaration()<CR>", opts)
  vim.api.nvim_buf_set_keymap(bufnr, "n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>", opts)
  vim.api.nvim_buf_set_keymap(bufnr, "n", "K", "<cmd>lua vim.lsp.buf.hover()<CR>", opts)
  vim.api.nvim_buf_set_keymap(bufnr, "n", "gi", "<cmd>lua vim.lsp.buf.implementation()<CR>", opts)
  vim.api.nvim_buf_set_keymap(bufnr, "n", "gk", "<cmd>lua vim.lsp.buf.signature_help()<CR>", opts)
  -- vim.api.nvim_buf_set_keymap(bufnr, "n", "<leader>rn", "<cmd>lua vim.lsp.buf.rename()<CR>", opts)
  vim.api.nvim_buf_set_keymap(bufnr, "n", "gr", "<cmd>lua vim.lsp.buf.references()<CR>", opts)
  -- vim.api.nvim_buf_set_keymap(bufnr, "n", "<leader>ca", "<cmd>lua vim.lsp.buf.code_action()<CR>", opts)
  -- vim.api.nvim_buf_set_keymap(bufnr, "n", "<leader>f", "<cmd>lua vim.diagnostic.open_float()<CR>", opts)
  vim.api.nvim_buf_set_keymap(bufnr, "n", "[d", '<cmd>lua vim.diagnostic.goto_prev({ border = "rounded" })<CR>', opts)
  vim.api.nvim_buf_set_keymap(
    bufnr,
    "n",
    "gl",
    -- '<cmd>lua vim.lsp.diagnostic.show_line_diagnostics({ border = "rounded" })<CR>',
    '<cmd>lua vim.diagnostic.open_float(0, {scope="line"})<CR>',
    opts
  )
  vim.api.nvim_buf_set_keymap(bufnr, "n", "]d", '<cmd>lua vim.diagnostic.goto_next({ border = "rounded" })<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, "n", "<leader>q", "<cmd>lua vim.diagnostic.setloclist()<CR>", opts)
  vim.cmd [[ command! Format execute 'lua vim.lsp.buf.formatting()' ]]
end

vim.api.nvim_create_autocmd("LspAttach", {
  callback = function(args)
    local bufnr = args.buf
    setup_buffer_keymaps(bufnr)
  end,
})

-- VIRTUAL TEXT ---
-- Disable virtual text by setting to false
vim.diagnostic.config({
  virtual_text = true,
})

