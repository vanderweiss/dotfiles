local feline = require('feline')
local vi_mode = require('feline.providers.vi_mode')

-- Atelier Global Theme
local atelier_global = {
	fg = '#AAAAAA', 
	bg = '#111110',
	red = '',
	blue = '',
	yellow = '',
	green = '',
	orange = '',
	purple = '',
}

-- Atelier Vi Theme
local atelier_vi_mode = {
	['NORMAL'] = '',
	['COMMAND'] = '',
	['INSERT'] = '',
	['REPLACE'] = '',
	['LINES'] = '',
	['VISUAL'] = '',
	['OP'] = '',
	['BLOCK'] = '',
	['V-REPLACE'] = '',
	['ENTER'] = '',
	['MORE'] = '',
	['SELECT'] = '',
	['SHELL'] = '',
	['TERM'] = '',
	['NONE'] = '',	
}

-- Utils
function get_filename()
	local filename = vim.api.nvim_buf_get_name(0)
	if filename == '' then
		filename = '[no name]'
	end
	return vim.fn.fnamemodify(filename, ':~:.')
end

function get_line_cursor()
	local cursor_line, _ = unpack(vim.api.nvim_win_get_cursor(0))
	return cursor_line
end

function get_line_total()
	return vim.api.nvim_buf_line_count(0)
end

function wrap_box(string)
	return ' -[ ' .. string .. ' ]-'
end

function wrap_left(string)
	return ' ' .. string .. ''
end

function wrap_right(string)
	return '' .. string .. ' '
end

function wrap_both(string) 
	return ' ' .. string .. ' '
end

function wrapped_provider(provider, wrapper)
	return function(component, opts)
		return wrapper(provider(component, opts))
	end
end

-- Providers
function provide_mode(component, opts)
	return vi_mode.get_vim_mode()
end

function provide_filename(component, opts)
	return get_filename()
end

function provide_linenumber(component, opts)
	return get_line_cursor() .. '/' .. get_line_total()
end

-- Status build 
local components = {
	active = {
		{},
		{},
	},
	inactive = {
		{},
		{},
	},
}

local LEFT = 1
local RIGHT = 2

table.insert(components.active[LEFT], {
	name = 'mode',
	provider = wrapped_provider(provide_mode, wrap_box),
	right_sep = '',
	hl = function()
		return {
			bg = atelier_global.bg,
			fg = atelier_global.fg,
		}
	end,
})

table.insert(components.active[LEFT], {
	name = 'filename',
	provider = wrapped_provider(provide_filename, wrap_both),
	right_sep = '',
	hl = {
		bg = atelier_global.bg,
		fg = atelier_global.fg,
  },
})

table.insert(components.active[RIGHT], {
	name = 'linenumber',
	provider = wrapped_provider(provide_linenumber, wrap_right),
	right_step = '',
	hl = {
		bg = atelier_global.bg,
		fg = atelier_global.fg,
	}
})
	
-- Setup
feline.setup {
	theme = atelier_global,
	components = components,
	vi_mode_colors = atelier_vi_mode,
}
