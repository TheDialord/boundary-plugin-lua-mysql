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

     ```Make.bat for Windows
		Makefile for nix-based OS
     ```
	 
2. You may use boundary-meter. Before params.json should be changed for choosen instances.

	```boundary-meter index.lua
     ```

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
|                                               |                                               |

