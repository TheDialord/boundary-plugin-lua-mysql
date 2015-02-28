Boundary MySQL Plugin
--------------------------
Extracts metrics from a MySQL database instances.

### Prerequisites

|     OS    | Linux | Windows | SmartOS | OS X |
|:----------|:-----:|:-------:|:-------:|:----:|
| Supported |   v   |    v    |    v    |  v   |


|  Runtime | node.js | Python | Java | LUA |
|:---------|:-------:|:------:|:----:|:---:|
| Required |         |       |       |  +  |

- [How to install Luvit (LUA)?](https://luvit.io/)

### Plugin Setup

#### Installation of Luvit to test plugin

1. Compile Luvit from SRC

     ```Make.bat``` for Windows ```Makefile``` for nix-based OS
	 
2. You may use boundary-meter. Before params.json should be changed for choosen instances.

	```boundary-meter index.lua```

### Plugin Configuration Fields
|Field Name|Description                                     |
|:-------|:-------------------------------------------------|
|host    |database host name or IP                          |
|port    |MySQL Port                                        |
|database|database name                                     |
|username|MySQL username                                    |
|password|MySQL Password (if not required put anything)     |
|source  |display name                                      |

### Metrics Collected

|Metric Name                                    |Description                                    |
|:----------------------------------------------|:----------------------------------------------|
|MYSQL_THREADS_CONNECTED|The number of currently open connections|
|MYSQL_THREADS_RUNNING|The number of threads that are not sleeping|
|MYSQL_TABLE_LOCKS_WAITED|The number of times that a request for a table lock could not be granted immediately and a wait was needed. If this is high and you have performance problems, you should first optimize your queries, and then either split your table or tables or use replication|
|MYSQL_TABLE_LOCKS_IMMEDIATE|The number of times that a request for a table lock could be granted immediately.|
|MYSQL_SLOW_QUERIES|The number of queries that have taken more than long_query_time seconds.|
|MYSQL_QCACHE_FREE_MEMORY|The amount of free memory for the query cache.|
|MYSQL_MAX_USED_CONNECTIONS|The maximum number of connections that have been in use simultaneously since the server started.|

