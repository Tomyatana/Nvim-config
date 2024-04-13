function add_semicolon()
    local buf = vim.api.nvim_get_current_buf()
    local win = vim.api.nvim_get_current_win()
    local line, _ = unpack(vim.api.nvim_win_get_cursor(win))
    local lines = vim.api.nvim_buf_get_lines(buf, line-1, line, false)
    local content = lines[1]
    if content:sub(-1) == ';' then
        content = content:sub(1, -2)
        else
            content = content .. ';'
        end
    vim.api.nvim_buf_set_lines(buf, line-1, line, false, {content})
end

vim.keymap.set("n", "<leader>,", function() add_semicolon() end)
