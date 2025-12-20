-- ~/.config/nvim/after/ftplugin/markdown.lua

-- 1) Define highlight colors (change to whatever you like)

vim.cmd("highlight MarkdownImportantLine guibg=#F7768E guifg=#000000 gui=bold")
vim.cmd("highlight MarkdownNoteLine      guibg=#7AA2F7 guifg=#000000 gui=bold")
vim.cmd("highlight MarkdownWarningLine   guibg=#FCC39F guifg=#000000 gui=bold")
-- 2) Namespace for applying highlights
local ns = vim.api.nvim_create_namespace("md_keyword_lines")

-- 3) Highlight function (entire line)
local function highlight_keyword_lines(bufnr)
  vim.api.nvim_buf_clear_namespace(bufnr, ns, 0, -1)

  local lines = vim.api.nvim_buf_get_lines(bufnr, 0, -1, false)
  if not lines then return end

  for i, line in ipairs(lines) do
    if line:match("^IMPORTANT:") then
      vim.api.nvim_buf_add_highlight(bufnr, ns, "MarkdownImportantLine", i - 1, 0, -1)
    elseif line:match("^NOTE:") then
      vim.api.nvim_buf_add_highlight(bufnr, ns, "MarkdownNoteLine", i - 1, 0, -1)
    elseif line:match("^WARNING:") then
      vim.api.nvim_buf_add_highlight(bufnr, ns, "MarkdownWarningLine", i - 1, 0, -1)
    end
  end
end

-- 4) Auto-update highlight on file load and changes
vim.api.nvim_create_autocmd({ "BufEnter", "BufWinEnter", "TextChanged", "TextChangedI", "BufWritePost" }, {
  pattern = { "*.md", "*.markdown" },
  callback = function(args)
    local bufnr = args.buf
    if vim.bo[bufnr].filetype ~= "markdown" then return end
    highlight_keyword_lines(bufnr)
  end,
})


