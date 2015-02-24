local boundary = require('boundary')
local mysqlinfo = require('mysqlinfo')

-- Default params
local connections = {
[0] = {
	
}}

-- Fetching params
if (boundary.param ~= nil) then
  connections = boundary.param or connections
end

print("_bevent:Boundary LUA Mysql plugin up : version 1.0|t:info|tags:lua,plugin")
local dbcon = nil

local function poll(connections)
	p("run poll for mysql")
end

poll(connections)