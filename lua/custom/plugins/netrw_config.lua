vim.g.netrw_banner = 0
vim.api.nvim_create_augroup('NetrwMapping', { clear = true })
vim.api.nvim_create_autocmd('FileType', {
  pattern = 'netrw',
  callback = function()
    local map = vim.api.nvim_buf_set_keymap
    local opts = { noremap = true, silent = true }

    map(0, 'n', '<c-r>', '<Plug>NetrwRefresh', opts)
    map(0, 'n', '<c-l>', ':TmuxNavigateRight<CR>', opts)
  end,
  group = 'NetrwMapping',
})

return {}
