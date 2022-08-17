local print = require("pretty-print").prettyPrint
local fs = require("fs")
local https = require("https")

---@param args { action: string, install: boolean, package: string }
return function (args)
    local stream = fs.createWriteStream("file")
    local recv, total = 0, 0
    local done = false
    local chunks = {}

    https.get("https://mirror.alpix.eu/endeavouros/iso/EndeavourOS_Artemis_neo_22_7.iso", function (response)
        response:on("error", function (err)
            return error(err, 1)
        end)

        response:on("response", function (data)
            total = tonumber(data.headers["content-length"]) or 1
        end)

        response:on("data", function (chunk)
            recv = recv + chunk.length
            chunks[#chunks + 1] = chunk
        end)

        response:on("end", function ()
            done = true
        end)
    end)

    repeat io.write("\x1b[33m", tostring(math.floor(recv / total) * 100) , "%\t\r") until done
end
