local export = {}

---@diagnostic disable-next-line
function switch(condition)
	---@param cases { [string | number]: fun(), default: fun() }
	return function (cases)
		for k, v in pairs(cases) do
			if condition == k then
				return v()
			end
		end
		cases.default()
	end
end


return export
