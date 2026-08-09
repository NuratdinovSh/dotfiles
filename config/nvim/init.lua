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

local colors = {
    bg       = "#101114",
    fg       = "#FEFCFD",

    black    = "#17181C",
    red      = "#e8998d",
    green    = "#52B788",
    yellow   = "#f4d58d",
    blue     = "#83C5BE",
    magenta  = "#EA9AB2",
    cyan     = "#56b6c2",
    white    = "#D8DEE9",

    cursor   = "#BFCDE0",
    selection = "#30343F",
}

vim.api.nvim_set_hl(0, "Normal", {
    fg = colors.fg,
    bg = "NONE",
})

vim.api.nvim_set_hl(0, "Comment", {
    fg = colors.blue,
})

vim.api.nvim_set_hl(0, "String", {
    fg = colors.green,
})

vim.api.nvim_set_hl(0, "Number", {
    fg = colors.yellow,
})

vim.api.nvim_set_hl(0, "Function", {
    fg = colors.cyan,
})

vim.api.nvim_set_hl(0, "Keyword", {
    fg = colors.magenta,
})

vim.api.nvim_set_hl(0, "Type", {
    fg = colors.blue,
})

vim.api.nvim_set_hl(0, "Constant", {
    fg = colors.red,
})

vim.api.nvim_set_hl(0, "LineNr", {
    fg = colors.blue,
})

vim.api.nvim_set_hl(0, "CursorLineNr", {
    fg = colors.fg,
})
