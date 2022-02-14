
WAIT_TO_START_SERVER = 8000

SERVERS_START_INTERVAL = 4000

START_PORT = 7779

SERVERS_CONFIG = {
    [[
# server configurations
[server]
    # server name
    name =              "nanos world server"
    # server description (max 127 characters)
    description =       ""
    # server logo URL (recommended size: 150x75)
    logo =              ""
    # max players
    max_players =       64
    # leave it blank for no password
    password =          ""
    # server IP. we recommend leaving it 0.0.0.0 for default
    ip =                "0.0.0.0"
    # server port (TCP and UDP forwarding needed)
    port =              {MPORT}
    # query port (UDP forwarding needed)
    query_port =        {MQUERYPORT}
    # announce server in the master server list
    announce =          true
    # server tick rate in milliseconds (dangerous! server will tick at each [tick_rate] ms, affecting both server and client performance. 33 ms means 30 ticks per second and is the default and recommended value)
    tick_rate =         33
    # log Level. (1) normal - (2) debug - (3) verbose
    log_level =         1

# nanos world configurations
[world]
    # game-mode package to load (set the main game-mode package to load - you can load only one 'game-mode' package type at once)
    game_mode =         ""
    # loading-screen package to load (the loading screen will be displayed when players join your server)
    loading_screen =    ""
    # packages script list (leave it blank to load all packages, this is usually useful when you have tons of packages downloaded and only wants to load one or some)
    packages = [
        "test1"
    ]
    # asset packs list (this will additionally load the asset packs you define here)
    assets = [
        
    ]
    # default startup map
    map =               "nanos-world::BlankMap"
    # banned IPs
    banned_ips = [
        
    ]

    ]],







    [[
# server configurations
[server]
    # server name
    name =              "nanos world server 2"
    # server description (max 127 characters)
    description =       ""
    # server logo URL (recommended size: 150x75)
    logo =              ""
    # max players
    max_players =       64
    # leave it blank for no password
    password =          ""
    # server IP. we recommend leaving it 0.0.0.0 for default
    ip =                "0.0.0.0"
    # server port (TCP and UDP forwarding needed)
    port =              {MPORT}
    # query port (UDP forwarding needed)
    query_port =        {MQUERYPORT}
    # announce server in the master server list
    announce =          true
    # server tick rate in milliseconds (dangerous! server will tick at each [tick_rate] ms, affecting both server and client performance. 33 ms means 30 ticks per second and is the default and recommended value)
    tick_rate =         33
    # log Level. (1) normal - (2) debug - (3) verbose
    log_level =         1

# nanos world configurations
[world]
    # game-mode package to load (set the main game-mode package to load - you can load only one 'game-mode' package type at once)
    game_mode =         ""
    # loading-screen package to load (the loading screen will be displayed when players join your server)
    loading_screen =    ""
    # packages script list (leave it blank to load all packages, this is usually useful when you have tons of packages downloaded and only wants to load one or some)
    packages = [
        "test2"
    ]
    # asset packs list (this will additionally load the asset packs you define here)
    assets = [
        
    ]
    # default startup map
    map =               "nanos-world::TestingMap"
    # banned IPs
    banned_ips = [
        
    ]

    ]],
}