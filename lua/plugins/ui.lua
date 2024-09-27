return {
	{
		"catppuccin/nvim", name = "catppuccin",
		config = function()
			vim.cmd('colorscheme retrobox')
		end
	},
	{
		"nvim-tree/nvim-web-devicons",
		config = require("nvim-web-devicons").setup{}
    },
}
