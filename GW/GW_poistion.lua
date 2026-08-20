
function randomSpawn () -- ntx, nty, ntz,ntr
    randomSP1 = math.random(1, 3)
	if randomSP1 == 1 then
		ntx, nty, ntz,ntr = getRandomPlayerPositionLS()
		--TownSF = nil
		--TownLS = true 
	elseif randomSP1 == 2 then
		ntx, nty, ntz = getRandomPlayerPositionSF()
		ntr = 270
		--TownLS = nil
		--TownSF = true
	else
		ntx, nty, ntz = getRandomPlayerPositionLV()
		ntr = 270
	end  
end



function RandomPoliceSpawn () 
    if not TownLS and not TownSF then
        randomJail = math.random(1,2)
        if randomJail == 1 then
            ptx,pty,ptz,ptm = getRandomPositionJ1() 
            --TownLS = true 
        elseif randomJail == 2 then
            ptx,pty,ptz,ptm = getRandomPositionJ3() 
            --TownSF = true 
        end
    elseif TownLS then
        ptx,pty,ptz,ptm = getRandomPositionJ1()
    elseif TownSF then
	    ptx,pty,ptz,ptm = getRandomPositionJ3()
    end
    return ptx,pty,ptz,ptm
end		

Jail1Table = {}
Jail1Table1 = {}
Jail1Table2 = {}
Jail1Table3 = {} 
PosstionNoTeamLV = {
[1] = { 1672.69446 , 1416.96973 , 10.78031 },
[2] = { 1657.79187 , 1962.84778 , 10.82031 },
[3] = { 1662.55176 , 2194.75952 , 10.82031 },
[4] = { 2443.80688 , 1951.18286 , 10.75233 },
}

PosstionNoTeamLS = {
[1] = { 1973, -1285, 28.49, 270 },
[2] = { 1945, -1370, 18.58, 90 },
[3] = { 2693, -1706, 11.85, 45 },
[4] = { 1788, -1384, 15.76, 90 },
[5] = { 1525, -1460, 9.5, 180 },
[6] = { 1727, -1635, 20.22, 0 },
[7] = { 1208, -1752, 13.6, 45 },
[8] = { 1441, -1095, 17.63, 0 },
[9] = { 2489, -1962, 16.76, 0 },

[10] = { 2752.10,-1943.59,17.29,90 },
[11] = { 891.90,-1644.59,13.5,180 },
[12] = { 1101.90,-1094.09,28.5,270 },
[13] = { 533.70,-1813.09,6.59,90 },
[14] = { 953.29,-913.59,45.79,180 },
[15] = { 1524,-1113.59,20.89 },

}

PosstionNoTeamSF = {
[1] = { -2647.40796 , -28.00173 , 6.13281 },
[2] = { -2564.84814 , 648.21521 , 14.45313 },
[3] = { -2118.17212 , 386.31046 , 35.17229 },
[4] = { -2723.54004 , -315.37216 , 7.17748 },
[5] = { -2511.46436 , 1221.67664 , 37.42833 },
[6] = { -2750.67065 , -195.90691 , 6.59846 },
[7] = { -2854.97876 , 1030.75439 , 36.39402 },
[8] = { -2138.88354 , -404.14435 , 35.34301 },
[9] = { -2444.17773 , 749.66681 , 35.17188 },
[10] = { -2397.90000 , -248.2000 , 39.9 },
[11] = { -2361.60009 , -24.20000 , 35.3 },
}


local Jail1Table1 = {
[1]={1568.71936 , -1692.40759 , 5.9, 267},
[2]={1553, -1676, 16.2, 90}
}
local Jail1Table2 = {
[1]={2242.9, 2454 , 10.9, 90},
[3]={2340, 2454, 15, 90},
[4]={2293, 2426, 10.8, 90}
}
local Jail1Table3 = {
[1] = { -1588.18433 , 717.60101 , -5.24219,90 },
[2] = { -1618.02393 , 676.44989 , 7.18750 ,90},
[3] = { -1598.27942 , 722.04724 , 10.65737 ,90}
}

function getRandomPosition()
     return unpack(Jail1Table[math.random(#Jail1Table)])
end

function getRandomPositionJ1()
     return unpack(Jail1Table1[math.random(#Jail1Table1)])
end

function getRandomPositionJ2()
     return unpack(Jail1Table2[math.random(#Jail1Table2)])
end

function getRandomPositionJ3()
     return unpack(Jail1Table3[math.random(#Jail1Table3)])
end

function getRandomPlayerPositionLV()
     return unpack(PosstionNoTeamLV[math.random(#PosstionNoTeamLV)])
end

function getRandomPlayerPositionLS()
     return unpack(PosstionNoTeamLS[math.random(#PosstionNoTeamLS)])
end

function getRandomPlayerPositionSF()
     return unpack(PosstionNoTeamSF[math.random(#PosstionNoTeamSF)])
end


function RandomSpawm (model) 
    if SkinsTeam[model] then
        randomSP = math.random(1, 3)
        if randomSP > 2 then
            TeamX["Ballas"] = {2256, -1333, 23.98, 270}
            TeamX["Grove Street"] = {2521, -1679, 15.26, 90}
            TeamX["Vagos"] = {2263, -1094, 42.65, 160}
            TeamX["Aztec"] = {1765, -1930, 13.57, 0}
            TeamX["Rifa"] = {-2052, 148, 28.83, 0}
            TeamX["Champions"] = {-2186, 697, 53.89063, 0}
            TeamX["Champions2"] = {-2073, 974, 62.92188, 0}
            TeamX["Mafia"] = {-2684, 1412, 7.09375, 0}
            TeamX["Russians"] = {-1681, 1350, 9.80469, 0}
        elseif randomSP > 1 then
            TeamX["Ballas"] = {2245, -1322, 23.97886, 0}
            TeamX["Grove Street"] = {2487, -1646, 14.07, 180}
            TeamX["Vagos"] = {2257, -1104, 37.98, 250}
            TeamX["Aztec"] = {1800, -1930, 13.39, 0}
            TeamX["Rifa"] = {-2036, 170, 28.83, 0}
            TeamX["Champions"] = {-2173, 681, 55.16396, 0}
            TeamX["Champions2"] = {-2047, 898, 53.11719, 0}
            TeamX["Mafia"] = {-2650, 1373, 7.18752, 0}
            TeamX["Russians"] = {-1694, 1362, 9.80469, 0}
        else
            TeamX["Ballas"] = {2232, -1333, 23.98158, 90}
            TeamX["Grove Street"] = {2495.3, -1688, 13.52, 0}
            TeamX["Vagos"] = {2257, -1104, 37.98, 250}
            TeamX["Aztec"] = {1778, -1902, 13.39, 270}
            
            TeamX["Rifa"] = {-2033, 148, 28.83, 0}
            TeamX["Champions"] = {-2181, 715, 53.89195 , 0}
            TeamX["Champions2"] = {-2079, 901, 64.13281 , 0}
            TeamX["Mafia"] = {-2623, 1408, 7.10156 , 0}
            TeamX["Russians"] = {-1682, 1351, 7.17219 , 0}
        end
        local ptx, pty, ptz, ptr  =  RandomPoliceSpawn ()
        TeamX["Police"] ={ptx, pty, ptz, ptr}
        TeamX["Medic"] = {1189.09,-1331.8,13.6, 270}
    elseif MCH then
        ntx, nty, ntz, ntr = getElementPosition(MCH)	
    elseif TownLV then
        ntx, nty, ntz = getRandomPlayerPositionLV() 
        ntr = 0
    elseif TownLS then
        ntx, nty, ntz,ntr = getRandomPlayerPositionLS() 
    elseif TownSF then 
        ntx, nty, ntz = getRandomPlayerPositionSF()
        ntr = 270	 
    else
        randomSpawn ()
    end	
end			


addEvent ( "IPhoneSyste:Spawn:SaveArea", true )
addEventHandler ( "IPhoneSyste:Spawn:SaveArea", root,
 function ( table )
  local i = table
     TownLS = i.LosSantos
     --TownSF = i.SanFierro
     TownLV = i.LasVenturas
 end
)