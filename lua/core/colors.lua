local status_ok, catppuccin = pcall(require, 'catppuccin')
if not status_ok then
  return
end

catppuccin.setup({
  flavour = "mocha",
  background = {
    light = "latte",
    dark = "mocha",
  },
  transparent_background = false,
  dim_inactive = {
    enabled = true,
    shade = "dark",
    percentage = 0.15,
  },
  integrations = {
    alpha = true,
    cmp = true,
    gitsigns = true,
    indent_blankline = { enabled = true },
    noice = true,
    notify = true,
    nvimtree = true,
    telescope = { enabled = true },
    treesitter = true,
    which_key = true,
    native_lsp = {
      enabled = true,
      underlines = {
        errors = { "undercurl" },
        hints = { "undercurl" },
        warnings = { "undercurl" },
        information = { "undercurl" },
      },
    },
  },
  custom_highlights = function(colors)
    return {
      CursorLineNr = { fg = colors.blue, style = { "bold" } },
      GitSignsCurrentLineBlame = { fg = colors.overlay0 },
    }
  end
})

vim.cmd.colorscheme "catppuccin"

-- Color palette for statusline
local M = {}

M.catppuccin_mocha = {
  bg = '#1e1e2e',
  fg = '#cdd6f4',
  pink = '#f5c2e7',
  green = '#a6e3a1',
  cyan = '#89dceb',
  yellow = '#f9e2af',
  orange = '#fab387',
  red = '#f38ba8',
  blue = '#89b4fa',
  lavender = '#b4befe',
  surface0 = '#313244',
  surface1 = '#45475a',
  overlay0 = '#6c7086',
}

return M
