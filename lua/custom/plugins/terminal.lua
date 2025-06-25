return {
  config = function()
    vim.api.nvim_set_keymap('t', '<Esc><Esc>', [[<C-\><C-n>]], { noremap = true })
  },
}
