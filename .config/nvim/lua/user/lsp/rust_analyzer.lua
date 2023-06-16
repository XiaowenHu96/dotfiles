local M = {}
M.server_conf = {
    settings = {
        ['rust-analyzer'] = {
            diagnostics = {
                enable = false,
            },
        }
    }
}
return M
