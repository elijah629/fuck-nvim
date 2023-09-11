local M = {}

local lspconfig = require"lspconfig"

function M.setup(lsps)
	for _, lsp in pairs(lsps) do
		lspconfig[lsp].setup{}
	end
end

return M
