-- Bluloco colorscheme - Zero external dependencies
local M = {}

local isGui = vim.fn.has("gui_running") == 1

local defaultConfig = {
  style            = "auto", -- auto | light | dark
  transparent      = false,
  italics          = false,
  terminal         = isGui,
  guicursor        = true,
  rainbow_headings = false,
  float_window     = "default", -- "default" | "transparent"
}

M.config = defaultConfig

function M.setup(options)
  M.config = vim.tbl_deep_extend("force", {}, defaultConfig, options or {})

  -- Set cursor color
  if (M.config.guicursor) then
    vim.opt.guicursor = "n-v-c-sm:block-Cursor,i-ci-ve:ver25-Cursor,r-cr-o:hor20-Cursor"
  end
end

function M.load()
  -- Reset highlighting
  if vim.g.colors_name then
    vim.cmd("hi clear")
  end

  if vim.fn.exists("syntax_on") then
    vim.cmd("syntax reset")
  end

  vim.g.colors_name = 'bluloco'

  -- Apply all highlights
  require('bluloco.highlights').setup(M.config)
end

return M
