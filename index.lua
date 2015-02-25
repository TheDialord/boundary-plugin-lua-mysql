local boundary = require('boundary')
local mysqlinfo = require('mysqlinfo')
local net = require('net')

-- Default params
local connections = {
[0] = {
	host = "localhost",
	port = 3306,
	user = "root",
	password = "",
	database = "",
	source = ""
}}

-- Fetching params
if (boundary.param ~= nil) then
  connections = boundary.param or connections
end

print("_bevent:Boundary LUA Mysql plugin up : version 1.0|t:info|tags:lua,plugin")
local dbcon = nil

local function poll(connections)
	if table.getn(connections) > 0 then
		local query = connections[1]
		local host = query.host
		local port = query.port
		local user = query.user
		local password = query.password
		local database = query.database
		local source = query.source
		table.remove(connections, 1)
		
		local dbcon = mysqlinfo:new(host, port, user, password, database, source)

		
		dbcon:establish(function(connection)
			connection:ping( function()    print("ping received")  end)
			dbcon:test(connection, function()
				dbcon:abort(connection, function()
					poll(connections)
				end)
			end)
		end)
		
	end
end

poll(connections)