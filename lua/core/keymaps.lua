local map = vim.keymap.set
local opts = { noremap = true, silent = true }

vim.g.mapleader = ','

-----------------------------------------------------------
-- General
-----------------------------------------------------------
map('n', '<leader>c', ':nohl<CR>', opts)
map('n', '<leader>s', ':w<CR>', opts)
map('n', '<leader>q', ':qa!<CR>', opts)

-- Better window navigation
map('n', '<C-h>', '<C-w>h', opts)
map('n', '<C-j>', '<C-w>j', opts)
map('n', '<C-k>', '<C-w>k', opts)
map('n', '<C-l>', '<C-w>l', opts)

-- Resize splits with arrows
map('n', '<C-Up>', ':resize -2<CR>', opts)
map('n', '<C-Down>', ':resize +2<CR>', opts)
map('n', '<C-Left>', ':vertical resize -2<CR>', opts)
map('n', '<C-Right>', ':vertical resize +2<CR>', opts)

-- Move lines up/down in visual mode
map('v', 'J', ":m '>+1<CR>gv=gv", opts)
map('v', 'K', ":m '<-2<CR>gv=gv", opts)

-- Stay centered when scrolling
map('n', '<C-d>', '<C-d>zz', opts)
map('n', '<C-u>', '<C-u>zz', opts)
map('n', 'n', 'nzzzv', opts)
map('n', 'N', 'Nzzzv', opts)

-- Better paste (don't overwrite register)
map('x', '<leader>p', '"_dP', opts)

-- Change split orientation
map('n', '<leader>tk', '<C-w>t<C-w>K', opts)
map('n', '<leader>th', '<C-w>t<C-w>H', opts)

-----------------------------------------------------------
-- Bufferline / Buffer navigation
-----------------------------------------------------------
map('n', '<S-l>', ':BufferLineCycleNext<CR>', opts)
map('n', '<S-h>', ':BufferLineCyclePrev<CR>', opts)
map('n', '<leader>bp', ':BufferLineTogglePin<CR>', opts)
map('n', '<leader>bc', ':bdelete<CR>', opts)

-----------------------------------------------------------
-- Telescope
-----------------------------------------------------------
map('n', '<leader>ff', ':Telescope find_files<CR>', opts)
map('n', '<leader>fg', ':Telescope live_grep<CR>', opts)
map('n', '<leader>fb', ':Telescope buffers<CR>', opts)
map('n', '<leader>fh', ':Telescope help_tags<CR>', opts)
map('n', '<leader>fo', ':Telescope oldfiles<CR>', opts)
map('n', '<leader>fd', ':Telescope diagnostics<CR>', opts)

-----------------------------------------------------------
-- NvimTree
-----------------------------------------------------------
map('n', '<C-n>', ':NvimTreeToggle<CR>', opts)
map('n', '<leader>n', ':NvimTreeFindFile<CR>', opts)

-----------------------------------------------------------
-- Terminal
-----------------------------------------------------------
map('n', '<C-t>', ':Term<CR>', opts)
map('t', '<Esc>', '<C-\\><C-n>', opts)

-----------------------------------------------------------
-- Git (gitsigns)
-----------------------------------------------------------
map('n', '<leader>gb', ':Gitsigns blame_line<CR>', opts)
map('n', '<leader>gp', ':Gitsigns preview_hunk<CR>', opts)
map('n', '<leader>gr', ':Gitsigns reset_hunk<CR>', opts)
map('n', ']h', ':Gitsigns next_hunk<CR>', opts)
map('n', '[h', ':Gitsigns prev_hunk<CR>', opts)
