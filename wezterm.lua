local wezterm = require("wezterm")

local utils = require("utils")

local config = {}

config.default_prog = utils.get_shell()

local default_default_cwd = utils.get_home_directory()
local custom_default_cwd = os.getenv("WEZTERM_DEFAULT_CWD")
config.default_cwd = custom_default_cwd == nil and default_default_cwd or custom_default_cwd

config.font = wezterm.font("ComicShannsMono Nerd Font")

config.color_scheme = "catppuccin-mocha"

return config
