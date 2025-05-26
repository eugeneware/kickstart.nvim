return {
  'nvim-tree/nvim-tree.lua',
  dependencies = {
    'nvim-tree/nvim-web-devicons', -- optional, for file icons
  },
  config = function()
    -- Disable netrw for nvim-tree (but keep oil.nvim working)
    vim.g.loaded_netrw = 1
    vim.g.loaded_netrwPlugin = 1

    require('nvim-tree').setup {
      -- Disable hijacking netrw to maintain oil.nvim compatibility
      disable_netrw = false,
      hijack_netrw = false,

      view = {
        width = 35,
        side = 'left',
      },

      renderer = {
        group_empty = true,
        highlight_git = true,
        icons = {
          show = {
            git = true,
            folder = true,
            file = true,
            folder_arrow = true,
          },
        },
      },

      filters = {
        dotfiles = false,
        custom = { '.git', 'node_modules', '.cache' },
      },

      git = {
        enable = true,
        ignore = false,
      },

      actions = {
        open_file = {
          quit_on_open = false,
          resize_window = true,
        },
      },

      update_focused_file = {
        enable = true,
        update_root = false,
      },
    }

    -- Keybinding to toggle nvim-tree
    vim.keymap.set('n', '<leader>-', ':NvimTreeToggle<CR>', { desc = 'Toggle file tree' })
  end,
}