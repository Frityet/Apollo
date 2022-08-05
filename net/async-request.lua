local http = require("coro-http")
local utilities = require("utils")

---@class RequestQueue
local export = {
    ---@class RequestQueue.Request
    ---@field body string
    ---@field head string

    ---@type RequestQueue.Request[] | thread[]
    requests = {
        body = "",
        head = ""
    },
    finished = 0,
    waiting_all = {},
    waiting_individual = {}
}

export.__index = export

---@return RequestQueue
function export.create()
    local self = setmetatable({}, export)

    self.requests = {}
    self.finished = 0

    self.waiting_all = {}
    self.waiting_individual = {}

    return self
end

---@param id integer
---@return nil
function export:_notify(id)
    if self.waiting_individual[id] then
        for _, thread in ipairs(self.waiting_individual[id]) do
            utilities.assertResume(thread, self.requests[id])
        end
    end

    if self.finished == #self.requests then
        for _, thread in ipairs(self.waiting_all) do
            utilities.assertResume(thread)
        end
    end
end

---@param id integer    
---@param method string
---@param url string
---@param headers string[]?
---@param payload string?
function export:_request(id, method, url, headers, payload)
    local res, body = http.request(method, url, headers, payload)

    self.requests[id] = { head = res, body = body }
    self.finished = self.finished + 1

    self:_notify(id)
end

---Adds a request to the queue.
---@param method "GET" | "POST" | "PUT" | "DELETE"
---@param url string
---@param headers string[]?
---@param payload string?
---@return integer
function export:add(method, url, headers, payload)
    local id = #self.requests + 1
    self.requests[id] = coroutine.create(export._request)

    assert(type(self.requests[id]) == "thread")
    coroutine.resume(self.requests[id]--[[@as thread]], self, id, method, url, headers, payload)

    return id
end

---@param id integer?
---@return RequestQueue.Request | thread?
function export:wait(id)
    if id == nil then
        if self.finished == #self.requests then
            return nil
        else
            table.insert(self.waiting_all, (coroutine.running()))

            return coroutine.yield()
        end
    else
        if type(self.requests[id]) == 'thread' then
            self.waiting_individual[id] = self.waiting_individual[id] or {}

            table.insert(self.waiting_individual[id], (coroutine.running()))

            return coroutine.yield()
        else
            return self.requests[id]
        end
    end
end

return export