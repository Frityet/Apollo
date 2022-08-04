local export = {}

---@class NetworkingRequest
export.NetworkingRequest = {
	url 		= "",
	progress 	= 0.0,
	done 		= false
}

---@class DownloadQueue
export.DownloadQueue = {
	---@type NetworkingRequest[]
	requests = {},

	---@type thread
	thread = nil
}

---@param requests { url: string, headers: string[] }[]
local function do_work(requests)
	for i, v in ipairs(requests) do
		
	end
end

---@return DownloadQueue
function export.DownloadQueue.create()
	---@type DownloadQueue
	local ret = {
		requests = {},
		thread = {}
	}

	ret.thread = coroutine.create(function()
		do_work(ret.requests)
	end)

	return ret
end

return export
