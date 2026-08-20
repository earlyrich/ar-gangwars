local screenW, screenH = guiGetScreenSize() 
DXLEVEL = 1
DXXP = 0
RXP,GGXP,BXP = 255, 17, 17
--[[
local pp = screenW * 0.2477
addEventHandler("onClientRender", root,
function()
	if not isPedDead(localPlayer) and lgin then
	    if DXXP < 0 then
		   DXXP2 = 0
		else
		   DXXP2 = DXXP
		end
		if DXXP > tonumber(DXLEVEL*100) then
		    DXXP = tonumber(DXLEVEL*100)
		end
        dxDrawRectangle(screenW * 0.7367, screenH * 0.9550, screenW * 0.2680, screenH * 0.0533, tocolor(9, 0, 0, 128), true)
        dxDrawRectangle(screenW * 0.7445, screenH * 0.9633, pp, screenH * 0.0283, tocolor(255, 254, 254, 140), true)
		lineLength1 = pp * ( DXXP2/tonumber(DXLEVEL*100) )
        dxDrawRectangle(screenW * 0.7445, screenH * 0.9633, lineLength1, screenH * 0.0283, tocolor(RXP,GGXP,BXP, 254), true)
        dxDrawText("Level "..DXLEVEL.." | XP "..DXXP.."/"..tonumber(DXLEVEL*100).." XP | Level "..tonumber(DXLEVEL+1), screenW * 0.7844, screenH * 0.9653, screenW * 0.9383, screenH * 1.0033, tocolor(255,255,255, 255), 1.00, "default", "left", "top", false, false, true, false, false)
    end
end
)
]]
function onWonXP ()
    if isTimer(isTimeOn) then return end
	local o1,o2,o3 = RXP,GGXP,BXP
	local nnum = 0
    isTimeOn = setTimer(function()
	    nnum = nnum +1
	    RXP,GGXP,BXP = math.random(255),math.random(255),math.random(255)
		if nnum == 10 then
		    RXP,GGXP,BXP = o1,o2,o3
		end
	end,500,10
	)

end

function onSpawn ()
    if getPlayerTeam(localPlayer) then
	    RXP,GGXP,BXP = getTeamColor ( getPlayerTeam(localPlayer) )
	end
end
addEventHandler("onClientPlayerSpawn",localPlayer,onSpawn)