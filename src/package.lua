---@class Package
local export = {
	package_version = 1,
	name            = "",
	version         = {},
	authors         = {},
	license         = "",
	description     = "",
	lua_versions    = {},
	dependencies    = {},
	on_build        = function(package) end,
	on_install      = function(package)
		print("Installing " .. package.name)
	end,
}

return export
