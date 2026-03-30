local status_ok, bufferline = pcall(require, 'bufferline')
if not status_ok then
  return
end

bufferline.setup {
  options = {
    mode = 'buffers',
    themable = true,
    close_command = 'bdelete! %d',
    indicator = {
      icon = '▎',
      style = 'icon',
    },
    buffer_close_icon = '󰅖',
    modified_icon = '●',
    close_icon = '',
    left_trunc_marker = '',
    right_trunc_marker = '',
    diagnostics = 'nvim_lsp',
    diagnostics_indicator = function(count, level)
      local icon = level:match('error') and ' ' or ' '
      return ' ' .. icon .. count
    end,
    offsets = {
      {
        filetype = 'NvimTree',
        text = '  Files',
        text_align = 'left',
        separator = true,
      },
    },
    separator_style = 'thin',
    hover = {
      enabled = true,
      delay = 200,
      reveal = { 'close' },
    },
  },
}

