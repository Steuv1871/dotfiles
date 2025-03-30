-- Inspired by @doctorfree https://github.com/doctorfree/NvChad-custom
-- Contain a list of headers for the nvdash
-- Return a table with dofferents headers and a random option
-- usage for a selected header: require("configs.nvdash_headers")["h1"]
-- usage for a random header: require("configs.nvdash_headers")["random"]

local headers = {
  ["h1"] = {
    [[  █▄▄▄▄ ▄▄▄ █ ▄ ▄▄▄ ▄ ▄▄▄ ▄ ▄ █ ▄]],
    [[▄ █ █▄█ █▄█ █ █ █▄█ █ █▄█ ▄▄▄ █ █]],
    [[█▄█ ▄ █▄▄█▄▄█ █ ▄▄█ █ ▄ █ █▄█▄█ █]],
    [[    █▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄█ █▄█▄▄▄█    ]],
  },
  ["h2"] = {
    [[           ▄ ▄                   ]],
    [[       ▄   ▄▄▄     ▄ ▄▄▄ ▄ ▄     ]],
    [[       █ ▄ █▄█ ▄▄▄ █ █▄█ █ █     ]],
    [[    ▄▄ █▄█▄▄▄█ █▄█▄█▄▄█▄▄█ █     ]],
    [[  ▄ █▄▄█ ▄ ▄▄ ▄█ ▄▄▄▄▄▄▄▄▄▄▄▄▄▄  ]],
    [[  █▄▄▄▄ ▄▄▄ █ ▄ ▄▄▄ ▄ ▄▄▄ ▄ ▄ █ ▄]],
    [[▄ █ █▄█ █▄█ █ █ █▄█ █ █▄█ ▄▄▄ █ █]],
    [[█▄█ ▄ █▄▄█▄▄█ █ ▄▄█ █ ▄ █ █▄█▄█ █]],
    [[    █▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄█ █▄█▄▄▄█    ]],
  },
  -- ["ogre"] = {
  --   [[      __         ___ _               _  ]],
  --   [[   /\ \ \__   __/ __\ |__   __ _  __| | ]],
  --   [[  /  \/ /\ \ / / /  | '_ \ / _` |/ _` | ]],
  --   [[ / /\  /  \ V / /___| | | | (_| | (_| | ]],
  --   [[ \_\ \/    \_/\____/|_| |_|\__,_|\__,_| ]],
  -- },
  ["sharp"] = {
    [[       ████ ██████           █████      ██                     ]],
    [[      ███████████             █████                             ]],
    [[      █████████ ███████████████████ ███   ███████████   ]],
    [[     █████████  ███    █████████████ █████ ██████████████   ]],
    [[    █████████ ██████████ █████████ █████ █████ ████ █████   ]],
    [[  ███████████ ███    ███ █████████ █████ █████ ████ █████  ]],
    [[ ██████  █████████████████████ ████ █████ █████ ████ ██████ ]],
  },
  ["rowan"] = {
    [[     dMMMMb  dMP dMP .aMMMb  dMP dMP .aMMMb  dMMMMb ]], 
    [[    dMP dMP dMP dMP dMP"VMP dMP dMP dMP"dMP dMP VMP ]], 
    [[   dMP dMP dMP dMP dMP     dMMMMMP dMMMMMP dMP dMP  ]],
    [[  dMP dMP  YMvAP" dMP.aMP dMP dMP dMP dMP dMP.aMP   ]],
    [[ dMP dMP    VP"   VMMMP" dMP dMP dMP dMP dMMMMP"    ]],
  },
  ["script"] = {
    [[  ,ggg, ,ggggggg,                      ,gggg,                                      ]], 
    [[ dP""Y8,8P"""""Y8b                   ,88"""Y8b, ,dPYb,                         8I  ]], 
    [[ Yb, `8dP'     `88                  d8"     `Y8 IP'`Yb                         8I  ]],
    [[  `"  88'       88                 d8'   8b  d8 I8  8I                         8I  ]],
    [[      88        88                ,8I    "Y88P' I8  8'                         8I  ]],
    [[      88        88     ggg    gg  I8'           I8 dPgg,     ,gggg,gg    ,gggg,8I  ]],
    [[      88        88    d8"Yb   88bgd8            I8dP" "8I   dP"  "Y8I   dP"  "Y8I  ]],
    [[      88        88   dP  I8   8I  Y8,           I8P    I8  i8'    ,8I  i8'    ,8I  ]],
    [[      88        Y8,,dP   I8, ,8I  `Yba,,_____, ,d8     I8,,d8,   ,d8b,,d8,   ,d8b, ]],
    [[      88        `Y88"     "Y8P"     `"Y8888888 88P     `Y8P"Y8888P"`Y8P"Y8888P"`Y8 ]],
  },
  ["dollar"] = {
    [[ $$\   $$\             $$$$$$\  $$\                       $$\  ]],
    [[ $$$\  $$ |           $$  __$$\ $$ |                      $$ | ]],
    [[ $$$$\ $$ |$$\    $$\ $$ /  \__|$$$$$$$\   $$$$$$\   $$$$$$$ | ]],
    [[ $$ $$\$$ |\$$\  $$  |$$ |      $$  __$$\  \____$$\ $$  __$$ | ]],
    [[ $$ \$$$$ | \$$\$$  / $$ |      $$ |  $$ | $$$$$$$ |$$ /  $$ | ]],
    [[ $$ |\$$$ |  \$$$  /  $$ |  $$\ $$ |  $$ |$$  __$$ |$$ |  $$ | ]],
    [[ $$ | \$$ |   \$  /   \$$$$$$  |$$ |  $$ |\$$$$$$$ |\$$$$$$$ | ]],
    [[ \__|  \__|    \_/     \______/ \__|  \__| \_______| \_______| ]],
  },
  ["shadowchad"] = {
    [[ ███╗   ██╗██╗   ██╗ ██████╗██╗  ██╗ █████╗ ██████╗  ]],
    [[ ████╗  ██║██║   ██║██╔════╝██║  ██║██╔══██╗██╔══██╗ ]],
    [[ ██╔██╗ ██║██║   ██║██║     ███████║███████║██║  ██║ ]],
    [[ ██║╚██╗██║╚██╗ ██╔╝██║     ██╔══██║██╔══██║██║  ██║ ]],
    [[ ██║ ╚████║ ╚████╔╝ ╚██████╗██║  ██║██║  ██║██████╔╝ ]],
    [[ ╚═╝  ╚═══╝  ╚═══╝   ╚═════╝╚═╝  ╚═╝╚═╝  ╚═╝╚═════╝  ]],
  },
  ["rebelchad"] = {
    [[  ██████   █████               █████████  █████                    █████ ]],
    [[ ░░██████ ░░███               ███░░░░░███░░███                    ░░███  ]],
    [[  ░███░███ ░███  █████ █████ ███     ░░░  ░███████    ██████    ███████  ]],
    [[  ░███░░███░███ ░░███ ░░███ ░███          ░███░░███  ░░░░░███  ███░░███  ]],
    [[  ░███ ░░██████  ░███  ░███ ░███          ░███ ░███   ███████ ░███ ░███  ]],
    [[  ░███  ░░█████  ░░███ ███  ░░███     ███ ░███ ░███  ███░░███ ░███ ░███  ]],
    [[  █████  ░░█████  ░░█████    ░░█████████  ████ █████░░████████░░████████ ]],
    [[ ░░░░░    ░░░░░    ░░░░░      ░░░░░░░░░  ░░░░ ░░░░░  ░░░░░░░░  ░░░░░░░░  ]],
  },
  -- ["graffiti"] = {
  --   [[  _______       _________ .__                .___ ]],
  --   [[  \      \___  _\_   ___ \|  |__ _____     __| _/ ]],
  --   [[  /   |   \  \/ /    \  \/|  |  \\__  \   / __ |  ]],
  --   [[ /    |    \   /\     \___|   Y  \/ __ \_/ /_/ |  ]],
  --   [[ \____|__  /\_/  \______  /___|  (____  /\____ |  ]],
  --   [[         \/             \/     \/     \/      \/  ]],
  -- },
}

local footer = {
  [[ ]],
  [[  Powered By  eovim ]],
  [[  Customized by Steuv1871 ]],
  [[ ]],
}

-- Append the footer to each header
local headers_with_footer = {}
for key, value in pairs(headers) do
  headers_with_footer[key] = vim.list_extend(value, footer)
end

-- Change headers table behaviour when specific keys are accessed
local h = setmetatable(headers_with_footer, {
  __index = function(tb, key)
    if key == "random" then
      -- Obtain keys and return a random banner
      local keys = vim.tbl_keys(tb)
      return tb[keys[math.random(1, #keys)]]
    else
      -- Return the desired banner
      return tb[key]
    end
  end,
})

-- Return the table headers with footer added to each entry and specific behaviour for "Random" key
return h