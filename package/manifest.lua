---@class Package.Manifest.Version
---@field major integer
---@field minor integer
---@field bug integer

---@class Package.Dependency
---@field version Package.Manifest.Version
---@field type string
---@field repository string?
---@field branch string?
---@field url string
---@field debug boolean?

---@class Package.Manifest
local export = {
	manifest_version = 0,
	name 			= "",

	---@type Package.Manifest.Version
	version 		= { 0, 0, 0 },

	---@type string[]
	authors 		= {""},
	license 		= "",
	description 	= "",

	---@type string[]
	lua_versions	= {""},

	---@type { [string] : Package.Dependency }
	dependencies 	= { [""] = {} },
	on_build 		= function(tools, cfg) end,
	on_install 		= function(tools, cfg) end,
}

return export
