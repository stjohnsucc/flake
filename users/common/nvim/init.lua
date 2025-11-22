vim.g.loaded_netrw       = 1
vim.g.loaded_netrwPlugin = 1
require('options')
require('plugins')
require('keymaps')

-- Configure LSP clients

-- Set default root markers for all clients
vim.lsp.config('*', {
  root_markers = { '.git' },
})

-- Set configuration for typescript language server
vim.lsp.config('tex', {
  cmd = { 'texlab', '--stdio' },
  filetypes = { 'tex', 'latex' },
})

-- Enable Typescript Language Server
vim.lsp.enable('tex')
