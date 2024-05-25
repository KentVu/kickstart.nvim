local M = {}

function M.setup(opts)
    require('config.autocmds')
    require('config.options')
    require('config.keymaps')
end

return M

