-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

vim.opt.guicursor = {
  "n:block", -- normal
  "i:block", -- insert
  "v:block", -- visual
  "c:block", -- command
  "r:block", -- replace
}
--set file encoding
vim.scriptencoding = "utf-8"
vim.opt.encoding = "utf-8"
vim.opt.fileencoding = "utf-8"
vim.opt.title = true
vim.opt.autoindent = true
vim.opt.smartindent = true
-- Optional: fileformats for reading
vim.o.fileformats = "unix,dos,mac"
