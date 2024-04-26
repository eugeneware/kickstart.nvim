return {
  'grusky/slimux',
  config = function()
    vim.g.slimux_python_use_ipython = 1
    vim.g.slimux_python_press_enter = 1

    local map = vim.api.nvim_set_keymap

    map('n', '<leader>xs', ':SlimuxREPLSendLine<CR>', { noremap = true, silent = true, desc = 'Send line to REPL' })
    map('n', '<leader>xp', ':SlimuxREPLSendParagraph<CR>', { noremap = true, silent = true, desc = 'Send paragraph to REPL' })
    map('v', '<leader>xs', ':SlimuxREPLSendSelection<CR>', { noremap = true, silent = true, desc = 'Send selection to REPL' })
    -- map('n', '<leader>xb', ':SlimuxREPLSendBuffer<CR>', { noremap = true, silent = true, desc = 'Send buffer to REPL' })
    map('n', '<leader>xa', ':SlimuxShellLast<CR>', { noremap = true, silent = true, desc = 'Send to last shell' })
    map('n', '<leader>xk', ':SlimuxSendKeysLast<CR>', { noremap = true, silent = true, desc = 'Send keys to last shell' })
    map('n', '<leader>xc', ':SlimuxREPLConfigure<CR>', { noremap = true, silent = true, desc = 'Configure REPL' })
    map('n', '<leader>xC', ':SlimuxShellConfigure<CR>', { noremap = true, silent = true, desc = 'Configure shell' })
  end,
}
