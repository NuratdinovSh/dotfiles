vim.cmd([[
  highlight Normal guibg=NONE ctermbg=NONE
  highlight NormalNC guibg=NONE ctermbg=NONE
  highlight SignColumn guibg=NONE ctermbg=NONE
  highlight EndOfBuffer guibg=NONE ctermbg=NONE
]])

vim.opt.number = true
vim.opt.numberwidth = 3
vim.opt.fillchars = { eob = " " }
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.softtabstop = 4
vim.opt.expandtab = true

vim.api.nvim_set_hl(0, "Normal", {
    fg = "#eeeeee",
    bg = "NONE",
})

vim.api.nvim_set_hl(0, "String", {
    fg = "#8fb996",
})

vim.api.nvim_set_hl(0, "Number", {
    fg = "#aed9e0",
})

vim.api.nvim_set_hl(0, "Function", {
    fg = "#a3c4f3",
})

vim.api.nvim_set_hl(0, "Keyword", {
    fg = "#faedcd",
})

vim.api.nvim_set_hl(0, "Type", {
    fg = "#bde0fe",
})

vim.api.nvim_set_hl(0, "Constant", {
    fg = "#ffb5a7",
})

vim.api.nvim_set_hl(0, "LineNr", {
    fg = "#6d6875",
})
vim.api.nvim_set_hl(0, "Identifier", {
    fg = "#cdb4db",
})
