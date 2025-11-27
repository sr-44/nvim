-- Setup Catppuccin with Mocha flavor
local status_ok, catppuccin = pcall(require, 'catppuccin')
if status_ok then
  catppuccin.setup({
    flavour = "mocha", -- latte, frappe, macchiato, mocha
    color_overrides = {
      mocha = {
        -- Можно переопределить цвета если нужно
        -- blue = "#89b4fa", -- это стандартный синий в mocha
      },
    },
    custom_highlights = function(colors)
      return {
        TSInclude = {
          fg = colors.blue,
        },
        GitSignsAdd = {
          fg = colors.green,
          bg = colors.surface0
        },
        GitSignsDelete = {
          fg = colors.red,
          bg = colors.surface0
        },
        GitSignsChange = {
          fg = colors.peach,
          bg = colors.surface0
        },
      }
    end
  })

  -- Применяем цветовую схему
  vim.cmd.colorscheme "catppuccin"
end

--[[
Statusline color schemes.
Import the following color schemes in your statusline.lua file
with: `require('core/colors').colorscheme_name` where the colors scheme name
is the value of the variables below.

e.g.: `local colors = require('core/colors').catppuccin_mocha
See: `core/statusline.lua`

The color schemes below are created by following the "palette" file color
schemes. Color names are adapted to maintain a pattern, original names can be
different.
--]]
local M = {}

-- Theme: OneDark (dark)
-- Colors: https://github.com/navarasu/onedark.nvim/blob/master/lua/onedark/palette.lua
M.onedark_dark = {
  bg = '#282c34',
  fg = '#b2bbcc',
  pink = '#c678dd',
  green = '#98c379',
  cyan = '#56b6c2',
  yellow = '#e5c07b',
  orange = '#d19a66',
  red = '#e86671',
}

-- Theme: Monokai (classic)
-- Colors: https://github.com/tanvirtin/monokai.nvim/blob/master/lua/monokai.lua
M.monokai = {
  bg = '#202328', --default: #272a30
  fg = '#f8f8f0',
  pink = '#f92672',
  green = '#a6e22e',
  cyan = '#66d9ef',
  yellow = '#e6db74',
  orange = '#fd971f',
  red = '#e95678',
}

-- Theme: Rosé Pine (main)
-- Colors: https://github.com/rose-pine/neovim/blob/main/lua/rose-pine/palette.lua
-- color names are adapted to the formats above
M.rose_pine = {
  bg = '#111019', --default: #191724
  fg = '#e0def4',
  pink = '#eb6f92',
  green = '#9ccfd8',
  cyan = '#31748f',
  yellow = '#f6c177',
  orange = '#2a2837',
  red = '#ebbcba',
}

-- Theme: Catppuccin (mocha)
-- Colors: https://github.com/catppuccin/nvim
-- Mocha palette with emphasis on blue
M.catppuccin_mocha = {
  bg = '#1e1e2e',
  fg = '#cdd6f4',
  pink = '#f5c2e7',
  green = '#a6e3a1',
  cyan = '#89dceb',
  yellow = '#f9e2af',
  orange = '#fab387',
  red = '#f38ba8',
  blue = '#89b4fa', -- основной синий цвет
}

return M
