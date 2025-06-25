return {
  'tpope/vim-fugitive',
  {
    'lewis6991/gitsigns.nvim',
    config = function()
      local gitsigns = require 'gitsigns'
      gitsigns.setup()

      vim.keymap.set('n', '[c', function()
        gitsigns.nav_hunk 'prev'
      end, { desc = 'Previous hunk' })
      vim.keymap.set('n', ']c', function()
        gitsigns.nav_hunk 'next'
      end, { desc = 'Next hunk' })

      vim.keymap.set('n', '<leader>gb', gitsigns.blame, { desc = '[G]it [B]lame' })

      local ok, builtin = pcall(require, 'telescope.builtin')
      if ok then
        vim.keymap.set('n', '<leader>gs', function()
          local file_dir = vim.fn.expand('%:p:h')
          -- Handle oil.nvim buffers
          if vim.startswith(file_dir, 'oil://') then
            file_dir = string.sub(file_dir, 7) -- Remove 'oil://' prefix
          end
          builtin.git_status({ cwd = file_dir })
        end, { desc = '[G]it [S]tatus (current file\'s repo)' })
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
