
return {
  "barrett-ruth/live-server.nvim",
  build = "npm install -g live-server",
  cmd = { "LiveServerStart", "LiveServerStop" },
  config = function()
    require("live-server").setup({
      args = {
        "--browser=firefox",
      },
    })
  end,
  keys = {
    {
      "<leader>hs",
      "<cmd>LiveServerStart<cr>",
      desc = "Start Live Server (Firefox)",
    },
    {
      "<leader>hx",
      "<cmd>LiveServerStop<cr>",
      desc = "Stop Live Server",
    },
  },
}

