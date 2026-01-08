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
-- vim.api.nvim_create_autocmd("BufEnter", {
--   callback = function()
--     local function is_flightaware_repo()
--       local path = vim.api.nvim_buf_get_name(0)
--       return string.find(path, "FlightAware") or string.find(path, "fa_web")
--     end
--
--     if is_flightaware_repo() then
--       vim.cmd([[
--       set smarttab
--       set noexpandtab
--       set shiftwidth=4
--       set tabstop=4
--       set softtabstop=2
--       ]])
--     end
--   end,
-- })

-- lua/config/autocmds.lua

local function is_this_repo(buf)
  local path = (vim.api.nvim_buf_get_name(buf) or ""):lower()
  return path:find("/vhosts/ryang2/fa_web", 1, true) ~= nil
end

local function apply_tabs4(buf)
  -- Run at the tail of the event loop so we win over other handlers
  vim.schedule(function()
    if not vim.api.nvim_buf_is_valid(buf) then
      return
    end
    if not is_this_repo(buf) then
      return
    end
    -- Force real tabs, width 4
    vim.bo[buf].expandtab = false -- noexpandtab
    vim.bo[buf].tabstop = 4
    vim.bo[buf].shiftwidth = 4
    vim.bo[buf].softtabstop = 4
  end)
end

-- Catch normal open/enter cases
vim.api.nvim_create_autocmd({ "BufEnter", "BufWinEnter", "FileType" }, {
  group = vim.api.nvim_create_augroup("ThisRepoTabs4", { clear = true }),
  callback = function(ev)
    apply_tabs4(ev.buf)
  end,
})

-- If you use editorconfig.nvim, it emits this after it sets options.
-- Re-apply our settings right after it runs.
vim.api.nvim_create_autocmd("User", {
  group = vim.api.nvim_create_augroup("ThisRepoTabs4_EditorConfig", { clear = true }),
  pattern = "EditorConfigLoaded",
  callback = function(ev)
    -- ev.buf is provided by editorconfig.nvim; fall back to current buffer
    apply_tabs4(ev.buf or vim.api.nvim_get_current_buf())
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

vim.api.nvim_create_autocmd("FileType", {
  pattern = { "*.md" },
  callback = function()
    vim.opt_local.colorcolumn = "85"
    vim.opt_local.textwidth = 85
  end,
})
