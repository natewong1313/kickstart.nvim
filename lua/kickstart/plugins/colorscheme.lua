local function checkIfLaptopClient()
  return os.getenv 'SSH_CLIENT' ~= nil or os.getenv 'hostname' ~= nil
end

return { -- You can easily change to a different colorscheme.
  -- Change the name of the colorscheme plugin below, and then
  -- change the command in the config to whatever the name of that colorscheme is.
  --
  -- If you want to see what colorschemes are already installed, you can use `:Telescope colorscheme`.
  -- 'nyoom-engineering/oxocarbon.nvim',
  -- priority = 1000,
  -- init = function()
  --   vim.opt.background = 'dark'
  --   vim.cmd.colorscheme 'oxocarbon'
  --   vim.cmd.hi 'Comment gui=none'
  -- end,
  'folke/tokyonight.nvim',
  priority = 1000, -- Make sure to load this before all the other start plugins.
  config = function()
    require('tokyonight').setup {
      transparent = false,
      day_brightness = 0.2,
      lualine_bold = true,
    }
  end,
  init = function()
    -- Load the colorscheme here.
    -- Like many other themes, this one has different styles, and you could load
    -- any other, such as 'tokyonight-storm', 'tokyonight-moon', or 'tokyonight-day'.
    if checkIfLaptopClient() then
      vim.cmd.colorscheme 'tokyonight-day'
    else
      vim.cmd.colorscheme 'tokyonight-night'
    end

    -- You can configure highlights by doing something like:
    vim.cmd.hi 'Comment gui=none'
  end,
}
