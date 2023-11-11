
--------------------------------------------------------
-----------------------Game Light-----------------------
-------- Discord https://discord.gg/HFwHnGguun ---------
--------------------------------------------------------

function openRadio(player)
    triggerClientEvent(player, "Vg:OpenRadio", player, "Page1")
end
addCommandHandler("n", openRadio)


addEvent("darvoz", true )
addEventHandler("darvoz", root,
function(voz)
        print("Radio - The Player "..getPlayerName(source).." Entered Frequency "..voz)
        exports["Voice"]:setPlayerChannel ( source, voz )
        
        playerNoCanal = exports["Voice"]:getPlayersInChannel ( voz )
        print("Radio - Players on the channel: "..voz) 
        iprint(playerNoCanal)
    end
)

addEvent("tirarvoz", true )
addEventHandler("tirarvoz", root,
function(canal)
    --local empty = exports.bgo_voice:getNextEmptyChannel() 
    exports["Voice"]:setPlayerChannel(source)          
    print("Radio - The Player "..getPlayerName(source).."  dropped out of frequency: "..canal)
    
    playerNoCanal = exports["Voice"]:getPlayersInChannel ( canal )
    print("Radio - Players on the channel: "..canal) 
    iprint(playerNoCanal)
    for i, v in ipairs(playerNoCanal) do
        setPlayerVoiceBroadcastTo ( v, playerNoCanal )
    end
end
)

--------------------------------------------------------
-----------------------Game Light-----------------------
-------- Discord https://discord.gg/HFwHnGguun ---------
--------------------------------------------------------
