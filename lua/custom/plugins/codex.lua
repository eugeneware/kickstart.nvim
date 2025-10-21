local function codex_cmd(use_last)
  return { "bash", "-lc", use_last and "codex-gocode --last" or "codex-gocode" }
end

local function codex_opts()
  return {
    win = {
      position = "right",
      width = 0.3,
    },
  }
end

local function find_codex_terminal(snacks)
  return snacks.terminal.get(codex_cmd(false), { create = false })
    or snacks.terminal.get(codex_cmd(true), { create = false })
end

return {
  "folke/snacks.nvim",
  keys = {
    {
      "<leader>o",
      function()
        local snacks = require "snacks"
        local term = find_codex_terminal(snacks)
        if term then
          term:toggle()
          return
        end
        snacks.terminal.get(codex_cmd(false), codex_opts())
      end,
      desc = "Toggle Codex Terminal",
    },
    {
      "<leader>O",
      function()
        local snacks = require "snacks"
        local term = snacks.terminal.get(codex_cmd(true), { create = false })
        if term then
          term:show()
          return
        end
        snacks.terminal.get(codex_cmd(true), codex_opts())
      end,
      desc = "Start Codex With Last Chat",
    },
  },
}
