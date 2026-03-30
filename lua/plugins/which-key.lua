local status_ok, wk = pcall(require, 'which-key')
if not status_ok then
  return
end

wk.setup {
  icons = {
    breadcrumb = '»',
    separator = '➜',
    group = ' ',
  },
  win = {
    border = 'rounded',
  },
}

wk.add({
  { "<leader>f", group = "Find (Telescope)" },
  { "<leader>g", group = "Git" },
  { "<leader>b", group = "Buffers" },
  { "<leader>t", group = "Splits" },
})
