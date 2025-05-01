return {
  'tpope/vim-fugitive',
  {
    'lewis6991/gitsigns.nvim',
    config = function()
      require('gitsigns').setup()

      vim.keymap.set('n', "[c", ":Gitsigns nav_hunk prev<CR>", { desc = 'Previous [C]ommit hunk' })
      vim.keymap.set('n', "]c", ":Gitsigns nav_hunk next<CR>", { desc = 'Next [C]ommit hunk' })

      local ok, builtin = pcall(require, 'telescope.builtin')
      if ok then
        vim.keymap.set('n', '<leader>gs', builtin.git_status, { desc = '[G]it [S]tatus (Telescope)' })
        vim.keymap.set('n', '<leader>gc', builtin.git_commits, { desc = '[G]it [C]ommits (Telescope)' })
      end

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
