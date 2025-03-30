-- This file  needs to have same structure as nvconfig.lua 
-- https://github.com/NvChad/NvChad/blob/v2.5/lua/nvconfig.lua

---@type ChadrcConfig
local M = {}

-- import headers table
local header = require("configs.nvdash_headers")

M.ui = {
	theme = "tokyonight",
	transparency = true,
	-- hl_override = {
	-- 	Comment = { italic = true },
	-- 	["@comment"] = { italic = true },
	-- },
	statusline = {
		theme = "default",
		separator_style = "default",
	},
}

M.nvdash = {
	load_on_startup = true,
	header = header["random"],
}

M.colorify = {
	enabled = true,
	mode = "virtual", -- fg, bg, virtual
	virt_text = "󱓻 ",
	highlight = { hex = true, lspvars = true },
}

M.mason = { 
	pkgs = { 
		"yamlfmt", "tex-fmt", "sql-formatter", "nixpkgs-fmt", 
		"prettier", "isort", "mypy", "jsonlint", "htmlhint", 
		"gitlint", "cspell", "debugpy","bash-debug-adapter", 
		"yaml-language-server", "sqlls", "ruff-lsp", "ruff", 
		"pyright", "powershell-editor-services", "markdown-oxide", 
		"json-lsp", "dockerfile-language-server", "bash-language-server", 
		"css-lsp", "html-lsp", "lua-language-server", 
		"stylua", "typescript-language-server",
	}, 
	skip = {} }

return M
