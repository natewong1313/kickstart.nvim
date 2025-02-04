-- Neo-tree is a Neovim plugin to browse the file system
-- https://github.com/nvim-neo-tree/neo-tree.nvim

return {
  'nvim-neo-tree/neo-tree.nvim',
  version = '*',
  dependencies = {
    'nvim-lua/plenary.nvim',
    'nvim-tree/nvim-web-devicons', -- not strictly required, but recommended
    'MunifTanjim/nui.nvim',
  },
  cmd = 'Neotree',
  keys = {
    { '\\', ':Neotree reveal<CR>:set number<CR>', desc = 'NeoTree reveal', silent = true },
  },
  config = function()
    require('neo-tree').setup {
      event_handlers = {

        {
          event = 'file_open_requested',
          handler = function()
            require('neo-tree.command').execute { action = 'close' }
          end,
        },
      },
      filesystem = {
        window = {
          mappings = {
            ['\\'] = 'close_window',
          },
          position = 'float',
        },
        filtered_items = {
          visible = true,
        },
      },
    }
  end,
}
