local lsp = require('lsp-zero')

lsp.preset('recommended')

local cmp = require('cmp')
local cmp_select = { behavior = cmp.SelectBehavior.Select }
local cmp_mappings = lsp.defaults.cmp_mappings({
	['<C-p>'] = cmp.mapping.select_prev_item(cmp_select),
	['<C-n>'] = cmp.mapping.select_next_item(cmp_select),
	['<C-y>'] = cmp.mapping.confirm({select = true}),
	['<C-Space>'] = cmp.mapping.complete(),
})

lsp.setup_nvim_cmp({
	mapping = cmp_mappings
})

lsp.on_attach(function(client, bufnr)

	local nmap = function(keys, func, desc)
		if desc then
			desc = 'LSP: ' .. desc
		end

		vim.keymap.set('n', keys, func, { buffer = bufnr, desc = desc })
	end

	nmap("gd",          vim.lsp.buf.definition, "[G]oto [D]efinition")
	nmap("gr",          require('telescope.builtin').lsp_references, "[G]oto [R]eferences")
	nmap("K",           vim.lsp.buf.hover, "Hover Documentation")
	nmap("<leader>vws", vim.lsp.buf.workspace_symbol, "Workspace Symbols")
	nmap("<leader>vd",  vim.diagnostic.open_float, "Open diagnostics float")
	nmap("[d",          vim.diagnostic.goto_prev, "Previous diagnostics")
	nmap("]d",          vim.diagnostic.goto_next, "Next diagnostics")
	nmap("<leader>vca", vim.lsp.buf.code_action, "Code actions")
	nmap("<leader>vrr", vim.lsp.buf.references, "References")
	nmap("<leader>vrn", vim.lsp.buf.rename, "Rename")
	nmap("<C-h>",       vim.lsp.buf.signature_help, "Signature documentation")

	nmap('<leader>e',   vim.diagnostic.open_float, "Open floating diagnostic message")
	nmap('<leader>q',   vim.diagnostic.setloclist, "Open diagnostics list")
end)

lsp.setup({
	on_attach = on_attach
})

vim.diagnostic.config({
	virtual_text = true
})
