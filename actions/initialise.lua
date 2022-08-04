return function (...)
	---@type { package: string }
	local args = {...}
	if args.package == nil then error "Expected package!" end
end
