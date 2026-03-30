local status_ok, alpha = pcall(require, 'alpha')
if not status_ok then
  return
end

local dashboard = require('alpha.themes.dashboard')

local function footer()
  local version = vim.version()
  local nvim_version = "v" .. version.major .. '.' .. version.minor .. '.' .. version.patch
  local datetime = os.date('%d.%m.%Y  %H:%M')
  local lazy_stats = require('lazy').stats()
  local plugins = '  ' .. lazy_stats.loaded .. '/' .. lazy_stats.count .. ' plugins'
  return nvim_version .. '   ' .. datetime .. '  ' .. plugins
end

local banner = {
  [[                                                     ]],
  [[  ███╗   ██╗███████╗ ██████╗ ██╗   ██╗██╗███╗   ███╗]],
  [[  ████╗  ██║██╔════╝██╔═══██╗██║   ██║██║████╗ ████║]],
  [[  ██╔██╗ ██║█████╗  ██║   ██║██║   ██║██║██╔████╔██║]],
  [[  ██║╚██╗██║██╔══╝  ██║   ██║╚██╗ ██╔╝██║██║╚██╔╝██║]],
  [[  ██║ ╚████║███████╗╚██████╔╝ ╚████╔╝ ██║██║ ╚═╝ ██║]],
  [[  ╚═╝  ╚═══╝╚══════╝ ╚═════╝   ╚═══╝  ╚═╝╚═╝     ╚═╝]],
  [[                                                     ]],
}

dashboard.section.header.val = banner
dashboard.section.header.opts.hl = "AlphaHeader"

dashboard.section.buttons.val = {
  dashboard.button('f', '  Find file',       ':Telescope find_files<CR>'),
  dashboard.button('r', '  Recent files',    ':Telescope oldfiles<CR>'),
  dashboard.button('g', '  Live grep',       ':Telescope live_grep<CR>'),
  dashboard.button('e', '  New file',        ':ene <BAR> startinsert<CR>'),
  dashboard.button('s', '  Settings',        ':e $MYVIMRC<CR>'),
  dashboard.button('u', '  Update plugins',  ':Lazy update<CR>'),
  dashboard.button('q', '  Quit',            ':qa<CR>'),
}

for _, button in ipairs(dashboard.section.buttons.val) do
  button.opts.hl = "AlphaButtons"
  button.opts.hl_shortcut = "AlphaShortcut"
end

dashboard.section.footer.val = footer()
dashboard.section.footer.opts.hl = "AlphaFooter"

dashboard.opts.layout[1].val = 3

alpha.setup(dashboard.config)
