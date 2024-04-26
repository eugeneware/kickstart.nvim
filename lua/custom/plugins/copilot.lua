return {
  {
    'zbirenbaum/copilot.lua',
    cmd = 'Copilot',
    event = 'InsertEnter',
    build = ':Copilot auth',
    opts = {
      suggestion = {
        auto_trigger = true,
        keymap = {
          accept = '<C-I>',
          accept_word = false,
          accept_line = false,
          next = '<C-N>',
          prev = '<C-P>',
          dismiss = '<ESC>',
        },
      },
    },
  },
}
