local print = require("pretty-print").prettyPrint

---@module "net.async-request"
local RequestQueue = require("../net/async-request")

---@param args {  }
return function (args)
	local queue = RequestQueue.create()
	local reqs = {
		queue:add("GET", "https://gist.githubusercontent.com/truemedian/9f52aedd31ab5952da980b0e02b3a3d8/raw/d3b42159ddc7d0d9d2523eb62720b18b66570832/dload.lua"),
		queue:add("GET", "https://gist.githubusercontent.com/truemedian/9f52aedd31ab5952da980b0e02b3a3d8/raw/d3b42159ddc7d0d9d2523eb62720b18b66570832/dload.lua"),
		queue:add("GET", "https://gist.githubusercontent.com/truemedian/9f52aedd31ab5952da980b0e02b3a3d8/raw/d3b42159ddc7d0d9d2523eb62720b18b66570832/dload.lua")
	}

	local ret = queue:wait();
	switch (type(ret)) {
		["table"] = function ()
			print(ret)
		end,
		["thread"] = function ()
			print(coroutine.resume(ret --[[@as thread]]))
		end,
		default = function ()
			error("Unexpected type to return (" .. type(ret) .. ")", 1)
			return nil
		end
	}
end
