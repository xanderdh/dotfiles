require "nvchad.mappings"

-- add yours here

local map = vim.keymap.set

-- git
map("n", "<leader>gbl", "<cmd>Git blame_line<cr>", { desc = "Git blame line" })
map("n", "<leader>gbb", "<cmd>Git blame<cr>", { desc = "Git blame" })

map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jk", "<ESC>")

map("i", "<C-l>", function()
  vim.fn.feedkeys(vim.fn["copilot#Accept"](), "")
end, { desc = "Copilot accept" })

-- map({ "n", "i", "v" }, "<C-s>", "<cmd> w <cr>")
