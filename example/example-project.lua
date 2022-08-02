return {
	package_version = 1,
	name 			= "example-project",
	version 		= { 1, 0, 0 },
	authors 		= { "Example Author" },
	license 		= "MIT",
	description 	= "Example project",
	lua_versions	= {
		"LuaJIT",
		"Lua 5.1",
	},
	dependencies 	= {
		["manditory-dependency"] = {
			version = { 1, 0, 0 },
			type 	= "tarball",
			url 	= "https://example.com/example-dependency.tar.gz",
			debug = true
		},
		["my-optional-dependency"] = {
			version 	= { 1, 0, 0 },
			type 		= "github",
			repository 	= "example/my-optional-dependency",
			branch 		= "master",
			optional 	= true
		}
	},

	on_build = function(package)
		local stat, err = tools.make {
			target = "all",
			jobs = 4
		}
		if err then error("Could not build package!\n" .. "Error: " .. err) end
	end
}
