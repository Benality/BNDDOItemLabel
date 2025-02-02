fx_version 'cerulean'
game 'rdr3'
rdr3_warning 'I acknowledge that this is a prerelease build of RedM, and I am aware my resources *will* become incompatible once RedM ships.'
lua54 'yes'

name 'BNDDO Item Label'
description 'Item labels for the VORP Framework'
author 'BNDOO Scripts' 

shared_scripts {
    "shared/config.lua",
    "shared/functions.lua"
}

client_scripts {
    "client/main.lua",
    "client/menu.lua"

}

server_scripts {
    "server/main.lua"
}

files {

}

escrow_ignore {"shared/config.lua"}

version '1.0'
-- vorp_checker 'yes'
-- vorp_name '^4BNDDOScripts Version Check3'
-- vorp_github 'git remote add origin https://github.com/Benality/BNDDOItemLabel'
