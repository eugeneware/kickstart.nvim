return {
  'grusky/slimux',
  config = function()
    vim.g.slimux_python_use_ipython = 1
    vim.g.slimux_python_press_enter = 1

    local map = vim.api.nvim_set_keymap

    function select_code_cell()
      -- Search backwards for the cell delimiter from the current line.
      local start = vim.fn.search('# %%', 'bW')

      -- If the start was found, move to the next line to start the selection.
      -- Otherwise, move to the first line of the buffer.
      if start > 0 then
        vim.cmd 'normal! j'
      else
        vim.cmd 'normal! gg'
      end

      -- Start visual mode.
      vim.cmd 'normal! V'

      -- Search forwards for the next cell delimiter.
      local finish = vim.fn.search('# %%', 'W')

      -- If the end was found, move up one line to end the selection.
      -- Otherwise, move to the last line of the buffer.
      if finish > 0 then
        vim.cmd 'normal! k'
      else
        vim.cmd 'normal! G'
      end
    end

    vim.api.nvim_set_keymap(
      'n',
      '<Leader>xx',
      ':lua select_code_cell()<CR>:SlimuxREPLSendSelection<CR>',
      { noremap = true, silent = true, desc = 'Send code cell' }
    )

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
