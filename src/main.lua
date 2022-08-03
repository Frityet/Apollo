-- commands 
local c_init = require "commands/init"
local c_install = require "commands/install"
local c_uninstall = require "commands/uninstall"

Lpm = {
    name = "lpm",
    version = "1.0.0"
}

function Cli()
    if arg[1] == "--help" then
        print("Usage: " .. Lpm.name .. " command [options]")
        print("\nCommands:")
        print(c_init.InitCommand.Name .. "      " .. c_init.InitCommand.Description)
        print(c_install.InstallCommand.Name .. "   " .. c_install.InstallCommand.Description)
        print(c_uninstall.UninstallCommand.Name .. " " .. c_uninstall.UninstallCommand.Description)
        return
    elseif arg[1] == "--version" then
        print(Lpm.name .. " v" .. Lpm.version)
        return
    elseif arg[1] == "init" then
        if arg[2] == "--help" then
            print(Lpm.name .. " " .. c_init.InitCommand.Usage)
            return
        end
        c_init.Init()
        return
    elseif arg[1] == "install" then
        if arg[2] == "--help" then
            print(Lpm.name .. " " .. c_install.InstallCommand.Usage)
            return
        end
        c_install.Install()
        return
    elseif arg[1] == "uninstall" then
        if arg[2] == "--help" then
            print(Lpm.name .. " " .. c_uninstall.UninstallCommand.Usage)
            return
        end
        c_uninstall.Uninstall()
        return
    elseif arg[1] == "update" then
        return
    elseif arg[1] == "search" then
        return
    elseif arg[1] == "add" then
        return
    elseif arg[1] == "remove" then
        return
    elseif arg[1] == "run" then
        return
    elseif arg[1] == "build" then
        return
    else
        print("Unknown command: " .. arg[1])
        return
    end

end

Cli()
