require "nvchad.options"

-- Line numbering
vim.opt.number = true
vim.opt.relativenumber = true
-- Indenting
vim.opt.shiftwidth = 4
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.expandtab = true -- use number of space to insert a <Tab>

-- WSL Config
if vim.fn.has("wsl") == 1 then
    -- Clipboard
    if vim.fn.executable("clip.exe") == 0 then
        print("clip not found, clipboard integration won't work")
    else
        vim.g.clipboard = {
            name = "wl-clipboard (wsl)",
            copy = {
                ["+"] = 'clip.exe',
                ["*"] = 'clip.exe',
            },
            paste = {
                ["+"] = (function()
                    return vim.fn.systemlist('powershell.exe -noprofile -command Get-Clipboard', {''}, 1) -- '1' keeps empty lines
                end),
                ["*"] = (function() 
                    return vim.fn.systemlist('powershell.exe -noprofile -command Get-Clipboard', {''}, 1)
                end),
            },
            cache_enabled = true
        }
    end
end