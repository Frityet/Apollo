return {
	name 			= "apollo",
	version 		= "0.1.0",
	description 	= "Lua package manager, the correct way",
	tags 			= { "lua", "luajit", "package manager" },
	license 		= "GPLv3",
	author 			= { name = "Amrit Bhogal", email = "ambhogal01@gmail.com" },
	homepage 		= "https://github.com/Frityet/Apollo",
	dependencies = {
		"luvit/require",
		"luvit/fs",
		"luvit/secure-socket",
		"luvit/https",
		"creationix/coro-http"
	},
	files = {
		"**.lua",
		"!test*"
	}
  }
