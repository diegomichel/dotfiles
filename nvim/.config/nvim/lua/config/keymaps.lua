-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
vim.keymap.set(
  "n",
  "<leader>sx",
  require("telescope.builtin").resume,
  { noremap = true, silent = true, desc = "resume" }
)
vim.keymap.set("n", "<leader>.", ":w<CR>", { noremap = true, silent = true, desc = "save" })
vim.keymap.set("n", "<leader>ga", ":!git add %", { noremap = true, silent = true, desc = "add" })
