vim.g.loaded_netrw       = 1
vim.g.loaded_netrwPlugin = 1
require('options')
require('plugins')
require('keymaps')

local blink_caps = require("blink.cmp").get_lsp_capabilities()

-- Configure LSP clients

-- Set default root markers for all clients
vim.lsp.config('*', {
  root_markers = { '.git' },
  capabilities = blink_caps,
})

-- texlab
vim.lsp.config('texlab', {
  cmd = { 'texlab' },
  filetypes = { 'tex', 'latex' },
  root_markers = { '.latexmkrc', '.texlabroot', 'main.tex' },
  capabilities = blink_caps,   -- ← REQUIRED
  settings = {
    texlab = {
      build = {
        executable = "latexmk",
        args = { "-pdf", "-interaction=nonstopmode", "-synctex=1", "%f" },
        onSave = true,
      },
      chktex = {
        onOpenAndSave = true,
      },
      forwardSearch = {
        executable = "zathura",
        args = { "--synctex-forward", "%l:1:%f", "%p" },
      },
    },
  }
})

-- nil_ls
vim.lsp.config('nil_ls', {
  cmd = { 'nil' },
  filetypes = { 'nix' },
  root_markers = { 'flake.nix', 'default.nix' },
  capabilities = blink_caps,   -- ← REQUIRED

  settings = {
    ['nil'] = {
      formatting = {
        command = { "nixfmt-rfc-style" },
      },
    },
  },
})

vim.lsp.enable('texlab')
vim.lsp.enable('nil_ls')

