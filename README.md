# nanos-multiple
## Works on Windows and Linux

### Each server takes 2 ports
* So if you have 2 servers then you'll have to open ports 7777, 7778 (multiple server), 7779, 7780 (server 1), 7781, 7782 (server 2)

### Edit the Config.lua to add servers config
* Replace the port by {MPORT}
* Replace the query_port by {MQUERYPORT}

### Start the server like you usually do (like with tmux on linux)

### Close the server
* Close them with Ctrl-C, just like normally, spam it a little more if it doesn't close

### Linux only behavior :
* Server logs are stored like that : server1.log, server2.log, ...