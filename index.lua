local boundary = require('boundary')
local mysqlinfo = require('mysqlinfo')
local table = require('table')

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

	dbcon = nil
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
			dbcon:get_server_status_metrics(connection, function(server_status_metrics)
				p(string.format("MYSQL_THREADS_CONNECTED %s %s", server_status_metrics['Threads_connected'], source))
				p(string.format("MYSQL_THREADS_RUNNING %s %s", server_status_metrics['Threads_running'], source))
				p(string.format("MYSQL_TABLE_LOCKS_WAITED %s %s", server_status_metrics['Table_locks_waited'], source))
				p(string.format("MYSQL_TABLE_LOCKS_IMMEDIATE %s %s", server_status_metrics['Table_locks_immediate'], source))
				p(string.format("MYSQL_SLOW_QUERIES %s %s", server_status_metrics['Slow_queries'], source))
				p(string.format("MYSQL_QCACHE_FREE_MEMORY %s %s", server_status_metrics['Qcache_free_memory'], source))
				p(string.format("MYSQL_MAX_USED_CONNECTIONS %s %s", server_status_metrics['Max_used_connections'], source))
			
				--dbcon:get_stats_per_sec(connection, function(per_sec_stats) 
					--p(string.format("MYSQL_QUERIES_PER_SEC %s %s", per_sec_stats['Queries_per_sec'], source))
				
				dbcon:abort(connection, function()
					poll(connections)
				end)
				--end)
			end)
		end)
		
	end
end

poll(connections)