
-- lazy
vim.keymap.set("n", "<Leader>l", "<cmd>Lazy<CR>", { desc = "Lazy Menu" })

-- telescope
vim.keymap.set("n", "<Leader>ff", ":Telescope find_files<CR>", { desc = "Find Files" })
vim.keymap.set("n", "<Leader>fd", ":Telescope live_grep<CR>", { desc = "Live Grep" })
vim.keymap.set("n", "<Leader>fw", ":Telescope grep_string<CR>", { desc = "Grep String" })
vim.keymap.set("n", "<Leader>fg", ":Telescope git_files<CR>", { desc = "Find Git Files" })

-- toggleterm
vim.keymap.set("n", "<Leader>tt", "<cmd>ToggleTerm <CR>", { desc = "Toggle Terminal" })
vim.keymap.set("n", "<Leader>th", "<cmd>ToggleTerm direction=horizontal<CR>", { desc = "Toggle Horizontal Terminal" })
vim.keymap.set("n", "<Leader>tv", "<cmd>ToggleTerm direction=vertical size=80<CR>", { desc = "Toggle Vertical Terminal" })
vim.keymap.set("t", "<Leader>tt", "<cmd>ToggleTerm <CR>", { desc = "Toggle Terminal" })
vim.keymap.set('t', "<C-h>", [[<cmd>wincmd h<CR>]])
vim.keymap.set("t", "<C-j>", [[<cmd>wincmd j<CR>]])
vim.keymap.set("t", "<C-k>", [[<cmd>wincmd k<CR>]])
vim.keymap.set("t", "<C-l>", [[<cmd>wincmd l<CR>]])

-- oil
vim.keymap.set("n", "<leader>o", function() require("oil").toggle_float(nil, { preview = { vertical = true } }) end, { desc = "Toggle Oil Float" })
