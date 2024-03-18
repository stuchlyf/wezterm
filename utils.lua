local module = {}

--- very primitive function to detect which os is running.
--- only detects windows or "unix" (macos/linux).
---@return string os_name "windows" or "unix"
local function detect_os()
	if os.getenv("HOME") == nil then
		return "windows"
	else
		return "unix"
	end
end

function module.get_shell()
	local shell_table = {}
	local os_name = detect_os()

	if os_name == "windows" then
		shell_table[1] = "pwsh"
		shell_table[2] = "-NoLogo"
	elseif os_name == "linux" then
		shell_table[1] = "fish"
	end

	return shell_table
end

function module.get_home_directory()
	local os_name = detect_os()

	if os_name == "windows" then
		return os.getenv("USERPROFILE")
	elseif os_name == "unix" then
		return os.getenv("HOME")
	end
end

return module
