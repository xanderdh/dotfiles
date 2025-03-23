local map = vim.keymap.set

-- clear search
map('n', '<leader>h', ':nohlsearch<CR>')

-- Navigate vim panes better
map('n', '<c-k>', ':wincmd k<CR>')
map('n', '<c-j>', ':wincmd j<CR>')
map('n', '<c-h>', ':wincmd h<CR>')
map('n', '<c-l>', ':wincmd l<CR>')

-- nvimtree
map("n", "<C-n>", "<cmd>NvimTreeToggle<CR>", { desc = "nvimtree toggle window" })
--map('n', '<c-n>', ':NvimTreeFindFile<CR>')
--map("n", "<leader>e", "<cmd>NvimTreeFocus<CR>", { desc = "nvimtree focus window" })

-- git
-- map("n", "<leader>gbl", "<cmd>Git blame_line<cr>", { desc = "Git blame line" })
-- map("n", "<leader>gbb", "<cmd>Git blame<cr>", { desc = "Git blame" })

