local http = require("coro-http")

---@param args { package: string }
return function (args)
    local head, body = http.request("GET", args.package)

    print(head)

    return body
end
