return {
  {
    'lambdalisue/fern.vim',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    keys = {
      { '\\', ':Fern . -reveal=% -drawer -toggle<CR>', { desc = 'Fern drawer toggle' } },
      { '-', ':Fern . -reveal=% -stay -wait<CR>', { desc = 'Fern split' } },
    },
  },
}
