vim.opt.guicursor = ""

vim.opt.nu = true
vim.opt.relativenumber = true

vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true

vim.opt.smartindent = true

vim.opt.wrap = false

vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
vim.opt.undofile = true

vim.opt.hlsearch = false
vim.opt.incsearch = true

vim.opt.termguicolors = true

vim.opt.scrolloff = 8
vim.opt.signcolumn = "yes"
vim.opt.isfname:append("@-@")

vim.opt.updatetime = 50

vim.opt.colorcolumn = "80"
-- Define a custom highlight group for TODO
vim.api.nvim_set_hl(0, "TodoHighlight", { fg = "#FF0000" }) -- Red color
vim.api.nvim_set_hl(0, "NOTEHighlight", { fg = "#0000FF" }) -- Red color

-- Create an autocommand group
vim.api.nvim_create_augroup("HighlightTODO", { clear = true })
vim.api.nvim_create_augroup("HighlightNOTE", { clear = true })

-- Add a pattern match for TODO
-- TODO: testing
vim.api.nvim_create_autocmd("BufReadPost", {
    group = "HighlightTODO",
    pattern = "*",
    callback = function()
        vim.fn.matchadd("TodoHighlight", "\\<TODO\\>")
    end,
})

vim.api.nvim_create_autocmd("BufReadPost", {
    group = "HighlightNOTE",
    pattern = "*",
    callback = function()
        vim.fn.matchadd("NoteHighlight", "\\<NOTE\\>")
    end,
})

