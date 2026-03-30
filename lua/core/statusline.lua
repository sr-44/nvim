local status_ok, lualine = pcall(require, 'lualine')
if not status_ok then
  return
end

lualine.setup {
  options = {
    theme = 'auto',
    component_separators = { left = '', right = '' },
    section_separators = { left = '', right = '' },
    globalstatus = true,
    disabled_filetypes = {
      statusline = { 'alpha' },
    },
  },
  sections = {
    lualine_a = {
      { 'mode', icon = '' },
    },
    lualine_b = {
      { 'branch', icon = '' },
      {
        'diff',
        symbols = { added = ' ', modified = ' ', removed = ' ' },
      },
    },
    lualine_c = {
      {
        'filename',
        path = 1,
        symbols = { modified = ' ●', readonly = ' ', unnamed = '[No Name]' },
      },
      {
        'diagnostics',
        sources = { 'nvim_diagnostic' },
        symbols = { error = ' ', warn = ' ', info = ' ', hint = ' ' },
      },
    },
    lualine_x = {
      {
        function()
          local clients = vim.lsp.get_clients({ bufnr = 0 })
          if #clients == 0 then return '' end
          local names = {}
          for _, client in ipairs(clients) do
            table.insert(names, client.name)
          end
          return '  ' .. table.concat(names, ', ')
        end,
      },
      'encoding',
      'fileformat',
    },
    lualine_y = { 'filetype' },
    lualine_z = {
      'progress',
      { 'location', padding = { left = 0, right = 1 } },
    },
  },
  inactive_sections = {
    lualine_a = {},
    lualine_b = {},
    lualine_c = { 'filename' },
    lualine_x = { 'location' },
    lualine_y = {},
    lualine_z = {},
  },
}
