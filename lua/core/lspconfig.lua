local M = {}

local lspconfig = require"lspconfig"

function M.setup(lsps)
     for _, lsp in ipairs(lsps) do
		if type(lsp) == "table" then
			lspconfig[lsp[1]].setup(lsp[2])
		else
			lspconfig[lsp].setup{}
		end
    end
end

return M
