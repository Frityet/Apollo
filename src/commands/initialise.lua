local Command = require("commands.command")

return Command {
	name = "init",
	description = "Initialise a new package",
	usage = "apollo init [package_name]",
	short = "i",
	on_execute = function (...) end
}
