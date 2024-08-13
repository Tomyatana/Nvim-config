return {
	{
		"catppuccin/nvim", name = "catppuccin",
		config = function()
			vim.cmd([[colorscheme catppuccin-mocha]])
		end
	},
	{
		"nvim-tree/nvim-web-devicons",
		config = require("nvim-web-devicons").setup{}
    },
    {
        "nvim-lualine/lualine.nvim",
    },
    {
        "willothy/nvim-cokeline",
        dependencies = {
            "nvim-lua/plenary.nvim",        -- Required for v0.4.0+
            "nvim-tree/nvim-web-devicons", -- If you want devicons
            "stevearc/resession.nvim"       -- Optional, for persistent history
        },
        config = true
    }
}

