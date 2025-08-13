-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
-- Add any additional autocmds here

-- Get rid of soft-white background.
vim.api.nvim_create_autocmd("BufEnter", {
  command = "highlight Normal guibg=none",
})

-- Use native CFilter package for quickfix list.
vim.api.nvim_create_autocmd("BufEnter", {
  command = "packadd cfilter",
})

-- FlightAware format settings
vim.api.nvim_create_autocmd("BufEnter", {
  callback = function()
    local function is_flightaware_repo()
      local path = vim.api.nvim_buf_get_name(0)
      return string.find(path, "FlightAware") or string.find(path, "fa_web")
    end

    if is_flightaware_repo() then
      vim.cmd([[
      set smarttab
      set noexpandtab
      set shiftwidth=4
      set tabstop=4
      set softtabstop=2
      ]])
    end
  end,
})

vim.api.nvim_create_autocmd({ "BufNewFile", "BufRead" }, {
  pattern = { "*.rvt", "*.tcl" },
  command = "set filetype=tcl",
})

vim.api.nvim_create_autocmd("BufWritePre", {
  pattern = { "*.tcl", "*.rvt" },
  callback = function()
    vim.cmd([[
    %s/\s\+$//e
    ]])
  end,
})
