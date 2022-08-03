local print = require("pretty-print").prettyPrint

return function (...)
	print({...})
end
