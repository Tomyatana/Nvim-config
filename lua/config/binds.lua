-- Telescope
local telescope = require('telescope.builtin')

vim.keymap.set('n', '<leader>ff', telescope.find_files, {})
vim.keymap.set('n', '<leader>fg', telescope.git_files, {})
vim.keymap.set('n', '<leader>vkh', telescope.keymaps, {})
vim.keymap.set('n', '<leader>fb', telescope.buffers, {})
vim.keymap.set('n', '<leader>fw', telescope.live_grep, {})

-- Moving bewtween windows
vim.keymap.set("n", "<C-h>", "<cmd>wincmd h<cr>")
vim.keymap.set("n", "<C-j>", "<cmd>wincmd j<cr>")
vim.keymap.set("n", "<C-k>", "<cmd>wincmd k<cr>")
vim.keymap.set("n", "<C-l>", "<cmd>wincmd l<cr>")

vim.keymap.set("n", "<leader>,", function ()
    local line = vim.api.nvim_get_current_line()
    if line:sub(-1) == ';' then
        line = line:sub(1, -2)
        else
            line = line .. ';'
        end
    vim.api.nvim_set_current_line(line)
end)


-- Harpoon
local harpoon = require('harpoon')

harpoon:setup()

vim.keymap.set('n', "<leader>ha", function() harpoon:list():add() end)
vim.keymap.set('n', "<C-e>", function() harpoon.ui:toggle_quick_menu(harpoon:list()) end)

vim.keymap.set('n', "<leader>h1", function() harpoon:list():select(1) end)
vim.keymap.set('n', "<leader>h2", function() harpoon:list():select(2) end)
vim.keymap.set('n', "<leader>h3", function() harpoon:list():select(3) end)
vim.keymap.set('n', "<leader>h4", function() harpoon:list():select(4) end)
vim.keymap.set('n', "<leader>h4", function() harpoon:list():select(4) end)

vim.keymap.set('n', "<leader>hn", function() harpoon:list():next() end)
vim.keymap.set('n', "<leader>hb", function() harpoon:list():prev() end)
