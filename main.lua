---@diagnostic disable-next-line 
arg = { [0] = "", unpack(args) }

local uv = require("uv")

---@class ArgumentParser
local ArgumentParser = require("argparse")

---@module "actions"
local actions = require("./actions")

local cmdparser = ArgumentParser() {
    name 			= "Apollo",
    description 	= "A package manager for Lua",
    epilog			= "https://github.com/Frityet/Apollo",
    command_target 	= "action"
}
cmdparser:add_complete()

local commands = {}
---Adds a command to the parser, with its options and arguments.
---@param name string The name of the command.
---@return fun(args: { commands: { [string]: {} }, options: { [string]: {} }? }): nil
function commands:add(name)
    commands[name] = cmdparser:command(name)
    ---@param args { commands: { [string]: {} }, options: { [string]: {} }? }
    return function (args)
        for k, v in pairs(args.commands) do
            commands[name]:argument(k) { unpack(v) }
        end

        if args.options ~= nil then
            for k, v in pairs(args.options) do
                commands[name]:option("-" .. k:sub(2, 2) .. " --" .. k) { unpack(v) }
            end
        end
    end
end

commands:add("initialise") {
    commands = {
        directory = {
            description = "Initalises a new package in the given directory",
            args = 1,
            default = "./"
        }
    }
}

commands:add("install") {
    commands = {
        package = {
            description = "Installs the given package",
            args = 1
        }
    }
}

commands:add("uninstall") {
    commands = {
        package = {
            description = "Dependency to remove",
            args = 1
        }
    }
}

commands:add("build") {
    commands = {
        directory = {
            description = "Builds package in the given directory",
            args = 1,
            default = "./"
        }
    }
}

commands:add("run") {
    commands = {
        directory = {
            description = "Runs package in the given directory",
            args = 1,
            default = "./"
        }
    }
}

commands:add("add") {
    commands = {
        package = {
            description = "Dependency to add",
            args = 1
        },
        directory = {
            description = "Package path to add to",
            args = 1,
            default = "./"
        }
    }
}

commands:add("remove") {
    commands = {
        package = {
            description = "Dependency to remove",
            args = 1
        },
        directory = {
            description = "Package path to remove from",
            args = 1,
            default = "./"
        }
    }
}

commands:add("search") {
    query = {
        directory = {
            description = "Packages to search",
            args = '+'
        }
    }
}

commands:add("info") {
    commands = {
        package = {
            description = "Package to show info for",
            args = 1
        }
    }
}

---@type { action: string, install: boolean, package: string?, directory: string?, [string]: string | number | boolean }
local args = cmdparser:parse(arg)

coroutine.wrap(function ()
    actions[args.action](args)
end)()

uv.run()
