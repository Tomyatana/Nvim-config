-- Telescope
local telescope = require('telescope.builtin')
vim.keymap.set('n', '<leader>f', telescope.find_files, {})
vim.keymap.set('n', '<leader>g', telescope.git_files, {})

-- Neotree
vim.keymap.set('n', '<leader>st', ":Neotree git_status toggle action=show<CR>", {})
vim.keymap.set('n', '<leader>nt', ":Neotree filesystem toggle focus<CR>", {})

-- Controlling buffers
vim.keymap.set("n", "<C-n>", vim.cmd.bnext)
vim.keymap.set("n", "<C-b>", vim.cmd.bprevious)
vim.keymap.set("n", "<C-q>", vim.cmd.bdelete)

-- Moving bewtween windows
vim.keymap.set("n", "<C-h>", "<cmd>wincmd h<cr>")
vim.keymap.set("n", "<C-j>", "<cmd>wincmd j<cr>")
vim.keymap.set("n", "<C-k>", "<cmd>wincmd k<cr>")
vim.keymap.set("n", "<C-l>", "<cmd>wincmd l<cr>")

vim.keymap.set("n", "<leader>,", function ()
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
end)

