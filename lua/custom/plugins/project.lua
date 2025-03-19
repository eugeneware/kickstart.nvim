return {
  {
    'ahmedkhalf/project.nvim',
    config = function()
      require('project_nvim').setup {
        scope_chdir = 'tab',
        silent_chdir = false,
        detection_methods = { 'pattern' },
        patterns = { '.git' },
      }
      local ts = require 'telescope'
      ts.load_extension 'projects'
      vim.keymap.set('n', '<leader>p', ts.extensions.projects.projects, { desc = 'Pick projects' })
    end,
  },
}
