function ColorMyPencils(color)
	color = color or "rose-pine"
	vim.cmd.colorscheme(color)

	vim.api.nvim_set_hl(0, "Normal", { bg = "black", fg = "wheat" })
	vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none", fg = "wheat" })

	vim.api.nvim_set_hl(0, "NonText", { fg = "#400000" })
	vim.api.nvim_set_hl(0, "Whitespace", { fg = "#008000" })


end

ColorMyPencils()
