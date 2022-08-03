-- commands 
local c_init = require "commands/init"
local c_install = require "commands/install"
local c_uninstall = require "commands/uninstall"
local c_update = require "commands/update"
local c_search = require "commands/search"
local c_add = require "commands/add"
local c_remove = require "commands/remove"
local c_run = require "commands/run"
local c_build = require "commands/build"
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
        print(c_update.UpdateCommand.Name .. "    " .. c_update.UpdateCommand.Description)
        print(c_search.SearchCommand.Name .. "    " .. c_search.SearchCommand.Description)
        print(c_add.AddCommand.Name .. "       " .. c_add.AddCommand.Description)
        print(c_remove.RemoveCommand.Name .. "    " .. c_remove.RemoveCommand.Description)
        print(c_run.RunCommand.Name .. "       " .. c_run.RunCommand.Description)
        print(c_build.BuildCommand.Name .. "       " .. c_build.BuildCommand.Description)
        return
    --[[ need to impl ]] elseif arg[1] == "--version" then
        print(Lpm.name .. " v" .. Lpm.version)
        return        
    --[[ need to impl ]] elseif arg[1] == "init" then
        if arg[2] == "--help" then
            print(Lpm.name .. " " .. c_init.InitCommand.Usage)
            return
        end
        c_init.Init()
        return
    --[[ need to impl ]] elseif arg[1] == "install" then
        if arg[2] == "--help" then
            print(Lpm.name .. " " .. c_install.InstallCommand.Usage)
            return
        end
        c_install.Install()
        return
    --[[ need to impl ]] elseif arg[1] == "uninstall" then
        if arg[2] == "--help" then
            print(Lpm.name .. " " .. c_uninstall.UninstallCommand.Usage)
            return
        end
        c_uninstall.Uninstall()
        return
    --[[ need to impl ]] elseif arg[1] == "update" then
        if arg[2] == "--help" then
            print(Lpm.name .. " " .. c_update.UpdateCommand.Usage)
            return
        end
        c_update.Update()
        return
    --[[ need to impl ]] elseif arg[1] == "search" then
        if arg[2] == "--help" then
            print(Lpm.name .. " " .. c_search.SearchCommand.Usage)
            return
        end
        c_search.Search()
        return
    --[[ need to impl ]] elseif arg[1] == "add" then
        if arg[2] == "--help" then
            print(Lpm.name .. " " .. c_add.AddCommand.Usage)
            return
        end
        c_add.Add()
        return
    --[[ need to impl ]] elseif arg[1] == "remove" then
        if arg[2] == "--help" then
            print(Lpm.name .. " " .. c_remove.RemoveCommand.Usage)
            return
        end
        c_remove.Remove()
        return
    --[[ need to impl ]] elseif arg[1] == "run" then
        if arg[2] == "--help" then
            print(Lpm.name .. " " .. c_run.RunCommand.Usage)
            return
        end
        c_run.Run()
        return
    --[[ need to impl ]] elseif arg[1] == "build" then
        if arg[2] == "--help" then
            print(Lpm.name .. " " .. c_build.BuildCommand.Usage)
            return
        end
        c_build.Build()
        return
    else
        print("Unknown command: " .. arg[1])
        return
    end

end

Cli()
