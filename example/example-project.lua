---@type Package.Manifest
return {
	manifest_version = 1,
	name 			= "example-project",
	version			= { major = 1, minor = 0, bug = 1 },
	authors 		= { "Example Author" },
	license 		= "MIT",
	description 	= "Example project",
	lua_versions	= {
		"JIT",
		"5.1",
	},
	dependencies 	= {
		["manditory-dependency"] = {
			version = { major = 1, minor = 0, bug = 1 },
			type 	= "tarball",
			url 	= "https://example.com/example-dependency.tar.gz",
			debug 	= true
		},
		["my-optional-dependency"] = {
			version 	= { major = 1, minor = 0, bug = 1 },
			type 		= "git",
			repository 	= "example/my-optional-dependency",
			branch 		= "master",
			optional 	= true
		}
	},

	on_build = function(tools, package)
		local stat, err = tools.make {
			target = "all",
			jobs = 4
		}
		if err then error("Could not build package!\n" .. "Error: " .. err) end
	end,

	on_install = function(tools, package)
		local stat, err = tools.make {
			target = "install",
			prefix = package.installation.prefix,
			jobs = 4
		}
		if err then error("Could not install package!\n" .. "Error: " .. err) end
	end
}
