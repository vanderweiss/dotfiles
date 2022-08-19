vim.g.indentLine_char = '┆'

require('indent_blankline').setup {
	space_char_blankline = " ",
	show_current_context = true,
	show_current_context_start = true,
	show_trailing_backline_indent = false
}
