
--------------------------------------------------------
-----------------------Game Light-----------------------
-------- Discord https://discord.gg/HFwHnGguun ---------
--------------------------------------------------------

local screenW, screenH = guiGetScreenSize()
local x, y = (screenW/1366), (screenH/768)

local stateRadio = "Fechado"
local tickJ = 0
local conectado = false

local edit_radio = createElement("Vg:RadioFreq")

function drawMyRadio()
    if stateRadio == "Page1" then 
        local animy = interpolateBetween(768, 0, 0, 502, 0, 0, (getTickCount() - tickJ)/1500, "OutElastic")
        dxDrawImage(x*1168, y*animy, x*126, y*266, "imgs/Radio.png")
        if animy > 350 then 
            dxDrawEditBox("000", x*1200, y*699, x*62, y*27, false, 3, edit_radio)
        end
    end
end
addEventHandler("onClientRender", getRootElement(), drawMyRadio)

function openRadio(state)
    stateRadio = state
    if state == "Page1" then 
        tickJ = getTickCount()
        showCursor(true)
    end
end
addEvent("Vg:OpenRadio", true)
addEventHandler("Vg:OpenRadio", getRootElement(), openRadio)

function closeRadio()
    if stateRadio == "Page1" then 
        stateRadio = "Fechado"
        showCursor(false)
    end
end
bindKey("e", "down", closeRadio)

function clickRadio(_, state)
    if state == "down" then 
        if stateRadio == "Page1" then 
            if isCursorOnElement(x*1264, y*601, x*29, y*24) then
                local frequencia = tonumber( getElementData(edit_radio, "text2") )
                if frequencia and frequencia > 0 and frequencia < 1000 then 
                    triggerServerEvent ( "darvoz", localPlayer, frequencia )
                    setElementData(localPlayer, "inCall", true)
                    playSound("imgs/on.mp3")
                    conectado = true 
                end
            elseif isCursorOnElement(x*1220, y*590, x*20, y*17) then
                if conectado == true then 
                    local frequencia = tonumber( getElementData(edit_radio, "text2") )
                    if frequencia and frequencia > 0 and frequencia < 1000 then 
                        setElementData(localPlayer, "inCall", false)
                        setElementData(edit_radio, "text2", "")
                        triggerServerEvent("tirarvoz", localPlayer, frequencia)
                        playSound("imgs/off.mp3")
                        conectado = false
                    end
                end
            end
        end
    end
end
addEventHandler("onClientClick", getRootElement(), clickRadio)

function startVoz()
    if conectado == true then 
        local frequencia = tonumber( getElementData(edit_radio, "text2") )
        if frequencia and frequencia > 0 and frequencia < 1000 then 
            playSound("imgs/on.mp3")
            print("Falou")
        end
    end
end
bindKey("z", "both", startVoz)
--addEventHandler("onClientPlayerVoiceStart", getRootElement(), startVoz)

------- util

function isCursorOnElement( posX, posY, width, height )
    if isCursorShowing( ) then
        local mouseX, mouseY = getCursorPosition( )
        local clientW, clientH = guiGetScreenSize( )
        local mouseX, mouseY = mouseX * clientW, mouseY * clientH
        if ( mouseX > posX and mouseX < ( posX + width ) and mouseY > posY and mouseY < ( posY + height ) ) then
            return true
        end
    end
    return false
end

--------------------------------------------------------
-----------------------Game Light-----------------------
-------- Discord https://discord.gg/HFwHnGguun ---------
--------------------------------------------------------
