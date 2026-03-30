local status_ok, telescope = pcall(require, 'telescope')
if not status_ok then
  return
end

telescope.setup {
  defaults = {
    prompt_prefix = '   ',
    selection_caret = '  ',
    entry_prefix = '  ',
    sorting_strategy = 'ascending',
    layout_config = {
      horizontal = {
        prompt_position = 'top',
        preview_width = 0.55,
      },
      width = 0.87,
      height = 0.80,
    },
    file_ignore_patterns = {
      'node_modules',
      '.git/',
      'dist/',
      'build/',
      '%.lock',
    },
    borderchars = { '─', '│', '─', '│', '╭', '╮', '╯', '╰' },
  },
}
