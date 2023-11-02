-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

-- Reimplement visual block mode: create command that executes the default (C-v)
vim.api.nvim_create_user_command("VisualBlock", "normal! <C-v>", {})
vim.keymap.set("n", "<M-v>", ":VisualBlock<cr>")

-- Better indenting
vim.keymap.set("v", "<", "<gv")
vim.keymap.set("v", ">", ">gv")

-- Paste without replace clipboard
vim.keymap.set("v", "p", '"_dP')
