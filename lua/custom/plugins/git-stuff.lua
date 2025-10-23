return {
  'tpope/vim-fugitive',
  {
    -- Custom git keymaps (telescope integration)
    'nvim-telescope/telescope.nvim',
    optional = true,
    keys = {
      {
        '<leader>gb',
        function()
          require('gitsigns').blame()
        end,
        desc = '[G]it [B]lame',
      },
      {
        '<leader>gs',
        function()
          local builtin = require('telescope.builtin')
          local file_dir = vim.fn.expand('%:p:h')
          -- Handle oil.nvim buffers
          if vim.startswith(file_dir, 'oil://') then
            file_dir = string.sub(file_dir, 7) -- Remove 'oil://' prefix
          end
          builtin.git_status({ cwd = file_dir })
        end,
        desc = '[G]it [S]tatus (current file\'s repo)',
      },
      {
        '<leader>gc',
        function()
          require('telescope.builtin').git_commits()
        end,
        desc = '[G]it [C]ommits (Telescope)',
      },
      {
        '<leader>gF',
        function()
          local builtin = require('telescope.builtin')
          local branch = vim.fn.input('Branch to compare (default: origin/main): ')
          if branch == '' then
            branch = 'origin/main'
          end

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
                vim.cmd('wincmd h')
              end

              map('i', '<CR>', open_diff)
              map('n', '<CR>', open_diff)

              return true
            end,
          })
        end,
        desc = '[G]it [F]iles changed from branch',
      },
      {
        '<leader>gf',
        function()
          local builtin = require('telescope.builtin')
          local branch = 'origin/main'

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
                vim.cmd('wincmd h')
              end

              map('i', '<CR>', open_diff)
              map('n', '<CR>', open_diff)

              return true
            end,
          })
        end,
        desc = '[G]it [f]iles changed from origin/main',
      },
    },
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
