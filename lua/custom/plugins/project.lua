return {
  {
    'ahmedkhalf/project.nvim',
    config = function()
      local ts = require 'telescope'
      ts.load_extension 'projects'
      vim.keymap.set('n', '<leader>p', ts.extensions.projects.projects, { desc = 'Pick projects' })
      require('project_nvim').setup {
        scope_chdir = 'tab',
        silent_chdir = false,
      }
    end,
  },
}
