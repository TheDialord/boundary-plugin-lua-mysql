--------------------------------------------------------------------------
-- Module to extract Mysql Process Information for Boundary Lua Mysql Plugin
--
-- Author: Yegor Dia
-- Email: yegordia at gmail.com
--
--------------------------------------------------------------------------

local object = require('core').Object
local ffi = require("ffi")

--[[ Check os for binding library path
]]
if ffi.os == "Windows" then
	p("windows OS")
end


local function callIfNotNil(callback, ...)
    if callback ~= nil then
        callback(...)
    end
end

local MysqlInfo = object:extend()

return MysqlInfo