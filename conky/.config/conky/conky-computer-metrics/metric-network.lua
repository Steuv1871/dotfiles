-- vim: set ft=lua :
-- Script to detect network adapter and replace the second argument of a given conky variable
function conky_add_network_adapter_to (...)
    -- get the network adapter name in the UP state
    local handle = io.popen("ip -br addr | grep UP | awk '{print $1}'")
    local adapter_name = handle:read("*a")
    handle:close()

    local args = {...}
    -- check if more than two arguments are passed
    if #args >= 2 then
        -- replace the second argument with the adapter name
        args[2] = adapter_name
    end

    -- return all arguments between ${ and }
    return "${" .. table.concat(args, " ") .. "}"
end
-- TODO: tester sur garuda et PC boulot pour l'obtention de l'ip: ip addr show | awk '/inet.*brd/{print $NF}' | egrep -v "(br-*)|(docker)" | head -1