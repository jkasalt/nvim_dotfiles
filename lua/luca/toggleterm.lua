require("toggleterm").setup{
	open_mapping = [[<C-t>]],
	size = 40,
	direction = 'float',
	float_opts = {
		border = 'curved',
	},
}

local Terminal = require("toggleterm.terminal").Terminal
local gitui = Terminal:new({cmd = "gitui", hidden = true, })
local opts = {noremap = true, silent = true}

function _gitui_toggle()
    gitui:toggle()
end

vim.api.nvim_set_keymap("n", "<leader>g", "<cmd> lua _gitui_toggle()<CR>", opts)
