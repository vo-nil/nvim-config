local highlight = {
    "IndentLevel0",
    "IndentLevel1",
    "IndentLevel2",
    "IndentLevel3",
    "IndentLevel4",
    "IndentLevel5",
    "IndentLevel5",
    "IndentLevel5",
    "IndentLevel5",
}

local tmp = {
    {
        {
            {
                {
                    {
                        {
                            "test"
                        }
                    }
                }
            }
        }
    }
}

local hooks = require "ibl.hooks"
-- create the highlight groups in the highlight setup hook, so they are reset
-- every time the colorscheme changes
hooks.register(hooks.type.HIGHLIGHT_SETUP, function()
    vim.api.nvim_set_hl(0, "IndentLevel0", { fg = "#400000" })
    vim.api.nvim_set_hl(0, "IndentLevel1", { fg = "#600000" })
    vim.api.nvim_set_hl(0, "IndentLevel2", { fg = "#800000" })
    vim.api.nvim_set_hl(0, "IndentLevel3", { fg = "#A00000" })
    vim.api.nvim_set_hl(0, "IndentLevel4", { fg = "#C00000" })
    vim.api.nvim_set_hl(0, "IndentLevel5", { fg = "#FF0000" })
end)

require("ibl").setup({
    indent = { highlight = highlight, char = "▏" },
})
