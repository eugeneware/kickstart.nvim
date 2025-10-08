return {
  "folke/snacks.nvim",
  keys = {
    {
      "<leader>ao",
      function()
        local snacks = require "snacks"
        snacks.terminal.toggle({ "bash", "-lc", "codex-gocode" }, {
          win = {
            position = "right",
            width = 0.3,
          },
        })
      end,
      desc = "Toggle Codex Terminal",
    },
  },
}