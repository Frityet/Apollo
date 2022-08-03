---@class Package
local export = {
	package_version = 0,
	name 			= "",
	version 		= { 0, 0, 0 },
	authors 		= {},
	license 		= "",
	description 	= "",
	lua_versions	= {},
	dependencies 	= {},
	on_build 		= function (package) end,
	on_install 		= function (package) end,
}

return export
