local utils = require("utils")

-- Keymaps for better default experience
-- See `:help vim.keymap.set()`
vim.keymap.set({ 'n', 'v' }, '<Space>', '<Nop>', { silent = true })

-- Navigate buffers
vim.keymap.set("n", "<Tab>", "<cmd>bnext<cr>", { desc = "Next buffer" })
vim.keymap.set("n", "<S-Tab>", "<cmd>bprev<cr>", { desc = "Previous buffer" })

-- Remap for dealing with word wrap
vim.keymap.set('n', 'k', "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
vim.keymap.set('n', 'j', "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })

-- Better indenting
vim.keymap.set("v", "<", "<gv")
vim.keymap.set("v", ">", ">gv")

-- Paste without replace clipboard
vim.keymap.set("v", "p", '"_dP')

-- Move Lines
vim.keymap.set("n", "<C-M-j>", ":m .+1<cr>==", { desc = "Move down" })
vim.keymap.set("v", "<C-M-j>", ":m '>+1<cr>gv=gv", { desc = "Move down" })
vim.keymap.set("i", "<C-M-j>", "<Esc>:m .+1<cr>==gi", { desc = "Move down" })
vim.keymap.set("n", "<C-M-k>", ":m .-2<cr>==", { desc = "Move up" })
vim.keymap.set("v", "<C-M-k>", ":m '<-2<cr>gv=gv", { desc = "Move up" })
vim.keymap.set("i", "<C-M-k>", "<Esc>:m .-2<cr>==gi", { desc = "Move up" })

-- Better move
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")

-- Diagnostic keymaps
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev)
vim.keymap.set('n', ']d', vim.diagnostic.goto_next)
vim.keymap.set('n', '<leader>e', vim.diagnostic.open_float)
--vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist)

-- Open quickfix list
vim.keymap.set("n", "<leader>q", function()
	vim.diagnostic.setloclist()
end, { desc = "Open quickfix list" })

-- Toggle options
vim.keymap.set("n", "<leader>tl", function()
	utils.toggle("relativenumber")
end, { desc = "Toggle Line Numbers" })

-- Git fugitve remaps
vim.keymap.set("n", "<leader>gl", ":diffget //3<cr>", { desc = "Get right (remote) diff" })
vim.keymap.set("n", "<leader>gh", ":diffget //2<cr>", { desc = "Get left (local) diff" })
vim.keymap.set("n", "<leader>gs", ":G<cr>", { desc = "Open git fugitive" })
-- vim.keymap.set("n", "dvv", ":<C-U>execute <SID>StageDiff('Gvdiffsplit!')<CR>", { desc = "Executes 3 way split in fugitive" })
