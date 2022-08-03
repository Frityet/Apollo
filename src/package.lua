---@class Package
local export = {
	name 			= "",
	version 		= {},
	authors 		= {},
	license 		= "",
	description 	= "",
	lua_versions	= {},
	dependencies 	= {},
	on_build = function(package) end,
	on_install = function (package) end,
}

return export
