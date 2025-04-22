local function getHostName()
  local f = io.popen '/bin/hostname'
  local hostname = f:read '*a' or ''
  f:close()
  hostname = string.gsub(hostname, '\n$', '')
  return hostname
end

local function checkIfLaptopClient()
  return os.getenv 'SSH_CLIENT' ~= nil or getHostName() == 'Nates-Air'
end

local function useTransparentBackground()
  return os.getenv 'SSH_CLIENT' == nil and getHostName() == 'iMac'
end

return { -- You can easily change to a different colorscheme.
  -- Change the name of the colorscheme plugin below, and then
  -- change the command in the config to whatever the name of that colorscheme is.
  --
  -- If you want to see what colorschemes are already installed, you can use `:Telescope colorscheme`.

  -- 'projekt0n/github-nvim-theme',
  -- lazy = false, -- make sure we load this during startup if it is your main colorscheme
  -- priority = 1000, -- make sure to load this before all the other start plugins
  -- config = function()
  --   require('github-theme').setup {}
  --
  --   vim.cmd 'colorscheme github_light'
  -- end,

  -- 'catppuccin/nvim',
  -- lazy = false,
  -- priority = 1000,
  -- config = function()
  --   require('catppuccin').setup { no_bold = false }
  -- end,
  -- init = function()
  --   if checkIfLaptopClient() then
  --     vim.cmd.colorscheme 'catppuccin-latte'
  --     vim.o.background = 'light'
  --   else
  --     vim.cmd.colorscheme 'catppuccin'
  --     vim.o.background = 'dark'
  --   end
  --   vim.cmd.hi 'Comment gui=none'
  -- end,

  'folke/tokyonight.nvim',
  priority = 1000, -- Make sure to load this before all the other start plugins.
  config = function()
    require('tokyonight').setup {
      transparent = useTransparentBackground(),
      -- day_brightness = 0.2,
      lualine_bold = true,
    }
  end,
  init = function()
    -- Load the colorscheme here.
    -- Like many other themes, this one has different styles, and you could load
    -- any other, such as 'tokyonight-storm', 'tokyonight-moon', or 'tokyonight-day'.
    -- if checkIfLaptopClient() then
    --   vim.cmd.colorscheme 'tokyonight-day'
    --   vim.o.background = 'light'
    -- else
    vim.cmd.colorscheme 'tokyonight-night'
    vim.o.background = 'dark'
    -- end

    -- You can configure highlights by doing something like:
    vim.cmd.hi 'Comment gui=none'
  end,
}
