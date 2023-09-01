local M = {}

M.setup = function(mappings)
  local mappings = require(mappings)
  vim.schedule(function()
    for mode, maps in pairs(mappings) do
      for keybind, mapping in pairs(maps) do
        local action = mapping[1]
        local description = mapping[2]

        vim.keymap.set(mode, keybind, action, {
            desc = description
        })
      end
    end
  end)
end

return M