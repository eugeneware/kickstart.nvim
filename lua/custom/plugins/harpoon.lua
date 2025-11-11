return {
  'ThePrimeagen/harpoon',
  branch = 'harpoon2',
  dependencies = {
    'nvim-lua/plenary.nvim',
  },
  config = function()
    local harpoon = require 'harpoon'

    -- REQUIRED: Setup harpoon
    harpoon:setup()

    -- Basic Harpoon operations
    vim.keymap.set('n', '<leader>ja', function()
      harpoon:list():add()
    end, { desc = '[J]ump [A]dd file to harpoon' })

    vim.keymap.set('n', '<leader>jd', function()
      harpoon:list():remove()
    end, { desc = '[J]ump [D]elete from harpoon' })

    vim.keymap.set('n', '<leader>jj', function()
      harpoon.ui:toggle_quick_menu(harpoon:list())
    end, { desc = '[J]ump to harpoon menu' })

    -- Quick navigation to harpooned files (1-9, 0 for 10)
    vim.keymap.set('n', '<leader>1', function()
      harpoon:list():select(1)
    end, { desc = 'Harpoon file 1' })

    vim.keymap.set('n', '<leader>2', function()
      harpoon:list():select(2)
    end, { desc = 'Harpoon file 2' })

    vim.keymap.set('n', '<leader>3', function()
      harpoon:list():select(3)
    end, { desc = 'Harpoon file 3' })

    vim.keymap.set('n', '<leader>4', function()
      harpoon:list():select(4)
    end, { desc = 'Harpoon file 4' })

    vim.keymap.set('n', '<leader>5', function()
      harpoon:list():select(5)
    end, { desc = 'Harpoon file 5' })

    vim.keymap.set('n', '<leader>6', function()
      harpoon:list():select(6)
    end, { desc = 'Harpoon file 6' })

    vim.keymap.set('n', '<leader>7', function()
      harpoon:list():select(7)
    end, { desc = 'Harpoon file 7' })

    vim.keymap.set('n', '<leader>8', function()
      harpoon:list():select(8)
    end, { desc = 'Harpoon file 8' })

    vim.keymap.set('n', '<leader>9', function()
      harpoon:list():select(9)
    end, { desc = 'Harpoon file 9' })

    vim.keymap.set('n', '<leader>0', function()
      harpoon:list():select(10)
    end, { desc = 'Harpoon file 10' })

    -- Navigate through harpoon list
    vim.keymap.set('n', ']j', function()
      harpoon:list():next()
    end, { desc = 'Next harpoon [J]ump mark' })

    vim.keymap.set('n', '[j', function()
      harpoon:list():prev()
    end, { desc = 'Previous harpoon [J]ump mark' })

    -- Optional: Telescope integration for alternative UI
    -- Requires telescope.nvim to be installed
    local ok, telescope = pcall(require, 'telescope')
    if ok then
      telescope.load_extension 'harpoon'
      vim.keymap.set('n', '<leader>sh', ':Telescope harpoon marks<CR>', { desc = '[S]earch [H]arpoon marks' })
    end
  end,
}
