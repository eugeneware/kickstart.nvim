return {
  'tpope/vim-fugitive',
  {
    'lewis6991/gitsigns.nvim',
    config = function()
      local gitsigns = require 'gitsigns'
      gitsigns.setup()

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

        local function show_changed_files(branch)
          builtin.git_files({
            prompt_title = string.format('Files changed from %s', branch),
            git_command = { 'git', 'diff', '--name-only', branch .. '...HEAD' },
            attach_mappings = function(_, map)
              local actions = require('telescope.actions')
              local action_state = require('telescope.actions.state')

              local function open_diff(prompt_bufnr)
                local selection = action_state.get_selected_entry()
                actions.close(prompt_bufnr)
                vim.cmd('edit ' .. selection.value)
                vim.cmd('Gvdiffsplit ' .. branch)
              end

              map('i', '<CR>', open_diff)
              map('n', '<CR>', open_diff)

              return true
            end,
          })
        end

        vim.keymap.set('n', '<leader>gF', function()
          local branch = vim.fn.input('Branch to compare (default: origin/main): ')
          if branch == '' then
            branch = 'origin/main'
          end
          show_changed_files(branch)
        end, { desc = '[G]it [F]iles changed from branch' })

        vim.keymap.set('n', '<leader>gf', function()
          show_changed_files('origin/main')
        end, { desc = '[G]it [f]iles changed from origin/main' })
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
