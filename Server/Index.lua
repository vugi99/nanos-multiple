
Package.Require("Config.lua")


function getOS()
    local raw_os_name, raw_arch_name = '', ''
            -- Unix-based OS
            raw_os_name = io.popen('uname -s','r'):read('*l')
            raw_arch_name = io.popen('uname -m','r'):read('*l')
            if raw_os_name == nil and raw_arch_name == nil then
               -- Windows
                local env_OS = os.getenv('OS')
                local env_ARCH = os.getenv('PROCESSOR_ARCHITECTURE')
                if env_OS and env_ARCH then
                    raw_os_name, raw_arch_name = env_OS, env_ARCH
                end
            end
    raw_os_name = (raw_os_name):lower()
    raw_arch_name = (raw_arch_name):lower()

    local os_patterns = {
        ['windows'] = 'Windows',
        ['linux'] = 'Linux',
        ['mac'] = 'Mac',
        ['darwin'] = 'Mac',
        ['^mingw'] = 'Windows',
        ['^cygwin'] = 'Windows',
        ['bsd$'] = 'BSD',
        ['SunOS'] = 'Solaris',
    }
    
    local arch_patterns = {
        ['^x86$'] = 'x86',
        ['i[%d]86'] = 'x86',
        ['amd64'] = 'x86_64',
        ['x86_64'] = 'x86_64',
        ['Power Macintosh'] = 'powerpc',
        ['^arm'] = 'arm',
        ['^mips'] = 'mips',
    }

    local os_name, arch_name = 'unknown', 'unknown'

    for pattern, name in pairs(os_patterns) do
        if raw_os_name:match(pattern) then
            os_name = name
            break
        end
    end
    for pattern, name in pairs(arch_patterns) do
        if raw_arch_name:match(pattern) then
            arch_name = name
            break
        end
    end
    return os_name, arch_name
end
os_name, arch_name = getOS()

local current_server_config = ""
local Server_Index = 1
function StartNextServer()
    if SERVERS_CONFIG[Server_Index] then
        v = SERVERS_CONFIG[Server_Index]
        v = v:gsub("{MPORT}", tostring(START_PORT))
        v = v:gsub("{MQUERYPORT}", tostring(START_PORT + 1))
        START_PORT = START_PORT + 2

        --print(v)

        local config_w = io.open("Config.toml", "w")
        if config_w then
            config_w:write(v)
            io.close(config_w)

            print("Multiple : Starting Server " .. tostring(Server_Index))
            if os_name == "Windows" then
                io.popen("NanosWorldServer.exe")
            else
                os.execute("./NanosWorldServer.sh > server" .. tostring(Server_Index) .. ".log & disown")
            end

            Server_Index = Server_Index + 1

            Timer.SetTimeout(function()
                StartNextServer()
            end, SERVERS_START_INTERVAL)
        else
            error("Can't open Config.toml in write mode")
        end
    elseif Server_Index > 1 then
        local config_w = io.open("Config.toml", "w")
        if config_w then
            config_w:write(current_server_config)
            io.close(config_w)

            print("Multiple : DONE")
        else
            error("Can't open Config.toml in write mode")
        end
    end
end

Package.Subscribe("Load", function()
    Timer.SetTimeout(function()
        local config_file = io.open("Config.toml", "r")
        if config_file then
            current_server_config = config_file:read("*a")
            io.close(config_file)

            StartNextServer()
        else
            error("Can't find Config.toml file")
        end
    end, WAIT_TO_START_SERVER)
end)