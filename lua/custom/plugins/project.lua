return {
  {
    'ahmedkhalf/project.nvim',
    config = function()
      require('project_nvim').setup {
        scope_chdir = 'tab',
        silent_chdir = false,
        detection_methods = { 'lsp', 'pattern' },
        patterns = { '.project-root', '.envrc', '.git' },
        manual_mode = false,
      }
      local ts = require 'telescope'
      ts.load_extension 'projects'
      vim.keymap.set('n', '<leader>p', ts.extensions.projects.projects, { desc = 'Pick projects' })
      vim.keymap.set('n', '<leader>pr', function() print('Project root: ' .. vim.fn.getcwd()) end, { desc = 'Show project root' })
    end,
  },
}
