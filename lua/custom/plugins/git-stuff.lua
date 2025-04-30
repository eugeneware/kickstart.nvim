return {
  'tpope/vim-fugitive',
  {
    'lewis6991/gitsigns.nvim',
    config = function()
      require('gitsigns').setup()

      vim.keymap.set('n', "[c", ":Gitsigns nav_hunk prev<CR>", { desc = 'Previous [C]ommit hunk' })
      vim.keymap.set('n', "]c", ":Gitsigns nav_hunk next<CR>", { desc = 'Next [C]ommit hunk' })
    end,
  },
  {
    'refractalize/oil-git-status.nvim',

    dependencies = {
      'stevearc/oil.nvim',
    },

    config = function()
      require('oil-git-status').setup {
        show_ignored = false,
      }
    end,
  },
}
