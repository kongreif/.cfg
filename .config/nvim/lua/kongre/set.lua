vim.opt.nu = true
vim.opt.relativenumber = true

vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true

vim.opt.smartindent = true

vim.opt.wrap = false

vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
vim.opt.undofile = true

vim.opt.hlsearch = false
vim.opt.incsearch = true

vim.opt.scrolloff = 8
vim.opt.signcolumn = "yes"
vim.opt.isfname:append("@-@")

vim.opt.updatetime = 50
vim.opt.colorcolumn = "100"

vim.opt.termguicolors = true

-- Autocommands for Markdown files
vim.api.nvim_create_augroup("Markdown", { clear = true })
vim.api.nvim_create_autocmd("FileType", {
    group = "Markdown",
    pattern = {"markdown", "md"},
    callback = function()
        -- Enable visual wrapping at the window edge
        vim.wo.wrap = true                -- Enable wrapping
        vim.wo.linebreak = true           -- Wrap lines at word boundaries
    end,
})

-- Reset settings for non-Markdown files
vim.api.nvim_create_autocmd("FileType", {
    group = "Markdown",
    pattern = "*",
    callback = function()
        if vim.bo.filetype ~= "markdown" and vim.bo.filetype ~= "md" then
            -- Disable wrapping for non-Markdown files
            vim.wo.wrap = false
            vim.wo.linebreak = false
        end
    end,
})
