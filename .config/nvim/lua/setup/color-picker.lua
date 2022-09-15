local opts = { noremap = true, silent = true }
vim.keymap.set("n", "<C-c>", "<cmd>PickColor<cr>", opts)
vim.keymap.set("i", "<C-c>", "<cmd>PickColorInsert<cr>", opts)

-- vim.keymap.set("n", "your_keymap", "<cmd>ConvertHEXandRGB<cr>", opts)
-- vim.keymap.set("n", "your_keymap", "<cmd>ConvertHEXandHSL<cr>", opts)

require("color-picker").setup {
	["icons"] = { "ﱢ", "" },
	["border"] = "single",
	["keymap"] = {
		["U"] = "<Plug>ColorPickerSlider5Decrease",
		["O"] = "<Plug>ColorPickerSlider5Increase",
	},
	["background_highlight_group"] = "Normal",
	["border_highlight_group"] = "FloatBorder",
  ["text_highlight_group"] = "Normal",
}

vim.cmd([[hi FloatBorder guibg=NONE]])
