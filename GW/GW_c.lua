--[[

    بامكان الجميع استخدامه بدون استثناء
	Everyone can use it without exception

--]]

--Last Edit : By SolidSnake--
--The Following Changes :--
--1- Disable wwe txd & triggers ... etc...
--2- ===Search "@" For Edits===
--3- WWE Stuff Disabled 99%--
--4- add Guimessages 50 %
--5- restore Bribe
--6- Fixed bugs
--7- Delete tow marker in the bank and change the place By HoLsTeN
--8- Delete languages except Arabic & English By SolidSnake



isSpawnTeam = 1
NewWeapon = true 
limitedMoney = 300000 -- nu9aif

JobisTrue = true
addEventHandler ( "onClientResourceStart", resourceRoot, function ( )
local txd1 = engineLoadTXD("img-i/T.txd", 16501 )
engineImportTXD(txd1, 16501)

function setPedAnimationN (thePed,block,anim,time,loop,updatePosition,interruptable,freezeLastFrame )
     if isElement(thePed) then
	   --if time == false then time = 1 end
	    if not block then
		  setPedAnimation (thePed ,false )
		else
          setPedAnimation (thePed ,block or nil,anim or nil,time or -1,loop or false,updatePosition or false,interruptable or false,freezeLastFrame or true )
	    end
	 end
end

killTimer_ = killTimer
TtScore = {}
function givePlayerScore (player,value)
    if isElement(player) and value then
	    if tonumber(value) and not isTimer(TtScore[player]) then
		   triggerServerEvent("givePlayerScore", player,tonumber(value))
		   TtScore[player] = setTimer (function(pp) TtScore[pp] = nil end,2000,1,player) 
		end
	end
end

function killTimer (Timer)
       if isTimer(Timer) then
	       killTimer_(Timer)
	   end
end	   

getElementRotation_ = getElementRotation

function getElementRotation (element)
         if isElement(element) then --- nu9aif
		    return getElementRotation_(element)
		 else
            return getElementRotation_(localPlayer)
		 end	
end

Champions = "OFF"
Champions2 = "OFF"
addEvent('ChampionsEvent',true)
addEventHandler('ChampionsEvent',resourceRoot,function(value1,value2)
    Champions = value1
	Champions2 = value2
end )

--[[ Enter vehicle lagg fix --
addEventHandler("onClientPlayerVehicleEnter", localPlayer, function() setRadioChannel(0) end)
addEventHandler("onClientPlayerRadioSwitch", localPlayer, function(id) if id ~= 0 then setRadioChannel(0) cancelEvent() end end)]]


Jail1 = createColRectangle( -245.2,-642.5, 8,23.7)
Jail2 = createColRectangle( -290.3,-642.4, 8,23.7)
Jail3 = createColRectangle( -282,-649.5, 36.7,36)
Jail4 = createColRectangle( -272,-663, 8.4,14)
Jail5 = createColRectangle( -281.54,-613.33, 11,13.69)

GateJail = ""
function isInJailZone ()
    if isElementWithinColShape(localPlayer,Jail1) 
	or isElementWithinColShape(localPlayer,Jail2)  
	or GateJail and (isElementWithinColShape(localPlayer,Jail3) or isElementWithinColShape(localPlayer,Jail4) or isElementWithinColShape(localPlayer,Jail5) ) and getElementData(GateJail,"TimeOut") then
        return true
	end
	return false
end

MarkerGoToJail = {
{1532, -1675, 13,4,0,0},
{1796.5,-1589.12,12,4,0,0},
{-261,-632,131.8,4,200,200},
}


MarkerJail = {}
function destroyMjail ()
    for marker1,marker2 in pairs(MarkerJail) do
	    if isElement(marker1) then
		    destroyElement(marker1)
		end
	    if isElement(marker2) then
		    destroyElement(marker2)
		end		
	end
end
	
function SetElementInterior (theElement,interior,x,y,z)
         if isElement(theElement) and interior then
		   if x and y and z then
		        setElementInterior (theElement,interior,x or false ,y or false,z or false)
		   else
		      setElementInterior (theElement,interior)
		   end
		 end
end

function SetElementPosition (theElement,x,y,z)
         if isElement(theElement) and x and y and z then
		        setElementPosition (theElement,x,y,z)
		 end
end

function SetElementDimension (theElement,value)
         if isElement(theElement) and tonumber(value) then
		        setElementDimension (theElement,tonumber(value) or 0)
		 end
end

function isSoundFinished(arga)
    local length = getSoundLength(arga)
    local post = getSoundPosition(arga)
    if (post == length) then
        return true
    end
    return false
end

function table.empty(arga)
    if type(arga) ~= "table" then
        return false
    end
    
    return not next(arga)
end

TownOld = nil
TownNew = nil
TownNewOld = nil
PlusDown = 10
local sw,sh = guiGetScreenSize()
local screenWidth, screenHeight = guiGetScreenSize ( ) -- Get the screen resolution (width and height)


GUIEditor = {
	edit = {},
	gridlist = {},
    button = {},
    window = {},
    label = {},
	radiobutton = {}
}

player = getLocalPlayer()
w, h = guiGetScreenSize()
setCloudsEnabled(false)
SetElementInterior(player, 0)
--setElementData(player,"Alive",false)
--setElementData(player,"MAW",{})
setCameraInterior(0)
fadeCamera(false, 0)

showChat(false)
showCursor(false)
New = true
CashFdia = 5000
PoliceTeam = "Police"
exports["mxSampKillMsg"]:ShowHidemessage(false)
MCTX = "GXP"
MCTL = "GLVL"

bail = 0
SecsLeft = 0
MinsLeft = 0
HTE = 0

ics = nil

row = {}
srow = {}

VUSW = {}
VUB = {}
VUSBB = {}
VUW = {}
VUSB = {}
VUBS = {}
NURB = {}
NORB = {}
Carts = {}
VUSRB = {}
Type = {}
VCLR = {}
nn = {}

Ishop = {}
IshopU = {}
Ishop[0] = createObject(14776, 1055, -1011.5, 20)
setElementDoubleSided(Ishop[0], true)
Ishop[1] = createObject(13607, 1050, -1017.75, 14)
setObjectScale(Ishop[1], 0.08)
Ishop[2] = createObject(1365, 1050, -1017.75, 12.55, 0, 0, 90)
attachElements(Ishop[2], Ishop[1], 0, 0, -1.45, 0, 0, 90)
Ishop[3] = createObject(1365, 1056.94, -1015.5, 13.33, 0, 0, 90)
Ishop[4] = createObject(1365, 1049, -1012, 12.34)
Ishop[5] = createObject(1365, 1055, -1008, 12.34)
Ishop[6] = createObject(1365, 1059.5, -1008, 12.34)

Ishop[7] = createVehicle(562, 1056.94, -1015.5, 13.33)
setVehicleDamageProof(Ishop[7], true)
setVehicleHeadLightColor(Ishop[7], 0, 0, 255)
setVehiclePaintjob(Ishop[7], 0)
attachElements(Ishop[7], Ishop[3], 0, 0, 1.85, 0, 0, -90)
IshopU[7] = {1034,1171,1010,1149,1035,1041,1147,1080}

Ishop[8] = createVehicle(565, 1049, -1012, 12.34)
setVehicleDamageProof(Ishop[8], true)
setVehicleHeadLightColor(Ishop[8], 0, 255, 0)
setVehiclePaintjob(Ishop[8], 2)
attachElements(Ishop[8], Ishop[4], 0, 0, 1.76, 0, 0, 270)
IshopU[8] = {1046,1153,1010,1150,1053,1051,1049,1079}

Ishop[9] = createVehicle(567, 1055, -1008, 12.34)
setVehicleDamageProof(Ishop[9], true)
setVehicleHeadLightColor(Ishop[9], 255, 255, 0)
setVehiclePaintjob(Ishop[9], 2)
attachElements(Ishop[9], Ishop[5], 0, 0, 1.99, 0, 0, 160)
IshopU[9] = {1188,1010,1186,1102,1083}

Ishop[10] = createVehicle(603, 1059.5, -1008, 12.34)
setVehicleDamageProof(Ishop[10], true)
setVehicleHeadLightColor(Ishop[10], 255, 0, 0)
attachElements(Ishop[10], Ishop[6], 0, 0, 1.97, 0, 0, 180)
IshopU[10] = {1144,1001,1007,1006,1010,1078}
Ishop[11] = createObject(1913, 1045, -1022.75, 16)
setElementAlpha(Ishop[11], 0)


VUS = {[0]={[1011]={"Race Scoop", 2200},
		[1012]={"Worx Scoop", 2500},
		[1142]={"L Oval Vents", 5000},
		[1143]={"R Oval Vents", 5000},
		[1144]={"L Square Vents", 5000},
		[1145]={"R Square Vents", 5000}},
[1] = { [1004]={"Champ Scoop", 1000},
		[1005]={"Fury Scoop", 1500}},
[2] = { [1000]={"Pro", 4000},
		[1001]={"Win", 5500},
		[1002]={"Drag", 2000},
		[1003]={"Alpha", 2500},
		[1014]={"Champ", 4000},
		[1015]={"Race", 5000},
		[1016]={"Worx", 2000},
		[1023]={"Fury", 3500},
		[1049]={"Alien", 8100},
		[1050]={"X-Flow", 6200},
		[1058]={"Alien", 6200},
		[1060]={"X-Flow", 5300},
		[1138]={"Alien", 5800},
		[1139]={"X-Flow", 4700},
		[1146]={"X-Flow", 4900},
		[1147]={"Alien", 5000},
		[1158]={"X-Flow", 5500},
		[1162]={"Alien", 6500},
		[1163]={"X-Flow", 4500},
		[1164]={"Alien", 5500}},
[3] = { [1007]={"R Sideskirt", 5000},
		[1017]={"L Sideskirt", 5000},
		[1026]={"R Alien", 4800},
		[1027]={"L Alien", 4800},
		[1030]={"L X-Flow", 3700},
		[1031]={"R X-Flow", 3700},
		[1036]={"R Alien", 5000},
		[1039]={"L X-Flow", 3900},
		[1040]={"L Alien", 5000},
		[1041]={"R X-Flow", 3900},
		[1042]={"R Chrome", 10000},
		[1047]={"R Alien", 6700},
		[1048]={"R X-Flow", 5300},
		[1051]={"L Alien", 6700},
		[1052]={"L X-Flow", 5300},
		[1056]={"R Alien", 5200},
		[1057]={"R X-Flow", 4300},
		[1062]={"L Alien", 5200},
		[1063]={"L X-Flow", 4300},
		[1069]={"R Alien", 5500},
		[1070]={"R X-Flow", 4500},
		[1071]={"L Alien", 5500},
		[1072]={"L X-Flow", 4500},
		[1090]={"R Alien", 4500},
		[1093]={"R X-Flow", 3500},
		[1094]={"L Alien", 4500},
		[1095]={"R X-Flow", 3500},
		[1099]={"L Chrome", 10000},
		[1101]={"L Chrome Flames", 7800},
		[1102]={"L Chrome Strip", 8300},
		[1106]={"R Chrome Arches", 7800},
		[1107]={"L Chrome Strip", 7800},
		[1108]={"R Chrome Strip", 7800},
		[1118]={"R Chrome Trim", 7200},
		[1119]={"R Wheelcovers", 9400},
		[1120]={"L Chrome Trim", 9400},
		[1121]={"L Wheelcovers", 9400},
		[1122]={"R Chrome Flames", 7800},
		[1124]={"L Chrome Arches", 7800},
		[1133]={"R Chrome Strip", 8300},
		[1134]={"R Chrome Strip", 8000},
		[1137]={"L Chrome Strip", 8000}},
[4] = { [1115]={"Chrome", 21300},
		[1116]={"Slamin", 20500}},
[5] = { [1109]={"Chrome", 16100},
		[1110]={"Slamin", 15400}},
[6] = { [1013]={"Round Fog", 1000},
		[1024]={"Square Fog", 500}},
[7] = { [1006]={"Roof Scoop", 800},
		[1032]={"Alien Roof Vent", 1700},
		[1033]={"X-Flow Roof Vent", 1200},
		[1035]={"X-Flow Roof Vent", 1500},
		[1038]={"Alien Roof Vent", 1900},
		[1053]={"X-Flow", 1300},
		[1054]={"Alien", 2100},
		[1055]={"Alien", 2300},
		[1061]={"X-Flow", 1800},
		[1067]={"Alien", 2500},
		[1068]={"X-Flow", 2000},
		[1088]={"Alien", 1500},
		[1091]={"X-Flow", 1000},
		[1103]={"Covertible", 32500},
		[1128]={"Vinyl Hardtop", 33400},
		[1130]={"Hardtop", 33800},
		[1131]={"Softtop", 32900}},
[8] = { [1008]={"5x Nitrous", 5000},
		[1009]={"2x Nitrous", 2000},
		[1010]={"10x Nitrous", 10000}},
[9] = { [1087]={"Hydraulics", 15000}},
[10] = {[1086]={"Stereo", 1000}},
[11] = {[1111]={"Front Sign", 1000},
		[1112]={"Front Sign", 1000}},
[12] = {[1025]={"Off Road", 10000},
		[1073]={"Shadow", 11000},
		[1074]={"Mega", 10300},
		[1075]={"Rimshine", 9800},
		[1076]={"Wires", 15600},
		[1077]={"Classic", 16200},
		[1078]={"Twist", 12000},
		[1079]={"Cutter", 10300},
		[1080]={"Switch", 9000},
		[1081]={"Grove", 12300},
		[1082]={"Import", 8200},
		[1083]={"Dollar", 15600},
		[1084]={"Trance", 13500},
		[1085]={"Atomic", 7700},
		[1096]={"Ahab", 10000},
		[1097]={"Virtual", 6200},
		[1098]={"Access", 11400}},
[13] = {[1018]={"Upswept", 3500},
		[1019]={"Twin", 3000},
		[1020]={"Large", 2500},
		[1021]={"Medium", 2000},
		[1022]={"Small", 1500},
		[1028]={"Alien", 7700},
		[1029]={"X-Flow", 6800},
		[1034]={"Alien", 7900},
		[1037]={"X-Flow", 6900},
		[1043]={"Slamin", 5000},
		[1044]={"Chrome", 5000},
		[1045]={"X-Flow", 5100},
		[1046]={"Alien", 7100},
		[1059]={"X-Flow", 7200},
		[1064]={"Alien", 8300},
		[1065]={"Alien", 8500},
		[1066]={"X-Flow", 7500},
		[1089]={"X-Flow", 6500},
		[1092]={"Alien", 7500},
		[1104]={"Chrome", 16100},
		[1105]={"Slamin", 15400},
		[1113]={"Chrome", 16500},
		[1114]={"Slamin", 15900},
		[1126]={"Chrome", 33400},
		[1127]={"Slamin", 32500},
		[1129]={"Chrome", 16500},
		[1132]={"Slamin", 15900},
		[1135]={"Slamin", 15000},
		[1136]={"Chrome", 10000}},
[14] = {[1117]={"Chrome", 20400},
		[1152]={"X-Flow", 9100},
		[1153]={"Alien", 12000},
		[1155]={"Alien", 10300},
		[1157]={"X-Flow", 9300},
		[1160]={"Alien", 10500},
		[1165]={"X-Flow", 8500},
		[1166]={"Alien", 9500},
		[1169]={"Alien", 9700},
		[1170]={"X-Flow", 8800},
		[1171]={"Alien", 9900},
		[1172]={"X-Flow", 9000},
		[1173]={"X-Flow", 9500},
		[1174]={"Chrome", 10000},
		[1175]={"Slamin", 9000},
		[1179]={"Chrome", 21500},
		[1181]={"Slamin", 20400},
		[1182]={"Chrome", 21500},
		[1185]={"Slamin", 20400},
		[1188]={"Slamin", 20800},
		[1189]={"Chrome", 22000},
		[1190]={"Slamin", 12000},
		[1191]={"Chrome", 10400}},
[15] = {[1140]={"X-Flow", 8700},
		[1141]={"Alien", 9800},
		[1148]={"X-Flow", 5000},
		[1149]={"Alien", 10000},
		[1150]={"Alien", 10900},
		[1151]={"X-Flow", 8400},
		[1154]={"Alien", 10300},
		[1156]={"X-Flow", 9200},
		[1159]={"Alien", 10500},
		[1161]={"X-Flow", 9500},
		[1167]={"X-Flow", 8500},
		[1168]={"Alien", 9500},
		[1176]={"Chrome", 10000},
		[1177]={"Slamin", 9000},
		[1178]={"Slamin", 20500},
		[1180]={"Chrome", 21300},
		[1183]={"Slamin", 20500},
		[1184]={"Chrome", 21500},
		[1186]={"Slamin", 20950},
		[1187]={"Chrome", 21750},
		[1192]={"Chrome", 9400},
		[1193]={"Slamin", 11000}},
[16] = {[1100]={"Chrome Grill", 9400},
		[1123]={"Chrome Bars", 8600},
		[1125]={"Chrome Lights", 11200}}
	}

ATT = {[404]={[0]={"Roof", 5000},
		[1]={"Fog Lights", 5000},
		[2]={"3", 5000}},
[407]={ [0]={'"64" Poster', 5000},--numbers
		[1]={'"16" Poster', 5000},
		[2]={'"47" Poster', 5000}},
[408]={ [0]={"trash", 3000}},
[413]={ [0]={"Sound System", 10000}},
[414]={ [0]={'"Toy Corner" Poster', 5000},--posters
		[1]={'"Binco" Poster', 5000},
		[2]={'"Semi" Poster', 5000},
		[3]={'"Shafted Appliances" Poster', 5000}},
[415]={ [0]={"Left Mirror", 10000},
		[1]={"Dual Mirrors", 10000}},
[416]={ [0]={'"37" Poster', 5000},--numbers
		[1]={'"71" Poster', 5000}},
[422]={ [0]={"Spare Tire", 5000},
		[1]={"Sprunk Cans", 5000}},
[423]={ [0]={'"Cherry Popping Good" Poster', 5000},--posters
		[1]={'"Slow Children Ahead" Poster', 5000}},
[424]={ [0]={"Side Panels", 10000}},
[428]={ [0]={'"Chuff" Poster', 5000},
		[1]={'"Lock&Load" Poster', 5000}},
[433]={ [0]={"Opaque Fabric Cover", 10000},--غطى حق السيارة حق الجيش اللي من ورا
		[1]={"Camo Netting Cover", 10000}},
[434]={ [0]={"Partial Engine Cover", 10000}},--غطى مكينة سيارة هوت نايف
[435]={ [0]={'"Cok-o-Pops" Poster', 5000},
		[1]={'"Munky Juice" Poster', 5000},
		[2]={'"Hinterland" Poster', 5000},
		[3]={'"Zip" Poster', 5000},
		[4]={'"RS Haul" Poster', 5000},
		[5]={'"Ranch" Poster', 5000}},
[437]={ [0]={'"Big O Tours" Poster', 5000},
		[1]={'"Bikini Line" Poster', 5000}},
[439]={ [0]={"Hardtop Roof", 8000},
		[1]={"Softtop (up) Roof", 9000},
		[2]={"Softtop (folded) Roof", 10000}},
[440]={ [0]={'"Cok-o-Pops" Poster', 5000},
		[1]={'"Harry Plums" Poster', 5000},
		[2]={'"Dick Goblins" Poster', 5000},
		[3]={'"Final Build" Poster', 5000},
		[4]={'"Transfender" Poster', 5000},
		[5]={'"Wheel Arch Angels" Poster', 5000}},
[442]={ [0]={"Brown Rectangle Coffin", 5000},--تابوت
		[1]={"Black Rectangle Coffin", 5000},
		[2]={"Brown Coffin", 5000}},
[450]={ [0]={"gravel/coal/stone", 10000}},--قاطرة فيها تراب
[453]={ [0]={"Boxes of Fish", 5000},
		[1]={"Bench", 5000}},--boat chair
[455]={ [0]={"Boxes", 10000},
		[1]={"Boxes with Cover", 10000},
		[2]={"Big Boxes", 10000}},
[456]={ [0]={'"Big Gas" Poster', 5000},
		[1]={'"RS Haul" Poster', 5000},
		[2]={'"Star Balls" Poster', 5000},
		[3]={'"Flower Power" Poster', 5000}},
[457]={ [0]={"Gray Golfbag", 5000},
		[1]={"Green Bag", 3000},
		[2]={"Red Golfbag", 5000},
		[3]={"Blue Bag", 3000},
		[4]={"Green Golfbag", 5000},
		[5]={"Blue Golfbag", 5000}},
[459]={ [0]={"Boxes of Toys", 5000}},
[470]={ [0]={"Low Cover", 5000},
		[1]={"High Cover", 8000},
		[2]={"Roll Bar", 10000}},
[472]={ [0]={"Items all Over", 10000},
		[1]={"Items Grouped in Back", 10000},
		[2]={"Items all Over &2 Oars in Front", 10000}},
[477]={ [0]={"Spoiler", 10000}},
[478]={ [0]={"Two Propane Tanks", 4000},
		[1]={"Open Crates", 2000},
		[2]={"Propane Tank & Barrel", 5000}},
[482]={ [0]={"Roof Lights & Spoiler", 20000}},
[483]={ [0]={"Open Curtains & Second Bench Seat", 7000},
		[1]={"Open Roof Vent, Closed Curtains, Bed in Back, Peace Sign", 10000}},
[484]={ [0]={"Windshield", 10000}},
[485]={ [0]={"Earmuffs", 4000},
		[1]={"Small Case", 4000},
		[2]={"Large Case", 4000}},
[499]={ [0]={'"Shady Industries" Poster', 5000},
		[1]={'"LSD" Poster', 5000},
		[2]={'"The Uphill Gardener" Poster', 5000},
		[3]={'"Discount Furniture" Poster', 5000}},
[500]={ [0]={"Roof", 8000},
		[1]={"Roll Bar in Back", 10000}},
[502]={ [0]={'"96" & Posters', 10000},
		[1]={'"67" & Posters', 10000},
		[2]={'"73" & Posters', 10000},
		[3]={'"52" & Posters', 10000},
		[4]={'"45" & Posters', 10000},
		[5]={'"14" & Posters', 10000}},
[503]={ [0]={'"82" & Posters', 10000},
		[1]={'"26" & Posters', 10000},
		[2]={'"65" & Posters', 10000},
		[3]={'"07" & Posters', 10000},
		[4]={'"36" & Posters', 10000},
		[5]={'"60" & Posters', 10000}},
[504]={ [0]={'Roof & "328" Poster', 9000},
		[1]={'Chess Roof & "464" Poster', 10000},
		[2]={'Chess Roof & "172" Poster', 10000},
		[3]={'Roof & "100" Poster', 9000},
		[4]={'Roof & "284" Poster', 9000},
		[5]={'Chess Roof & "505" Poster', 10000}},
[506]={ [0]={"Roof", 8000}},
[521]={ [0]={"Single Exhaust", 10000},
		[1]={"Dual Exhausts", 20000},
		[2]={"Black Dual Exhausts", 25000},
		[3]={"Windshields & Half Body Size", 12000},
		[4]={"Windshields & full Body Size", 25000}},
[522]={ [0]={"Single black Pair Exhausts", 18000},
		[1]={"Single Pair Exhausts", 15000},
		[2]={"Black Dual Pair Exhausts", 36000},
		[3]={"Windshields & Smooth Body", 36000},
		[4]={"Windshields & Body With Side Cutouts", 40000}},
[535]={ [0]={"Normal Steering Wheel", 8000},
		[1]={"Chain Steering Wheel", 10000}},
[543]={ [0]={"Two Propane Tanks & Crate", 5000},
		[1]={"Two Barrels", 6000},
		[2]={"Sprunk Cans", 5000},
		[3]={"Open Crates", 2000}},
[552]={ [0]={"Cones & Barrel", 8000},
		[1]={"Cones & Barrel with Mop", 10000}},
[555]={ [0]={"Roof", 9000},
		[1]={"No Roof", 10000}},
[556]={ [0]={"Roof Spoiler", 10000},
		[1]={"Roof Lights", 15000},
		[2]={"Roll Bar with Lights", 20000}},
[557]={ [0]={"Roof Spoiler", 10000},
		[1]={"Roof Lights", 15000}},
[571]={ [0]={"Body Panels", 10000},
		[1]={"Steering Column", 8000}},
[581]={ [0]={"Single Exhaust", 10000},
		[1]={"Black Exhaust", 15000},
		[2]={"Dual Exhausts", 20000},
		[3]={"Windshields & Half Body Size", 12000},
		[4]={"Windshields & full Body Size", 25000}},
[583]={ [0]={"Red Case", 3000},
		[1]={"Green Case", 3000}},
[595]={ [0]={"Back Roof", 10000},
		[1]={"Front Roof", 10000}},
[600]={ [0]={"Planks", 5000},
		[1]={"Sprunk Cans", 5000}},
[601]={ [0]={'"1" Poster', 5000},
		[1]={'"9" Poster', 5000},
		[2]={'"6" Poster', 5000},
		[3]={'"7" Poster', 5000}},
[605]={ [0]={"Two Propane Tanks & Crate", 5000},
		[1]={"Two Barrels", 5000},
		[2]={"Sprunk Cans", 10000},
		[3]={"Open Crates", 2000}},
[607]={ [0]={"Big Bags", 10000},
		[1]={"small & Big Bags", 10000},
		[2]={"small Bags", 10000}},
}

--BlockKillInHospital = createColCuboid(1137.9, -1388 , 13, 100, 100, 150)
RadarArea = createRadarArea(1137.9, -1388 , 100, 100, 150,150,255,200)

BHO={
createObject(2950,2330.39307,-1179.16003,1030.54675),
createObject(3064,2338.116,-1181.92,1033.1874,0,0,90),
createObject(3063,2340.28,-1182.293,1026.969,0,0,90)
}
for k,v in pairs(BHO) do
	setElementInterior(v,5)
end

oHO = createObject(1506,-2171.1001,639.91998,1051.3669)
setElementInterior(oHO,1)
WHO={
oHO
}

oHO = createObject(1535,2255.7,-1140.917,1049.41,0,0,90)
setObjectScale(oHO,1.2)
AHO={oHO}

oHO = createObject(1497,299.26001,315.23999,998.15002)
setElementInterior(oHO,4)
oHOb = createObject(14861,309.14001,301.72,1002.7)
setElementInterior(oHOb,99)
GHO={
oHO,
oHOb
}

oHO = createObject(2370,273.88,304.66,998.25)
setElementInterior(oHO,99)
KHO={
oHO
}

oHO,oHOb = nil,nil

SHO={
createObject(1793,2533.8301,-1684.2,1014.5,0,0,90),
createObject(988,2530.6101,-1685.8199,1015.14),
createObject(988,2526.4199,-1680.95,1014.5),
createObject(988,2530.6001,-1681.86,1014.44,90),
createObject(988,2527.8401,-1683.59,1014.5,0,0,90),
createObject(988,2533.1799,-1683.6,1014.5,0,0,90),
createObject(988,2526.4199,-1681.25,1014.5),
createObject(8658,2531.8799,-1681.1,1016.74,90,346.367,283.633),
createObject(988,2530.6001,-1681.86,1018.03,90),
createObject(988,2529.76,-1681.1,1018.2),
createObject(1498,2523.71,-1680.1299,1014.49,0,0,90),
createObject(2949,2530.9099,-1681.36,1014.85,0,0,80),
createObject(1726,2532.5,-1675.52,1014.5,0,0,90),
createObject(2095,2531.55,-1682.1801,1014.5,0,0,270),
createObject(2292,2535.3,-1672.22,1014.5,0,0,357),
createObject(2297,2536.7,-1676.86,1014.5,0,0,135.6),
createObject(1746,2528.3799,-1682.27,1014.5),
createObject(2292,2536.1101,-1672.25,1014.5,0,0,267),
createObject(3632,2528.1399,-1677.3,1014.79)
}
for k,v in pairs(SHO) do
	setElementInterior(v,99)
end

HNPI={
[0]={3000},
[1]={4000},
[2]={7000,nil,KHO},
[3]={10000,nil,GHO},
[4]={15000},
[5]={20000},
[6]={30000,nil,WHO},

[7]={5000},
[8]={5500,nil,AHO},
[9]={5500},
[10]={6000},
[11]={7000},
[12]={8000},
[13]={8000},
[14]={9000},
[15]={10000},
[16]={10000},
[17]={10000,nil,SHO},
[18]={10000},
[19]={12000},
[20]={15000},
[21]={15000},
[22]={18000},
[23]={20000},
[24]={25000},
[25]={27000},
[26]={30000},
[27]={32000},
[28]={32000},
[29]={35000},
[30]={40000},
[31]={45000},

[32]={30000},
[33]={32000},
[34]={35000},
[35]={37000},
[36]={40000},
[37]={45000},
[38]={48000},
[39]={50000},
[40]={55000},
[41]={60000,nil,BHO},
[42]={80000,"PGC"},

[43]={85000,"PGC"},
[44]={85000,"PGC"},
[45]={90000,"PGC"},
[46]={100000,"PGC"}
}

 
knho1 = createMarker(1111.5, -976, 42.76, "corona", 1.5) 
createBlipAttachedTo(knho1,0,2.5,0, 255, 0, 255, 255, 600 )
knho2 = createMarker(887.5, -1116.76, 24, "corona", 1.5) 
createBlipAttachedTo(knho2,0,2.5,0, 255, 0, 255, 255, 600 )
knho3 = createMarker(2150.2, -1584.7, 14, "corona", 1.5)
createBlipAttachedTo(knho3,0,2.5,0, 255, 0, 255, 255, 600 ) 


SetElementInterior(knho1, 100)
SetElementInterior(knho2, 100)
SetElementInterior(knho3, 100)

createMarker(1111.5, -976, 41.76, "cylinder", 1.5, 255, 0, 0, 128)
createMarker(887.5, -1116.75, 23.19, "cylinder", 1.5, 255, 0, 0, 128)
createMarker(2150.2, -1584.7, 13.3, "cylinder", 1.5, 255, 0, 0, 128)

jiconr = createColSphere(0,0,0,20)--createMarker(0,0,0,"corona",20,0,0,0,0)
attachElements(jiconr, player)

sp = createObject(1913, 0, 0, 0)
SetElementInterior(sp, 100)

setElementData(player,"Kills",-2)

createBlip(2288, 2443, 0, 30,2, 255, 0, 0, 255, 255, 400 )
createBlip(-1602.7, 703, 0, 30,2, 255, 0, 0, 255, 255, 400 )

createBlip(2400, -1982, 0, 6,2, 255, 0, 0, 255, 255, 400 )
createBlip(1369, -1280, 0, 6,2, 255, 0, 0, 255, 255, 400 )
createBlip(1556, -1675.6, 0, 30,2, 255, 0, 0, 255, 255, 400 )

createBlip(2106, -1806, 0, 29,2, 255, 0, 0, 255, 255, 400 )

createBlip(1200, -918, 0, 10,2, 255, 0, 0, 255, 255, 400 )
createBlip(811, -1616, 0, 10,2, 255, 0, 0, 255, 255, 400 )

createBlip(2419, -1509, 0, 14,2, 255, 0, 0, 255, 255, 400 )
createBlip(2397, -1900, 0, 14,2, 255, 0, 0, 255, 255, 400 )
createBlip(929, -1353, 0, 14,2, 255, 0, 0, 255, 255, 400 )

createBlip(2065, -1832, 0, 63,2, 255, 0, 0, 255, 255, 400 )
createBlip(1025, -1025, 0, 63,2, 255, 0, 0, 255, 255, 400 )
createBlip(488, -1740, 0, 63,2, 255, 0, 0, 255, 255, 400 )

createBlip(596, -1251, 0, 36,2, 255, 0, 0, 255, 255, 400 )

-- SF BLIPS ! --14 CHIKEN  29 pizz 10 burger  6 gun
createBlip(-1815, 618, 0, 14,2, 255, 0, 0, 255, 255, 400 )
createBlip(-1808, 945, 0, 29,2, 255, 0, 0, 255, 255, 400 )
createBlip(-1721, 1359, 0, 29,2, 255, 0, 0, 255, 255, 400 )
createBlip(-2356, 1008, 0, 10,2, 255, 0, 0, 255, 255, 400 )
createBlip(-1912, 828, 0, 10,2, 255, 0, 0, 255, 255, 400 )
createBlip(-2671, 258, 0, 14,2, 255, 0, 0, 255, 255, 400 )
createBlip(-2625, 208, 0, 6,2, 255, 0, 0, 255, 255, 400 )
createBlip(-2336, -166, 0, 10,2, 255, 0, 0, 255, 255, 400 )
-- LV CITY
createBlip(2472, 2033, 0, 10,2, 255, 0, 0, 255, 255, 400 )
createBlip(2393, 2041, 0, 29,2, 255, 0, 0, 255, 255, 400 )
createBlip(2366, 2071, 0, 10,2, 255, 0, 0, 255, 255, 400 )
createBlip(1872, 2072, 0, 10,2, 255, 0, 0, 255, 255, 400 )
createBlip(2102, 2228, 0, 14,2, 255, 0, 0, 255, 255, 400 )
createBlip(2083, 2224, 0, 10,2, 255, 0, 0, 255, 255, 400 )
createBlip(2546, 2085, 0, 6,2, 255, 0, 0, 255, 255, 400 )
createBlip(2159, 943, 0, 6,2, 255, 0, 0, 255, 255, 400 )
createBlip(2638, 1671, 0, 14,2, 255, 0, 0, 255, 255, 400 )
createBlip(2638, 1849, 0, 29,2, 255, 0, 0, 255, 255, 400 )
createBlip(2838, 2407, 0, 14,2, 255, 0, 0, 255, 255, 400 )
createBlip(2756, 2477, 0, 29,2, 255, 0, 0, 255, 255, 400 )
createBlip(2169, 2795, 0, 10,2, 255, 0, 0, 255, 255, 400 )
createBlip(777, 1871, 0, 6,2, 255, 0, 0, 255, 255, 400 )
createBlip(1158, 2072, 0, 10,2, 255, 0, 0, 255, 255, 400 )
createBlip(2351, 2532, 0, 29,2, 255, 0, 0, 255, 255, 400 )


-- TAWNS
createBlip(-2093, -2464, 0, 6,2, 255, 0, 0, 255, 255, 400 )
createBlip(-2155, -2460, 0, 14,2, 255, 0, 0, 255, 255, 400 )
createBlip(-1213, 1830, 0, 14,2, 255, 0, 0, 255, 255, 400 )
createBlip(2333, 61, 0, 6,2, 255, 0, 0, 255, 255, 400 )
createBlip(2333, 75, 0, 29,2, 255, 0, 0, 255, 255, 400 )
createBlip(242, -178, 0, 6,2, 255, 0, 0, 255, 255, 400 )
createBlip(203, -202, 0, 29,2, 255, 0, 0, 255, 255, 400 )
createBlip(172, 1176, 0, 14,2, 255, 0, 0, 255, 255, 400 )
createBlip(1367, 248, 0, 29,2, 255, 0, 0, 255, 255, 400 )
createBlip(-315, 829, 0, 6,2, 255, 0, 0, 255, 255, 400 )






---------------------------------------------------------------------------

c1 = createColSphere(1584.04, -1679.13, 1226.5, 2) -- FLOOR 1
c2 = createColSphere(1579.29, -1679.13, 1226.5, 2) -- FLOOR 1
c3 = createColSphere(1574.54, -1679.13, 1226.5, 2) -- FLOOR 1
c4 = createColSphere(1569.79, -1679.13, 1226.5, 2) -- FLOOR 1

c5 = createColSphere(1584.33, -1662.97, 1226.5, 2) -- FLOOR 1
c6 = createColSphere(1579.58, -1662.97, 1226.5, 2) -- FLOOR 1
c7 = createColSphere(1574.83, -1662.97, 1226.5, 2) -- FLOOR 1
c8 = createColSphere(1570.08, -1662.97, 1226.5, 2) -- FLOOR 1
------------
c9 = createColSphere(1587.84, -1679.13, 1230.7, 2) -- FLOOR 2
c10 = createColSphere(1583.08, -1679.13, 1230.7, 2) -- FLOOR 2
c11 = createColSphere(1578.34, -1679.13, 1230.7, 2) -- FLOOR 2
c12 = createColSphere(1573.56, -1679.13, 1230.7, 2) -- FLOOR 2
c13 = createColSphere(1568.8, -1679.13, 1230.7, 2) -- FLOOR 2
c14 = createColSphere(1564.09, -1679.13, 1230.7, 2) -- FLOOR 2
c15 = createColSphere(1559.34, -1679.13, 1230.7, 2) -- FLOOR 2

c16 = createColSphere(1588.13, -1662.97, 1230.7, 2) -- FLOOR 2
c17 = createColSphere(1583.39, -1662.97, 1230.7, 2) -- FLOOR 2
c18 = createColSphere(1578.61, -1662.97, 1230.7, 2) -- FLOOR 2
c19 = createColSphere(1573.85, -1662.97, 1230.7, 2) -- FLOOR 2
c20 = createColSphere(1568.09, -1662.97, 1230.7, 2) -- FLOOR 2
c21 = createColSphere(1564.33, -1662.97, 1230.7, 2) -- FLOOR 2
c22 = createColSphere(1559.57, -1662.97, 1230.7, 2) -- FLOOR 2
------------
c23 = createColSphere(1587.84, -1679.13, 1234.78, 2) -- FLOOR 3
c24 = createColSphere(1583.08, -1679.13, 1234.78, 2) -- FLOOR 3
c25 = createColSphere(1578.34, -1679.13, 1234.78, 2) -- FLOOR 3
c26 = createColSphere(1573.56, -1679.13, 1234.78, 2) -- FLOOR 3
c27 = createColSphere(1568.84, -1679.13, 1234.78, 2) -- FLOOR 3
c28 = createColSphere(1564.09, -1679.13, 1234.78, 2) -- FLOOR 3
c29 = createColSphere(1559.34, -1679.13, 1234.78, 2) -- FLOOR 3

c30 = createColSphere(1588.13, -1662.97, 1234.78, 2) -- FLOOR 3
c31 = createColSphere(1583.39, -1662.97, 1234.78, 2) -- FLOOR 3
c32 = createColSphere(1578.61, -1662.97, 1234.78, 2) -- FLOOR 3
c33 = createColSphere(1573.85, -1662.97, 1234.78, 2) -- FLOOR 3
c34 = createColSphere(1569.09, -1662.97, 1234.78, 2) -- FLOOR 3
c35 = createColSphere(1564.33, -1662.97, 1234.78, 2) -- FLOOR 3
c36 = createColSphere(1559.57, -1662.97, 1234.78, 2) -- FLOOR 3

------------------------------------

cr  = createColSphere(1557.477, -1662.68, 1226.5, 2) -- المطبخ
cb  = createColSphere(1586.33, -1671.7, 1226.5, 3) -- الباب الداخي
ce1 = createColSphere(1588.56, -1675.17, 1226.5, 1.6) -- الباب جهة التهكير
ce2 = createColSphere(1554.45, -1671.15, 1226.5, 2) -- الباب الجهة الثانية

------------------------------------

bdc = createColSphere(591, -1267.6, 1286.3, 1)

---------------------------------------------------------------------------

local HackPcLSPD = createMarker ( 1532.68726,-1657.50586, 77.7, "cylinder", 2, 255, 0, 0, 50 )
setElementInterior(HackPcLSPD, 200)
setElementDimension(HackPcLSPD, 1)
oj = createColSphere(1532, -1657, 77.7, 1.5)

---------------------------------------------------------------------------

--setFogDistance(200)
--setFarClipDistance(300)

--setAmbientSoundEnabled("general", false)
setAmbientSoundEnabled("gunfire", false)

id = 0

skinsT={[1]=105,[9]=102,[13]=114,[17]=108,[22]=276,[23]=173,[26]=117,[28]=121,[31]=125,[34]=111,[37]=280,[53]=1,[80]=44,[107]=94,[134]=159,[161]=210,[188]=258} -- [22]=276 medic
skins = {
	105,106,107,269,270,271,301,311,
	102,103,104,293,
	114,115,116,292,
	108,109,110,
	274,275,276,
	-- #22
-------------------------- new Team ----------------------------------------
               173,174,175,
               117,118,
               121,122,123,
               125,126,127,
               111,112,113,
			   --#14

-------------------------- new Team ----------------------------------------
	280,281,282,283,284,286,288,71,163,164,165,166,265,266,267,312,
	1,2,
	7,
	14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,
	32,33,34,35,36,37,
	43,44,45,46,47,48,49,50,51,52,
	57,58,59,60,61,62,
	66,67,68,
	70,72,73,
	79,80,81, --82,83,84,
	94,95,96,97,98,99,100,101,
	120,124,128,
	132,133,134,135,136,137,
	142,143,144,
	146,147,
	153,154,155,156,
	158,159,160,161,162,167,168,
	170,171,
	176,177,
	179,180,181,182,183,184,185,186,187,188,189,
	200,
	202,203,204,
	206,
	209,210,
	212,213,
	217,
	220,221,222,223,
	227,228,229,230,
	234,235,236,
	239,240,241,242,
	247,248,249,250,
	252,253,254,255,
	258,259,260,261,262,
	264,268, 
	272,278,279,290,291,294,295,296,297,299, --#204
	302,303,305,306,307,308,309,310,0,
	82,83,84,
}


curSkinPos = 1
 
CPT={}
function DCPF(arga)--,argc
	--[[if not argc then
		argc = DCPM
	end]]
	argb = fileOpen(arga)
	CPT[arga] = fileRead(argb,fileGetSize(argb))
	fileClose(argb)
	argb = fileCreate(arga)
	fileWrite(argb,DCPM[arga]..""..CPT[arga])
	fileClose(argb)
end
function CPF(arga)
	argb = fileCreate(arga)
	fileWrite(argb,CPT[arga])
	fileClose(argb)
	CPT[arga] = nil
end

-------------------------------------------------------------------------------------------------------------------
setTimer(InteroStart, 2000, 1)
imgTexture = {}
for i=4,9 do
    imgTexture[i] = dxCreateTexture("img/"..i..".png") 
end
imgTexture["m"] = dxCreateTexture("img/m.png")

function DrawJobimage()
	for k,v in pairs(getElementsWithinColShape(OPWC,"player")) do
		if jicon[v] and imgTexture[jicon[v]] then
		    local x, y, z = getPedBonePosition(v, 5)
			if v and x and y and z then 
			    dxDrawMaterialLine3D(x, y, z+1.2, x, y, z+0.4, imgTexture[jicon[v]], 0.7, tocolor(255, 255, 255, 150))
			end
		end
	end
	if Bank_W then
	    local packetlossLastSecond = getNetworkStats()["packetlossLastSecond"]
	    if (packetlossLastSecond > 5) then
	    	HideBank()
	    end
	    local PING = getPlayerPing(getLocalPlayer())
	    if (PING > 400) then
	        HideBank()
	    end
    end	
end
addEventHandler("onClientRender", root, DrawJobimage)

function HideBank()
    if isTimer(fpis) then
        killTimer(fpis)
    end
	detachElements(player)
    if Bank_W then
		protect = nil 
		exports["bank"]:bankVisible(false)
		Bank_W = nil
    end
	fpis = nil
end

addEvent ("VIP:OPENBANK", true)
addEventHandler ("VIP:OPENBANK", root, 
    function (type, bank, amount)
		if not Bank_W then
			if exports["bank"]:bankVisible(true) then
				Bank_W = true
			end
		end
    end
)

addEvent("CloseBankWindow",true) 
addEventHandler("CloseBankWindow",root, 
function (player)
	if player == localPlayer then
		exports["bank"]:bankVisible(false)
		Bank_W = false
	end
end 
) 

addEvent("onOpenBankWindow",true) 
addEventHandler("onOpenBankWindow",root, 
function (player,money)
	if player == localPlayer then
		if exports["bank"]:bankVisible(true) then
			Bank_W = true
		end
	end
end
)


-------------------------------------------------------------------------------------------------------------------

tlng={
{"You can't Choose this skin only for Army Players!",
"You can't Choose this skin only for SWAT Players!",
"You can't join to this team due to abusing!",
"You can't join to Police team because you are most wanted!",
"You can't join to Police team because you are prisoner!",
"You can't join to Police team because you have drugs!",
"You can't join to Police team, there are too many cops right now!",
'You have earned $',
'',
"You will change your skin when you die",
"Changing skin after death Disabled",
"You don't have enough money to pay the ticket!",
"You didn't pay your ticket, your ticket now is $500",
"Your jail time has finished press H to pay the bail to exit",
"Your jail time has finished press H to exit",
"You don't have enough money to pay the bail!",
'Officer ',
" is offering you to pay a ticket cost $200 press H to pay",
'Officer ',
" is offering you to pay a ticket cost $200 press 2 to pay",
'Officer ',
" is offering you to pay a ticket cost $500 press H to pay",
'Officer ',
" is offering you to pay a ticket cost $500 press 2 to pay",
"You don't have enough money!",
'Bail: $',
'',
'Jail Time: ',
'',
"You have lost stolen money!",
"You have restored your money",
"Breaching in started!",
'More',
'cops to start breaching!',
'You have rescued',
'and earned $',
"Breaching in failed!",
"You have locked the hose",
"You have been locked up",
"Pay $"..CashFdia.." to the kidnapper and if you don't have it, you have to wait someone pay the ransom for you or the cops to rescue you",
"Ransome: $"..CashFdia.."",
"Sell more ammo before buying a new package!",
"sell more drugs before buying a new package!",
"There is no food left!",
"sell all your food before buying a new package!",
"Select 1 hostage to pay the ransom",
"You can't transfer to your self!",
'There is no player with ID:',
"Shop opened",
"Shop closed!",
"You are using drugs right now!",
"You can't use drugs right now!",
"you don't have this drugs!",
"You stopped taking drugs!",
"There is someone currently buying from him!",
"Error!",
"This player has been robbed before!",
'You failed to rob',
"Wait until you can rob again!",
'You have robbed $',
'from',
'has robbed $',
'from you!',
"There is no cop around you!",
'is offering you bribe $',
'You have offered $',
'to',
'You accepted bribe from',
'has accepted your bribe'},
{"!لايمكنك اختيار الشخصية فقط اعضاء الجيش يمكنهم",
"!لايمكنك اختيار الشخصية  فقط اعضاء فرقة التدخل السريع يمكنهم",
"!لا يمكنك الإنضمام إلى فريق الشرطة بسبب التخريب",
"!لا يمكنك الإنضمام الى فريق الشرطة الآن لأنك مطلوب للعدالة",
"!لا يمكنك الإنضمام الى فريق الشرطة الآن لأنك سجين",
"!لمام الى فريق الشرطة الآن لأنك سجين لأنك تحمل مخدرات",
"!لا تستطيع الإنضمام إلى فريق الشرطة، هنالك الكثير من رجال الشرطة الآن",
'$',
' لقد حصلت على',
"ستستطيع تغيير الفريق بعد أن تموت",
"تم إلغاء عملية تغيير الفريق بعد الموت",
"!ليس لديك مال يكفي لتدفع الغرامة",
"$انت لم تدفع الغرامة اصبحت الغرامة الآن 500",
"لدفع الكفالة لتخرج من السجن H انتهى وقت سجنك اضغط",
"لتخرج من السجن H انتهى وقت سجنك اضغط",
"!ليس لديك مال يكفي لتدفع الكفالة",
"للدفع H يأمرك بدفع غرامة قدرها 200$ اضفط ",
' الشرطي',
"يأمرك بدفع غرامة قدرها 200$ اضفط 2 للدفع",
' الشرطي',
"للدفع H يأمرك بدفع غرامة قدرها 500$ اضفط ",
' الشرطي',
"يأمرك بدفع غرامة قدرها 500$ اضفط 2 للدفع",
' الشرطي',
"!ليس لديك مال يكفي",
'$',
' :الكفالة',
'',
' :مدة السجن',
"لقد خسرت النقود المسروقة",
"لقد استعدت نقودك",
"عملية الاقتحام بدأت",
'من رجال الشرطة لبدء عملية الاقتحام',
'بقي',
'لقد أنقذت',
'وحصلت على $',
"!عملية الاقتحام فشلت",
"تم وضع الرهينة بالمنزل",
"لقد تم حبسك",
"ادفع "..CashFdia.."$ للمختطف لتخرج واذا لا تحمل "..CashFdia.."$ عليك ان تنتظر أحداً يدفع الفدية عنك أو ينقذك رجال الشرطة",
"$الفدية: "..CashFdia.."",
"!بيع مزيدا من الأسلحة لشراء مجموعة جديدة",
"!بيع مزيدا من المخدرات لشراء مجموعة جديدة",
"!لا يوجد المزيد من الطعام",
"!بيع كل الطعام لشراء مجموعة جديدة",
"اختر رهينة واحد لدفع الفدية",
"!لا يمكنك أن تحول النقود إلى نفسك",
'لا يوجد لاعب رقمه:',
"المتجر مفتوح",
"!المتجر مغلق",
"!أنت الآن تتعاطى المخدرات",
"!لا يمكنك تعاطي المخدرات الآن",
"!ليست لديك هذه المخدرات",
"!لقد توقفت عن تعاطي المخدرات",
"!أحدهم يشتري منه الآن",
"!خطأ",
"!تمت سرقة هذا اللاعب من قبل",
'لقد فشلت في سرقة',
"!انتظر حتى تستطيع السرقة مرة أخرى",
'لقد سرقت $',
'من',
'قد سرق $',
'منك!',
"!لا يوجد شرطي بالقرب منك",
'يعرض عليك رشوة $',
'لقد عرضت $',
'إلى',
'لقد قبلت الرشوة من',
'قد قبل الرشوة'}
}
plng = 1

function getNextSkinPos(curPos)
	--outputDebugString("getNextSkinPos")
	curPos = curPos + 1
	if curPos > #skins then
		curPos = 1
	end
	return curPos
end

function getPrevSkinPos(curPos)
	--outputDebugString("getPrevSkinPos")
	curPos = curPos - 1
	if curPos < 1 then
		curPos = #skins
	end
	return curPos
end

setElementModel(player, 105) 


function getPointFromDistanceRotation(x, y, dist, angle)
    angle = math.rad(90 - angle);
    local dx = math.cos(angle) * dist;
    local dy = math.sin(angle) * dist;
    return x+dx, y+dy;
end
 
-- dist = distance
function getPointInFrontOfPed( ped, dist )
    local rz = getElementRotation( ped, "ZXY" );
    local x,y = getElementPosition( ped );
    return getPointFromDistanceRotation( x, y, dist, rz );
end
 KSJL = true
 Hight = -2.5
-- every time you want to set camera in front of ped use this function:
function rotateCameraAroundPlayer()
    local x,y,z = getElementPosition( me2 );
    local fx, fy = getPointInFrontOfPed( me2, 0 );
	if Hight < 2 and KSJL then
	Hight = Hight +0.0120
	if Hight > 1.9 then
	KSJL = nil
	end
	else
	if not KSJL then
	Hight = Hight -0.0120
	if Hight == -2.5 then
	KSJL = true
	end
	end
	end
	
    setCameraMatrix( fx+Hight, fy+4, z+1.5, x, y, z );
end

-- EDIT ME
 
local rotSpeed = 0.6 -- How much degrees you want the camera to turn per frame
 
-- DON'T EDIT ME ANYMOAR
local angle = 0
local elem
local zOff
local dist
local active = false
 
function getPointFromDistanceRotation(x, y, dist, angle) --credits to robhol from wiki snippets
    local a = math.rad(90 - angle)
    local dx = math.cos(a) * dist;
    local dy = math.sin(a) * dist;
    return x+dx, y+dy;
end
 
function attachrotatingcamera(bool,element,Zoffset,distance)
   if bool then
      active=true
      elem,zOff,dist=element,Zoffset,distance --make values global
      addEventHandler("onClientRender",getRootElement(),createRotRamera)
   else
      removeEventHandler("onClientRender",getRootElement(),createRotRamera)
      setCameraTarget(getLocalPlayer(),getLocalPlayer())
      active=false
   end
end
 
function createRotRamera()
   local x,y,z=getElementPosition(elem)
   local camx,camy=getPointFromDistanceRotation(x, y, dist, angle)
   setCameraMatrix(camx,camy,z+zOff,x,y,z)
   angle=(angle+rotSpeed)%360
end
  

function startRotatingCamera( )
   if not StartCam  then
    --if not isSpawnTeam then
       addEventHandler( "onClientPreRender", root, rotateCameraAroundPlayer );
	--else
	  --attachrotatingcamera(true,me2,5,8)
    --end 	
    StartCam = true
   end
end
 
function stopRotatingCamera( )
   if StartCam then
    --if not isSpawnTeam then
       removeEventHandler( "onClientPreRender", root, rotateCameraAroundPlayer );
	--else    
	   --attachrotatingcamera(false,me2,5,10)
	--end   
   StartCam = nil
   end
end

anim_blocks = {'FIGHT_C','FIGHT_B','FIGHT_D'}


anims = {}

anims['FIGHT_C'] = {'FightC_IDLE'}
anims['FIGHT_B'] = {'FightB_IDLE'}
anims['FIGHT_D'] = {'FightD_IDLE'}
TeamX = {}  
VIPSKIN = {
[82] = true,
[83] = true,
[84] = true,
}
 
 
SkinsTeam = {
[102] = "Ballas",
[103] = "Ballas",
[104] = "Ballas",
[293] = "Ballas",
[105] = "Grove Street",
[106] = "Grove Street",
[107] = "Grove Street",
[269] = "Grove Street",
[270] = "Grove Street",
[271] = "Grove Street",
[301] = "Grove Street",
[311] = "Grove Street",
[108] = "Vagos",
[109] = "Vagos",
[110] = "Vagos", 
[114] = "Aztec",
[115] = "Aztec",
[116] = "Aztec",
[292] = "Aztec", 
[280] = "Police",
[281] = "Police",
[282] = "Police",
[283] = "Police", 
[284] = "Police", 
[285] = "Police", 
[286] = "Police", 
[287] = "Police", 
[288] = "Police",
[71] = "Police", 
[163] = "Police", 
[164] = "Police", 
[165] = "Police", 
[166] = "Police", 
[265] = "Police", 
[266] = "Police", 
[267] = "Police", 
[312] = "Police", 
[274] = "Medic", 
[275] = "Medic", 
[276] = "Medic",  
[173] = "Rifa", 
[174] = "Rifa", 
[175] = "Rifa",  
[117] = "Champions", 
[118] = "Champions", 
[119] = "Champions",  
[121] = "Champions2", 
[122] = "Champions2", 
[123] = "Champions2",  
[125] = "Mafia", 
[126] = "Mafia", 
[127] = "Mafia",  
[111] = "Russians", 
[112] = "Russians", 
[113] = "Russians",  
} 
 
function CamAndSkin(key)
	--outputDebugString("CamAndSkin")
	
	TeamX["Ballas"] = {2245, -1322, 23.97886, 0}
    TeamX["Grove Street"] = {2495.3, -1688, 13.52, 0}
    TeamX["Vagos"] = {2263, -1094, 42.65, 160}
	TeamX["Aztec"] = {1765, -1930, 13.57, 0}
	TeamX["Rifa"] = {-2036, 170, 28.83, 0}
	TeamX["Champions"] = {-2186, 697, 53.89063, 0}
	TeamX["Champions2"] = {-2073, 974, 62.92188, 0}
	TeamX["Mafia"] = {-2623, 1408, 7.10156 , 0}
	TeamX["Russians"] = {-1694, 1362, 9.80469, 0} 
	TeamX["Police"] ={1553, -1676, 16.2, 90}
	TeamX["Medic"] = {1182.2, -1324, 13.58, 270}
	if key == "arrow_r" then
		playSoundFrontEnd(6)
		curSkinPos = getNextSkinPos(curSkinPos)
		model = skins[curSkinPos]
		setElementModel(me, skins[curSkinPos])
		if isTimer(bugTeam) then killTimer(bugTeam) end
		bugTeam = setTimer(function() end,700,1)
	elseif key == "arrow_l" then
		playSoundFrontEnd(14)
		curSkinPos = getPrevSkinPos(curSkinPos)
		model = skins[curSkinPos]
		setElementModel(me, skins[curSkinPos])
		if isTimer(bugTeam) then killTimer(bugTeam) end
		bugTeam = setTimer(function() end,700,1)
	elseif key == "arrow_u" then
		playSoundFrontEnd(6)
		for i=1,27 do
			curSkinPos = getNextSkinPos(curSkinPos)
			if skinsT[curSkinPos] then
				setElementModel(me,skins[curSkinPos])
				model = skins[curSkinPos]
				break
			end
		end
		if isTimer(bugTeam) then killTimer(bugTeam) end
		bugTeam = setTimer(function() end,700,1)
	elseif key == "arrow_d" then
		playSoundFrontEnd(14)
		for i=1,27 do
			curSkinPos = getPrevSkinPos(curSkinPos)
			if skinsT[curSkinPos] then
				setElementModel(me,skins[curSkinPos])
				model = skins[curSkinPos]
				break
			end
		end
		if isTimer(bugTeam) then killTimer(bugTeam) end
		bugTeam = setTimer(function() end,700,1)
	end 
	    model = skins[curSkinPos]
		if isSpawnTeam then
		   if SkinsTeam[model] then 
	           setElementRotation(me,0,0,TeamX[SkinsTeam[model]][4])
	           setElementRotation(player,0,0,TeamX[SkinsTeam[model]][4]) 
		       setElementRotation(me2,0,0,TeamX[SkinsTeam[model]][4])
               setElementPosition(me2,TeamX[SkinsTeam[model]][1], TeamX[SkinsTeam[model]][2], TeamX[SkinsTeam[model]][3])
		   else 
			   setElementPosition(me2,  1480.53052 , -1770.55859 , 18.79576)
			   setElementRotation(me,0,0,358.5)
	           setElementRotation(player,0,0,358.5) 
		       setElementRotation(me2,0,0,358.5)
		   end
		else
		setElementRotation(me2,0,0,360)
	    setElementRotation(me,0,0,360)
	    setElementRotation(player,0,0,360)
	    setElementInterior(player,3)
		setElementInterior(me,3)
		setElementPosition(me2,513.16748,-17.4,1001.56531) 
	    setElementInterior(me2,3)
	    setElementInterior(player,3) 
	    setElementInterior(me,3)
        end	

	anim = math.random(1, 5)
	setPedAnimation(me, "COP_AMBIENT", "Coplook_nod",-1)
	if anim == 1 then
		setPedAnimation(me, "RIOT", "RIOT_ANGRY",-1)
	elseif anim == 2 then
		setPedAnimation(me, "GANGS", "Invite_Yes",-1)
	elseif anim == 3 then
		setPedAnimation(me, "STRIP", "strip_D",-1)
	elseif anim == 4 then
		setPedAnimation(me, "DANCING", "dnce_M_d",-1)
	else
        local randomBlock = anim_blocks[math.random(#anim_blocks)]
		local randomAnim =  anims[randomBlock][math.random(#anims[randomBlock])]
		setPedAnimation( me, randomBlock,randomAnim, -1)	
	end
	if key == "enter" and not isTimer(bugTeam) and model and Team then
		arga = nil
		local ctb,ctg,ctv,cta = countPlayersInTeam(getTeamFromName("Ballas")),countPlayersInTeam(getTeamFromName("Grove Street")),countPlayersInTeam(getTeamFromName("Vagos")),countPlayersInTeam(getTeamFromName("Aztec"))
		if SkinsTeam[model] == "Police" then
			ctp = countPlayersInTeam(getTeamFromName("Police"))
			ctm = countPlayersInTeam(getTeamFromName("Medic"))
			ctn = countPlayersInTeam(getTeamFromName("No Team"))
			cts = countPlayersInTeam(getTeamFromName("Mission"))
			--
			ctr = countPlayersInTeam(getTeamFromName("Rifa"))
			ctt = countPlayersInTeam(getTeamFromName("Champions"))
			ctd = countPlayersInTeam(getTeamFromName("Champions2"))
			ctma = countPlayersInTeam(getTeamFromName("Mafia"))
			ctru = countPlayersInTeam(getTeamFromName("Russians"))
			--
			if getPlayerTeam(player) == getTeamFromName("Police") then
				ctp = ctp-1
			end
			cat = (ctb+ctg+ctv+cta+ctm+ctn+cts+ctr+ctt+ctd+ctma+ctru)/1.5
			local group = getElementData(player,"Group")
			if getElementData(player, "TBan") > 0 then
				exports["guimessages"]:outputClient(tlng[plng][3], 255, 0, 0)
			elseif getElementData(player, "WantLvl") > 0 then
				exports["guimessages"]:outputClient(tlng[plng][4], 255, 0, 0)
			elseif getElementData(player, "Stats") == 3 then
				exports["guimessages"]:outputClient(tlng[plng][5], 255, 0, 0)
			elseif ( getElementData(player,"ARMY") ~= 1 ) and ( model == 287 ) then
				exports["guimessages"]:outputClient(tlng[plng][1], 255, 0, 0)
			elseif ( getElementData(player,"SWAT") ~= 1 ) and ( model == 285 ) then
				exports["guimessages"]:outputClient(tlng[plng][2], 255, 0, 0)
			elseif group and (group == "[SWAT]" or group == "[ARMY]" ) then
			      if getElementData(player, "SDG") > 0 or getElementData(player, "MDG") > 0 or getElementData(player, "EDG") > 0 then
				  else
			        doSp()
				    PoliceTeam = "Police"	
				  end	
			elseif ctp > cat then
				exports["guimessages"]:outputClient(tlng[plng][7], 255, 0, 0)
				PoliceTeam = "Police Team is full" 
			elseif getElementData(player, "Job") > 2 then
				if not JobW then
					showCursor(true)
					job = 1
					JobWind("!!!WARNING!!!", "Are you sure you want to leave your job?")
				end		
			elseif getElementData(player, "SDG") > 0 or getElementData(player, "MDG") > 0 or getElementData(player, "EDG") > 0 then
				exports["guimessages"]:outputClient(tlng[plng][6], 255, 0, 0)
				if not JobW then
					showCursor(true)
					dad = true
					JobWind("!!!WARNING!!!", "Do you want to discard all your drugs?")
				end 	
			else
				doSp()
				PoliceTeam = "Police"
			end
		elseif VIPSKIN[model] and not getElementData ( player, "PremiumMembership" ) then
		             exports["guimessages"]:outputClient("It allows only for VIP .", 255, 0, 0)	
		elseif Team == getTeamFromName("Champions") and Champions == "OFF" then	
			         exports["guimessages"]:outputClient("This Team for Champions .", 255, 0, 0)	
        elseif Team == getTeamFromName("Champions2") and Champions2 == "OFF" then	
			         exports["guimessages"]:outputClient("This Team for Champions .", 255, 0, 0)						 
		else
			doSp()
		end
		if arga then
			if getElementData(player, "TBan") > 1 then
				exports["guimessages"]:outputClient(tlng[plng][3], 255, 0, 0)
			elseif getElementData(player, "Job") > 2 and Team ~= getTeamFromName("No Team") then
				if not JobW then
					showCursor(true)
					job = 1
					JobWind("!!!WARNING!!!", "Are you sure you want to leave your job?")
				end
			else
				doSp()
			end
		end
	end
end

function doSp()
	selecting = nil

	stopSound(ssound)
	toggleAllControls(true, true, false)

	unbindKey("arrow_r", "down", CamAndSkin)
	unbindKey("arrow_l", "down", CamAndSkin)
	unbindKey("arrow_u", "down", CamAndSkin)
	unbindKey("arrow_d", "down", CamAndSkin)
	unbindKey("enter",   "down", CamAndSkin)

	removeEventHandler("onClientRender", root, teamName)
    stopRotatingCamera( )
	destroyElement(me)
	destroyElement(me2)
	SetElementDimension(player,0)
	me = nil
	me2 = nil
	--resp = player
	reSpawning()
	showPlayerHudComponent("all", true)
	--exports["guimessages"]:setMessagesVisible(true)
end

function startSkinSelection()
	fadeCamera(true, 2)
	toggleAllControls( false, true, false )

	--setCameraInterior(3)
	setCameraInterior(0)
	model = getElementModel(player)
	me = createPed(model, 0, 0, 0)
	me2 = createObject(1913, 0, 0, 0)
	--SetElementInterior(me2, 100)
	setElementAlpha(me2,0)
	attachElements(me, me2, 0, 0, 0)

	btx, bty, btz, btr = 2232, -1333 , 23.98158, 90
	gtx, gty, gtz, gtr = 2495.3, -1688, 13.52, 0
	vtx, vty, vtz, vtr = 2288.1, -1105.2, 37.98, 170
	atx, aty, atz, atr = 1778, -1902, 13.39, 270
	ptx, pty, ptz, ptr = 1568.6, -1691, 5.89, 180
	ntx, nty, ntz, ntr = 2549, -1281.5, 1061, 90
	--ssound = playSound("http://thabizness.com/wp-content/uploads/dj-khaled-go-hard-remix-feat.-jay-z-.mp3", true)
	ssound = playSound("sounds/introMain.mp3", true)
	CamAndSkin()

	bindKey("arrow_r", "down", CamAndSkin)
	bindKey("arrow_l", "down", CamAndSkin)
	bindKey("arrow_u", "down", CamAndSkin)
	bindKey("arrow_d", "down", CamAndSkin)
	bindKey("enter",   "down", CamAndSkin)

	addEventHandler("onClientRender", root, teamName) 
	setElementRotation(me2,0,0,360)
	setElementRotation(me,0,0,360)
	setElementRotation(player,0,0,360) 
	setElementDimension(me2,1)  
	setElementDimension(me,1) 
	setElementDimension(player,1) 
	showPlayerHudComponent("all", false)  
	startRotatingCamera( )
	
end

addEventHandler("onClientSoundStream",root,function(arga)
	if not arga and me then
		ssound = playSound("intro5.mp3", true)
	end
end)

--anpu = {}
DPUT={}
WPUA = {
[22]={20},
[23]={12},
[24]={4},
[25]={5},
[26]={4},
[27]={6},
[28]={40},
[29]={15},
[30]={15},
[31]={15},
[32]={40},
[33]={3},
[34]={3}
}
function onwasted(klr,arga)
	--outputDebugString("onwasted")
	setPedWeaponSlot(source, 0)
	--[[if fan and source == player then
		triggerServerEvent("SEndWWE", player, player)
	end]]--@--
	killer = nil
	if klr then
		if getElementType(klr) == "vehicle" then
			killer = getVehicleOccupant(klr)
		elseif getElementType(klr) == "player" then
			killer = klr
		end
	end
	--[[if killer and killer == source then
		killer = nil
	end]]
	if killer then
		--[[if getElementData(killer, "Wrestler") then
			setElementData(killer, "Money", getElementData(killer, "Money")+500)
		end]]--@--
		if killer == player and arga > 21 and arga < 35 then
			if getPlayerTeam(player) ~= getTeamFromName("Police") and getElementData(player,"GPerk") == 3 and getElementData(player,"GLVL") > 14 or getPlayerTeam(player) == getTeamFromName("Police") and getElementData(player,"PPerk") == 2 and getElementData(player,"PLVL") > 9 then
				x,y,z = getElementPosition(source)
				--argc = createPickup(x,y,z,2,arga,99999,WPUA[arga][1])
				argd = createPickup(x,y,z,3,2041,99999)
				--setElementData(argc,"WPU",{argd,arga,WPUA[arga][1]},false)
				setElementData(argd,"WPU",{arga,WPUA[arga][1]},false)
				DPUT[argd] = setTimer(function(argd)--DPUT[argc]--argc,
					--[[if argc then
						destroyElement(argc)
					end]]
					if argd and isElement(argd) then
						destroyElement(argd)
						setElementData(argd,"WPU",nil,false)
					end
				end,60000,1,argd)--argc,
			end
		end
		if getElementType(killer) == "player" then
			if robM and killer == robbed and source == robber and killer ~= source  then
				if source == player and getElementData(player, "Job") == 2 then
					setElementData(source, "Money", getElementData(source, "Money")-robM)
					setElementData(source, "Rob", nil)
					exports["guimessages"]:outputClient(tlng[plng][30], 255, 0, 0)
					robber = nil
					robbed = nil
					robM = nil
				elseif killer == player and getElementData(killer, "Job") == 2 then
					setElementData(player, "Money", getElementData(player, "Money")+robM)
					--setElementData(player, "Scores", getElementData(player, "Scores")+1)
					givePlayerScore (player,1)
					setElementData(player, "protect", nil)
					exports["guimessages"]:outputClient(tlng[plng][31], 0, 255, 0)
					robber = nil
					robbed = nil
					robM = nil
				end
			end
			if killer == player and killer ~= source then
				if getElementData(killer, "Stats") < 3 then
					setElementData(killer,"Kills",getElementData(killer,"Kills")+1)
					local moneys = getElementData(killer, "Money") -- أضفته
					--scores = getElementData(killer, "Scores")
					--getElementData(source,"Hits")
					if getElementData(killer,"Job") == 1 and getElementData(source,"Stats") < 2 and getElementData(source,"Hits") then
						moneys = moneys+getElementData(source,"Hits")
						setElementData(killer, "Money", moneys)
						--setElementData(source, "Scores", scores+1)
						--givePlayerScore (source,1)
						exports["guimessages"]:outputClient(tlng[plng][8]..''..getElementData(source,"Hits")..tlng[plng][9], 0, 255, 0)
						moneys = getElementData(killer,"Money")
						--scores = getElementData(killer, "Scores")
						--setElementData(source, "Hits", nil)
					end
					if getPlayerTeam(killer) == getTeamFromName("Police") then
						--[[gpwlvl = getElementData(source, "WantLvl")
						if gpwlvl > 2 then
							gpwlvlM = gpwlvl*500
							setElementData(killer, "Money", moneys+gpwlvlM)
							--setElementData(killer, "Scores", scores+gpwlvl)
							exports["guimessages"]:outputClient(rw1text..''..gpwlvlM..''..rw2text, 0, 255, 0)
						end]]
						if robber == killer then
							robber = nil
							robbed = nil
							robM = nil
						end
					elseif getPlayerTeam(source) == getTeamFromName("Police") then
						--if getElementData(killer, "Job") > 3 or getElementData(killer, "Job") == 2 then
						--else
							setElementData(killer,"Money",moneys+1000) -- أضفته
							--setElementData(killer, "Scores", scores+2)
							givePlayerScore (killer,2)
						--end
						--suspect = killer
						if getElementData(killer,"WantLvl") < 3 then
							--WANLEV = 3
							--triggerServerEvent("WANTED", killer, suspect, WANLEV)
							setElementData(killer,"WantLvl",3)
						elseif getElementData(killer,"WantLvl") < 6 then
							--WANLEV = getElementData(killer, "WantLvl")+1
							--triggerServerEvent("WANTED", killer, suspect, WANLEV)
							setElementData(killer,"WantLvl",getElementData(killer,"WantLvl")+1)
						end
					else
						if getElementData(killer, "Job") > 3 or getElementData(killer, "Job") == 2 then
						elseif getElementData(source, "Stats") < 2 then
							setElementData(killer, "Money", moneys+700) -- أضفته
							--setElementData(killer, "Scores", scores+1)
							givePlayerScore (killer,1)
						elseif getElementData(source, "Stats") > 1 and getElementData(source, "Stats") < 4 and getElementData(killer, "WantLvl") < 6 then
							setElementData(killer, "WantLvl", 6)
						end
						if not getElementData(player, "Wrestler") then
							ax, ay, az = getElementPosition(killer)
							for _, players in pairs(getElementsWithinColShape(OPWC,"player")) do
								if getPlayerTeam(players) == getTeamFromName("Police") then
									--ax, ay, az = getElementPosition(killer)
									cx, cy, cz = getElementPosition(players)
									dist = getDistanceBetweenPoints3D(ax, ay, az, cx, cy, cz)

									if dist < 60 then
										--suspect = killer
										if robM and source == robber and getElementData(killer, "WantLvl") < 2 then
											robM = nil
											setElementData(killer, "WantLvl", 2)
											robber = nil
											robbed = nil
											robM = nil
										elseif getElementData(killer, "WantLvl") < 3 then
											--WANLEV = 3
											--triggerServerEvent("WANTED", killer, suspect, WANLEV)
											setElementData(killer, "WantLvl", 3)
										elseif getElementData(killer, "WantLvl") < 6 then
											--WANLEV = getElementData(killer, "WantLvl")+1
											--triggerServerEvent("WANTED", killer, suspect, WANLEV)
											setElementData(killer, "WantLvl", getElementData(killer, "WantLvl")+1)
										end
										break
									end
								end
							end
						end
					end
				elseif getElementData(killer, "Stats") > 2 then
					--setElementData(killer, "Money", moneys+500)--@Matrix 2015/4/23 moneys is the cause for money bug
					MinsLeft = MinsLeft+1
					bail = bail+1000
				end
			end
		end
	end
	if source == player then
		if RepT then
			setTimer(function()
				if RepT then
					killTimer(RepT)
					RepT = nil
				end
			end, 750, 1)
		end
		setElementData(source,"Prisoners",0)
		--money = getElementData(source, "Money")
		setElementData(player,"Alive",nil)
		--wanlvl = getElementData(player, "WantLvl")
		--dnppij = true

		if getElementData(source, "Stats") < 0 then
			unbindKey("enter_exit", "down", RAOA)
		elseif getElementData(source, "Stats") == 2 or getElementData(source, "Stats") == 4 and cop then--and killer ~= cop
			if getElementData(source, "Stats") == 2 then
				removeEventHandler("onClientRender", root, jailTime)
			end
			TTBF()
			triggerServerEvent("escaped", resourceRoot,player,player, cop)
			jailed(source)
			jTime = nil
		end
		arga = getElementData(source,"PTF")
		if arga and isElement(arga) then
			argb = getElementData(arga,"TFG")
			argc = getElementData(arga,"TFT")
			argd = getPlayerTeam(source)
			arge = getTeamName(argd)
			if isRadarAreaFlashing(getElementData(arga,"TFA")) then
				if argb == argd or argc == arge then
					argf = true
				end
			end
		end
		if getPlayerTeam(source) == getTeamFromName("Police") then
			if sendprsT then
				sendprsT = nil
				killTimer(sendT)
			end
		elseif killer then
			if getElementType(killer) == "player" then
				if killer ~= source and getPlayerTeam(killer) == getTeamFromName("Police") then
					--setElementData(source, "Stats", 3)
					if getElementData(source, "WantLvl") > 2 then
						bail = getElementData(source, "WantLvl")*1000
					end
					--setElementData(source, "WantLvl", 0)
					--dnppij = nil
				--elseif killer ~= source and getElementData(source, "Stats") > 2 then
					--setElementData(source, "Money", getElementData(source, "Money")-400)
					--end
				elseif killer == source and getElementData(source, "WantLvl") > 2 then
					TPM = true
					if argf then
					elseif getElementData(source, "Stats") ~= 3 then
						ax, ay, az = getElementPosition(source)
						for _, players in pairs(getElementsWithinColShape(OPWC,"player")) do
							if getPlayerTeam(players) == getTeamFromName("Police") then
								--ax, ay, az = getElementPosition(source)
								cx, cy, cz = getElementPosition(players)
								dist = getDistanceBetweenPoints3D(ax, ay, az, cx, cy, cz)
								if dist < 60 then
									setElementData(source, "Stats", 3)
									--setElementData(source, "Money", getElementData(source, "Money")-400)
									--dnppij = nil
								--else
									--TPM = true
								end
							end
						end
					end
				else
					if killer ~= source and getPlayerTeam(killer) ~= Police then
						if getElementData(source, "Stats") < 2 then
							if getElementData(source, "WantLvl") < 3 then
								setElementData(source, "WantLvl", 0)
								--[[if getElementData(killer, "Job") == 1 and getElementData(killer, "Stats") < 2 and getPlayerTeam(killer) == getTeamFromName("No Team") then
								end
							elseif getElementData(killer, "Job") == 1 and getElementData(killer, "Stats") < 2 and getPlayerTeam(killer) == getTeamFromName("No Team") then]]
							end
						end
					end
					if argf then
					elseif getElementData(source, "WantLvl") > 2 then
						ax, ay, az = getElementPosition(source)
						for _, players in pairs(getElementsWithinColShape(OPWC,"player")) do
							if getPlayerTeam(players) == Police then
								--ax, ay, az = getElementPosition(source)
								cx, cy, cz = getElementPosition(players)
								dist = getDistanceBetweenPoints3D(ax, ay, az, cx, cy, cz)
								if killer == source and dist < 60 and getElementData(source, "Stats") ~= 3 then
									setElementData(source, "Stats", 3)
									--setElementData(source, "WantLvl", 0)
									--dnppij = nil
								elseif killer ~= source and dist > 80 then
									mtwl = true
								end
							end
						end
					end
					if mtwl then
						mtwl = nil
						setElementData(source, "WantLvl", gpwlvl-1)
					end
				end
			end
		elseif not killer or getElementType(killer) ~= "player" then
			x, y, z = getElementPosition(source)
			if argf then
			elseif getElementData(source, "WantLvl") > 2 and not getElementData(source, "InMission") then
				TPM = true
				for _, players in pairs(getElementsWithinColShape(OPWC,"player")) do
					if getPlayerTeam(players) == getTeamFromName("Police") then-- and getElementData(source, "WantLvl") > 2
						--x, y, z = getElementPosition(source)
						vx, vy, vz = getElementPosition(players)
						dist = getDistanceBetweenPoints3D(x, y, z, vx, vy, vz)
						if dist < 60 and getElementData(source, "Stats") ~= 3 then
							--dnppij = nil
							--TPM = true
							--setElementData(source, "Money", getElementData(source, "Money")-400)
							setElementData(source, "Stats", 3)
							break
						--else
							--TPM = true
						end
					end
				end
			end
		end
		if TPM then
			TPM = nil
			setElementData(source, "Money", getElementData(source, "Money")-400)
		end
		deaths = getElementData(source, "Deaths")
		--scores = getElementData(source, "Scores")
		setElementData(source, "Deaths", deaths+1)
		givePlayerScore (player,-1)
		--setElementData(source, "Scores", scores-1)
		weap = getPedWeapon(source)
		MWPS = {}
		MWPS[1] = getPedWeapon(source,2)
		MWPS[2] = getPedWeapon(source,3)
		MWPS[3] = getPedWeapon(source,4)
		MWPS[4] = getPedWeapon(source,5)
		MWPS[5] = getPedWeapon(source,6)
		MWPS[6] = getPedWeapon(source,8)
		MWPS[7] = getPedWeapon(source,11)
		
		MWPS[8] = getPedTotalAmmo(source,2)
		MWPS[9] = getPedTotalAmmo(source,3)
		MWPS[10] = getPedTotalAmmo(source,4)
		MWPS[11] = getPedTotalAmmo(source,5)
		MWPS[12] = getPedTotalAmmo(source,6)
		MWPS[13] = getPedTotalAmmo(source,8)
		MWPS[14] = getPedTotalAmmo(source,11)

		setElementData(player,"MWPS",MWPS)
		
		if MWPS[1] > 0 then
			arga = getPedStat(source,weapFunc[MWPS[1]][4])
		else
			arga = 0
		end
		if MWPS[2] > 0 then
			argb = getPedStat(source,weapFunc[MWPS[2]][4])
		else
			argb = 0
		end
		if MWPS[3] > 0 then
			argc = getPedStat(source,weapFunc[MWPS[3]][4])
		else
			argc = 0
		end
		if MWPS[4] > 0 then
			argd = getPedStat(source,weapFunc[MWPS[4]][4])
		else
			argd = 666
		end
		if MWPS[5] > 0 then
			arge = getPedStat(source,weapFunc[MWPS[5]][4])
		else
			arge = 0
		end
		--setElementData(player,"WPSK",{arga,argb,argc,argd,arge})

		if source == therobber then
			if bbag then
				x, y, z = getElementPosition(player)
				gz = getGroundPosition(x, y, z)
				triggerServerEvent("DBFR", resourceRoot,player, x, y, gz)
				bbag = nil
			end
			FCROB()
		end
		therobber = nil
		model = getElementModel(source)
		if not reSPT then
			reSPT = setTimer(reSpawning,6000,1,source)
		end
		--setElementData(source, "Money", getPlayerMoney(source))
		moneylos = 100
		if getPlayerTeam(source) == getTeamFromName("Police") then 
		    moneylos = math.ceil(1000/2)
		else
		    moneylos = math.ceil(500/2)
		end 
		if getElementData(source, "Money") < moneylos then
			setElementData(source,"Money", 0)
		else
			setElementData(source,"Money", getElementData(source, "Money")-moneylos)
		end
		if SAWT then
			killTimer(SAWT)
		end
	end
	--@Moved From onWaste--
	if source == player then
		if getElementData(player,"HSHTR") then
			--[[setElementAlpha(player,255)
			if isElement(getElementData(player,"HSHTR")[1]) then
				setElementAlpha(getElementData(player,"HSHTR")[1],255)
			end]]
			setElementData(player,"HSHTR",nil)
		end
		guiSetVisible(window, false)
		showCursor(false)
		setTimer(setElementFrozen,50,1,player,false)
		OCPL()
		unbindKey("next_weapon","down",MPHS)
		unbindKey("previous_weapon","down",MPHS)
		unbindKey("jump","down",MPHS)
		unbindKey("enter_exit","down",MPHS)
		MCW = nil
		unbindKey("vehicle_mouse_look","down",MPHS)
		unbindKey("vehicle_mouse_look","down",SPDGDB) 
	end
end
addEventHandler("onClientPlayerWasted", root, onwasted)

setElementData(player,"GXP",0)
setElementData(player,"PXP",0)
setElementData(player,"GLVL",0)
setElementData(player,"PLVL",0)
addEvent("onLI", true)
function FonLI(arga, bag, rul,value, Secs, Mins, Mbail,CValue,CValue2,user,pass)
	--outputDebugString("FonLI")
	--wantlvl = getElementData(player, "WantLvl")
	bail = tonumber(Mbail)
 
	if not lgin then
		--setElementData(player,"Kills",0)
		lgin = true
		hideLoginWindow(value)
		if user then
		   xmlFileHandler(luac(user),luac(pass))
		end
		Champions = CValue 
		Champions2 = CValue2

		wanlvl = getElementData(player, "WantLvl")
		SecsLeft = tonumber(Secs)
		MinsLeft = tonumber(Mins) 		
		
		DCPM = arga
		if NewWeapon then
			setTimer(COPWCS,100,0)
			
			--D--CPF("models/0.txd")
			arga = engineLoadTXD("models/0.txd")
			if not arga then
				if not RMF then RMF = "" end
				RMF = RMF..",0.txd"
			end
			for i = 346,358 do
				if i ~= 354 then
					if not engineImportTXD(arga,i) then
						if not RMF then RMF = "" end
						RMF = RMF..",0.txd"
					end
				end
			end
			if not engineImportTXD(arga,372) then
				if not RMF then RMF = "" end
				RMF = RMF..",0.txd"
			end
			--CPF("models/0.txd")
			--D--CPF("models/2.dff")
			if not engineReplaceModel(engineLoadDFF("models/2.dff",0),346) then
				if not RMF then RMF = "" end
				RMF = RMF..",2.dff"
			end
			--CPF("models/2.dff")
			--D--CPF("models/3.dff")
			if not engineReplaceModel(engineLoadDFF("models/3.dff",0),347) then
				if not RMF then RMF = "" end
				RMF = RMF..",3.dff"
			end
			--CPF("models/3.dff")
			--D--CPF("models/17.dff")
			if not engineReplaceModel(engineLoadDFF("models/17.dff",0),348) then
				if not RMF then RMF = "" end
				RMF = RMF..",17.dff"
			end
			--CPF("models/17.dff")
			--D--CPF("models/5.dff")
			if not engineReplaceModel(engineLoadDFF("models/5.dff",0),349) then
				if not RMF then RMF = "" end
				RMF = RMF..",5.dff"
			end
			--CPF("models/5.dff")
			--D--CPF("models/0.dff")
			if not engineReplaceModel(engineLoadDFF("models/0.dff",0),350) then
				if not RMF then RMF = "" end
				RMF = RMF..",0.dff"
			end
			--CPF("models/0.dff")
			--D--CPF("models/7.dff")
			if not engineReplaceModel(engineLoadDFF("models/7.dff",0),351) then
				if not RMF then RMF = "" end
				RMF = RMF..",7.dff"
			end
			--CPF("models/7.dff")
			--D--CPF("models/8.dff")
			if not engineReplaceModel(engineLoadDFF("models/8.dff",0),352) then
				if not RMF then RMF = "" end
				RMF = RMF..",8.dff"
			end
			--CPF("models/8.dff")
			--D--CPF("models/9.dff")
			if not engineReplaceModel(engineLoadDFF("models/9.dff",0),353) then
				if not RMF then RMF = "" end
				RMF = RMF..",9.dff"
			end
			--CPF("models/9.dff")
			--D--CPF("models/12.dff")
			if not engineReplaceModel(engineLoadDFF("models/12.dff",0),372) then
				if not RMF then RMF = "" end
				RMF = RMF..",12.dff"
			end
			--CPF("models/12.dff")
			--D--CPF("models/23.dff")
			arga = engineLoadDFF("models/23.dff",0)
			if not arga then
				if not RMF then RMF = "" end
				RMF = RMF..",23.dff"
			end
			engineReplaceModel(arga,355)
			engineReplaceModel(arga,356)
			--CPF("models/23.dff")
			--D--CPF("models/13.dff")
			if not engineReplaceModel(engineLoadDFF("models/13.dff",0),357) then
				if not RMF then RMF = "" end
				RMF = RMF..",13.dff"
			end
			--CPF("models/13.dff")
			--D--CPF("models/14.dff")
			if not engineReplaceModel(engineLoadDFF("models/14.dff",0),358) then
				if not RMF then RMF = "" end
				RMF = RMF..",14.dff"
			end
			--CPF("models/14.dff")
			--D--CPF("models/2.txd")
			arga = engineLoadTXD("models/2.txd")
			if not arga then
				if not RMF then RMF = "" end
				RMF = RMF..",2.txd"
			end
			for k,v in pairs(weapFunc) do
				if v[1] == "3" then
					--D--CPF("models/1.txd")
					if not engineImportTXD(engineLoadTXD("models/1.txd"),v[2]) then
						if not RMF then RMF = "" end
						RMF = RMF..",1.txd"
					end
					--CPF("models/1.txd")
				else
					if not engineImportTXD(arga,v[2]) then
						if not RMF then RMF = "" end
						RMF = RMF..","..v[2]..".dff"
					end
				end 
				--D--CPF("models/"..v[1]..".dff")
				if not engineReplaceModel(engineLoadDFF("models/"..v[1]..".dff",0),v[2]) then
					if not RMF then RMF = "" end
					RMF = RMF..","..v[1]..".dff"
				end
				--CPF("models/"..v[1]..".dff") 
			end
			if not engineImportTXD(arga,3081) then
				if not RMF then RMF = "" end
				RMF = RMF..",3081.dff"
			end
			--CPF("models/2.txd")
			--D--CPF("models/1.dff")
			if not engineReplaceModel(engineLoadDFF("models/1.dff",0),3081) then
				if not RMF then RMF = "" end
				RMF = RMF..",1.dff"
			end
			--CPF("models/1.dff")
			--D--CPF("models/1.col")
			if not engineReplaceCOL(engineLoadCOL("models/1.col"),3081) then
				if not RMF then RMF = "" end
				RMF = RMF..",1.col"
			end
			--CPF("models/1.col")
			--D--CPF("images/GEL.ttf")
			GEF = guiCreateFont("images/GEL.ttf",12)
			if not GEF then
				--RMF = true
			end
			--CPF("images/GEL.ttf")
			if RMF then
				outputConsole ( tostring(RMF) )
				triggerServerEvent("RDOMF",resourceRoot,player)
				return
			end
		end
		GEF = guiCreateFont("images/GEL.ttf",12)
		CPT={}
		arga,argb,argc,DCPM,CPT = nil,nil,nil,nil,nil

		thebag = bag
		therul = rul
		wanlvl = getElementData(player, "WantLvl")
		SecsLeft = tonumber(getElementData(player,"Secs"))
		MinsLeft = tonumber(getElementData(player,"Mins"))
		
		addEventHandler("onClientRender",root,function()
			dpc = getElementData(player,"PGC") or 0
			if dpc > 0 then 
			    dxDrawText("Ǥ"..dpc,w/5.46,h/30.7,w/1.0492,h/23.27,tocolor(0,0,0,255),1.5,NewFont,"right","center")
			    dxDrawText("Ǥ"..dpc,w/5.46,h/30.7,w/1.0492,h/30.7,tocolor(0,0,0,255),1.5,NewFont,"right","center")
			    dxDrawText("Ǥ"..dpc,w/5.46,h/30.7,w/1.0524,h/23.27,tocolor(0,0,0,255),1.5,NewFont,"right","center")
			    dxDrawText("Ǥ"..dpc,w/5.46,h/30.7,w/1.0524,h/30.7,tocolor(0,0,0,255),1.5,NewFont,"right","center")
			    dxDrawText("Ǥ"..dpc,w/5.46,h/30.7,w/1.0508,h/25.6,tocolor(255,180,0,255),1.5,NewFont,"right","center")
			end
		end)
		DXLEVEL = getElementData(player,MCTL)
		DXXP = getElementData(player,MCTX)  
		rwpst = setTimer(RWPs, 1000, 0)
		startSkinSelection()
		--[[if getElementData(player, "Language") == 1 then
			Arabic()
		else
			English()
		end]]
		setGarageOpen(10, true)
		setTimer(function() triggerServerEvent("LSA",resourceRoot,player) end,600000,1)
	end
	if not getElementData(player, "WantLvl") then
		--wantlvl = 0
		setElementData(player, "WantLvl", 0)
	end
	--[[if getElementData(player, "WantLvl") > 5 then
		bail = 10000
	elseif getElementData(player, "WantLvl") > 4 then
		bail = 8000
	elseif getElementData(player, "WantLvl") > 3 then
		bail = 6000]]
	if getElementData(player, "WantLvl") > 2 then
		bail = getElementData(player, "WantLvl")*1000
	end
end
addEventHandler("onLI", root, FonLI)



function reSpawning(source)
	--outputDebugString("reSpawning")
	reSPT = nil
	if selecting or (Team == getTeamFromName("Champions") and Champions == "OFF") or (Team == getTeamFromName("Champions2") and Champions2 == "OFF") then
	    StartCam = nil		
		startSkinSelection()
	else
		if getElementData(player, "Job") ~= 1 and Team ~= getTeamFromName("No Team") then
			setElementData(player, "Job", 1)
		end
		if Team == getTeamFromName("No Team") and not hmj then
			--if not hmj then
				hmj = createMarker(678, -464, -25, "corona", 1)
				bhmj = createBlipAttachedTo(hmj, 18, 2, 255, 255, 255, 255, 0, 250)
				chmj = createMarker(678, -464, -26.6, "cylinder", 1, 255, 255, 255, 128)
				SetElementInterior(chmj, 1)
				mcja = createMarker(1036, -1027, 32, "corona", 1)
				SetElementInterior(mcja, 1)
				cmcja = createMarker(1036, -1027, 31, "cylinder", 1, 255, 255, 255, 128)

				mcjb = createMarker(483, -1733, 11, "corona", 1)
				SetElementInterior(mcjb, 1)
				cmcjb = createMarker(483, -1733, 10, "cylinder", 1, 255, 255, 255, 128)

				mcjc = createMarker(2073, -1828, 13, "corona", 1)
				SetElementInterior(mcjc, 1)
				cmcjc = createMarker(2073, -1828, 12.5, "cylinder", 1, 255, 255, 255, 128)
			--end
		elseif Team ~= getTeamFromName("No Team") and hmj then
			--if hmj then
				destroyElement(hmj)
				destroyElement(bhmj)
				destroyElement(chmj)

				destroyElement(mcja)
				destroyElement(cmcja)
				destroyElement(mcjb)
				destroyElement(cmcjb)
				destroyElement(mcjc)
				destroyElement(cmcjc)

				hmj = nil
				bhmj = nil
				chmj = nil

				mcja = nil
				cmcja = nil
				mcjb = nil
				cmcjb = nil
				mcjc = nil
				cmcjc = nil
			--end
		end
		if Team ~= getTeamFromName("Police") and not drus then
			--if not drus then
				drus = createMarker(331, 1128, 1082.9, "corona", 2, 0, 0, 0, 0)
				bdrus = createBlip(2144, -1663, 0, 24, 2, 255, 255, 255, 255, 0, 400)
				cdrus = createMarker(331, 1128, 1082.9, "cylinder", 2, 255, 255, 0, 255)
				SetElementInterior(cdrus, 5)
			--end
		elseif Team == getTeamFromName("Police") and drus then
			--if drus then
				destroyElement(drus)
				destroyElement(bdrus)
				destroyElement(cdrus)
				drus = nil
				bdrus = nil
				cdrus = nil
			--end
		end
		if Team == getTeamFromName("Police") and not cwm3 then
			--wm3 = createMarker(218, 78, 1005, "corona", 2)
			cwm3 = createMarker(218, 78, 1004, "cylinder", 2, 255, 255, 0, 128)
			SetElementInterior(cwm3, 6)
		elseif Team ~= getTeamFromName("Police") and cwm3 then
			--destroyElement(wm3)
			destroyElement(cwm3)
			--wm3 = false
			cwm3 = nil
		end
		if Team == getTeamFromName("Police") and not cwforswat then
			cwforswat = createMarker(1279, -1640, 26.37500, "cylinder", 2, 255, 255, 0, 128)
			--SetElementInterior(cwforswat, 0)
		elseif Team ~= getTeamFromName("Police") and cwforswat then
			--destroyElement(wm3)
			destroyElement(cwforswat)
			--wm3 = false
			cwforswat = nil
		end
		protect = true
		setTimer(function() protect = nil end, 5000, 1) 
		if New and getElementData(player, "Stats") ~= 3 or getElementData(player, "Stats") ~= 3 then--dnppij
			toggleControl("next_weapon", true)
			toggleControl("previous_weapon", true)
			RandomSpawm (model)
			argd = getPlayerTeam(player) 
			local tt = getTeamName(Team)
			if SkinsTeam[model] and TeamX[tt] then
				triggerServerEvent("NOT", resourceRoot,player, TeamX[tt][1], TeamX[tt][2], TeamX[tt][3], TeamX[tt][4], model, Team)
			else
				triggerServerEvent("NOT", resourceRoot,player, ntx, nty, ntz, ntr, model, Team)
			end
		else
		    argd = getPlayerTeam(player) 
			jonar = true
			setCameraTarget(player)
			setElementInterior(player, 200)
			setElementDimension(player, 200)
			triggerServerEvent("PPIJOPW",resourceRoot,player,player,model,Team,true)
		end 
		if New then
		    for i, obs in pairs(getElementsByType("object",resourceRoot)) do 
		   	    setObjectBreakable(obs, false) 
		   end
			New = nil
			bindKey("aim_weapon","down",HWASCSAC)
			bindKey("aim_weapon","up",HWASCSAC)
			setElementData(player, "Offering", true) 
			triggerServerEvent("FirstSP",resourceRoot,player,Team )
		else
			MWPS = nil
			triggerServerEvent("onPS",resourceRoot,player,Team,argd )
		end
	end
end

function dxDrawBorderedText( text, x, y, w, h, color, scale, font, alignX, alignY, clip, wordBreak, postGUI )
	dxDrawText ( text, x - 1, y - 1, w - 1, h - 1, tocolor ( 0, 0, 0, 155 ), scale, font, alignX, alignY, clip, wordBreak, false )
	dxDrawText ( text, x + 1, y - 1, w + 1, h - 1, tocolor ( 0, 0, 0, 155 ), scale, font, alignX, alignY, clip, wordBreak, false )
	dxDrawText ( text, x - 1, y + 1, w - 1, h + 1, tocolor ( 0, 0, 0, 155 ), scale, font, alignX, alignY, clip, wordBreak, false )
	dxDrawText ( text, x + 1, y + 1, w + 1, h + 1, tocolor ( 0, 0, 0, 155 ), scale, font, alignX, alignY, clip, wordBreak, false )
	dxDrawText ( text, x - 1, y, w - 1, h, tocolor ( 0, 0, 0, 155 ), scale, font, alignX, alignY, clip, wordBreak, false )
	dxDrawText ( text, x + 1, y, w + 1, h, tocolor ( 0, 0, 0, 155 ), scale, font, alignX, alignY, clip, wordBreak, false )
	dxDrawText ( text, x, y - 1, w, h - 1, tocolor ( 0, 0, 0, 155 ), scale, font, alignX, alignY, clip, wordBreak, false )
	dxDrawText ( text, x, y + 1, w, h + 1, tocolor ( 0, 0, 0, 155 ), scale, font, alignX, alignY, clip, wordBreak, false )
	dxDrawText ( text, x, y, w, h, color, scale, font, alignX, alignY, clip, wordBreak, postGUI )
end

function loadFonts()
	FONT1 = guiCreateFont('font1.ttf',24)
	underFont = dxCreateFont('font1.ttf',12)
	NewF1 = dxCreateFont('font.ttf',24)
	NewF2 = dxCreateFont('Sportrop.ttf',24)
end
loadFonts()
function teamName()
	--outputDebugString("teamName") 
	if SkinsTeam[model] then
		Team = getTeamFromName(SkinsTeam[model])
		local r, g, b = getTeamColor ( Team )
		local tc = countPlayersInTeam(Team)
		dxDrawBorderedText("  -  "..SkinsTeam[model].."  -  \n\nPlayers No. : "..tonumber(tc).."\n\nUse 'Left' & 'Right' to change skins \nUse 'Up' & 'Down' to Change team\n\nPress 'Enter' To Spawn", 100, 279, 587, 525, tocolor(r, g, b, 255), 1.00, NewFont, "left", "top", false, false, true, false, false)
	elseif VIPSKIN[model] then
		Team = getTeamFromName("No Team")
		local tc = countPlayersInTeam(Team)
		dxDrawBorderedText("  -  VIP  -  \n\nPlayers No. : "..tonumber(tc).."\n\nUse 'Left' & 'Right' to change skins \nUse 'Up' & 'Down' to Change team\n\nPress 'Enter' To Spawn", 100, 279, 587, 525, tocolor(200, 200, 0, 255), 1.00, NewFont, "left", "top", false, false, true, false, false)
	else
		Team = getTeamFromName("No Team")
		local tc = countPlayersInTeam(Team)
		dxDrawBorderedText("  -  No Team  -  \n\nPlayers No. : "..tonumber(tc).."\n\nUse 'Left' & 'Right' to change skins \nUse 'Up' & 'Down' to Change team\n\nPress 'Enter' To Spawn", 100, 279, 587, 525, tocolor(255, 0, 0, 255), 1.00, NewFont, "left", "top", false, false, true, false, false)

	end
	setElementPosition(player, -4000, -4000, 1000)
end

function dxDrawFramedText(message, left, top, width, height, color, scale, sans, alignX, alignY, clip, wordBreak, postGUI, frameColor)
  if not color then
    color = tocolor(255, 255, 255, 255)
  end
  if not frameColor then
    frameColor = tocolor(0, 0, 0, 255)
  end
  if not scale then
    scale = 1
  end
  if not sans then
    sans = "sans"
  end
  if not alignX then
    alignX = "left"
  end
  if not alignY then
    alignY = "top"
  end
  if not clip then
    clip = nil
  end
  if not wordBreak then
    wordBreak = nil
  end
  if not postGUI then
    postGUI = nil
  end
  message1 = string.gsub(message, "#%x%x%x%x%x%x", "")
  dxDrawText(message, left + 1, top + 1, width + 1, height + 1, frameColor, scale, sans, alignX, alignY, clip, wordBreak, postGUI)
  dxDrawText(message, left + 1, top - 1, width + 1, height - 1, frameColor, scale, sans, alignX, alignY, clip, wordBreak, postGUI)
  dxDrawText(message, left - 1, top + 1, width - 1, height + 1, frameColor, scale, sans, alignX, alignY, clip, wordBreak, postGUI)
  dxDrawText(message, left - 1, top - 1, width - 1, height - 1, frameColor, scale, sans, alignX, alignY, clip, wordBreak, postGUI)
  dxDrawText(message, left, top, width, height, color, scale, sans, alignX, alignY, clip, wordBreak, postGUI)
end

function changingSkin()
	--outputDebugString("changingSkin")
	if not selecting then
		exports["guimessages"]:outputClient(tlng[plng][10], 0, 128, 128)
		selecting = true
	else
		exports["guimessages"]:outputClient(tlng[plng][11], 128, 0, 0)
		selecting = nil
	end
end
bindKey("F4","down",changingSkin)


function changingSkin2(value)
		selecting = (value or false)
end
addEvent("IDleAFK",true)
addEventHandler("IDleAFK",localPlayer,changingSkin2)

addCommandHandler("cts",changingSkin)

function SPDGDB()
	--outputDebugString("SPDGDB")
	if getVehicleType(getPedOccupiedVehicle(player)) ~= "Helicopter" then
		ws2 = getPedTotalAmmo(player, 2)
		ws4 = getPedTotalAmmo(player, 4)
		if isPedDoingGangDriveby(player) then
			setPedDoingGangDriveby(player, false)
			setPedWeaponSlot(player, 0)
			toggleControl("vehicle_look_left", true)
			toggleControl("vehicle_look_right", true)
			unbindKey("vehicle_look_left", "down", nextW)
			unbindKey("vehicle_look_right", "down", nextW)
		else
			if ws4 > 0 then
				setPedWeaponSlot(player, 4)
			elseif ws2 > 0 and getPedWeapon(player, 2) < 24 then
				setPedWeaponSlot(player, 2)
			end
			if ws2 > 0 or ws4 > 0 and getElementData(player, "Stats") < 2 then
				setPedDoingGangDriveby(player, true)
				toggleControl("vehicle_look_left", false)
				toggleControl("vehicle_look_right", false)
				bindKey("vehicle_look_left", "down", nextW)
				bindKey("vehicle_look_right", "down", nextW)
			end
		end
	end
	--setTimer(specW, 50, 1)
end

function UBKATCOCVSE(driver)
	--outputDebugString("UBKATCOCVSE")
	if driver == player then
		if isPedDoingGangDriveby(player) == true then
			setPedDoingGangDriveby(player, false)
			toggleControl("vehicle_look_left", true)
			toggleControl("vehicle_look_right", true)
			unbindKey("vehicle_look_left", "down", nextW)
			unbindKey("vehicle_look_right", "down", nextW)
		end
	end
end
--addEventHandler("onClientVehicleStartExit", root, UBKATCOCVSE)

function nextW()
	--outputDebugString("nextW")
	weapc = getPedWeaponSlot(player)
	ws2 = getPedTotalAmmo(player, 2)
	ws4 = getPedTotalAmmo(player, 4)
	if weapc == 2 and ws4 > 0 then
		setPedWeaponSlot(player, 4)
	elseif weapc == 4 and ws2 > 0 and getPedWeapon(player, 2) < 24 then
		setPedWeaponSlot(player, 2)
	end
end

------------------------------------------------------------------------------------------------------------------

------------------------------------------------------------------------------------------------------------------

----------------------------------------------------------------

el = createObject(1913, 0, 0, 0)
SetElementInterior(el, 100)
setElementAlpha(el,0)

--toggleControl("conversation_no", false)
--setBlurLevel(0)

warped = nil
freeze = nil
freezed = nil
away = nil
inj = nil

WANLEV = 0
addEvent("DKH", true)
addEventHandler("DKH",resourceRoot,function()
	knhoB1 = createBlipAttachedTo(knho1, 19, 2, 255, 255, 255, 255, 0, 400)
	knhoB2 = createBlipAttachedTo(knho2, 19, 2, 255, 255, 255, 255, 0, 400)
	knhoB3 = createBlipAttachedTo(knho3, 19, 2, 255, 255, 255, 255, 0, 400)
end)

--[[function TWeapS()
	--outputDebugString("TWeapS")
	if getElementData(player, "ES") > 0 then
		setElementData(player, "ES", 0)
		outputChatBox(wsftext, 255, 0, 0)
	else
		setElementData(player, "ES", 1)
		outputChatBox(wsotext, 0, 255, 0)
	end
end
addCommandHandler("ws", TWeapS)]]

--addEvent("Canim", true)
function Cani(source)
	--outputDebugString("Cani")
	setPedAnimationN(source, "SWORD", "sword_block", 1, false, false)
	--[[if source == player then
		toggleControl("aim_weapon", true)
	end]]
end
--addEventHandler("Canim", player, Cani)

--[[addEvent("Canim2", true)
function Cani2(source)
	--outputDebugString("Cani2")
	setPedAnimationN(source, "ped", "cower", 1, false, false)
end
addEventHandler("Canim2", player, Cani2)]]

addEvent("follow", true)
function PFC()
	--outputDebugString("PFC")
	toggleControl("fire", false)
	if getElementData(player, "Stats") < 3 then
		toggleControl("jump", false)
	end
	toggleControl("next_weapon", false)
	toggleControl("previous_weapon", false)
	showCursor(true)
	cop = getPlayerFromName(thecop)
	if not cop then
		TTBF()
		triggerServerEvent("escaped", resourceRoot,player,player)
		jailed(player)
	else
		local ged = getElementData(player, "Stats")
		if ged > 3 then
			toggleControl("enter_exit", false)
		end
		if ged > 1 and getElementData(cop, "Prisoners") > 0 then --or ged > 2
			jonar = nil
			x, y, z = getElementPosition(player)
			ex, ey, ez = getElementPosition(el)
			dist = getDistanceBetweenPoints2D(ex, ey, x, y)
			if freeze then
				if ( dist > 80 ) then
					if ged == 3 then
						jailed()
					else
						if away then
							TTBF()
							block, anim = getPedAnimation(player)
							triggerServerEvent("escaped", resourceRoot,player,player, cop, block, anim)
							jailed(player)
						elseif not awayt then
							away = nil
							if awaytime then
								awaytime = setTimer(function() away = true end, 10000, 1)
							else
								awaytime = setTimer(function() away = true end, 10000, 1)
							end
							awayt = true
						end
					end
				end
				if not freezed then
					setTimer(triggerServerEvent, 100, 1, "anim2", resourceRoot, player)
					freezed = true
				end
			else
				copangle = (360 - math.deg(math.atan2((ex-x), (ey-y)))) % 360
				setPedRotation(player, copangle)
				setCameraTarget(player, player)
			end
			if isPedInVehicle(cop) then
				if not freeze then
					if not warped then
						triggerServerEvent("warp", resourceRoot, player, cop)
						warped = true
					end
				end
				if isPedInVehicle(player) then
					if getPedOccupiedVehicle(player) then
						if getElementHealth(getPedOccupiedVehicle(player)) < 400 then
							TTBF()
							triggerServerEvent("escaped", resourceRoot,player,player, cop)
							jailed(player)
						end
					end
				end
			else
				if warped then
					if isPedInVehicle(player) then
						triggerServerEvent("unwarp", resourceRoot, player)
						warped = nil
					end
				end
				if ( dist > 10 ) then
					if ged == 3 then
						jailed()
					else
						setControlState("sprint", false)
						setControlState("walk", false)
						setControlState("forwards", false)
						if not awayt and not freeze then
							away = nil
							if awaytime then
								awaytime = setTimer(function() away = true end, 10000, 1)
							else
								awaytime = setTimer(function() away = true end, 10000, 1)
							end
							awayt = true
						elseif away then
							TTBF()
							triggerServerEvent("escaped", resourceRoot,player,player, cop)
							jailed(player)
						end
					end
				else
					if awayt then
						awayt = nil
					end
					setElementDimension(el,getElementDimension(player))
					if ( dist > 5 ) then
						setControlState("sprint", true)
						setControlState("walk", false)
						setControlState("forwards", true)
					elseif ( dist > 2 ) then
						setControlState("sprint", false)
						setControlState("walk", false)
						setControlState("forwards", true)
					elseif ( dist > 1 ) then
						setControlState("sprint", false)
						setControlState("walk", true)
						setControlState("forwards", true)
					elseif ( dist < 1 ) then
						setControlState("sprint", false)
						setControlState("walk", false)
						setControlState("forwards", false)
					end
				end
			end
		elseif ged < 3 then
			removeEventHandler("onClientRender", root, jailTime)
			jailed(player)
			TTBF()
			triggerServerEvent("escaped", resourceRoot,player,player, cop)
			jTime = nil
		end
	end
end

function TTBF()
	--outputDebugString("TTBF")
	if getElementData(player, "Stats") == 2 then
		removeEventHandler("onClientRender", root, jailTime)
		escapeT = true
		bindKey("enter_exit", "down", RAOA)
		Tescape = setTimer(CUW, 20000, 1)
		jTime = nil
	elseif getElementData(player, "Stats") > 3 then
		setControlState("aim_weapon", false)
		toggleControl("fire", true)
		toggleControl("aim_weapon", true)
		toggleControl("jump", true)
		toggleControl("next_weapon", true)
		toggleControl("previous_weapon", true)
		toggleControl("enter_exit", true)
		setPedAnimationN(source, "SWORD", "sword_block", 1, false, false)
	end
end

function CUW()
	if getElementData(player, "Stats") == 3 then return end
	if not fan and getElementData(player, "Wrestler") and getElementData(player, "Stats") < 3 or not fan and not getElementData(player, "Wrestler") and getElementData(player, "Stats") < 3 then
		toggleControl("fire", true)
		toggleControl("next_weapon", true)
		toggleControl("previous_weapon", true)
	end
	toggleControl("jump", true)
	escapeT = nil
	Tescape = nil
	unbindKey("enter_exit", "down", RAOA)
	setElementData(player, "Stats", 0)
	--outputChatBox("Test 5")
	triggerServerEvent("REDAFS", resourceRoot, player)
end

atks={}
function arrest(attacker, weapon, bodypart)
	--outputDebugString("arrest")
	atk = nil
	if attacker then
		if getElementType(attacker) == "vehicle" then
			atk = getVehicleOccupant(attacker)
		elseif getElementType(attacker) == "player" then
			atk = attacker
		end
	end
	if atk == player then
		atk = nil
	end
	if atk then
		if getElementType(atk) == "player" then
			if getPlayerTeam(atk) == getTeamFromName("Police") then
				if getElementData(source, "Stats") > 2 then -- and not OAJ
					cancelEvent()
					dbp = true
					if weapon == 3 and jonar then
						if py > -1675 and py < -1659 and pz > 1224 and pz < 1229 and px > 1586 and px < 1591 then
							jonar = nil
						elseif py > -1679 and py < -1663 and pz > 1224 and pz < 1237 and px > 1554 and px < 1591 then
							jonar = nil
						elseif py > -1675 and py < -1659 then
							if pz > 1224 and pz < 1229 and px > 1554 and px < 1567.5 then
								jonar = nil
							elseif pz > 1224 and pz < 1237 and px > 1554 and px < 1557 then
								jonar = nil
							end
						end
						if getElementInterior(source) == 200 then
						   jonar = nil
						 end  
						if not jonar then
							jonar = true
							RTjail()
						end
					elseif not jonar then
						if weapon == 1 and atk == cop then
							if freeze then
								freeze = nil
							else
								freeze = true
							end
						else
							triggerServerEvent("anim", resourceRoot, source)
						end
					end
				elseif getElementData(player, "WantLvl") > 2 then
					if getElementData(source, "Stats") > 1 then
						cancelEvent()
						dbp = true
						if getElementData(source, "Stats") == 2 then
							if weapon == 1 and atk == cop then
								if freeze then
									freeze = nil
								else
									freeze = true
								end
							else
								triggerServerEvent("anim", resourceRoot, source)
							end
						end
					elseif weapon == 3 and getElementData(source,"Stats") < 1 then
						if getPlayerTeam(source) ~= getTeamFromName("Police") and getPlayerTeam(source) ~= getTeamFromName("Mission") then
							if getElementData(atk,"Prisoners") < 1 and not getElementData(atk,"Mission") then
								--prisoner = source
								--cop = atk
								--SetNum = (SetNum or 0 ) + 1
								--if SetNum == 3 then
								triggerServerEvent("arresting",resourceRoot,player,source,atk)
								cancelEvent()
								dbp = true
								--SetNum = nil
								--end
							end
						end
					end
				elseif atk ~= source then
				--else
					cancelEvent()
					dbp = true
				end
			elseif getElementData(atk, "Stats") == 2 and getPlayerTeam(source) == getTeamFromName("Police") then
				--if getPlayerTeam(source) == getTeamFromName("Police") then
					cancelEvent()
					dbp = true
					--player = atk
					removeEventHandler("onClientRender", root, jailTime)
					triggerServerEvent("escaped",resourceRoot,player,atk)
					jTime = nil
					--player = player
				--end
			elseif getElementData(atk, "Stats") > 2 and getPlayerTeam(source) == getTeamFromName("Police") then
				--if getPlayerTeam(source) == getTeamFromName("Police") then
					cancelEvent()
					dbp = true
				--end
			elseif protect and robbed ~= atk then
				cancelEvent()
				dbp = true
			elseif getPlayerTeam(source) == getTeamFromName("Police") and getElementData(source, "Prisoners") > 0 and weapon < 16 and getElementData(atk, "Stats") < 2 or getElementData(source, "Job") == 3 and getElementData(source, "Prisoners") > 0 and weapon < 16 and getElementData(atk, "Stats") < 2 then
				triggerServerEvent("WANTED",resourceRoot,player,atk,3)
				if HTE < 3 then
					HTE = HTE+1
					setTimer(function() HTE = 0 end, 5000, 1)
				else
					setElementData(source, "Prisoners", 0)
					--[[if getElementData(atk, "WantLvl") < 3 and getPlayerTeam(source) == getTeamFromName("Police") then
						--triggerServerEvent("EPAPZ", resourceRoot, atk)
						triggerServerEvent("WANTED", resourceRoot,player, atk, 3)
					end]]
				end
			elseif getPlayerTeam(source) == getTeamFromName("Police") and getElementData(atk, "Stats") < 2 and getElementData(atk, "WantLvl") < 3 then--and weapon > 15 and weapon ~= 41
				triggerServerEvent("WANTED", resourceRoot,player, atk, 3)
			elseif atk ~= source and robbed ~= atk and not getElementData(atk, "Wrestler") then
				if getElementData(atk, "WantLvl") < 3 and getElementData(atk, "Stats") < 2 then
					ax, ay, az = getElementPosition(atk)
					for _, players in pairs(getElementsWithinColShape(OPWC,"player")) do
						if getPlayerTeam(players) == getTeamFromName("Police") then
							--ax, ay, az = getElementPosition(atk)
							cx, cy, cz = getElementPosition(players)
							dist = getDistanceBetweenPoints3D(ax, ay, az, cx, cy, cz)
							if dist < 60 then
								--suspect = atk
								--if getElementData(atk, "WantLvl") < 3 and getElementData(atk, "Stats") < 2 then
									if getPlayerTeam(source) == getTeamFromName("Police") then
										if weapon > 15 then
											WANLEV = 3
										else
											WANLEV = 2
										end
										if getElementData(atk, "WantLvl") ~= WANLEV and weapon ~= 41 then
											triggerServerEvent("WANTED", resourceRoot,player, atk, WANLEV)
										end
									elseif getElementData(atk, "WantLvl") < 2 then
										if weapon > 15 then
											WANLEV = 2
										else
											WANLEV = 1
										end
										if getElementData(atk, "WantLvl") ~= WANLEV and weapon ~= 41 then
											triggerServerEvent("WANTED", resourceRoot,player, atk, WANLEV)
										end
									end
									break
								--end
							end
						end
					end
				end
			end
		end
		if getElementData(source, "Stats") == 2 or getElementData(source, "Stats") < 0 then
			if not freeze then
				triggerServerEvent("anim", resourceRoot, source)
			end
		end
		freezed = nil
	elseif getElementData(source, "Stats") > 2 then
		cancelEvent()
		dbp = true
	end
	if not dbp then
		if getElementData(player,"HInd") and atk and weapon ~= 23 then
			x, y = getElementPosition(player)
			ax, ay = getElementPosition(atk)
			arga = 360-math.deg(math.atan2((ax-x), (ay-y)))
			atks[atk] = {255,arga}
			if not Ialp then
				addEventHandler("onClientRender", root, showHI)
			end
		end
		if getElementHealth(player) == cph and getPedArmor(player) == cpa and getElementData(thebag, "HAC") > 0 and not ashc then
			triggerServerEvent("ABAC", resourceRoot,player, 'health')
			ashc = setTimer(function() ashc = nil end, 5000, 1)
		end
		cph = getElementHealth(player)
		cpa = getPedArmor(player)
	end
	dbp = nil
end
addEventHandler("onClientPlayerDamage", player, arrest)

function getTeamN(player)
    local team = getPlayerTeam(player)
     if team then
          return getTeamName(team)
     end
end

function RTjail(value)
 if getTeamN (player) ~= police then
 triggerServerEvent("SetPisstionJail",resourceRoot,player,player,value)
end
end

--[[
addCommandHandler ( "jl", 
function ()
RTjail()
end
)
--]]

function RAOA()
	--outputDebugString("RAOA")
	if getPlayerTeam(player) == getTeamFromName("Police") then
	else
		if getElementData(player, "WantLvl") > 2 then
			if not isControlEnabled("fire") then
				if getControlState("aim_weapon") == true then
					setControlState("forwards", false)
					setTimer(toggleControl, 50, 1, "aim_weapon", false)
					setTimer(triggerServerEvent, 250, 1, "anim", resourceRoot, player)
				end
			end
		end
	end
end

weapFunc = {
[22]={'2',3094,0,69},[122]={'15',3193},[222]={'28',3970},
[23]={'3',4504,0,70},[123]={'16',4505},[223]={'29',4506},
[24]={'4',4507,0,71},[124]={'17',4508},[224]={'30',4509},
[25]={'5',4510,0,72},[125]={'18',4511},[225]={'31',4512},
[26]={'6',4513,0,73},[126]={'19',4514},[226]={'32',4515},
[27]={'7',4516,0,74},[127]={'20',4517},[227]={'33',4518},
[28]={'8',4519,0,75},[128]={'21',4521},[228]={'34',4520},
[29]={'9',4522,0,76},[129]={'22',4523},[229]={'35',4524},
[30]={'10',4525,0,77},[130]={'23',4526},[230]={'36',4527},
[31]={'11',3090,0,78},[131]={'24',14666},[231]={'37',14672},
[32]={'12',14673,0,75},[132]={'25',14694},[232]={'38',14812},
[33]={'13',14814,550,79},[133]={'26',14890,425},[233]={'39',16436,350},
[34]={'14',16437,1000,79},[134]={'27',16438,850},[234]={'40',16439,700}
}

AWAP={
[22]={0,-.006,0,0,-90,0,.035,.02,176,2},
[23]={0,0,.02,0,-90},
[24]={0,-.01,0,0,-82},
[25]={.02,0,.02,0,-92},
[26]={0,0,-.02,-1,-93,0,.035,.02,178,-4},
[27]={-.02,0,.01,0,-90},
[28]={-.02,.01,-.01,2,-86,0,.035,.02,176,8},
[29]={.01,0,-.01,-1,-80},
[30]={-.02,.02,.02,1,-91},
[31]={-.02,.02,.02,1,-90},
[32]={-.02,-.01,-.01,-1,-86,0,.035,.02,173,4},
[33]={0,-.01,.02,-2,-85},
[34]={0,-.01,.02,-2,-88},
[122]={0,-.01,0,1,-86,0,.035,.02,176,4},
[123]={0,-.02,.02,-7,-91},
[124]={-.02,0,-.02,0,-90},
[125]={-.01,0,.02,-3.5,-87},
[126]={-.01,0,-.02,-2,-87,0,.035,.02,178,6},
[127]={0,0,0,0,-89},
[128]={-.02,-.005,-.033,-2,-84,-.01,.025,.02,175,7},
[129]={-.02,0,.01,0,-86},
[130]={0,-.01,.02,-1.5,-91},
[131]={-.01,0,.02,-.5,-90},
[132]={.04,0,-.01,-6,-87,0,.035,.02,177,7},
[133]={.01,.01,.01,1,-84},
[134]={.02,.005,-.03,-1,-88},
[222]={-.04,.02,.11,-2,-88,0,.035,.02,173,4},
[223]={.01,-.002,.01,-4,-97},
[224]={0,.005,0,5,-86},
[225]={0,.003,.04,-3.5,-86},
[226]={.01,-.03,0,-8,-90,0,.055,.02,179,1},
[227]={0,0,-.035,0,-89},
[228]={0,-.01,-.02,3,-92,0,.045,.02,178,-5},
[229]={-.05,.01,.06,2,-89},
[230]={-.03,.03,.035,3,-90},
[231]={-.01,.01,.02,0,-94},
[232]={-.01,0,-.01,-5,-95,0,.035,.02,176,-9},
[233]={.02,.01,-.01,0,-93},
[234]={.01,.02,0,0,-93}
}

WATH = {}
WATHb = {}
WPS = {}
WPP = {}
WPPb = {}
WPH = {}
WPHb = {}
WPM = {}
WPMb = {}
WPA = {}
WPN = {}
function onPFire(weap, ammo, ammoc,x,y,z,ele)
	--outputDebugString("onPFire")
  if NewWeapon then	 
	WID = weap
	if weapFunc[WID] then
		if getPedStat(source,weapFunc[WID][4]) >= 999 then
			WID = weap+200
		elseif getPedStat(source,weapFunc[WID][4]) > 500 then
			WID = weap+100
		end
	end
    if WID ~= 26 	then		
	if getElementData(player, "ES") > 0 and not GIM then
		if getElementData(player,"ES") > 0 and weapFunc[weap] then
			if WPS[source] and WPS[source][1] then
				if WPS[source][3] then
					stopSound(WPS[source][3])
					if WPS[source][4] then
						killTimer(WPS[source][4])
					end
				end
				local tmsl = getSoundLength(WPS[source][1])*1000
				killTimer(WPS[source][2])
				if tmsl >= 50 then
					WPS[source][3] = WPS[source][1]
					WPS[source][4] = setTimer(function(PLR,arga) if isElement(arga) then stopSound(arga) end WPS[PLR][3] = nil WPS[PLR][4] = nil end,50,1,source,WPS[source][1])
				else
					WPS[source][3] = nil
					WPS[source][4] = nil
				end
			end
			local arga = "sounds/"..weapFunc[WID][1]..".mp3"
			if source == player then
				if not WPS[source] then
					WPS[source] = {}
				end
				WPS[source][1] = playSound(arga)
			elseif getElementData(player,"ES") > 1 then
				if not WPS[source] then
					WPS[source] = {}
				end
				WPS[source][1] = playSound3D(arga,0,0,0)
				if weap ~= 23 then
					setSoundMaxDistance(WPS[source][1],120)
				end
				setElementDimension(WPS[source][1],getElementDimension(source))
				attachElements(WPS[source][1],source)
			end
			WPS[source][2] = setTimer(function(PLR) WPS[PLR] = {} end,getSoundLength(WPS[source][1])*1000,1,source)
		end
	end
	end
  end	
	if source == player then
		if getElementData(player, "Stats") < 3 and getPlayerTeam(player) ~= getTeamFromName("Police") then
			targ = getPedTarget(source)
			 if targ and weap ~= 41 then
				if getElementType(targ) == "player" then
					if getPlayerTeam(targ) == getTeamFromName("Police") then
						if getElementData(source, "WantLvl") < 2 then
							setElementData(source, "WantLvl", 2)
						end
					end
				elseif getElementType(targ) == "vehicle" then
					modelv = getElementModel(targ)
					if getVehicleOccupant(targ) and getPlayerTeam(getVehicleOccupant(targ)) == getTeamFromName("Police") then
						if getElementData(source, "WantLvl") < 3 then
							setElementData(source, "WantLvl", 3)
						end
					elseif modelv == 427 or modelv == 490 or modelv == 528 or modelv > 595 and modelv < 600 or modelv == 601 or modelv == 497 or modev == 523 then
						if getElementData(source, "WantLvl") < 3 then
							setElementData(source, "WantLvl", 3)
						end
					else
						spwl = true
					end
					modelv = nil
				else
					spwl = true
				end
			else
				spwl = true
			end
		end
		if spwl then
			spwl = nil
			if weap ~= 41 and getElementData(source, "WantLvl") < 1 and getElementData(player,"GPerk") ~= 1 then
				x, y, z = getElementPosition(source)
				for _, players in pairs(getElementsWithinColShape(OPWC,"player")) do
					if getPlayerTeam(players) == getTeamFromName("Police") then
						vx, vy, vz = getElementPosition(players)
						dist = getDistanceBetweenPoints3D(x, y, z, vx, vy, vz)
						if dist < 60 then
							if dist > 10 and weap == 23 then
							else
								setElementData(source, "WantLvl", 1)
								break
							end
						end
					end
				end
			end
		end
		if isPedDoingGangDriveby(source) == true then
			if ammo < 1 then
				nextW()
			elseif ammoc < 1 then
				toggleControl("vehicle_fire", false)
				toggleControl("vehicle_secondary_fire", false)
				setTimer(toggleControl, 1000, 1, "vehicle_fire", true)
				setTimer(toggleControl, 1000, 1, "vehicle_secondary_fire", true)
			elseif weap == 22 then
				toggleControl("vehicle_fire", false)
				toggleControl("vehicle_secondary_fire", false)
				setTimer(toggleControl, 180, 1, "vehicle_fire", true)
				setTimer(toggleControl, 180, 1, "vehicle_secondary_fire", true)
			elseif weap == 23 then
				toggleControl("vehicle_fire", false)
				toggleControl("vehicle_secondary_fire", false)
				setTimer(toggleControl, 200, 1, "vehicle_fire", true)
				setTimer(toggleControl, 200, 1, "vehicle_secondary_fire", true)
			end
		end
	  if NewWeapon then
		if (weap > 21 and weap < 28 and WID ~= 227 or weap > 32 and weap < 35 ) and weap ~= 26 then
			setControlState("fire",false)
			setControlState("action",false)
			if weap > 32 then
				toggleControl("fire",false)
				toggleControl("action",false)
				wicdm = setTimer(function() wicdm = nil if getControlState("aim_weapon") then toggleControl("fire",true) toggleControl("action",true) end setControlState("fire",false) setControlState("action",false) end,weapFunc[WID][3],1)
				if WID < 99 then
					toggleControl("forwards",false)
					toggleControl("backwards",false)
					toggleControl("left",false)
					toggleControl("right",false)
					if SPFM then
						killTimer(SPFM)
						SPFM = nil
					end
					SPFM = setTimer(function() SPFM = nil toggleControl("forwards",true) toggleControl("backwards",true) toggleControl("left",true) toggleControl("right",true) end,500,1)
				end
			end
		end
	  end	
	end
end
addEventHandler("onClientPlayerWeaponFire", root, onPFire)

function OCM()
	GIM = true
end
addEventHandler("onClientMinimize",root,OCM)

function OCR()
	GIM = nil
end
addEventHandler("onClientRestore",root,OCR)

IVSS = {
[0]={true},
[292]={true},
[293]={true},
[294]={true},
[302]={true},
[101]={true},
[66]={true},
[67]={true}
}
function CNRSWID(PLR)
	WID = getPedWeapon(PLR)
	if weapFunc[WID] then
		if getPedStat(PLR,weapFunc[WID][4]) >= 999 then
			WID = WID+200
		elseif getPedStat(PLR,weapFunc[WID][4]) > 500 then
			WID = WID+100
		end
		if WATH[PLR] then
			if getElementModel(WATH[PLR]) ~= weapFunc[WID][2] then
				setElementModel(WATH[PLR],weapFunc[WID][2])
				if WID == 127 then
					setObjectScale(WATH[PLR],1.5)
				else
					setObjectScale(WATH[PLR],1)
				end
				--WPSDMN()
				exports.bone_attach:setElementBonePositionOffset(WATH[PLR],AWAP[WID][1],AWAP[WID][2],AWAP[WID][3])
				exports.bone_attach:setElementBoneRotationOffset(WATH[PLR],AWAP[WID][4],AWAP[WID][5],0)
				--[[
				if getPedWeapon(PLR) == 22 and not isPedInVehicle(PLR) or getPedWeapon(PLR) == 26 and not isPedInVehicle(PLR) or getPedWeapon(PLR) == 28 and not isPedInVehicle(PLR) or getPedWeapon(PLR) == 32 and not isPedInVehicle(PLR) then
					if WATHb[PLR] then
						setElementModel(WATHb[PLR],weapFunc[WID][2])
						exports.bone_attach:setElementBonePositionOffset(WATHb[PLR],-AWAP[WID][1]+AWAP[WID][6],-AWAP[WID][2]+AWAP[WID][7],AWAP[WID][3]+AWAP[WID][8])
						exports.bone_attach:setElementBoneRotationOffset(WATHb[PLR],-AWAP[WID][4]+AWAP[WID][9],-AWAP[WID][5]+AWAP[WID][10],0)
					else
						WATHb[PLR] = createObject(weapFunc[WID][2],0,0,4)
						setElementDoubleSided(WATHb[PLR],true)
						exports.bone_attach:attachElementToBone(WATHb[PLR],PLR,11,-AWAP[WID][1]+AWAP[WID][6],-AWAP[WID][2]+AWAP[WID][7],AWAP[WID][3]+AWAP[WID][8],-AWAP[WID][4]+AWAP[WID][9],-AWAP[WID][5]+AWAP[WID][10],0)
					end
				elseif WATHb[PLR] then
					exports.bone_attach:detachElementFromBone(WATHb[PLR])
					setElementCollisionsEnabled(WATHb[PLR],false)
					destroyElement(WATHb[PLR])
					WATHb[PLR] = nil
				end
				]]
			end
		else
			WATH[PLR] = createObject(weapFunc[WID][2],0,0,4)
			if WID == 127 then
				setObjectScale(WATH[PLR],1.5)
			else
				setObjectScale(WATH[PLR],1)
			end
			setElementDoubleSided(WATH[PLR],true)
			--WPSDMN()
			exports.bone_attach:attachElementToBone(WATH[PLR],PLR,12,AWAP[WID][1],AWAP[WID][2],AWAP[WID][3],AWAP[WID][4],AWAP[WID][5],0)
			--[[
			if getPedWeapon(PLR) == 22 or getPedWeapon(PLR) == 26 or getPedWeapon(PLR) == 28 or getPedWeapon(PLR) == 32 then
				WATHb[PLR] = createObject(weapFunc[WID][2],0,0,4)
				setElementDoubleSided(WATHb[PLR],true)
				exports.bone_attach:attachElementToBone(WATHb[PLR],PLR,11,-AWAP[WID][1]+AWAP[WID][6],-AWAP[WID][2]+AWAP[WID][7],AWAP[WID][3]+AWAP[WID][8],-AWAP[WID][4]+AWAP[WID][9],-AWAP[WID][5]+AWAP[WID][10],0)
			end
			--]]
		end
	elseif WATH[PLR] then
		DTWSTPB(PLR,WATH,WATHb)
	end
	if PLR == player and getElementData(PLR,"HSHTR") and WATH[PLR] and isElement(WATH[PLR]) then
		setElementAlpha(WATH[PLR],141)
		if WATHb[PLR] and isElement(WATHb[PLR]) then
			setElementAlpha(WATHb[PLR],141)
		end
	end
	if getElementData(player,"EA") then
		if isPedInVehicle(PLR) or getElementData(PLR,"HSHTR") then
			OCPQ(PLR)
		else
			local mwp = getElementData(PLR,"MAW")
			if getSlotFromWeapon(getPedWeapon(PLR)) ~= 2 and not WPP[PLR] and mwp[2] then--getPedWeapon(PLR,2) > 0
				WID = getPedWeapon(PLR,2)
				if WID > 0 then
					if getPedStat(PLR,weapFunc[WID][4]) >= 999 then
						WID = WID+200
					elseif getPedStat(PLR,weapFunc[WID][4]) > 500 then
						WID = WID+100
					end
					if WID > 223 then
						x,y,z,rx,ry = -.01,0,0,5,0
					elseif WID > 222 then
						x,y,z,rx,ry = 0,0,0,-4,0
					elseif WID > 221 then
						x,y,z,rx,ry = -.03,0,0,-2,0
						xx,yy,zz,rxx,ryy = -.03,0,0,-2,0
					elseif WID > 123 then
						x,y,z,rx,ry = -.01,0,0,-5,0
					elseif WID > 122 then
						x,y,z,rx,ry = 0,0,0,-7,0
					elseif WID > 121 then
						x,y,z,rx,ry = 0,0,0,1,0
						xx,yy,zz,rxx,ryy = 0,0,0,1,0
					elseif WID > 23 then
						x,y,z,rx,ry = 0,0,0,0,0
					elseif WID > 22 then
						x,y,z,rx,ry = 0,0,0,0,0
					elseif WID > 21 then
						x,y,z,rx,ry = 0,0,0,0,0
						xx,yy,zz,rxx,ryy = 0,0,0,0,0
					end
					rz,rzz = 80,100
					ATWSTPB(PLR,2,WPP,14,13,WPPb)
				end
			elseif getSlotFromWeapon(getPedWeapon(PLR)) == 2 and WPP[PLR] then
				DTWSTPB(PLR,WPP,WPPb)
			end
			if getSlotFromWeapon(getPedWeapon(PLR)) ~= 4 and not WPM[PLR] and mwp[4] then--getPedWeapon(PLR,4) > 0
				WID = getPedWeapon(PLR,4)
				if WID > 0 then
					if getPedStat(PLR,weapFunc[WID][4]) >= 999 then
						WID = WID+200
					elseif getPedStat(PLR,weapFunc[WID][4]) > 500 then
						WID = WID+100
					end
					if WID == 229 then
						x,y,z,rx,ry,rz = -.1,0,.17,70,-80,0
					elseif WID == 132 then
						x,y,z,rx,ry,rz = .06,.1,.14,64,0,1
						xx,yy,zz,rxx,ryy,rzz = -.1,.11,.2,-90,0,174
					elseif WID == 129 then
						x,y,z,rx,ry,rz = .04,0,.17,70,-80,0
					elseif WID == 128 then
						x,y,z,rx,ry,rz = .035,.1,.1,69,0,-8
						xx,yy,zz,rxx,ryy,rzz = -.055,.12,.2,-85,0,181
					elseif WID == 32 then
						x,y,z,rx,ry,rz = .0255,.1,.125,73,0,-4
						xx,yy,zz,rxx,ryy,rzz = -.0455,.12,.2,-90,0,177
					elseif WID == 29 then
						x,y,z,rx,ry,rz = .1,0,.17,70,-80,0
					else
						x,y,z,rx,ry,rz = .025,.1,.14,66,0,-4
						xx,yy,zz,rxx,ryy,rzz = -.045,.12,.2,-90,0,177
					end
					ATWSTPB(PLR,4,WPM,4,4,WPMb)
				end
			elseif getSlotFromWeapon(getPedWeapon(PLR)) == 4 and WPM[PLR] then
				DTWSTPB(PLR,WPM,WPMb)
			end
			if getSlotFromWeapon(getPedWeapon(PLR)) ~= 5 and not WPA[PLR] and mwp[5] then--getPedWeapon(PLR,5) > 0
				WID = getPedWeapon(PLR,5)
				if WID > 0 then
					if getPedStat(PLR,weapFunc[WID][4]) >= 999 then
						WID = WID+200
					elseif getPedStat(PLR,weapFunc[WID][4]) > 500 then
						WID = WID+100
					end
					if WID == 230 then
						x,y,z,rx,ry,rz = -.04,-.2,.15,180,70,-100
					else
						x,y,z,rx,ry,rz = -.02,0,.2,180,70,-100
					end
					ATWSTPB(PLR,5,WPA,5)
				end
			elseif getSlotFromWeapon(getPedWeapon(PLR)) == 5 and WPA[PLR] then
				DTWSTPB(PLR,WPA)
			end
			if getSlotFromWeapon(getPedWeapon(PLR)) ~= 6 and not WPN[PLR] and mwp[6] then--getPedWeapon(PLR,6) > 0
				WID = getPedWeapon(PLR,6)
				if WID > 0 then
					if getPedStat(PLR,weapFunc[WID][4]) >= 999 then
						WID = WID+200
					elseif getPedStat(PLR,weapFunc[WID][4]) > 500 then
						WID = WID+100
					end
					x,y,z,rx,ry,rz = -.21,0,.1,-10,110,-80
					ATWSTPB(PLR,6,WPN,6)
				end
			elseif getSlotFromWeapon(getPedWeapon(PLR)) == 6 and WPN[PLR] then
				DTWSTPB(PLR,WPN)
			end
		end
	end
end

function ATWSTPB(PLR,WST,TTB,BN,BNb,TTBb)
	TTB[PLR] = createObject(weapFunc[WID][2],0,0,4)
	if WID == 127 then
		setObjectScale(TTB[PLR],1.5)
	else
		setObjectScale(TTB[PLR],1)
	end
	setElementDoubleSided(TTB[PLR],true)
	exports.bone_attach:attachElementToBone(TTB[PLR],PLR,BN,x+.11,y,z,rx+7,ry-85,rz)
	--[[
	if TTBb then
		if getPedWeapon(PLR,WST) == 22 or getPedWeapon(PLR,WST) == 26 or getPedWeapon(PLR,WST) == 28 or getPedWeapon(PLR,WST) == 32 then
			TTBb[PLR] = createObject(weapFunc[WID][2],0,0,4)
			setElementDoubleSided(TTBb[PLR],true)
			exports.bone_attach:attachElementToBone(TTBb[PLR],PLR,BNb,xx-.06,yy,zz,rxx+5,ryy-85,rzz)
		end
	end
	--]]
end

function DTWSTPB(PLR,TTB,TTBb)
	exports.bone_attach:detachElementFromBone(TTB[PLR])
	setElementCollisionsEnabled(TTB[PLR],false)
	destroyElement(TTB[PLR])
	TTB[PLR] = nil
	if TTBb and TTBb[PLR] then
		exports.bone_attach:detachElementFromBone(TTBb[PLR])
		setElementCollisionsEnabled(TTBb[PLR],false)
		destroyElement(TTBb[PLR])
		TTBb[PLR] = nil
	end
end

function OPVEN(vehicle, seat)
	--outputDebugString("OPVEN")
	if source == player then
		tpiiav = true
		setPedWeaponSlot(player, 0)
		modelv = getElementModel(vehicle)
		if getPlayerTeam(source) == getTeamFromName("Police") then
		elseif seat < 1 then
			if modelv == 427 or modelv == 490 or modelv == 528 or modelv > 595 and modelv < 600 or modelv == 601 or modelv == 497 or modelv == 523 then
				--suspect = source
				gpwl = getElementData(player, "WantLvl")
				if gpwl < 3 then
					--WANLEV = 3
					--triggerServerEvent("WANTED", source, suspect, WANLEV)
					setElementData(source, "WantLvl", 3)
				--elseif gpwl < 6 then
					--WANLEV = gpwl+1
					--triggerServerEvent("WANTED", source, suspect, WANLEV)
					--setElementData(source, "WantLvl", gpwl+1)
				end
			end
		end
		if getVehicleType(vehicle) ~= "Helicopter" then
			bindKey("vehicle_mouse_look","down",SPDGDB)
			if seat == 0 then
				wheel = {}
				xx,yy,zz = getElementPosition(vehicle)
				z = getElementDistanceFromCentreOfMassToBaseOfModel(vehicle)
				if getVehicleType(vehicle) == "Automobile" or getVehicleType(vehicle) == "Monster Truck" or getVehicleType(vehicle) == "Quad" then
					if getElementModel(vehicle) == 406 then
						z = 2.7
					elseif getElementModel(vehicle) == 573 then
						z = 1.9
					elseif getElementModel(vehicle) == 530 then
						z = .44
					elseif getVehicleType(vehicle) == "Monster Truck" then
						z = 1.5
						--outputChatBox("Monster!")
					end
					if not wlf then
						wlf = createObject(1913,xx,yy,zz)--1913-16101-2898
						wrf = createObject(1913,xx,yy,zz)
						wlb = createObject(1913,xx,yy,zz)
						wrb = createObject(1913,xx,yy,zz)
					end
					setElementAlpha(wlf,0)
					setElementAlpha(wrf,0)
					setElementAlpha(wlb,0)
					setElementAlpha(wrb,0)
					--[[setElementCollisionsEnabled(wlf,false)
					setElementCollisionsEnabled(wrf,false)
					setElementCollisionsEnabled(wlb,false)
					setElementCollisionsEnabled(wrb,false)
					setElementDoubleSided(wlf,true)
					setElementDoubleSided(wrf,true)
					setElementDoubleSided(wlb,true)
					setElementDoubleSided(wrb,true)]]
					wheel[wlf] = {}
					wheel[wrf] = {}
					wheel[wlb] = {}
					wheel[wrb] = {}
					wheel[wlf][1] = "wheel_lf_dummy"
					wheel[wrf][1] = "wheel_rf_dummy"
					wheel[wlb][1] = "wheel_lb_dummy"
					wheel[wrb][1] = "wheel_rb_dummy"
					wheel[wlf][2] = 1
					wheel[wrf][2] = 3
					wheel[wlb][2] = 2
					wheel[wrb][2] = 4
					x,y = getVehicleComponentPosition(vehicle,"wheel_lf_dummy")
					attachElements(wlf,vehicle,x,y,-z)
					x,y = getVehicleComponentPosition(vehicle,"wheel_rf_dummy")
					attachElements(wrf,vehicle,x,y,-z)
					x,y = getVehicleComponentPosition(vehicle,"wheel_lb_dummy")
					attachElements(wlb,vehicle,x,y,-z)
					x,y = getVehicleComponentPosition(vehicle,"wheel_rb_dummy")
					attachElements(wrb,vehicle,x,y,-z)
				elseif getVehicleType(vehicle) == "Bike" then
					wft = createObject(1913,xx,yy,zz)
					wre = createObject(1913,xx,yy,zz)
					setElementAlpha(wft,0)
					setElementAlpha(wre,0)
					--[[setElementCollisionsEnabled(wft,false)
					setElementCollisionsEnabled(wre,false)
					setElementDoubleSided(wft,true)
					setElementDoubleSided(wre,true)]]
					wheel[wft] = {}
					wheel[wre] = {}
					wheel[wft][1] = "wheel_front"
					wheel[wre][1] = "wheel_rear"
					wheel[wft][2] = 1
					wheel[wre][2] = 2
					x,y = getVehicleComponentPosition(vehicle,"wheel_front")
					attachElements(wft,vehicle,x,y,-z)
					x,y = getVehicleComponentPosition(vehicle,"wheel_rear")
					attachElements(wre,vehicle,x,y,-z)
				end
				xx,yy,zz,x,y,z,gx,gy,gz = nil,nil,nil,nil,nil,nil,nil,nil,nil
			end
		else
			local val = getElementData(player,"HSHTR")
			if getElementData(player,"HSHTRH") == vehicle and val and type(val) == "table" then
				setElementAlpha(player,255)
				setElementAlpha(vehicle,255)
				if WATH[player] and isElement(WATH[player]) then
					setElementAlpha(WATH[player],255)
					if WATHb[player] and isElement(WATHb[player]) then
						setElementAlpha(WATHb[player],255)
					end
				end
			end
			setTimer(function() bindKey("vehicle_mouse_look","down",MPHS) end,2000,1)
			unbindKey("next_weapon","down",MPHS)
			unbindKey("previous_weapon","down",MPHS)
			unbindKey("jump","down",MPHS)
			unbindKey("enter_exit","down",MPHS)
			MCW = nil
		end
	end
	OCPQ(source,true)
	ARSTP(source,0,true)
end
addEventHandler("onClientPlayerVehicleEnter", player, OPVEN)

function UDFWHL()
	wheel = nil
	if wlf then
		destroyElement(wlf)
		wlf = nil
	end
	if wrf then
		destroyElement(wrf)
		wrf = nil
	end
	if wlb then
		destroyElement(wlb)
		wlb = nil
	end
	if wrb then
		destroyElement(wrb)
		wrb = nil
	end
	if wft then
		destroyElement(wft)
		wft = nil
	end
	if wre then
		destroyElement(wre)
		wre = nil
	end
	if WRC then
		WRC = nil
		--removeEventHandler("onClientRender",root,RWPCC)
		wheels = nil
		--outputChatBox("left")
	end
	if getElementData(player,"HSHTR") then
		setElementAlpha(player,101)
		if isElement(getElementData(player,"HSHTR")[1]) then
			setElementAlpha(getElementData(player,"HSHTR")[1],101)
		end
		setTimer(function() MCW = 4 NWPS() end,50,1)
		setTimer(function()
			bindKey("next_weapon","down",MPHS)
			bindKey("previous_weapon","down",MPHS)
			bindKey("jump","down",MPHS)
			bindKey("enter_exit","down",MPHS)
		end,2000,1)
	else
		unbindKey("next_weapon","down",MPHS)
		unbindKey("previous_weapon","down",MPHS)
		unbindKey("jump","down",MPHS)
		unbindKey("enter_exit","down",MPHS)
		MCW = nil
	end
	unbindKey("vehicle_mouse_look","down",MPHS)
	unbindKey("vehicle_mouse_look","down",SPDGDB)
	if getControlState("aim_weapon") then
		HWASCSAC(nil,"down")
	end
	setPedDoingGangDriveby(player,false)
	toggleControl("vehicle_look_left",true)
	toggleControl("vehicle_look_right",true)
end
addEventHandler("onClientPlayerVehicleExit",player,UDFWHL)

function Oticket()
	--outputDebugString("Oticket")
	if getPlayerTeam(player) == getTeamFromName("Police") then
		unbindKey("conversation_no", "down", Oticket)
		unbindKey("sub_mission", "down", Oticket)
		ppx, ppy, ppz = getElementPosition(player)
		vT = {}
		for _, players in pairs(getElementsWithinColShape(OPWC,"player")) do
			if getElementData(players, "WantLvl") > 0 and getElementData(players, "WantLvl") < 3 then
				if getElementData(players, "Stats") == 0 and getElementData(players, "WantLvl") > 0 and getElementData(players, "WantLvl") < 3 then
					--ppx, ppy, ppz = getElementPosition(player)
					psx, psy, psz = getElementPosition(players)
					dist = getDistanceBetweenPoints3D(ppx, ppy, ppz, psx, psy, psz)
					if dist < 20 then
						--triggerServerEvent("OFFTICK", resourceRoot, player, players)--Edit loop
						table.insert(vT,players)
						--break
					end
				end
			end
		end
		--local next = next
		if not table.empty(vT) then--#vT > 0
			triggerServerEvent("OFFTICK", resourceRoot, player, vT)--Edit loop
		end
		vT = nil
		setTimer(function()
			bindKey("conversation_no", "down", Oticket)
			bindKey("sub_mission", "down", Oticket)
		end, 2000, 1)
	end
end
bindKey("conversation_no", "down", Oticket)
bindKey("sub_mission", "down", Oticket)

addEvent("BKPT", true)
function BKPticket(cop)
	--outputDebugString("BKPticket")
	tcop = cop
	vTT = {}
	if getElementData(player, "WantLvl") == 1 then
		if isPedInVehicle(player) then
			vTT[player] = tlng[plng][19]..''..getPlayerName(cop)..''..tlng[plng][20]
			exports["guimessages"]:outputClient(vTT[player], 255, 255, 0)
			checkntf('y', 'tk', 'y', vTT)
		else
			vTT[player] = tlng[plng][17]..''..getPlayerName(cop)..''..tlng[plng][18]
			exports["guimessages"]:outputClient(vTT[player], 255, 255, 0)
			checkntf('y', 'tk', 'y', vTT)
		end
		bail = 200
	elseif getElementData(player, "WantLvl") == 2 then
		if isPedInVehicle(player) then
			vTT[player] = tlng[plng][23]..''..getPlayerName(cop)..''..tlng[plng][24]
			exports["guimessages"]:outputClient(vTT[player], 255, 255, 0)
			checkntf('y', 'tk', 'y', vTT)
		else
			vTT[player] = tlng[plng][21]..''..getPlayerName(cop)..''..tlng[plng][22]
			exports["guimessages"]:outputClient(vTT[player], 255, 255, 0)
			checkntf('y', 'tk', 'y', vTT)
		end
		bail = 500
	end
	vTT = nil
	chance = setTimer(DPT, 30000, 2, cop)
	bindKey("group_control_back", "down", Pticket, cop)
	bindKey("sub_mission", "down", Pticket, cop)
end
addEventHandler("BKPT", resourceRoot, BKPticket)

function Pticket()
	--outputDebugString("Pticket")
	if getElementData(player, "WantLvl") < 3 and getElementData(player,"Stats") < 2 then
		tix, tiy, tiz = getElementPosition(player)
		cox, coy, coz = getElementPosition(tcop)
		dist = getDistanceBetweenPoints3D(tix, tiy, tiz, cox, coy, coz)
		if dist < 20 then
			if getElementData(player, "Money") >= bail then
				killTimer(chance)
				unbindKey("group_control_back", "down", Pticket)
				unbindKey("sub_mission", "down", Pticket)
				if getElementData(player, "WantLvl") == 1 then
					setElementData(player, "Money", getElementData(player,"Money")-200)
				elseif getElementData(player, "WantLvl") == 2 then
					setElementData(player, "Money", getElementData(player,"Money")-500)
				end
				--setElementData(player, "Money", getPlayerMoney(player))
				triggerServerEvent("PTick", resourceRoot, player, tcop)
			else
				exports["guimessages"]:outputClient(tlng[plng][12], 255, 255, 0)
			end
		end
	else
		killTimer(chance)
		chance = nil
		unbindKey("group_control_back", "down", Pticket, cop)
		unbindKey("sub_mission", "down", Pticket, cop)
	end
end

function DPT(cop)
	--outputDebugString("DPT")
	local x,y,z = getElementPosition(player)
	local xx,yy,zz = getElementPosition(tcop)
	local dist = getDistanceBetweenPoints3D(x,y,z,xx,yy,zz)
	if dist < 20 then
		local vTT = {}
		if getElementData(player, "WantLvl") == 1 then
			vTT[player] = tlng[plng][13]
			exports["guimessages"]:outputClient(vTT[player], 255, 255, 0)
			checkntf('r', 'tk', 'r', vTT)
		elseif getElementData(player, "WantLvl") == 2 then
			vTT[player] = ""
			checkntf('r', 'gu', 'r', vTT)
			killTimer(chance)
			chance = nil
			unbindKey("group_control_back", "down", Pticket)
			unbindKey("sub_mission", "down", Pticket)
		end
		triggerServerEvent("TCHANCE", resourceRoot, player)
	else
		killTimer(chance)
		chance = nil
		--triggerServerEvent("SED", player, player)
		setElementData(player, "Stats", 0)
	end
end

function targetArrest(target)
	--outputDebugString("targetArrest")
	if source == player and target then
		weapon = getPedWeapon(source)
		if getControlState("aim_weapon") or isPedDoingGangDriveby(source) and getPlayerTeam(source) == getTeamFromName("Police") then
			if getElementType(target) == "player" then
				if getPlayerTeam(source) ~= getTeamFromName("Police") and getPlayerTeam(target) == getTeamFromName("Police") and getElementData(source,"WantLvl") < 3 and weapon > 20 and weapon < 39 then
					local x,y,z = getElementPosition(source)
					local xx,yy,zz = getElementPosition(target)
					if getDistanceBetweenPoints3D(x,y,z,xx,yy,zz) < 30 then
						setElementData(source,"WantLvl",2)
					end
				end 
				if getPlayerTeam(source) == getTeamFromName("Police") or getElementData(source, "Job") == 3 and getElementData(target, "Job") ~= 3 and not getElementData(target, "protect") and not isElementInMarkers(target) then
					weap = getPedWeapon(target)
					if weapon > 20 and weapon < 39 and weap < 18 and getElementData(source, "Job") == 3 or weapon > 20 and weapon < 39 and getPlayerTeam(source) == getTeamFromName("Police") then
						--for _, players in ipairs(getElementsByType("player")) do
							--if target == players then
								--if getPlayerTeam(target) ~= getTeamFromName("Police") then
									--if getElementData(target, "WantLvl") > 2 then
										local sheal = getElementHealth(target)
										if sheal < 30 and getPlayerTeam(target) ~= getTeamFromName("Police") and getElementData(target, "WantLvl") > 2 and getPlayerTeam(source) == getTeamFromName("Police") or sheal < 50 and getElementData(source, "Job") == 3 then -- and sheal < getElementHealth(player)
											local x,y,z = getElementPosition(target)
											local xx,yy,zz = getElementPosition(source)
											local dist = getDistanceBetweenPoints3D(x,y,z,xx,yy,zz)
											if dist < 7 and sheal > 0 then
												if sheal >= 10 then
													dist = dist/((sheal/10)^(1/2))
												end
												if dist < 7 then
													if getElementData(source, "Prisoners") < 1 then
														if getElementData(target, "Stats") < 2 then
															if isPedDoingGangDriveby(source) and sheal < 50 and getPlayerTeam(source) == getTeamFromName("Police") then
																pvmodel = getElementModel(getPedOccupiedVehicle(source))
																if pvmodel == 427 or pvmodel == 490 or pvmodel == 528 or pvmodel > 595 and pvmodel < 600 or pvmodel == 601 or pvmodel == 523 then
																	--cop = source
																	triggerServerEvent("arresting",resourceRoot,player,target,player)
																	removeEventHandler("onClientPlayerTarget",root,targetArrest)
																	setTimer(function() addEventHandler("onClientPlayerTarget",root,targetArrest) end,2000,1)
																end
															elseif not isPedDoingGangDriveby(source) then
																--cop = source
																triggerServerEvent("arresting",resourceRoot,player,target,player)
																removeEventHandler("onClientPlayerTarget",root,targetArrest)
																setTimer(function() addEventHandler("onClientPlayerTarget",root,targetArrest) end,2000,1)
															end
														end
													end
												end
											end
										end
									--end
								--end
							--end
						--end
					end
				elseif getElementData(source, "Stats") < 3 and getPlayerTeam(target) == getTeamFromName("Police") then
					if weapon > 20 and weapon < 39 then--if weapon > 20 and weapon < 37 or weapon == 38 then
						--for _, players in pairs(getElementsWithinColShape(OPWC,"player")) do
							--if getPlayerTeam(players) == getTeamFromName("Police") then
								local x,y,z = getElementPosition(source)
								--local xx,yy,zz = getElementPosition(players)
								local xx,yy,zz = getElementPosition(target)
								--local dist = getDistanceBetweenPoints3D(x,y,z,xx,yy,zz)
								--if players == target then
									if getDistanceBetweenPoints3D(x,y,z,xx,yy,zz) < 30 then
										if getElementData(player,"WantLvl") < 1 then
											--[[WANLEV = 1
											suspect = source
											triggerServerEvent("WANTED", source, suspect, WANLEV)]]
											setElementData(source,"WantLvl",1)
											--break
										end
									end
								--end
							--end
						--end
					end
				end
			end
		end
	end
end
addEventHandler("onClientPlayerTarget",root,targetArrest)



addEvent("UnAR", true)
function unarrest(PLR)
	--outputDebugString("unarrest")
	if getPlayerTeam(PLR) == getTeamFromName("Police") then
		if getElementData(player, "Stats") == 2 then
			if getPlayerName(PLR) == cop then
				removeEventHandler("onClientRender", root, jailTime)
				TTBF()
				triggerServerEvent("escaped", resourceRoot,player,player, thecop)
				jailed(player)
				jTime = nil
			end
		end
	elseif getPlayerTeam(player) == getTeamFromName("Police") then
		if getElementData(PLR, "Stats") == 2 then
			if getElementData(player, "Prisoners") > 0 then
				if prsnr == PLR then
					removeEventHandler("onClientRender", root, jailTime)
					triggerServerEvent("escaped", resourceRoot,player,prsnr, player,nil,nil,true)
					setElementData(PLR, "Money", getElementData(PLR, "WantLvl")*500)
					sendprsT = nil
					killTimer(sendT)
					--unbindKey("group_control_back", "down", TSETJP)
					--unbindKey("radio_user_track_skip", "down", TSETJP)
					prsnr = nil
					jTime = nil
					--setElementData(player, "Money", getPlayerMoney(player))
				end
			end
		end
	end
end
addEventHandler("UnAR", player, unarrest)


addEvent("SetTimeOn", true)
function Settimeon()
      thecop = true
	  desc = nil
	  --jonar = false
       if not jTime then
			addEventHandler("onClientRender", root, jailTime)
			jTime = true
	  end
	  
end
addEventHandler("SetTimeOn", root, Settimeon)

addEvent("clienAR", true)
function Carrest(PLR,cop,arga)
	--outputDebugString("Carrest")
	if PLR == player then
		triggerServerEvent("HPCF",resourceRoot,player)
		thecop = getPlayerName(cop)
		if escapeT then
			if isTimer(Tescape) then killTimer(Tescape) end
			Tescape = nil
			unbindKey("enter_exit", "down", RAOA)
			escapeT = nil
		end
		addEventHandler("onClientRender", root, PFC)
		setPedWeaponSlot(PLR, 0)
		showCursor(true)
		setElementDimension(el,getElementDimension(player))
		if getElementData(PLR, "Stats") > 2 then
			attachElements(el, cop, 0, 2, 0)
		else
			attachElements(el, cop, 0, 0, 0)
			if arga == 1 then
				setTimer(ff,3000,1,cop)
			else
				setTimer(ff,5000,1,cop)
			end
		end
		if healT then
			exports["guimessages"]:outputClient(tlng[plng][54], 255, 255)
			killTimer(healT)
			healT = nil
			HTime = nil
			plusH = nil
			drugG = nil
			ddata = nil
			noD = setTimer(function()
				noD = nil
			end, 120000, 1)
		end
	elseif cop == player then
		kidnapped = PLR
		if getPlayerTeam(cop) == getTeamFromName("Police") then
			if arga == 1 then
				setTimer(WPTJ,3000,1,PLR)
			else
				setTimer(WPTJ,5000,1,PLR)
			end
		end
	end
	if PLR == player or cop == player and getElementData(cop, "Job") ~= 3 then
        destroyMjail ()
		for k,v in pairs(MarkerGoToJail) do
		    local sptjm = createMarker(v[1], v[2], v[3], "corona", v[4])
			local csptjm = createMarker(v[1], v[2], v[3]-0.7, "cylinder", v[4], 0, 0, 255, 128)
			MarkerJail[sptjm] = csptjm
			setElementInterior(sptjm, v[5]+20)
			setElementInterior(csptjm, v[5])
			setElementDimension (csptjm , v[6] )
		end
	end
end
addEventHandler("clienAR",root,Carrest)

addEvent("FOL", true)
function ff(cop)
	--outputDebugString("ff")
	--if source == player then
		setElementDimension(el,getElementDimension(player))
		attachElements(el, cop, 0, 2, 0)
	--end
end
addEventHandler("FOL", player, ff)

addEvent("COAJT", true)
function OAJT()
	--outputDebugString("OAJT")
	OAJ = true
end
addEventHandler("COAJT", root, OAJT)

addEvent("COAJF", true)
function OAJF()
	--outputDebugString("OAJF")
	OAJ = nil
end
addEventHandler("COAJF", root, OAJF)


--chk = 0
function RWPs()
	--outputDebugString("RWPs")
	cged = getElementData(player, "Stats")
	if not getElementData(player, "Stats") then
		cged = 0
		setElementData(player, "Stats", cged)
	end
	bx, by, bz = getElementPosition(player)
	gz = getGroundPosition(bx, by, bz)
	if tpiiav and isPedInVehicle(player) then
		veh = getPedOccupiedVehicle(player)
		if sprayd then
			if getElementHealth(veh) < 1000 then
				if getElementData(player,"Money") < 500 then
					exports["guimessages"]:outputClient(tlng[plng][25], 255, 255, 0)
				else
					vx, vy, vz = getElementVelocity(veh)
					if vx == 0 and vy == 0 and vz == 0 then
						toggleAllControls(false, true, false)
						Rsound = setTimer(playSoundFrontEnd,2000,10,46)
						setTimer(playSFX,2000,1,"script",150,0)
						sprayd = nil
						spray = nil
						setGarageOpen(8, false)
						setGarageOpen(11, false)
						setGarageOpen(12, false)
						setTimer(function() Rsound = nil
							setGarageOpen(8, true)
							setGarageOpen(11, true)
							setGarageOpen(12, true)
							fixVehicle(veh)
							setElementData(player, "Money", getElementData(player,"Money")-500)
							--setElementData(player, "Money", getPlayerMoney(player))
							toggleAllControls(true, true, false)
						end, 4000, 1)
					end
				end
			end
		elseif vshopd and getElementHealth(veh) > 250 then
			vx, vy, vz = getElementVelocity(veh)
			if vx == 0 and vy == 0 and vz == 0 then
				local dacc--dacc = nil
				for k,v in pairs(getVehicleOccupants(veh)) do
					if v and v ~= player then
						dacc = true
						break
					end
				end
				if dacc then
					outputChatBox("All passengers must leave the vehicle before entering the shop!", 255, 255, 0)
				else
					if IshopU then
						setVehicleColor(Ishop[7], 255, 120, 120)
						setVehicleColor(Ishop[8], 255, 255, 0)
						setVehicleColor(Ishop[9], 255, 255, 255, 255, 0, 0)
						setVehicleColor(Ishop[10], 255, 120, 0, 0, 0, 0)

						for i=0, 11 do
							setElementDimension(Ishop[i], getElementData(player, "ID"))
							if i > 1 and i < 7 then
								setElementAlpha(Ishop[i], 0)
							end
							if i > 6 and i < 11 then
								setVehicleOverrideLights(Ishop[i], 2)
								for k,v in pairs(IshopU[i]) do
									addVehicleUpgrade(Ishop[i], v)
								end
								IshopU[i] = nil
							end
							if i ~= 1 and i < 11 then
								Ishop[i] = nil
							end
						end
						IshopU = nil
					end
					setWorldSoundEnabled(0,0,false)
					setWorldSoundEnabled(0,29,false)
					setWorldSoundEnabled(0,30,false)
					fadeCamera(false, 1)
					setGarageOpen(10, false)
					toggleAllControls(false, true, false)
					setVehicleEngineState(veh, false)
					vshopd = nil
					vshop = nil
					setVehicleDamageProof(veh,true)
					setTimer(function()
						veh = getPedOccupiedVehicle(player)
						setElementInterior(player,1)
						setElementDimension(player, getElementData(player, "ID"))
						setElementDimension(veh, getElementData(player, "ID"))
						setElementPosition(veh, 1050, -1017.75, 16)
						setElementRotation(veh, 0, 0, 180)
						setCameraMatrix(1045, -1022.75, 16, 1050, -1017.75, 14.5)
						showPlayerHudComponent("radar", false)
						rchn = getRadioChannel()
						setRadioChannel(0)
						setTimer(function()
							vss = playSound("sounds/0.mp3", true)
							for k,v in pairs(getElementsByType("player")) do
								if FWIND[v] then
									Cwindow(v)
								end
							end
							if fpis then
								killTimer(fpis)
								fpis = nil
							end
							protect = nil
							detachElements(player)
							HideBank()
						end, 1300, 1)
						setTimer(function()
							Mhit()
							vx, vy, vz = getElementPosition(veh)
							vz = vz-14
							attachElements(veh, Ishop[1], 0, 0, vz, 0, 0, 180)
							vx,vy,vz = nil,nil,nil
							z = nil
							fadeCamera(true, 1)
							bindKey("a", "both", RotVSO)
							bindKey("d", "both", RotVSO)
							setElementInterior(player,0)
						end, 1600, 1)--1300
					end, 1000, 1)
				end
				--dacc = nil
			end
		end
	end

	if getPlayerTeam(player) ~= getTeamFromName("Police") then
		gpwlev = getElementData(player, "WantLvl")
		if not getElementData(player, "WantLvl") then
			gpwlev = 0
			setElementData(player, "WantLvl", gpwlev)
		end
		if cged < 2 and not isPedDead(player)and not selecting and gpwlev > 2 then

			MinsLeft = gpwlev
			SecsLeft = 0

			source = player
			FonLI(source)
		end
		px, py, pz = getElementPosition(player)
		if cged == 3 then
		    setPedWeaponSlot(player,0 )
			if not isElement(GateJail) then
			    GateJail = getElementByID ("Persion:G1")
			end
			if not isElement(GateJail) then
			    GateJail = ""
			end
		end
		if cged == 3 and OAJ or cged == 3 and not jonar and not OAJ or cged == 2 and not jonar then
			desc = true
			if cged == 2 and not jonar then
			    if isInJailZone () then
					desc = nil 
			    end				
			end
			JAILTIMEF()
		elseif cged > 1 and not jonar or cged > 1 and not OAJ then
			if isInJailZone () then
				desc = nil
				JAILTIMEF()
				--outputChatBox("333333333") 
			end
		end
		--[[
		if px > 1586 and px < 1603 and py > -1683 and py < -1675 and pz > 1224 and pz < 1229 or px > 1591 and px < 1603 and py > -1683 and py < -1657 and pz > 1224 and pz < 1229 or px > 1548 and px < 1554 and py > -1700 and py < -1665 and pz > 1224 and pz < 1229 then
			if px > 1586 then
				bc1 = true
				bc2 = nil
				
			elseif px < 1554 then
				bc1 = nil
				bc2 = true
				
			end
			if cged > 2 and getElementHealth(player) > 0 then
				if jonar then
					removeEventHandler("onClientRender", root, jailTime)
					if jte then
						unbindKey("group_control_back", "down", bailing)
						jte = nil
					end
					triggerServerEvent("JailEscape", resourceRoot, player, bc1, bc2)
					jTime = nil
				else
					SetElementPosition(player, 1584, -1681, 1227)
					setPedRotation(player, 0)
				end
			end
		end
		--]]
		if jTime then
			if getElementData(player, "Stats") < 2 then
				removeEventHandler("onClientRender", root, jailTime)
				if jte then
					unbindKey("group_control_back", "down", bailing)
					jte = nil
				end
				jTime = nil
			end
		end
	end
end

function RotVSO(key, state)
	if key == "a" then
		unbindKey("d", "both", RotVSO)
		if state == "down" then
			moveObject(Ishop[1], 3000, 1050, -1017.75, 14, 0, 0, -360)
			RotAG = setTimer(moveObject, 3000, 0, Ishop[1], 3000, 1050, -1017.75, 14, 0, 0, -360)
		else
			if RotAG then
				killTimer(RotAG)
				RotAG = nil
			end
			stopObject(Ishop[1])
			bindKey("d", "both", RotVSO)
		end
	else
		unbindKey("a", "both", RotVSO)
		if state == "down" then
			moveObject(Ishop[1], 3000, 1050, -1017.75, 14, 0, 0, 360)
			RotAG = setTimer(moveObject, 3000, 0, Ishop[1], 3000, 1050, -1017.75, 14, 0, 0, 360)
		else
			if RotAG then
				killTimer(RotAG)
				RotAG = nil
			end
			stopObject(Ishop[1])
			bindKey("a", "both", RotVSO)
		end
	end
end

function Mhit()
	--if hitp == player then
		--if source == VSM then
			--if isPedInVehicle(hitp) then
				sveh = getPedOccupiedVehicle(player)
				setVehicleOverrideLights(sveh, 2)
				CVU = getVehicleUpgrades(sveh)
				GVNC = getVehicleNitroCount(sveh)
				VCLR[0] = getVehiclePlateText(sveh)
				VCLR[1] = getVehiclePaintjob(sveh)
				VCLR[2],VCLR[3],VCLR[4] = getVehicleHeadLightColor(sveh)
				VCLR[5],VCLR[6],VCLR[7],VCLR[8],VCLR[9],VCLR[10],VCLR[11],VCLR[12],VCLR[13],VCLR[14],VCLR[15],VCLR[16] = getVehicleColor(sveh, true)
				VCLR[29],VCLR[30] = getVehicleVariant(sveh)
				if getAttachedElements(sveh) then
					for k,v in pairs(getAttachedElements(sveh)) do
						if getElementType(v) == "marker" then
							--x,y,z = getElementPosition(v)
							--outputChatBox("Neon= "..x..", "..y..", "..z)
							if not Neon then
								VON = true
								Neon = true
								VHN = v
								VCLR[31],VCLR[32],VCLR[33] = getMarkerColor(v)
							end
							--outputChatBox(VCLR[31].."**"..VCLR[32].."**"..VCLR[33])
							setElementDimension(v, getElementData(player, "ID"))
						end
					end
				end
				if not VCLR[31] then
					VCLR[31],VCLR[32],VCLR[33] = 0,0,0
				end
				--EVar()
				for i=5, 16 do
					if not VCLR[i] then
						VCLR[i] = 0
					end
				end
				Cart = 0
				VUSW[0] = guiCreateWindow(w/1.096, h/3.6, w, h,"VShop",false)
				VUSW[1] = guiCreateWindow(0, h/3.3, w/11.4, h/4+h/24,"VShop",false)
					VUB[2] = guiCreateButton(w/136.6, h/20-h/128, w/13.66, h/30,"Repair",false,VUSW[1])
					VUB[3] = guiCreateButton(w/136.6, h/10-h/128, w/13.66, h/30,"Color",false,VUSW[1])
					VUB[4] = guiCreateButton(w/136.6, h/20*3-h/128, w/13.66, h/30,"Paintjob",false,VUSW[1])
					VUB[5] = guiCreateButton(w/136.6, h/5-h/128, w/13.66, h/30,"Neon",false,VUSW[1])
					VUB[6] = guiCreateButton(w/136.6, h/4-h/128, w/13.66, h/30,"Text Plate",false,VUSW[1])
				VUSW[2] = guiCreateWindow(w, h, w/6.7, h/10+h/24,"Repair",false)
					VUB[8] = guiCreateButton(w/136.6, h/20-h/128, w/7.04, h/30,"Apperance & Tires $300",false,VUSW[2])
					VUB[9] = guiCreateButton(w/136.6, h/10-h/128, w/7.04, h/30,"Engine $200",false,VUSW[2])
				VUSW[3] = guiCreateWindow(w, h, w/6.7, h/2.5+h/24,"Color",false)
					VUB[10] = guiCreateRadioButton(w/136.6, h/20-h/128, w/8, h/30,"Vehicle $1000",false,VUSW[3])
					VUB[11] = guiCreateRadioButton(w/136.6, h/10-h/128, w/8, h/30,"Headlights $1000",false,VUSW[3])
					VUB[12] = guiCreateRadioButton(w/136.6, h/20*3-h/128, w/8, h/30,"Neon $1000",false,VUSW[3])
					VUB[13] = guiCreateLabel(w/136.6, h/5, w/8, h/30, "R1                G1                B1", false, VUSW[3])
					VUB[14] = guiCreateLabel(w/136.6, h/4, w/8, h/30, "R2                G2                B2", false, VUSW[3])
					VUB[15] = guiCreateLabel(w/136.6, h/20*6, w/8, h/30, "R3                G3                B3", false, VUSW[3])
					VUB[16] = guiCreateLabel(w/136.6, h/20*7, w/8, h/30, "R4                G4                B4", false, VUSW[3])
					VUB[17] = guiCreateEdit(w/52.54, h/5-h/128, w/31, h/30, "0", false, VUSW[3])
					VUB[18] = guiCreateEdit(w/15.52, h/5-h/128, w/31, h/30, "0", false, VUSW[3])
					VUB[19] = guiCreateEdit(w/9, h/5-h/128, w/31, h/30, "0", false, VUSW[3])
					VUB[20] = guiCreateEdit(w/52.54, h/4-h/128, w/31, h/30, "0", false, VUSW[3])
					VUB[21] = guiCreateEdit(w/15.52, h/4-h/128, w/31, h/30, "0", false, VUSW[3])
					VUB[22] = guiCreateEdit(w/9, h/4-h/128, w/31, h/30, "0", false, VUSW[3])
					VUB[23] = guiCreateEdit(w/52.54, h/20*6-h/128, w/31, h/30, "0", false, VUSW[3])
					VUB[24] = guiCreateEdit(w/15.52, h/20*6-h/128, w/31, h/30, "0", false, VUSW[3])
					VUB[25] = guiCreateEdit(w/9, h/20*6-h/128, w/31, h/30, "0", false, VUSW[3])
					VUB[26] = guiCreateEdit(w/52.54, h/20*7-h/128, w/31, h/30, "0", false, VUSW[3])
					VUB[27] = guiCreateEdit(w/15.52, h/20*7-h/128, w/31, h/30, "0", false, VUSW[3])
					VUB[28] = guiCreateEdit(w/9, h/20*7-h/128, w/31, h/30, "0", false, VUSW[3])
					VUB[29] = guiCreateButton(w/136.6, h/2.5-h/128, w/7.04, h/30, "Restore", false, VUSW[3])
					guiSetProperty(VUB[29], "NormalTextColour", "FF00FF00")
					for i=17, 28 do
						guiEditSetMaxLength(VUB[i], 3)
					end
					for i=5, 16 do
						guiSetText(VUB[i+12], tostring(VCLR[i]))
					end
				VUSW[4] = guiCreateWindow(w, h, w/6.7, h/30*4+h/39,"Paintjob",false)
					VUB[30] = guiCreateRadioButton(w/136.6, h/30-h/128, w/9, h/30,"None",false,VUSW[4])
					VUB[31] = guiCreateRadioButton(w/136.6, h/15-h/128, w/8.5, h/30,"Paintjob 1 $50000",false,VUSW[4])
					VUB[32] = guiCreateRadioButton(w/136.6, h/10-h/128, w/8.5, h/30,"Paintjob 2 $50000",false,VUSW[4])
					VUB[33] = guiCreateRadioButton(w/136.6, h/7.5-h/128, w/8.5, h/30,"Paintjob 3 $50000",false,VUSW[4])
					if VCLR[1] < 3 then
						guiRadioButtonSetSelected(VUB[VCLR[1]+31], true)
						guiSetProperty(VUB[VCLR[1]+31], "NormalTextColour", "FF00FF00")
					else
						guiRadioButtonSetSelected(VUB[30], true)
						guiSetProperty(VUB[30], "NormalTextColour", "FF00FF00")
					end
				VUSW[5] = guiCreateWindow(w, h, w/6.7, h/15+h/39,"Neon",false)
					VUB[34] = guiCreateRadioButton(w/136.6, h/30-h/128, w/9, h/30,"None",false,VUSW[5])
					VUB[35] = guiCreateRadioButton(w/136.6, h/15-h/128, w/8.5, h/30,"Add Neon $100000",false,VUSW[5])
					if VHN then
						guiRadioButtonSetSelected(VUB[35], true)
						guiSetProperty(VUB[35], "NormalTextColour", "FF00FF00")
					else
						guiRadioButtonSetSelected(VUB[34], true)
						guiSetProperty(VUB[34], "NormalTextColour", "FF00FF00")
					end
				VUSW[6] = guiCreateWindow(w, h, w/6.7, h/10+h/24,"Text Plate",false)
					VUB[36] = guiCreateLabel(w/136.6, h/20, w/7.04, h/30, "Text:                                  $10000", false, VUSW[6])
					VUB[37] = guiCreateEdit(w/34, h/20-h/128, w/15, h/30, getVehiclePlateText(sveh), false, VUSW[6])
					guiEditSetMaxLength(VUB[37], 8)
					VUB[38] = guiCreateButton(w/136.6, h/10-h/128, w/7.04, h/30, "Restore", false, VUSW[6])
					guiSetProperty(VUB[38], "NormalTextColour", "FF00FF00")

				if ATT[getElementModel(sveh)] then
					guiSetSize(VUSW[1], w/11.4, h/20*6+h/24, false)
					VUB[7] = guiCreateButton(w/136.6, h/20*6-h/128, w/13.66, h/30,"Attachments",false,VUSW[1])
					ATTI = ATT[getElementModel(sveh)]
					for i=0, 1 do
						--for k,v in pairs(ATT[getElementModel(sveh)]) do
							if i < 1 then
								--if not VUB[39] then
									--VUB[39] = guiCreateLabel(w/136.6, h/30-h/128, w/7.04, h/30, "Attachment(1)", false, VUSW[7])
									VUSW[7] = guiCreateWindow(w, h, w, h,"Attachment(1)",false)
									VCLR[VUSW[7]] = VCLR[29]
									VUB[39] = guiCreateRadioButton(w/136.6, h/30-h/128, w/9, h/30,"None",false,VUSW[7])
									guiRadioButtonSetSelected(VUB[39], true)
									guiSetProperty(VUB[39], "NormalTextColour", "FF00FF00")
									NOB = 2
									VUSN = 41
								--end
								--outputChatBox(v)
								for v=0, 5 do
									if ATTI[v] then
										VUB[VUSN] = guiCreateRadioButton(w/136.6, h/30*NOB-h/128, w/3.5, h/30,ATTI[v][1].." $"..ATTI[v][2],false,VUSW[7])
										VCLR[VUB[VUSN]] = v
										if VCLR[29] == v then
											guiSetProperty(VUB[39], "NormalTextColour", "FFFFFFFF")
											guiRadioButtonSetSelected(VUB[VUSN], true)
											guiSetProperty(VUB[VUSN], "NormalTextColour", "FF00FF00")
										end
										NOB = NOB+1
										VUSN = VUSN+1
									end
								end
								guiSetSize(VUSW[7], w/3.4, h/30*NOB+h/39, false)
							else
								--if not VUB[41] then
									--NOB = NOB+1
									--VUB[41] = guiCreateLabel(w/136.6, h/30*NOB-h/128, w/7.04, h/30, "Attachment(2)", false, VUSW[8])
									VUSW[8] = guiCreateWindow(w, h, w, h,"Attachment(2)",false)
									VCLR[VUSW[8]] = VCLR[30]
									VUB[40] = guiCreateRadioButton(w/136.6, h/30-h/128, w/9, h/30,"None",false,VUSW[8])
									guiRadioButtonSetSelected(VUB[40], true)
									guiSetProperty(VUB[40], "NormalTextColour", "FF00FF00")
									NOB = 2
								--end
								--ATTI = ATT[getElementModel(sveh)]
								for v=0, 5 do
									if ATTI[v] then
										VUB[VUSN] = guiCreateRadioButton(w/136.6, h/30*NOB-h/128, w/3.5, h/30,ATTI[v][1].." $"..ATTI[v][2],false,VUSW[8])
										VCLR[VUB[VUSN]] = v
										if VCLR[30] == v then
											guiSetProperty(VUB[40], "NormalTextColour", "FFFFFFFF")
											guiRadioButtonSetSelected(VUB[VUSN], true)
											guiSetProperty(VUB[VUSN], "NormalTextColour", "FF00FF00")
										end
										NOB = NOB+1
										VUSN = VUSN+1
									end
								end
								guiSetSize(VUSW[8], w/3.4, h/30*NOB+h/39, false)
							end
							--addEventHandler("onClientRender", root, DrawB)
						--end
					end
					--guiSetSize(VUSW[7], w/6.7, h/30*NOB+h/39, false)
					ATTI = nil
					VUSN = nil
				end
				NOB = 1
				DrawB()
				SCDSW()
				--addEventHandler("onClientGUIClick", root, guiclick)
				addEventHandler("onClientGUIScroll", root, updateRatio)
				addEventHandler("onClientGUIChanged", root, OCGCCET)
				guiRadioButtonSetSelected(VUB[10], true)
			--end
		--end
	--end
end

function SCDSW()
	gx, gy = guiGetSize(VUSW[1], false)
	VUSW[9] = guiCreateWindow(0,h/3.3+gy,w/11.4,h/2.8,"Vehicle Control",false)
		VUSBB[0] = guiCreateScrollBar(w/136.6,h/15.7,w/13.66,h/45.2,true,false,VUSW[9])
		VUB[53] = guiCreateLabel(w/30.4,h/25,w/9,h/51.2,"Hood",false,VUSW[9])
		VUSBB[1] = guiCreateScrollBar(w/136.6,h/8.4,w/13.66,h/45.2,true,false,VUSW[9])
		VUB[54] = guiCreateLabel(w/80,h/10.7,w/9,h/51.2,"Front Left Door",false,VUSW[9])
		VUSBB[2] = guiCreateScrollBar(w/136.6,h/5.9,w/13.66,h/45.2,true,false,VUSW[9])
		VUB[55] = guiCreateLabel(w/97,h/6.9,w/9,h/51.2,"Front Right Door",false,VUSW[9])
		VUSBB[3] = guiCreateScrollBar(w/136.6,h/4.6,w/13.66,h/45.2,true,false,VUSW[9])
		VUB[56] = guiCreateLabel(w/72,h/5.09,w/9,h/51.2,"Rear Left Door",false,VUSW[9])
		VUSBB[4] = guiCreateScrollBar(w/136.6,h/3.73,w/13.66,h/45.2,true,false,VUSW[9])
		VUB[57] = guiCreateLabel(w/91,h/4.06,w/9,h/51.2,"Rear Right Door",false,VUSW[9])
		VUSBB[5] = guiCreateScrollBar(w/136.6,h/3.16,w/13.66,h/45.2,true,false,VUSW[9])
		VUB[58] = guiCreateLabel(w/30.4,h/3.4,w/9,h/51.2,"Trunk",false,VUSW[9])
		Type[VUSBB[0]] = 0
		Type[VUSBB[1]] = 2
		Type[VUSBB[2]] = 3
		Type[VUSBB[3]] = 4
		Type[VUSBB[4]] = 5
		Type[VUSBB[5]] = 1
	for i=0, 58 do
		if VUB[i] then
			Carts[VUB[i]] = 0
			guiSetFont(VUB[i],"default-bold-small")
		end
		if VUSW[i] then
			Carts[VUSW[i]] = 0
			guiWindowSetSizable(VUSW[i], false)
			if i > 1 and i < 8 then
				guiSetVisible(VUSW[i], false)
			end
		end
	end
	gx, gy = nil, nil
end

function updateRatio()
	setVehicleDoorOpenRatio(sveh, Type[source], guiScrollBarGetScrollPosition(source)/100)
end

function JAILTIMEF()
	--outputDebugString("JAILTIMEF")
	if getElementData(player, "Stats") == 2 and not desc and thecop then
		cop = getPlayerFromName(thecop)
		triggerServerEvent("PIJ", resourceRoot, localPlayer, cop)
		unbindKey("enter_exit", "down", RAOA)
		jailed(player)
		thecop = nil
	elseif getElementData(player, "Stats") > 1 then
		if getElementData(player, "Stats") > 2 then
			toggleControl("next_weapon", false)
			toggleControl("previous_weapon", false)
			setPedWeaponSlot(player, 0)
			toggleControl("fire", true)
			toggleControl("jump", true)
			if not jonar and not desc then
				jailed(player)
			end
		end
		if not jTime then
			addEventHandler("onClientRender", root, jailTime)
			jTime = true
			triggerServerEvent("setJailData", resourceRoot,localPlayer, "BAIL", bail)
		else
			if SecsLeft > 0 then
				SecsLeft = SecsLeft-1
			end
			if SecsLeft <= 0 and MinsLeft > 0 then
				SecsLeft = 59
				MinsLeft = MinsLeft-1
			elseif MinsLeft <= 0 and SecsLeft <= 0 then
				bail = bail-25
				if bail < 0 then
					bail = 0
				end
			end
			if not isTimer(SecTimer) then
				SecTimer = setTimer(function() end, 10000, 1)
				if CoSecsLeft ~= SecsLeft then
					CoSecsLeft = SecsLeft
					triggerServerEvent("setJailData", resourceRoot,localPlayer, "SEC", SecsLeft)
				end
			end
			if not isTimer(MinTimer) then
				MinTimer = setTimer(function() end, 5000, 1)
				if CoMinsLeft ~= MinsLeft then
					CoMinsLeft = MinsLeft
					triggerServerEvent("setJailData", resourceRoot,localPlayer, "MIN", MinsLeft)
				end
			end
			if not isTimer(BailTimer) then
				BailTimer = setTimer(function() end, 5000, 1)
				if CoBail ~= bail then
					CoBail = bail
					triggerServerEvent("setJailData", resourceRoot,localPlayer, "BAIL", bail)
				end
			end
		end
	end
end

function jailTime()
	--outputDebugString("jailTime")
	--dxDrawText(mb1dxtext..''..bail..''..mb2dxtext, w, h/1.07, w/1.13, h/10, tocolor(255, 255, 0, 255), 1, "default", "right")
	if tonumber(plng) == tonumber(1) then
	   ffff = NewFont
	else
	   ffff = "sans"
	end
	if not bail then
	bail = 6000
	end
	if not MinsLeft then
	MinsLeft = 6
	end
	if not SecsLeft then
	SecsLeft = 0
	end
	if bail == 0 then 
		if not jte then
			exports["guimessages"]:outputClient(tlng[plng][15], 0, 255, 0)
			jte = true
			bindKey("group_control_back", "down", bailing)
		end	 
	end
	dxDrawFramedText(tlng[plng][26]..''..bail..''..tlng[plng][27], w, h/1.07, w/1.13, h/10, tocolor(0, 255, 188, 255), 1, ffff, "right")
	--dxDrawFramedText("Bribe Accept : % "..BribeAccep, w, (h/1.07)+13, w/1.13, h/10, tocolor(255, 255, 0, 255), 1, "sans", "right")
	if MinsLeft < 1 and SecsLeft <= 0 then
		if bail > 0 then
			if not jte then
				exports["guimessages"]:outputClient(tlng[plng][14], 0, 255, 0)
				jte = true
				bindKey("group_control_back", "down", bailing)
			end
			--dxDrawText(ebdxtext, w, h/1.1, w/1.13, h/10, tocolor(0, 255, 0, 255), 1, "default", "right")
			dxDrawFramedText(tlng[plng][14], w, h/1.1, w/1.13, h/10, tocolor(0, 255, 0, 255), 1, ffff, "right")
		else
			if not jte then
				exports["guimessages"]:outputClient(tlng[plng][15], 0, 255, 0)
				jte = true
				bindKey("group_control_back", "down", bailing)
			end
			--dxDrawText(edxtext, w, h/1.1, w/1.13, h/10, tocolor(0, 255, 0, 255), 1, "default", "right")
			dxDrawFramedText(tlng[plng][15], w, h/1.1, w/1.13, h/10, tocolor(0, 255, 0, 255), 1, ffff, "right")
		end
	else
		if jte then
			jte = nil
			unbindKey("group_control_back", "down", bailing)
		end
		if SecsLeft < 10 then
			--dxDrawText(jt1dxtext..''..MinsLeft..':0'..SecsLeft..''..jt2dxtext, w, h/1.1, w/1.13, h/10, tocolor(255, 255, 255, 255), 1, "default", "right")
			dxDrawFramedText(tlng[plng][28]..''..MinsLeft..':0'..SecsLeft..''..tlng[plng][29], w, h/1.1, w/1.13, h/10, tocolor(246, 80, 212, 255), 1, ffff, "right")
		else
			--dxDrawText(jt1dxtext..''..MinsLeft..':'..SecsLeft..''..jt2dxtext, w, h/1.1, w/1.13, h/10, tocolor(255, 255, 255, 255), 1, "default", "right")
			dxDrawFramedText(tlng[plng][28]..''..MinsLeft..':'..SecsLeft..''..tlng[plng][29], w, h/1.1, w/1.13, h/10, tocolor(246, 80, 212, 255), 1, ffff, "right")
		end
	end
end

function bailing()
	--outputDebugString("bailing")
	if  getElementData(player, "Money") >= bail or bail == 0 then
		toggleControl("next_weapon", true)
		toggleControl("previous_weapon", true)
		removeEventHandler("onClientRender", root, jailTime)
		unbindKey("group_control_back", "down", bailing)
		setElementData(player, "Money", getElementData(player,"Money")-bail)
		--setElementData(player, "Money", getPlayerMoney(player))
		triggerServerEvent("BAIL", resourceRoot, player, bail)
		jTime = nil
		bail = 0
		MinsLeft = 0
		SecsLeft = 0
		jte = nil
	else
		exports["guimessages"]:outputClient(tlng[plng][16], 255, 255, 0)
	end
end

addEvent("CPIJ", true)
function jailed()--jailer
	--outputDebugString("jailed")
	--if jailer == player then
		detachElements(el)
		removeEventHandler("onClientRender", root, PFC)
		jonar = true
		cop = nil
		showCursor(false)
		setControlState("sprint", false)
		setControlState("walk", false)
		setControlState("forwards", false)
		warped = nil
		freeze = nil
		freezed = nil
		away = nil
		setElementFrozen(player, true)
		setTimer(setElementFrozen, 1000, 1, player, false)
		destroyMjail ()
		if healT then
			exports["guimessages"]:outputClient(tlng[plng][54], 255, 255)
			killTimer(healT)
			healT = nil
			HTime = nil
			plusH = nil
			drugG = nil
			ddata = nil
			noD = setTimer(function()
				noD = nil
			end, 120000, 1)
		end
	--end
end
addEventHandler("CPIJ", localPlayer, jailed)

addEvent("TWPTJ", true)
function WPTJ(arga)
	if player ~= arga then
	   if sendT then
		   killTimer(sendT)
		   sendT = nil
	    end	
		prsnr = arga
		sendprsT = true
		sendT = setTimer(TSETJP, 60000, 1)
	end
	--[[outputDebugString("WPTJ")
	if cop == player then
		bindKey("group_control_back", "down", TSETJP)
		bindKey("radio_user_track_skip", "down", TSETJP)
	end]]
end
addEventHandler("TWPTJ", resourceRoot, WPTJ)

addEvent("UTWPTJ", true)
function UWPTJ()
	sendprsT = nil
	if sendT then
		killTimer(sendT)
		sendT = nil
	end
	--[[outputDebugString("UWPTJ")
	if cop == player then
		prsnr = false
		unbindKey("group_control_back", "down", TSETJP)
		unbindKey("radio_user_track_skip", "down", TSETJP)
	end]]
end
addEventHandler("UTWPTJ", root, UWPTJ) 

function TSETJP()
	--outputDebugString("TSETJP")
	sendT = nil
	--cop = player
	if getElementData(player, "Prisoners") > 0 then
		triggerServerEvent("SSPTJ",resourceRoot,player,prsnr,player)
		--outputChatBox("1- " ..getPlayerName(prsnr))
	end
	UWPTJ(player)
end


addEvent("SSiren", true)
function FSSiren()
	--outputDebugString("FSSiren")
	if not siren then
		siren = true
		setTimer(function()
				siren = nil
				removeEventHandler("onClientRender", root, SSV)
		end, 73000, 1)
		ibps = playSound("sounds/PSiren.mp3")
		addEventHandler("onClientRender", root, SSV)
	end
end
addEventHandler("SSiren", root, FSSiren)

function SSV()
	--outputDebugString("SSV")
	local sx, sy, sz = getElementPosition(player)
	if getElementInterior(player) == 200 and getElementDimension(player) == 200 then
	    setSoundVolume(ibps, 1)
	elseif sx > 1548 and sx < 1603 and sy > -1700 and sy < -1657 and sz > 1224 and sz < 1237 or sx > 214 and sx < 271 and sy > 59 and sy < 93 and sz > 1000 and sz < 1012 or sx > 2250 and sx < 2320 and sy > -165 and sy < -115 and sz > 1540 and sz < 1565 then
		setSoundVolume(ibps, 1)
	else
		dist = getDistanceBetweenPoints3D(1564.5, -1675.3, 55, sx, sy, sz)
		vol = 1-(dist/500)
		if vol < 0 then
			vol = 0
		end
		setSoundVolume(ibps, vol)
	end
end

addEvent("dbanim", true)
function Fdbanim(rbp)
	--outputDebugString("Fdbanim")
	therobber = player
	toggleAllControls(false,true,false)
	setTimer(toggleAllControls,5000,1,true,true,false)
	SetElementPosition(player,591.6,-1267.6,1286.3)
	setPedRotation(player,90)
	setPedAnimationN(player,"ped","DRIVE_BOAT_L",false,false,true,false)
	setTimer(dbaloop,300,30,player)
	setTimer(setPedAnimationN,10000,1,player)
end
addEventHandler("dbanim", root, Fdbanim)

addEvent("SSafes", true)
function FSSafes()
	therobber = player
	rb1 = createMarker(588.6, -1264.6, 1285.62, "cylinder", 1, 255, 0, 0, 128)
	rb2 = createMarker(584.7, -1264.6, 1285.62, "cylinder", 1, 255, 0, 0, 128)
	rb3 = createMarker(580.73, -1264.6, 1285.62, "cylinder", 1, 255, 0, 0, 128)
	rb4 = createMarker(576.8, -1264.6, 1285.62, "cylinder", 1, 255, 0, 0, 128)
	
	rb5 = createMarker(588.6, -1270.6, 1285.62, "cylinder", 1, 255, 0, 0, 128)
	rb6 = createMarker(584.7, -1270.6, 1285.62, "cylinder", 1, 255, 0, 0, 128)
	rb7 = createMarker(580.73, -1270.6, 1285.62, "cylinder", 1, 255, 0, 0, 128)
	rb8 = createMarker(576.8, -1270.6, 1285.62, "cylinder", 1, 255, 0, 0, 128)

	SetElementInterior(rb1, 1)
	SetElementInterior(rb2, 1)
	SetElementInterior(rb3, 1)
	SetElementInterior(rb4, 1)

	SetElementInterior(rb5, 1)
	SetElementInterior(rb6, 1)
	SetElementInterior(rb7, 1)
	SetElementInterior(rb8, 1)
end
addEventHandler("SSafes", root, FSSafes)

addEvent("SafesM", true)
function FSafesM(rbp, rbank1, rbank2, rbank3, rbank4, rbank5, rbank6, rbank7, rbank8)
	if rbp == player then
		--robber = player
		bbag = true
		if not mark then
			mark = math.random(1, 3)
			if mark == 1 then
				dpos = createMarker(2324.2, -3.8, 25.56, "cylinder", 2, 255, 0, 0, 255)
			elseif mark == 2 then
				dpos = createMarker(1297, 394, 18.55, "cylinder", 2, 255, 0, 0, 255)
			else
				dpos = createMarker(196, -232, .78, "cylinder", 2, 255, 0, 0, 255)
			end
			mblip = createBlipAttachedTo(dpos, 41)
		end
		if not rbank1 and not rb1 then
			rb1 = createMarker(588.6, -1264.6, 1285.62, "cylinder", 1, 255, 0, 0, 128)
			SetElementInterior(rb1, 1)
		end
		if not rbank2 and not rb2 then
			rb2 = createMarker(584.7, -1264.6, 1285.62, "cylinder", 1, 255, 0, 0, 128)
			SetElementInterior(rb2, 1)
		end
		if not rbank3 and not rb3 then
			rb3 = createMarker(580.73, -1264.6, 1285.62, "cylinder", 1, 255, 0, 0, 128)
			SetElementInterior(rb3, 1)
		end
		if not rbank4 and not rb4 then
			rb4 = createMarker(576.8, -1264.6, 1285.62, "cylinder", 1, 255, 0, 0, 128)
			SetElementInterior(rb4, 1)
		end

		if not rbank5 and not rb5 then
			rb5 = createMarker(588.6, -1270.6, 1285.62, "cylinder", 1, 255, 0, 0, 128)
			SetElementInterior(rb5, 1)
		end
		if not rbank6 and not rb6 then
			rb6 = createMarker(584.7, -1270.6, 1285.62, "cylinder", 1, 255, 0, 0, 128)
			SetElementInterior(rb6, 1)
		end
		if not rbank7 and not rb7 then
			rb7 = createMarker(580.73, -1270.6, 1285.62, "cylinder", 1, 255, 0, 0, 128)
			SetElementInterior(rb7, 1)
		end
		if not rbank8 and not rb8 then
			rb8 = createMarker(576.8, -1270.6, 1285.62, "cylinder", 1, 255, 0, 0, 128)
			SetElementInterior(rb8, 1)
		end
	end
	therobber = rbp
	if Mbag then
		destroyElement(Mbag)
		Mbag = nil
		bagm = nil
	end
end
addEventHandler("SafesM", root, FSafesM)

addEvent("BTBTTB", true)
function FBTBTTB(rbp)
	if not cmark and rbp == player then
		cmark = true
		Cbag = createMarker(611, -1258, 1298.2, "cylinder", 1, 255, 0, 0, 128)
		Cblip = createBlipAttachedTo(Cbag)
		SetElementInterior(Cbag, 1)
	end
	if Mbag then
		destroyElement(Mbag)
		Mbag = nil
		bagm = nil
	end
end
addEventHandler("BTBTTB", root, FBTBTTB)

addEvent("DropB", true)
function FDropB(x, y, gz)
	if Mbag then
		destroyElement(Mbag)
		Mbag = nil
		bagm = nil
	end
	Mbag = createColSphere(x, y, gz+1, 1)
	if thebag then setElementCollisionsEnabled(thebag, false) end
	therobber = nil
end
addEventHandler("DropB", root, FDropB)

function dbaloop(rbp)
	--outputDebugString("dbaloop")
	--SetElementPosition(rbp, 591.6, -1267.6, 1286.3)
	if right then
		setPedAnimationN(rbp, "ped", "DRIVE_BOAT_L", false, false, true)
		right = nil
	else
		setPedAnimationN(rbp, "ped", "DRIVE_BOAT_R", false, false, true)
		right = true
	end
end

addEvent("rbanim", true)
function Frbanim(rbp, rbb)
	--outputDebugString("Frbanim")
	if rbp == player then
		bbag = true
		toggleAllControls( false, true, false )
		setTimer(toggleAllControls, 11300, 1, true, true, false)
		if rbb == 1 then
			SetElementPosition(player, 588.6, -1265, 1286.3)
			destroyElement(rb1)
			rb1 = nil
		elseif rbb == 2 then
			SetElementPosition(player, 584.7, -1265, 1286.3)
			destroyElement(rb2)
			rb2 = nil
		elseif rbb == 3 then
			SetElementPosition(player, 580.73, -1265, 1286.3)
			destroyElement(rb3)
			rb3 = nil
		elseif rbb == 4 then
			SetElementPosition(player, 576.8, -1265, 1286.3)
			destroyElement(rb4)
			rb4 = nil
		elseif rbb == 5 then
			SetElementPosition(player, 588.6, -1270.2, 1286.3)
			destroyElement(rb5)
			rb5 = nil
		elseif rbb == 6 then
			SetElementPosition(player, 584.7, -1270.2, 1286.3)
			destroyElement(rb6)
			rb6 = nil
		elseif rbb == 7 then
			SetElementPosition(player, 580.73, -1270.2, 1286.3)
			destroyElement(rb7)
			rb7 = nil
		elseif rbb == 8 then
			SetElementPosition(player, 576.8, -1270.2, 1286.3)
			destroyElement(rb8)
			rb8 = nil
		end
		if rbb > 4 then
			setPedRotation(player, 180)
		else
			setPedRotation(player, 0)
		end
	end
	robbank = nil
	setPedAnimationN(rbp, "ROB_BANK", "CAT_Safe_Open", 0, false, false, false)
	setTimer(rbaloop, 1100, 1, rbp)
	setTimer(setPedAnimationN, 10600, 1, rbp, "ROB_BANK", "CAT_Safe_End", false, false, false, false)
	setTimer(setPedAnimationN, 11300, 1, rbp)
end
addEventHandler("rbanim", root, Frbanim)

function rbaloop(rbp)
	--outputDebugString("rbaloop")
	setTimer(setPedAnimationN, 1850, 4, rbp, "ROB_BANK", "CAT_Safe_Rob", 0, false, false)
end

addEvent("CROB", true)
function FCROB()
	--outputDebugString("FCROB")
	if rb1 then
		destroyElement(rb1)
		rb1 = nil
	end
	if rb2 then
		destroyElement(rb2)
		rb2 = nil
	end
	if rb3 then
		destroyElement(rb3)
		rb3 = nil
	end
	if rb4 then
		destroyElement(rb4)
		rb4 = nil
	end
	if rb5 then
		destroyElement(rb5)
		rb5 = nil
	end
	if rb6 then
		destroyElement(rb6)
		rb6 = nil
	end
	if rb7 then
		destroyElement(rb7)
		rb7 = nil
	end
	if rb8 then
		destroyElement(rb8)
		rb8 = nil
	end
	if mark then
		destroyElement(dpos)
		destroyElement(mblip)
		mark = nil
	end
	if cmark then
		destroyElement(Cbag)
		destroyElement(Cblip)
		cmark = nil
	end
end
addEventHandler("CROB", root, FCROB)

addEvent("CALITS", true)
function FCALITS(rp)
	if rp ~= player then
		engineLoadDFF("GW_c.lua", 0)
	end
end
addEventHandler("CALITS", root, FCALITS)

-------------------------------------------------------------------------

GUIEditor_Window = {}
GUIEditor_Button = {}
GUIEditor_Label = {}
GUIEditor_Image = {}
w, h = guiGetScreenSize()

wm1 = createMarker(296.3, -37.8, 1000.5, "corona", 2)
wm2 = createMarker(287.9, -109.1, 1000.5, "corona", 2)
wm3 = createMarker(218, 78, 1005, "corona", 2)
wm4 = createMarker(295.1, -79.7, 1000.5, "corona", 2)


cwm1 = createMarker(296.3, -37.8, 1000.5, "cylinder", 2, 255, 255, 0, 128)
cwm2 = createMarker(287.9, -109.1, 1000.5, "cylinder", 2, 255, 255, 0, 128)
cwm4 = createMarker(295.1, -79.7, 1000.5, "cylinder", 2, 255, 255, 0, 128)
SetElementInterior(cwm1, 1)
SetElementInterior(cwm2, 6)
SetElementInterior(cwm4, 4)
SetElementDimension(cwm4, 3)
createBlip(2546, 2085.8, 15.7, 6,2,255,0,0,255,0,400) -- wm4

function CGUI(v)
	--outputDebugString("CGUI")
	FWIND[v] = true
	--triggerEvent ( "WeaponShop:onOpenWeaponsShop", v )
	msell = v
end

function OCPH(HNAPU)
	if getElementID(HNAPU) and getElementModel(HNAPU) == 1273 then
		if getPlayerTeam(player) == getTeamFromName("Police") then
			arga = "PLVL"
		else
			arga = "GLVL"
		end
		if getElementData(player,arga) < 6 and getElementData(player,"MCH") ~= tonumber(getElementID(HNAPU)) then
			outputChatBox("You need to be Level 6 at least!",255,255,0)
		elseif not GUIEditor.window[1] and getElementData(player,"Stats") < 2 and getElementData(player,"Stats") > -1 then
			setTimer(function()
				setControlState("forwards",false)
				setControlState("backwards",false)
				setControlState("left",false)
				setControlState("right",false)
				setControlState("fire",false)
				setControlState("aim_weapon",false)
			end,150,1)
			for k,v in pairs(getElementsByType("player")) do
				if FWIND[v] then
					Cwindow(v)
				end
			end
			if fpis then
				killTimer(fpis)
				fpis = nil
			end
			protect = nil
			detachElements(player)
			HideBank()
			if Window_kid then
				destroyElement(Window_kid)
				Window_kid = nil
			end
			removeEventHandler("onClientGUIChanged", resourceRoot, OCGCCET) -- edit nu9aif
			msell = nil
			money = nil
			
			HNAP = HNAPU
			if not isPedInVehicle(player) then
			HNAW()
			end
		end
	elseif getElementModel(HNAPU) == 2041 and getElementData(HNAPU,"WPU") and DPUT[HNAPU] then
		playSoundFrontEnd(6)
		killTimer(DPUT[HNAPU])
		DPUT[HNAPU] = nil
		triggerServerEvent("SVP",resourceRoot,player,getElementData(HNAPU,"WPU"))
		setElementData(HNAPU,"WPU",nil,false)
		destroyElement(HNAPU)
	end
end
addEventHandler("onClientPlayerPickupHit",player,OCPH)

function OCPL()
	if GUIEditor.window[1] then
		destroyElement(GUIEditor.window[1])
		GUIEditor.window[1] = nil
		txtc = nil
	end
	if GUIEditor.window[2] then
		destroyElement(GUIEditor.window[2])
		GUIEditor.window[2] = nil
	end
	if GUIEditor.window[3] then
		destroyElement(GUIEditor.window[3])
		GUIEditor.window[3] = nil
	end
	showCursor(false)
	HNAP = nil
	HSPC = nil
	PMS = nil
end
addEventHandler("onClientPlayerPickupLeave",player,OCPL)


function output (Text,r,p,g) 
     local rr,gg,bb = r or 255,p or 255,g or 255
     exports["guimessages"]:outputClient("#FF9600[Bank System] "..string.format("#%.2X%.2X%.2X", rr,gg,bb)..""..Text,255,0,0)
end

function CGUIOMH(hitp)
	--outputDebugString("CGUIOMH")
	if hitp == player then
		if source == knho1 or source == knho2 or source == knho3 then-- or source == knho4
			if getElementData(hitp, "Stats") < 2 and getPlayerTeam(hitp) ~= getTeamFromName("Police") then
				kiddPs()
				showCursor(true)
				protect = true
			elseif getElementData(hitp, "Stats") < 2 and getPlayerTeam(hitp) == getTeamFromName("Police") then
				if source == knho1 then
					breach1 = true
				elseif source == knho2 then
					breach2 = true
				elseif source == knho3 then
					breach3 = true
				--elseif source == knho4 then
					--breach4 = true
				end
			end
			if getPlayerTeam(hitp) ~= getTeamFromName("Police") then
				if source == knho1 then
					knh = 1
					if getElementData(hitp, "Stats") < 2 then
						for k,v in pairs(getElementsByType("player")) do
							if getElementData(v, "KidH") == 1 then
								row[v] = guiGridListAddRow(Grid_playersname)
								guiGridListSetItemText(Grid_playersname, row[v], column, getPlayerName(v), false, false)
							end
						end
					end
				elseif source == knho2 then
					knh = 2
					if getElementData(hitp, "Stats") < 2 then
						for k,v in pairs(getElementsByType("player")) do
							if getElementData(v, "KidH") == 2 then
								row[v] = guiGridListAddRow(Grid_playersname)
								guiGridListSetItemText(Grid_playersname, row[v], column, getPlayerName(v), false, false)
							end
						end
					end
				elseif source == knho3 then
					knh = 3
					if getElementData(hitp, "Stats") < 2 then
						for k,v in pairs(getElementsByType("player")) do
							if getElementData(v, "KidH") == 3 then
								row[v] = guiGridListAddRow(Grid_playersname)
								guiGridListSetItemText(Grid_playersname, row[v], column, getPlayerName(v), false, false)
							end
						end
					end
				end
			end
			if getElementData(hitp, "Stats") > 3 then
				triggerServerEvent("Kidnapped", resourceRoot, player, cop, knh)
			end
		elseif source == hmj and Team and Team == getTeamFromName("No Team") then
			job = 1
			if job ~= getElementData(hitp, "Job") then
				protect = true
				showCursor(true)
				JobWind("Hitman Job", "Are you sure you want to be Hitman?")
			end
		elseif isPickpocketMark[source] and Team and Team == getTeamFromName("No Team") then
			job = 2
			if job ~= getElementData(hitp, "Job") then
				protect = true
				showCursor(true)
				JobWind("Pickpocket Job", "Are you sure you want to be Pickpocket?")
			end
		elseif source == mcja or source == mcjb or source == mcjc then
			job = 9
			if job ~= getElementData(hitp, "Job") then
				protect = true
				showCursor(true)
				JobWind("Mechanic Job", "Are you sure you want to be Mechanic?")
			end 
		elseif source == bk1 or source == bk2 or source == atm1 or source == atm2 or source == atm3 or source == atm5 or source == atm6 or source == atm7 or source == atm8 or source == atm9 or source == atm10 or getElementData(source,"BankMarker") or isMarkersBank[source] then
		    local isHaveAcc = getElementData(player,"isHaveAccBank")
			if not isHaveAcc then output ("You do not have a bank account",255,0,0) return end
			if getElementData(player, "Stats") < 2 and not isPedInVehicle(localPlayer) then
				if FWIND[msell] then
					destroyElement(FWIND[msell])
					FWIND[msell] = nil 
					cash = 0
					packL = nil
					packB = 0
					if JobW then
						destroyElement(JobW)
						JobW = nil
					end
					ics = nil
					job = nil
					msell = nil
				end
				protect = true
				GUICBW()
				addEventHandler("onClientGUIChanged", resourceRoot, OCGCCET) -- edit nu9aif
				setControlState("fire", false)
				setControlState("forwards", false)
				setControlState("backwards", false)
				setControlState("left", false)
				setControlState("right", false)
			end
		elseif MarkerJail[source] and getElementData(hitp, "Stats") == 2 then
			if isPedInVehicle(player) then
				triggerServerEvent("ReVehicleJail", resourceRoot, player)
			else
				RTjail()
			end
			destroyMjail ()
		elseif source == EHM then
			bindKey("enter_exit","down",TTF)
		end
		--[[dim = getElementDimension(player)
		SetElementDimension(pzp1, dim)
		SetElementDimension(pzp2, dim)
		SetElementDimension(pzp3, dim)

		SetElementDimension(bsp1, dim)
		SetElementDimension(bsp2, dim)

		SetElementDimension(cbp1, dim)
		SetElementDimension(cbp2, dim)]]

		robbank = nil
		if source == dpos then
			local dacc
			for k,v in pairs(getElementsWithinColShape(OPWC,"player")) do
				if getPlayerTeam(v) == getTeamFromName("Police") then
					x,y,z = getElementPosition(player)
					vx,vy,vz = getElementPosition(v)
					dist = getDistanceBetweenPoints3D(x,y,z,vx,vy,vz)
					if dist < 200 then
						dacc = true
						break
					end
				end
			end
			if dacc then
				--dacc = nil
				outputChatBox("You need to lose the cops first!", 255, 255, 0)
			else
				triggerServerEvent("OMH", resourceRoot, player)
				FCROB()
			end
		elseif source == rb1 then
			robbank = 1
			--guiSetVisible(animationWindow,false)
			showCursor(false)
		elseif source == rb2 then
			robbank = 2
			--guiSetVisible(animationWindow,false)
			showCursor(false)
		elseif source == rb3 then
			robbank = 3
			--guiSetVisible(animationWindow,false)
			showCursor(false)
		elseif source == rb4 then
			robbank = 4
			--guiSetVisible(animationWindow,false)
			showCursor(false)
		elseif source == rb5 then
			robbank = 5
			--guiSetVisible(animationWindow,false)
			showCursor(false)
		elseif source == rb6 then
			robbank = 6
			--guiSetVisible(animationWindow,false)
			showCursor(false)
		elseif source == rb7 then
			robbank = 7
			--guiSetVisible(animationWindow,false)
			showCursor(false)
		elseif source == rb8 then
			robbank = 8
			--guiSetVisible(animationWindow,false)
			showCursor(false)
		elseif source == Cbag then
			destroyElement(Cbag)
			destroyElement(Cblip)
			Cbag = nil
			setElementData(player,"Money",getElementData(player,"Money")+6000)
			triggerServerEvent("Rbag", resourceRoot, player)
		elseif not protect then
			if source == wm1 or source == wm2 or source == wm4 and getPlayerTeam(hitp) ~= getTeamFromName("Police") or source == wm3  and getPlayerTeam(player) == getTeamFromName("Police") then
				if getElementData(player, "Stats") < 2 then
					protect = true
					if source == drus then
						SDSW(player)
                        OCGCCET()
					    showCursor(true)
					    addEventHandler("onClientGUIChanged", resourceRoot, OCGCCET) -- edit nu9aif
					else
						CGUI(player)
					end
					setControlState("forwards", false)
				end
			elseif source == pzr1 or source == pzr2 or source == pzr3 then
				if getElementData(player, "Stats") < 2 then
					protect = true
					ResN = "Well Stacked Pizza Co."
					GUICB(player)
					GUICPZ(player)
					showCursor(true)
					setControlState("forwards", false)
					toggleControl("fire", false)
					toggleControl("forwards", false)
					toggleControl("backwards", false)
					toggleControl("left", false)
					toggleControl("right", false)
				end
			elseif source == bsr1 or source == bsr2 then
				if getElementData(player, "Stats") < 2 then
					protect = true
					ResN = "Burger Shot"
					GUICB(player)
					GUICBS(player)
					showCursor(true)
					setControlState("forwards", false)
					toggleControl("fire", false)
					toggleControl("forwards", false)
					toggleControl("backwards", false)
					toggleControl("left", false)
					toggleControl("right", false)
				end
			elseif source == cbr1 or source == cbr2 then
				if getElementData(player, "Stats") < 2 then
					protect = true
					ResN = "Cluckin' Bell"
					GUICB(player)
					GUICCB(player)
					showCursor(true)
					setControlState("forwards", false)
					toggleControl("fire", false)
					toggleControl("forwards", false)
					toggleControl("backwards", false)
					toggleControl("left", false)
					toggleControl("right", false)
				end
			end
		end 
	end  
end
addEventHandler("onClientMarkerHit", root, CGUIOMH)

function CPCTB(arga,argb)
	--local next = next
	local argb = 0
	if not table.empty(getElementsWithinColShape(OPWC,"player")) then--#getElementsWithinColShape(OPWC,"player") > 0
		for k,v in pairs(getElementsWithinColShape(OPWC,"player")) do--getElementsByType("player")
			if isElementWithinMarker(v,arga) and getPlayerTeam(v) == getTeamFromName("Police") and getElementHealth(v) > 0 then
				--outputChatBox(getPlayerName(v))
				argb = argb+1
			end
		end
	end
	return argb
end


function JobWind(wtext, ltext) 
	if getElementData(player, "Job") > 5 and getElementData(player, "Job") < 9 then
		atext = "!!!WARNING!!!:                                You will lose all your food!"
	elseif getElementData(player, "Job") > 4 then
		atext = "!!!WARNING!!!:                                You will lose all your drugs pack!"
	elseif getElementData(player, "Job") > 3 then
		atext = "!!!WARNING!!!:                                You will lose all your guns pack!"
	elseif getElementData(player, "Job") > 2 then
		atext = "!!!WARNING!!!:                                You will lose all your kidnapped players!"
	else
		atext = ""
	end
	JobW = guiCreateWindow(w/2.6,h/1.7,w/3.1,h/5.2,wtext,false)
	guiWindowSetSizable(JobW,false)
	accJ = guiCreateButton(w/57,h/7.6,w/7.5,h/20,"Yes",false,JobW)
	rejJ = guiCreateButton(w/6,h/7.6,w/7.5,h/20,"No",false,JobW)
	GUIEditor_Label[1] = guiCreateLabel(w/72,h/24,w/3.48,h/18,ltext,false,JobW)
	GUIEditor_Label[2] = guiCreateLabel(w/72,h/14.6,w/3.48,h/18,atext,false,JobW)
	guiLabelSetColor(GUIEditor_Label[2],255, 0, 0)
	guiLabelSetHorizontalAlign(GUIEditor_Label[2],"center",true)
end
 
function BIF(rch)
	for k,v in pairs(getElementsByType("player")) do
		if getElementData(v, "KidH") == rch then
			triggerServerEvent("freeH", resourceRoot, player, v, rch)
		end
	end
	breach = nil
	exports["guimessages"]:outputClient("successfully breached in", 0, 255, 0)
end

addEvent("ResqRew", true)
function FResqRew(rchr, hostage)
	--outputChatBox('winnnnnnnnn')
	--outputChatBox(rchr)
	--outputChatBox(rch)
	if rchr == rch then
		--[[if breach1 then
			bknho = bknho1
		elseif breach2 then
			bknho = bknho2
		elseif breach3 then
			bknho = bknho3
		end]]
		--outputChatBox("$$$$$$$$$$$", 0, 255, 0)
		setElementData(player, "Money", getElementData(player, "Money")+1000)--math.ceil(4000/bknho)
		--setElementData(player, "Scores", getElementData(player, "Scores")+1)
		givePlayerScore (player,1)
		exports["guimessages"]:outputClient(tlng[plng][35]..' '..getPlayerName(hostage)..' '..tlng[plng][36]..'1000', 0, 255, 0)
		if not getElementData(player, "protect") then
			setElementData(player, "protect", true)
		elseif ptt then
			tl, tc, tt = getTimerDetails(ptt)
			killTimer(ptt)
			ptt = setTimer(function() ptt = nil setElementData(source, "protect", nil) end, (tl+1440000), 1)
		end 
		CER(30,"PXP","PLVL")
		vT = {}
		vT[player] = {"+"..tostring(30).." Hostage Rescue"}
		FOPEC(vT)
	end
end
addEventHandler("ResqRew", root, FResqRew)

function CER(argc,argd,arge)
	arga = getElementData(player,argd)+math.ceil(argc)
	argb = getElementData(player,arge)*200
	if arga > argb then
		arga = arga-argb
		setElementData(player,arge,getElementData(player,arge)+1)
	end
	setElementData(player,argd,arga)
end

function CGUIOML(leftp)
	--outputDebugString("CGUIOML")
	if leftp == player then
		if source == wm1 or source == wm2 or source == wm4 or source == wm3 and getPlayerTeam(player) == getTeamFromName("Police") then
			protect = nil
			if fpis then
				killTimer(fpis)
				fpis = nil
			end
			if isElement(FWIND[player]) then
				detachElements(player)
				destroyElement(FWIND[player])
				--triggerEvent ( "WeaponShop:onCloseWeaponsShop", player )
				FWIND[player] = nil
				showCursor(false)
			end

			if JobW then
				destroyElement(JobW)
				JobW = nil
			end
			ics = nil
			job = nil
			showCursor(false)
			removeEventHandler("onClientGUIChanged", resourceRoot, OCGCCET) -- edit nu9aif
		elseif source == pzr1 or source == pzr2 or source == pzr3 or source == bsr1 or source == bsr2 or source == cbr1 or source == cbr2 then
			protect = nil
			toggleControl("fire", true)
			toggleControl("forwards", true)
			toggleControl("backwards", true)
			toggleControl("left", true)
			toggleControl("right", true)
			if fpis then
				killTimer(fpis)
				fpis = nil
			end
			if FWIND[player] then
				detachElements(player)
				destroyElement(FWIND[player])
				FWIND[player] = nil
			end
			cash = 0
			packL = nil
			packB = 0
			if JobW then
				destroyElement(JobW)
				JobW = nil
			end
			ics = nil
			job = nil
			showCursor(false)
		elseif source == knho1 or source == knho2 or source == knho3 then
			protect = nil
			if fpis then
				killTimer(fpis)
				fpis = nil
			end
			if Window_kid then
				detachElements(player)
				destroyElement(Window_kid)
				Window_kid = nil
			end
			ics = nil
			job = nil
			if JobW then
				destroyElement(JobW)
				JobW = nil
			end
			ics = nil
			job = nil
			showCursor(false)
			knh = 0
		elseif source == hmj or source == mcja or source == mcjb or source == mcjc or isPickpocketMark[source] then
			protect = nil
			if JobW then
				destroyElement(JobW)
				JobW = nil
			end
			ics = nil
			job = nil
			showCursor(false)
		--[[elseif source == wwe1 or source == wwe2 or source == wwe3 or source == wwe4 or source == wwe5 or source == wwe6 or source == wwe7 or source == wwe8 or source == wwe9 or source == wwe10 or source == wwe11 or source == wwe12 or source == wwe13 or source == wwe14 or source == wwe15 or source == wwe16 or source == wwe17 or source == wwe18 or source == wwe19 or source == wwe20 then
			protect = false
			if Window_wwe then
				destroyElement(Window_wwe)
				Window_wwe = false
			end
			showCursor(false)]]--@--
		--[[elseif source == Bet1mark or source == Bet2mark then
			if Window_bet then
				destroyElement(Window_bet)
				showCursor(false)
			end]]--
		elseif source == bk1 or source == bk2 or source == atm1 or source == atm2 or source == atm3 or source == atm5 or source == atm6 or source == atm7 or source == atm8 or source == atm9 or source == atm10 or getElementData(source,"BankMarker") or isMarkersBank[source] then
			protect = nil
			if fpis then
				killTimer(fpis)
				fpis = nil
			end
			HideBank()
			removeEventHandler("onClientGUIChanged", resourceRoot, OCGCCET) -- edit nu9aif
			showCursor(false)
		elseif source == EHM then
			unbindKey("enter_exit","down",TTF)
		else
			robbank = nil
		end
	--[[elseif isElement(leftp) and getElementType(leftp) == "player" then
		if source == jiconr then
			if jicon[leftp] then
				destroyElement(jicon[leftp])
				jicon[leftp] = nil
			end
			if FWIND[leftp] then
				Cwindow(leftp)
			end
		end]]
	end
	--outputChatBox(getElementType(leftp))
end
addEventHandler("onClientMarkerLeave", root, CGUIOML)

function TTF()
	if TAT then
		removeEventHandler("onClientPlayerQuit",getPlayerFromName(TAT),TTF)
		TAT = nil
	end
	--[[if TTFT and not key then
		killTimer(TTFT)
		TTFT = false
	end]]
	if EHM then
		triggerServerEvent("FTHT",resourceRoot,player)
		setElementPosition(player,OTx,OTy,OTz)
		destroyElement(EHM)
		EHM = nil
		fadeCamera(false,0)
		setTimer(fadeCamera,50,1,true,1)
		row,column,itm = nil,nil,nil
	end
end

addEvent("CKD", true)
function FCKD(cop, hitp)
	if cop == player then
		if hitp then
			 exports["guimessages"]:outputClient(tlng[plng][38], 0, 255, 0)
		end
		if knhoB1 then
			destroyElement(knhoB1)
			knhoB1 = nil
		end
		if knhoB2 then
			destroyElement(knhoB2)
			knhoB2 = nil
		end
		if knhoB3 then
			destroyElement(knhoB3)
			knhoB3 = nil
		end
	end
	if hitp and hitp == player then
		jailed(player)
		if not Rransom then
		addEventHandler("onClientRender", root, ransom)
		Rransom = true 
		exports["guimessages"]:outputClient(tlng[plng][40], 255, 255, 0)
		end
		if cop then
			exports["guimessages"]:outputClient(tlng[plng][39], 255, 0, 0)
		end
		
		setTimer(function()
				bindKey("group_control_back", "down", FpayR, player)
		end, 3050, 1)
		toggleControl("fire", false)
		toggleControl("aim_weapon", false)
		toggleControl("next_weapon", false)
		toggleControl("previous_weapon", false)
		toggleControl("enter_exit", false)
		setPedWeaponSlot(player, 0)
	end
end
addEventHandler("CKD", root, FCKD)

function ransom(kidn)
	--dxDrawText(kdrtext, w, h/1.07, w/1.02, h/10, tocolor(255, 255, 0, 255), 1, "default", "right")
	--dxDrawText(prstext, w, h/1.1, w/1.01, h/10, tocolor(0, 255, 0, 255), 1, "default", "right")
	dxDrawFramedText(tlng[plng][41], w, h/1.07, w/1.02, h/10, tocolor(255, 255, 0, 255), 1, "default", "right")
	dxDrawFramedText(tlng[plng][40], w, h/1.1, w/1.01, h/10, tocolor(0, 255, 0, 255), 1, "default", "right")
end

addEvent("payR", true)
function FpayR(hosta, resc, arg)
	--outputDebugString("FpayR")
	if hosta == player or arg == player then
		if hosta == "group_control_back" then
			hosta = arg
		end
		if getElementData(player, "Money") >= CashFdia then
			if resc == "down" then
				resc = nil
			end
			unbindKey("group_control_back", "down", FpayR, player)
			cop = nil
			if thecop then
				cop = getPlayerFromName(thecop)
			end
			triggerServerEvent("freeK", resourceRoot, player, cop, resc)
			setElementData(player, "protect", true)
			toggleControl("fire", true)
			toggleControl("aim_weapon", true)
			toggleControl("next_weapon", true)
			toggleControl("previous_weapon", true)
			toggleControl("enter_exit", true)
		else
			exports["guimessages"]:outputClient(tlng[plng][25], 255, 255, 0)
		end
	end
end
addEventHandler("payR", root, FpayR)

addEvent("freeP", true)
function FfreeP()
	toggleControl("fire", true)
	toggleControl("enter_exit", true)
	toggleControl("next_weapon", true)
	toggleControl("previous_weapon", true)
	if Rransom then
	removeEventHandler("onClientRender", root, ransom)
	Rransom = false
	end
	--setElementData(kidd, "Money", getPlayerMoney(kidd))

end
addEventHandler("freeP", root, FfreeP)

function PRCET()
	--outputDebugString("PRCET")
	sile = guiGetText(Silenced_Ammo_E)
	colt = guiGetText(Colt_Ammo_E)
	deag = guiGetText(Deagle_Ammo_E)
	shot = guiGetText(Shotgun_Ammo_E)
	sawn = guiGetText(Sawn_Ammo_E)
	spaz = guiGetText(Spaz_Ammo_E)
	tec = guiGetText(Tec_Ammo_E)
	uzi = guiGetText(Uzi_Ammo_E)
	mp5 = guiGetText(MP5_Ammo_E)
	ak = guiGetText(AK_Ammo_E)
	m4 = guiGetText(M4_Ammo_E)
	rife = guiGetText(Rifel_Ammo_E)
	snip = guiGetText(Sniper_Ammo_E)
	para = guiGetText(Para_Ammo_E)
	gren = 0
	tear = 0
	GL = 0
	if msell == player then
		gren = guiGetText(Grenade_Ammo_E)
		tear = guiGetText(Gas_Ammo_E)
		GL = guiGetText(GL_Ammo_E)
	end
end

function OCGCCET()
	--outputDebugString("OCGCCET")
	money = getElementData(player, "Money")
	if not dcheck then
		if source == VUB[37] then
			Carts[VUSW[6]] = 10000
			CACS(VUB[0])
			playSoundFrontEnd(38)
			setVehiclePlateText(sveh, guiGetText(source))
		else
			for i=16, 27 do
				if source == VUB[i] then
					dcheck = true
					if tonumber(guiGetText(source)) == nil or tonumber(guiGetText(source)) < 0 then
						guiSetText(source, "0")
					else 
						if tonumber(guiGetText(source)) > 255 then
							guiSetText(source, "255")
						else
							guiSetText(source, math.ceil(tonumber(guiGetText(source))))
						end
					end
					dcheck = nil
					if guiRadioButtonGetSelected(VUB[12]) then
						Carts[VUB[12]] = 1000
						if VHN then
							for k,v in pairs(getAttachedElements(sveh)) do
								if getElementType(v) == "marker" then
									setMarkerColor(v, tonumber(guiGetText(VUB[17])), tonumber(guiGetText(VUB[18])), tonumber(guiGetText(VUB[19])))
								end
							end
						end
					elseif guiRadioButtonGetSelected(VUB[11]) then
						Carts[VUB[11]] = 1000
						setVehicleHeadLightColor(sveh, tonumber(guiGetText(VUB[17])), tonumber(guiGetText(VUB[18])), tonumber(guiGetText(VUB[19])))
					else
						Carts[VUB[10]] = 1000
						setVehicleColor(sveh, tonumber(guiGetText(VUB[17])), tonumber(guiGetText(VUB[18])), tonumber(guiGetText(VUB[19])), tonumber(guiGetText(VUB[20])), tonumber(guiGetText(VUB[21])), tonumber(guiGetText(VUB[22])), tonumber(guiGetText(VUB[23])), tonumber(guiGetText(VUB[24])), tonumber(guiGetText(VUB[25])), tonumber(guiGetText(VUB[26])), tonumber(guiGetText(VUB[27])), tonumber(guiGetText(VUB[28])))
					end
					Carts[VUSW[3]] = 0
					for i=10, 12 do
						Carts[VUSW[3]] = Carts[VUSW[3]]+Carts[VUB[i]]
					end
					CACS(VUB[0])
				end
			end
		end
	end
	if Silenced_Ammo_E then
		PRCET()
		--outputChatBox("process1")
		if not process then
		--outputChatBox("process2")
			process = true
			if source == Silenced_Ammo_E then
				if tonumber(sile) == nil or tonumber(sile) < 0 then
					guiSetText(source, "0")
				else
					guiSetText(Colt_Ammo_E, "0")
					guiSetText(Deagle_Ammo_E, "0")
					AML = tonumber(sile)+getPedTotalAmmo(player, 2)
					AML = 1500-AML
					if AML < 0 then
						if getPedTotalAmmo(player, 2) > 1499 then
							guiSetText(source, "0")
						else
							guiSetText(source, tostring(1500-getPedTotalAmmo(player, 2)))
						end
					else
						guiSetText(source, math.ceil(sile))
					end
				end
			elseif source == Colt_Ammo_E then
				if tonumber(colt) == nil or tonumber(colt) < 0 then
					guiSetText(source, "0")
				else
					guiSetText(Silenced_Ammo_E, "0")
					guiSetText(Deagle_Ammo_E, "0")
					AML = tonumber(colt)+getPedTotalAmmo(player, 2)
					AML = 1500-AML
					if AML < 0 then
						if getPedTotalAmmo(player, 2) > 1499 then
							guiSetText(source, "0")
						else
							guiSetText(source, tostring(1500-getPedTotalAmmo(player, 2)))
						end
					else
						guiSetText(source, math.ceil(colt))
					end
				end
			elseif source == Deagle_Ammo_E then
				if tonumber(deag) == nil or tonumber(deag) < 0 then
					guiSetText(source, "0")
				else
					guiSetText(Silenced_Ammo_E, "0")
					guiSetText(Colt_Ammo_E, "0")
					AML = tonumber(deag)+getPedTotalAmmo(player, 2)
					AML = 1500-AML
					if AML < 0 then
						if getPedTotalAmmo(player, 2) > 1499 then
							guiSetText(source, "0")
						else
							guiSetText(source, tostring(1500-getPedTotalAmmo(player, 2)))
						end
					else
						guiSetText(source, math.ceil(deag))
					end
				end
			elseif source == Shotgun_Ammo_E then
				if tonumber(shot) == nil or tonumber(shot) < 0 then
					guiSetText(source, "0")
				else
					guiSetText(Sawn_Ammo_E, "0")
					guiSetText(Spaz_Ammo_E, "0")
					AML = tonumber(shot)+getPedTotalAmmo(player, 3)
					AML = 1000-AML
					if AML < 0 then
						if getPedTotalAmmo(player, 3) > 999 then
							guiSetText(source, "0")
						else
							guiSetText(source, tostring(1000-getPedTotalAmmo(player, 3)))
						end
					else
						guiSetText(source, math.ceil(shot))
					end
				end
			elseif source == Sawn_Ammo_E then
				if tonumber(sawn) == nil or tonumber(sawn) < 0 then
					guiSetText(source, "0")
				else
					guiSetText(Shotgun_Ammo_E, "0")
					guiSetText(Spaz_Ammo_E, "0")
					AML = tonumber(sawn)+getPedTotalAmmo(player, 3)
					AML = 1000-AML
					if AML < 0 then
						if getPedTotalAmmo(player, 3) > 999 then
							guiSetText(source, "0")
						else
							guiSetText(source, tostring(1000-getPedTotalAmmo(player, 3)))
						end
					else
						guiSetText(source, math.ceil(sawn))
					end
				end
			elseif source == Spaz_Ammo_E then
				if tonumber(spaz) == nil or tonumber(spaz) < 0 then
					guiSetText(source, "0")
				else
					guiSetText(Shotgun_Ammo_E, "0")
					guiSetText(Sawn_Ammo_E, "0")
					AML = tonumber(spaz)+getPedTotalAmmo(player, 3)
					AML = 1000-AML
					if AML < 0 then
						if getPedTotalAmmo(player, 3) > 999 then
							guiSetText(source, "0")
						else
							guiSetText(source, tostring(1000-getPedTotalAmmo(player, 3)))
						end
					else
						guiSetText(source, math.ceil(spaz))
					end
				end
			elseif source == Tec_Ammo_E then
				if tonumber(tec) == nil or tonumber(tec) < 0 then
					guiSetText(source, "0")
				else
					guiSetText(Uzi_Ammo_E, "0")
					guiSetText(MP5_Ammo_E, "0")
					AML = tonumber(tec)+getPedTotalAmmo(player, 4)
					AML = 2000-AML
					if AML < 0 then
						if getPedTotalAmmo(player, 4) > 1999 then
							guiSetText(source, "0")
						else
							guiSetText(source, tostring(2000-getPedTotalAmmo(player, 4)))
						end
					else
						guiSetText(source, math.ceil(tec))
					end
				end
			elseif source == Uzi_Ammo_E then
				if tonumber(uzi) == nil or tonumber(uzi) < 0 then
					guiSetText(source, "0")
				else
					guiSetText(Tec_Ammo_E, "0")
					guiSetText(MP5_Ammo_E, "0")
					AML = tonumber(uzi)+getPedTotalAmmo(player, 4)
					AML = 2000-AML
					if AML < 0 then
						if getPedTotalAmmo(player, 4) > 1999 then
							guiSetText(source, "0")
						else
							guiSetText(source, tostring(2000-getPedTotalAmmo(player, 4)))
						end
					else
						guiSetText(source, math.ceil(uzi))
					end
				end
			elseif source == MP5_Ammo_E then
				if tonumber(mp5) == nil or tonumber(mp5) < 0 then
					guiSetText(source, "0")
				else
					guiSetText(Tec_Ammo_E, "0")
					guiSetText(Uzi_Ammo_E, "0")
					AML = tonumber(mp5)+getPedTotalAmmo(player, 4)
					AML = 2000-AML
					if AML < 0 then
						if getPedTotalAmmo(player, 4) > 1999 then
							guiSetText(source, "0")
						else
							guiSetText(source, tostring(2000-getPedTotalAmmo(player, 4)))
						end
					else
						guiSetText(source, math.ceil(mp5))
					end
				end
			elseif source == AK_Ammo_E then
				if tonumber(ak) == nil or tonumber(ak) < 0 then
					guiSetText(source, "0")
				else
					guiSetText(M4_Ammo_E, "0")
					AML = tonumber(ak)+getPedTotalAmmo(player, 5)
					AML = 3000-AML
					if AML < 0 then
						if getPedTotalAmmo(player, 5) > 2999 then
							guiSetText(source, "0")
						else
							guiSetText(source, tostring(3000-getPedTotalAmmo(player, 5)))
						end
					else
						guiSetText(source, math.ceil(ak))
					end
				end
			elseif source == M4_Ammo_E then
				if tonumber(m4) == nil or tonumber(m4) < 0 then
					guiSetText(source, "0")
				else
					guiSetText(AK_Ammo_E, "0")
					AML = tonumber(m4)+getPedTotalAmmo(player, 5)
					AML = 3000-AML
					if AML < 0 then
						if getPedTotalAmmo(player, 5) > 2999 then
							guiSetText(source, "0")
						else
							guiSetText(source, tostring(3000-getPedTotalAmmo(player, 5)))
						end
					else
						guiSetText(source, math.ceil(m4))
					end
				end
			elseif source == Rifel_Ammo_E then
				if tonumber(rife) == nil or tonumber(rife) < 0 then
					guiSetText(source, "0")
				else
					guiSetText(Sniper_Ammo_E, "0")
					AML = tonumber(rife)+getPedTotalAmmo(player, 6)
					AML = 1000-AML
					if AML < 0 then
						if getPedTotalAmmo(player, 6) > 999 then
							guiSetText(source, "0")
						else
							guiSetText(source, tostring(1000-getPedTotalAmmo(player, 6)))
						end
					else
						guiSetText(source, math.ceil(rife))
					end
				end
			elseif source == Sniper_Ammo_E then
				if tonumber(snip) == nil or tonumber(snip) < 0 then
					guiSetText(source, "0")
				else
					guiSetText(Rifel_Ammo_E, "0")
					AML = tonumber(snip)+getPedTotalAmmo(player, 6)
					AML = 1000-AML
					if AML < 0 then
						if getPedTotalAmmo(player, 6) > 999 then
							guiSetText(source, "0")
						else
							guiSetText(source, tostring(1000-getPedTotalAmmo(player, 6)))
						end
					else
						guiSetText(source, math.ceil(snip))
					end
				end
			elseif source == Grenade_Ammo_E then
				if tonumber(gren) == nil or tonumber(gren) < 0 then
					guiSetText(source, "0")
				else
					guiSetText(Gas_Ammo_E, "0")
					AML = tonumber(gren)+getPedTotalAmmo(player, 8)
					AML = 4-AML
					if AML < 0 then
						if getPedTotalAmmo(player, 8) > 3 then
							guiSetText(source, "0")
						else
							guiSetText(source, tostring(4-getPedTotalAmmo(player, 8)))
						end
					else
						guiSetText(source, math.ceil(gren))
					end
				end
			elseif source == Gas_Ammo_E then
				if tonumber(tear) == nil or tonumber(tear) < 0 then
					guiSetText(source, "0")
				else
					guiSetText(Grenade_Ammo_E, "0")
					AML = tonumber(tear)+getPedTotalAmmo(player, 8)
					AML = 4-AML
					if AML < 0 then
						if getPedTotalAmmo(player, 8) > 3 then
							guiSetText(source, "0")
						else
							guiSetText(source, tostring(4-getPedTotalAmmo(player, 8)))
						end
					else
						guiSetText(source, math.ceil(tear))
					end
				end
			elseif source == Para_Ammo_E then
				if tonumber(para) == nil or tonumber(para) < 0 or getPedTotalAmmo(player, 11) > 0 then
					guiSetText(source, "0")
				else
					guiSetText(source, "1")
				end
			elseif source == GL_Ammo_E then
				--outputChatBox("GL1")
				if tonumber(GL) == nil or tonumber(GL) < 0 then
					guiSetText(source, "0")
					--outputChatBox("GL2")
				else
					--outputChatBox("GL3")
					AML = tonumber(GL)+getElementData(player, "GLA")
					AML = 2-AML
					if AML < 0 then
						--outputChatBox("GL4")
						if getElementData(player, "GLA") > 1 then
							--outputChatBox("GL5")
							guiSetText(source, "0")
						else
							--outputChatBox("GL6")
							guiSetText(source, tostring(2-getElementData(player, "GLA")))
						end
					else
						--outputChatBox("GL7")
						guiSetText(source, math.ceil(GL))
					end
				end
			end
		end
		AML = nil
		PRCET()

		sile = tonumber(sile)
		colt = tonumber(colt)
		deag = tonumber(deag)
		shot = tonumber(shot)
		sawn = tonumber(sawn)
		spaz = tonumber(spaz)
		tec = tonumber(tec)
		uzi = tonumber(uzi)
		mp5 = tonumber(mp5)
		ak = tonumber(ak)
		m4 = tonumber(m4)
		rife = tonumber(rife)
		snip = tonumber(snip)
		gren = tonumber(gren)
		tear = tonumber(tear)
		para = tonumber(para)
		GL = tonumber(GL)

		totalA = sile+colt+deag+shot+sawn+spaz+tec+uzi+mp5+ak+m4+rife+snip+gren+tear+para+GL
		if source and getElementType(source) == "gui-edit" then
			totalB = totalA-tonumber(guiGetText(source))
		end
		if msell ~= player and totalA > getElementData(msell, "DLP") then
			--if source == Silenced_Ammo_E or source == Colt_Ammo_E or source == Deagle_Ammo_E or source == Shotgun_Ammo_E or source == Sawn_Ammo_E or source == Spaz_Ammo_E or source == Tec_Ammo_E or source == Uzi_Ammo_E or source == MP5_Ammo_E or source == AK_Ammo_E or source == M4_Ammo_E or source == Rifel_Ammo_E or source == Sniper_Ammo_E or source == Grenade_Ammo_E or source == Gas_Ammo_E or source == Para_Ammo_E or source == GL_Ammo_E then
			--totalA = totalB+(getElementData(msell, "DLP")-totalB)
			guiSetText(source, getElementData(msell, "DLP")-totalB)
			--end
		end
		--totalC = totalB

		Asile = 8*sile
		Acolt = 12*colt
		Adeag = 23*deag
		Ashot = 18*shot
		Asawn = 21*sawn
		Aspaz = 21*spaz
		Atec = 13*tec
		Auzi = 15*uzi
		Amp5 = 17*mp5
		Aak = 19*ak
		Am4 = 19*m4
		Arife = 21*rife
		Asnip = 30*snip
		Agren = 1000*gren
		Atear = 500*tear
		Apara = 100*para
		AGL = 2000*GL

		totalM = Asile+Acolt+Adeag+Ashot+Asawn+Aspaz+Atec+Auzi+Amp5+Aak+Am4+Arife+Asnip+Agren+Atear+Apara+AGL
		guiSetText(total_L, 'Total: $'..totalM)
		--outputChatBox('total'..totalM)
		--outputChatBox('money'..tostring(money))
		if money < totalM then
			guiLabelSetColor(total_L, 255, 0, 0)
		elseif money/2 <= totalM then
			guiLabelSetColor(total_L, 255, 255, 0)
		elseif money >= totalM then
			guiLabelSetColor(total_L, 0, 255, 0)
		end
	elseif DS_SE then
		if not process then
			process = true
			if source == DS_SE then
				if tonumber(guiGetText(DS_SE)) == nil or tonumber(guiGetText(DS_SE)) < 0 then
						guiSetText(source, "0")
				else
					AML = tonumber(guiGetText(DS_SE))+getElementData(player, "SDG")
					AML = 200-AML
					if AML < 0 then
						--[[if getElementData(player, "SDG") > 199 then
							guiSetText(source, "0")
						else]]
							guiSetText(source, tostring(200-getElementData(player, "SDG")))
						--end
					else
						guiSetText(source, math.ceil(tonumber(guiGetText(DS_SE))))
					end
				end
			elseif source == DS_EE then
				if tonumber(guiGetText(DS_EE)) == nil or tonumber(guiGetText(DS_EE)) < 0 then
						guiSetText(source, "0")
				else
					AML = tonumber(guiGetText(DS_EE))+getElementData(player, "EDG")
					AML = 100-AML
					if AML < 0 then
						--[[if getElementData(player, "EDG") > 99 then
							guiSetText(source, "0")
						else]]
							guiSetText(source, tostring(100-getElementData(player, "EDG")))
						--end
					else
						guiSetText(source, math.ceil(tonumber(guiGetText(DS_EE))))
					end
				end
			elseif source == DS_ME then
				if tonumber(guiGetText(DS_ME)) == nil or tonumber(guiGetText(DS_ME)) < 0 then
						guiSetText(source, "0")
				else
					AML = tonumber(guiGetText(DS_ME))+getElementData(player, "MDG")
					AML = 200-AML
					if AML < 0 then
						--[[if getElementData(player, "MDG") > 199 then
							guiSetText(source, "0")
						else]]
							guiSetText(source, tostring(200-getElementData(player, "MDG")))
						--end
					else
						guiSetText(source, math.ceil(tonumber(guiGetText(DS_ME))))
					end
				end
			end
		end

		totalA = tonumber(guiGetText(DS_SE))+tonumber(guiGetText(DS_EE))+tonumber(guiGetText(DS_ME))
		if getElementType(source) == "gui-edit" then
			totalB = totalA-tonumber(guiGetText(source))
		end
		if msell ~= player and totalA > getElementData(msell, "DLP") then
			guiSetText(source, getElementData(msell, "DLP")-totalB)
		end

		totalM = (tonumber(guiGetText(DS_SE))*3)+(tonumber(guiGetText(DS_EE))*5)+(tonumber(guiGetText(DS_ME))*4)
		guiSetText(total_L, 'Total: $'..totalM)
		if money < totalM then
			guiLabelSetColor(total_L, 255, 0, 0)
		elseif money/2 <= totalM then
			guiLabelSetColor(total_L, 255, 255, 0)
		elseif money >= totalM then
			guiLabelSetColor(total_L, 0, 255, 0)
		end
	end
	--outputChatBox("process3")
	process = nil
	--money = false
end

function CACS(btn)
	Cart = 0
	for i=0, 16 do
		if VUW[i] then
			Cart = Cart+Carts[VUW[i]]
		end
		if VUSW[i] then
			Cart = Cart+Carts[VUSW[i]]
		end
	end
	guiSetText(btn, "Buy "..ctx..""..Cart)
end

function CVS()
	--removeEventHandler("onClientRender", root, DrawB)
	MZC(1045, -1022.75, 16, 360)
	fadeCamera(false, 1)
	unbindKey("a", "both", RotVSO)
	unbindKey("d", "both", RotVSO)
	if RotAG then
		killTimer(RotAG)
		RotAG = nil
	end
	if RotAG then
		killTimer(RotAG)
		RotAG = nil
	end
	addEventHandler("onClientRender", root, lowervss)
	setTimer(function()
		for k,v in pairs(getAttachedElements(sveh)) do
			setElementDimension(v, 0)
		end
		setCameraTarget(player)
		detachElements(veh, Ishop[1])
		setElementDimension(player, 0)
		setElementDimension(sveh, 0)
		fadeCamera(true, 1)
		toggleAllControls(true, true, false)
		setVehicleEngineState(sveh, true)
		setVehicleOverrideLights(sveh, 0)
		setRadioChannel(rchn)
		setElementPosition(sveh, 1041, -1012, 32)
		setElementRotation(sveh, 0, 0, 180)
		showPlayerHudComponent("radar", true)
		setGarageOpen(10, true)
		setVehicleDamageProof(sveh, false)
		sveh = nil
		rchn = nil
		setTimer(function()
			if nn[1] then
				for i=1,4 do
					if nn[i] then
						destroyElement(nn[i])
						nn[i] = nil
					end
				end
			end
			for i=0, 36 do
				VCLR[i] = nil
			end
		end, 50, 1)
	end, 1000, 1)
	--removeEventHandler("onClientGUIClick", root, guiclick)
	removeEventHandler("onClientGUIScroll", root, updateRatio)
	removeEventHandler("onClientGUIChanged", root, OCGCCET)
	--CVUW()
	for i=0, 58 do
		if VUSB[i] then
			VUBS[VUSB[i]] = nil
			VUSB[i] = nil
			
			if VUSRB[i] then
				destroyElement(VUSB[i])
				VUBS[VUSRB[i]] = nil
				VUSRB[i] = nil
			end
			NORB[VUW[i]] = nil
			destroyElement(VUW[i])
			VUW[i] = nil
		end
		if VUB[i] then
			Carts[VUB[i]] = nil
			VCLR[VUB[i]] = nil
			VUB[i] = nil
		end
		if VUSBB[i] then
			VUSBB[i] = nil
		end
		if VUSW[i] then
			Carts[VUSW[i]] = nil
			destroyElement(VUSW[i])
			VUSW[i] = nil
		end
	end
	--destroyElement(sveh)
	GVUS = nil
	Cart = nil
	NOB = nil
	LBP = nil
	Neon = nil
	VHN = nil
	showCursor(false)
end

function lowervss()
	vssvol = getSoundVolume(vss)-.02
	if vssvol < 0.02 then
		removeEventHandler("onClientRender", root, lowervss)
		stopSound(vss)
		vss = nil
		vssvol = nil
		setWorldSoundEnabled(0,0,true)
		setWorldSoundEnabled(0,29,true)
		setWorldSoundEnabled(0,30,true)
	else
		setSoundVolume(vss, vssvol)
	end
end

function RVU()
	for k,v in pairs(getAttachedElements(sveh)) do
		if getElementType(v) == "marker" then
			setMarkerColor(v, VCLR[31],VCLR[32],VCLR[33])
		end
	end
	for k,v in pairs(getVehicleUpgrades(sveh)) do
		removeVehicleUpgrade(sveh, v)
	end
	for k,v in pairs(CVU) do
		addVehicleUpgrade(sveh, v)
	end
	CVU = nil
	if GVNC then
		setVehicleNitroCount(sveh, GVNC)
		GVNC = nil
	end
	setVehiclePaintjob(sveh, VCLR[1])
	setVehicleHeadLightColor(sveh,VCLR[2],VCLR[3],VCLR[4])
	setVehicleColor(sveh,VCLR[5],VCLR[6],VCLR[7],VCLR[8],VCLR[9],VCLR[10],VCLR[11],VCLR[12],VCLR[13],VCLR[14],VCLR[15],VCLR[16])
	setVehiclePlateText(sveh,VCLR[0])
	gx, gy = getVehicleVariant(sveh)
	if VCLR[29] ~= gx or VCLR[30] ~= gy then
		triggerServerEvent("EqVar", resourceRoot,player, VCLR[29],VCLR[30])
	end
	gx, gy = nil, nil
	for i=0, 36 do
		VCLR[i] = nil
	end
end

-----------------------------------------------------------------------------------------------

function SDSW(v)
	--[[
	if guiGetVisible(animationWindow) then
		guiSetVisible(animationWindow,false)
		showCursor(false)
	end
	--]]
	FWIND[v] = guiCreateWindow(w/2.8,h/1.5,w/3.54,h/3.5,"Drugs",false)
	--guiWindowSetMovable(FWIND[v],false)
	guiWindowSetSizable(FWIND[v],false)

	DS_EX = guiCreateButton(w/6.95,h/5,w/16,h/12,"Exit",false,FWIND[v])
	DS_B = guiCreateButton(w/4.75,h/5,w/16,h/12,"Buy",false,FWIND[v])
	DS_SE = guiCreateEdit(w/88.8888,h/9.375,w/13.793,h/30,"0",false,FWIND[v])
	DS_EE = guiCreateEdit(w/5,h/9.375,w/13.793,h/30,"0",false,FWIND[v])
	DS_ME = guiCreateEdit(w/9.4118,h/9.375,w/13.793,h/30,"0",false,FWIND[v])
	DS_S = guiCreateLabel(w/88.8888,h/24,w/13.793,h/40,"small",false,FWIND[v])
	guiLabelSetHorizontalAlign(DS_S,"center")

	DS_E = guiCreateLabel(w/5,h/24,w/13.793,h/40,"extra",false,FWIND[v])
	guiLabelSetHorizontalAlign(DS_E,"center")

	DS_M = guiCreateLabel(w/9.5,h/24,w/13.793,h/40,"medium",false,FWIND[v])
	guiLabelSetHorizontalAlign(DS_M,"center")

	DS_TL = guiCreateLabel(w/88.8888,h/14,w/13.793,h/40,"$3",false,FWIND[v])
	guiLabelSetHorizontalAlign(DS_TL,"center")

	DS_FVL = guiCreateLabel(w/5,h/14,w/13.793,h/40,"$5",false,FWIND[v])
	guiLabelSetHorizontalAlign(DS_FVL,"center")

	DS_FL = guiCreateLabel(w/9.5,h/14,w/13.793,h/40,"$4",false,FWIND[v])
	guiLabelSetHorizontalAlign(DS_FL,"center")

	total_L = guiCreateLabel(w/88.8888,h/6.3,w/3.9,h/20,"Total: $0",false,FWIND[v])
	guiLabelSetHorizontalAlign(total_L, "center")

	if v == player then
		fpis = setTimer(function()
			fpis = nil
			x, y, z = getElementPosition(player)
			SetElementPosition(el, x, y, z)
			attachElements(player, el)
		end, 500, 1)
		if getElementData(v, "Job") == 5 then
			DS_SP = guiCreateButton(w/88.8888,h/5,w/16,h/12,"1500gm $3000",false,FWIND[v])
			DS_MP = guiCreateButton(w/13,h/5,w/16,h/12,"3000gm $5800",false,FWIND[v])
		elseif getPlayerTeam(player) == getTeamFromName("No Team") then
			ddj = guiCreateButton(w/88.8888,h/5,w/7.8,h/12,"Drugs Dealer Job",false,FWIND[v])
		end
	end
	msell = v
end

-------------------------------------------------------------------------------------------------


function OCGUIC()
	--outputDebugString("OCGUIC")
	HP = getElementHealth(player)
	money = getElementData(player, "Money")
	if source == buy_B then
	 if getPlayerPing (player) < 800  then
	  if not isCursorShowing () then
		if money >= totalM then
			if totalM > 0 then
				if sile+colt+deag > 0 then
					triggerServerEvent("Pistols", resourceRoot, player, msell, sile, colt, deag)
				end
				if shot+sawn+spaz > 0 then
					triggerServerEvent("ShotGuns", resourceRoot, player, msell, shot, sawn, spaz)
				end
				if tec+uzi+mp5 > 0 then
					triggerServerEvent("MPistols", resourceRoot, player, msell, tec, uzi, mp5)
				end
				if ak+m4 > 0 then
					triggerServerEvent("MGuns", resourceRoot, player, msell, ak, m4)
				end
				if rife+snip > 0 then
					triggerServerEvent("Snipers", resourceRoot, player, msell, rife, snip)
				end
				if gren+tear > 0 then
					triggerServerEvent("Grenades", resourceRoot, player, msell, gren, tear)
				end
				--[[if para > 0 then
					triggerServerEvent("Para", resourceRoot, player, msell, para)--missing
				end]]
				setElementData(player, "GLA", getElementData(player, "GLA")+GL)
				setElementData(player, "Money", money-totalM)
				if msell ~= player then
					if getElementData(player, "WantLvl") < 2 or getElementData(msell, "WantLvl") < 2 then
						for k,v in pairs(getElementsWithinColShape(OPWC,"player")) do
							if getPlayerTeam(v) == getTeamFromName("Police") then
								vx, vy, vz = getElementPosition(v)
								--if getElementData(player, "WantLvl") < 2 then
									x, y, z = getElementPosition(player)
									--vx, vy, vz = getElementPosition(v)
									dist = getDistanceBetweenPoints3D(x, y, z, vx, vy, vz)
									if dist < 30 then
										Wlvl = 2
										break
									else
										x, y, z = getElementPosition(msell)
										dist = getDistanceBetweenPoints3D(x, y, z, vx, vy, vz)
										if dist < 30 then
											Wlvl = 2
											break
										end
									end
								--end
								--if getElementData(msell, "WantLvl") < 2 then
									--x, y, z = getElementPosition(msell)
									--vx, vy, vz = getElementPosition(v)
									--dist = getDistanceBetweenPoints3D(x, y, z, vx, vy, vz)
									--if dist < 30 then
										--Wlvl = 2
									--end
								--end
							end
						end
						if Wlvl then
							setElementData(player, "WantLvl", Wlvl)
						end
						triggerServerEvent("GPC",resourceRoot,player,msell,totalM,totalA,Wlvl)
						--triggerServerEvent("Cust",resourceRoot,player,msell)
					end
				end
				if fpis then
					killTimer(fpis)
					fpis = nil
				end
				protect = nil
				showCursor(false)
				removeEventHandler("onClientGUIChanged", resourceRoot, OCGCCET) -- edit nu9aif
				detachElements(player)
				destroyElement(FWIND[msell])
				FWIND[msell] = nil
				Silenced_Ammo_E = nil
				Grenade_Ammo_E = nil
				Gas_Ammo_E = nil
				GL_Ammo_E = nil
				Wlvl = nil
				if JobW then
					destroyElement(JobW)
					JobW = nil
				end
				ics = nil
				job = nil
				msell = nil
			end
		else
			exports["guimessages"]:outputClient(tlng[plng][25], 255, 0, 0)
		end
		end
		else
			exports["guimessages"]:outputClient("You Ping is hight +800", 255, 0, 0)
	  end
	elseif source == armor_B then
		if money >= 200 then
			triggerServerEvent("GArmor", resourceRoot, player, msell)
			setElementData(player, "Money", money-200)
			cpa = 100
		else
			exports["guimessages"]:outputClient(tlng[plng][25], 255, 0, 0)
		end
	elseif source == SPack then
		if money >= 8000 then
			if getElementData(player, "DLP") > 1000 then
				exports["guimessages"]:outputClient(tlng[plng][42], 255, 255, 0)
			else
				setElementData(player, "DLP", getElementData(player, "DLP")+500)
				setElementData(player, "Money", money-8000)
				--setElementData(player, "Scores", getElementData(player, "Scores")+1)
				givePlayerScore (player,1)
			end
		else
			exports["guimessages"]:outputClient(tlng[plng][25], 255, 255, 0)
		end
	elseif source == MPack then
		if money >= 15000 then
			if getElementData(player, "DLP") > 500 then
				exports["guimessages"]:outputClient(tlng[plng][42], 255, 255, 0)
			else
				setElementData(player, "DLP", getElementData(player, "DLP")+1000)
				setElementData(player, "Money", money-15000)
				--setElementData(player, "Scores", getElementData(player, "Scores")+2)
				givePlayerScore (player,2)
			end
		else
			exports["guimessages"]:outputClient(tlng[plng][25], 255, 255, 0)
		end
	elseif source == LPack then
		if money >= 21000 then
			if getElementData(player, "DLP") > 0 then
				exports["guimessages"]:outputClient(tlng[plng][42], 255, 255, 0)
			else
				setElementData(player, "DLP", 1500)
				setElementData(player, "Money", money-21000)
				--setElementData(player, "Scores", getElementData(player, "Scores")+3)
				givePlayerScore (player,3)
			end
		else
			exports["guimessages"]:outputClient(tlng[plng][25], 255, 255, 0)
		end
	elseif source == DS_B then
		if money >= totalM and totalM > 0 then
			setElementData(player, "SDG", getElementData(player, "SDG")+guiGetText(DS_SE))
			setElementData(player, "EDG", getElementData(player, "EDG")+guiGetText(DS_EE))
			setElementData(player, "MDG", getElementData(player, "MDG")+guiGetText(DS_ME))
			setElementData(player, "Money", money-totalM)
			if getElementData(player, "WantLvl") < 2 or getElementData(msell, "WantLvl") < 2 then
				for k,v in pairs(getElementsWithinColShape(OPWC,"player")) do
					if getPlayerTeam(v) == getTeamFromName("Police") then
						vx, vy, vz = getElementPosition(v)
						--if getElementData(player, "WantLvl") < 2 then
							x, y, z = getElementPosition(player)
							--vx, vy, vz = getElementPosition(v)
							dist = getDistanceBetweenPoints3D(x, y, z, vx, vy, vz)
							if dist < 30 then
								Wlvl = 2
								break
							else
								x, y, z = getElementPosition(msell)
								dist = getDistanceBetweenPoints3D(x, y, z, vx, vy, vz)
								if dist < 30 then
									Wlvl = 2
									break
								end
							end
						--end
						--if getElementData(msell, "WantLvl") < 2 then
							--[[x, y, z = getElementPosition(msell)
							vx, vy, vz = getElementPosition(v)
							dist = getDistanceBetweenPoints3D(x, y, z, vx, vy, vz)
							if dist < 30 then
								Wlvl = 2
							end]]
						--end
					end
				end
				if Wlvl then
					setElementData(player, "WantLvl", Wlvl)
				end
			end
			if msell ~= player then
				if cash > 0 and packB > 0 then
					triggerServerEvent("GPC",resourceRoot,player,msell,cash,packB)
				end
				triggerServerEvent("Cust",resourceRoot,player,msell)
		    end
			if fpis then
				killTimer(fpis)
				fpis = nil
			end
			protect = nil
			showCursor(false)
			removeEventHandler("onClientGUIChanged", resourceRoot, OCGCCET) -- edit nu9aif
			detachElements(player)
			destroyElement(FWIND[msell])
			FWIND[msell] = nil
			DS_SE = nil
			Wlvl = nil
			if JobW then
				destroyElement(JobW)
				JobW = nil
			end
			ics = nil
			job = nil
			msell = nil
		else
			exports["guimessages"]:outputClient(tlng[plng][25], 255, 0, 0)
		end
	elseif source == DS_SP then
		if money >= 3000 then
			if getElementData(player, "DLP") > 1500 then
				exports["guimessages"]:outputClient(tlng[plng][43], 255, 255, 0)
			else
				setElementData(player, "DLP", getElementData(player, "DLP")+1500)
				setElementData(player, "Money", money-3000)
				--setElementData(player, "Scores", getElementData(player, "Scores")+1)
				givePlayerScore (player,1)
			end
		else
			exports["guimessages"]:outputClient(tlng[plng][25], 255, 255, 0)
		end
	elseif source == DS_MP then
		if money >= 5800 then
			if getElementData(player, "DLP") > 0 then
				exports["guimessages"]:outputClient(tlng[plng][43], 255, 255, 0)
			else
				setElementData(player, "DLP", 3000)
				setElementData(player, "Money", money-5800)
				--setElementData(player, "Scores", getElementData(player, "Scores")+2)
				givePlayerScore (player,2)
			end
		else
			exports["guimessages"]:outputClient(tlng[plng][25], 255, 255, 0)
		end
	elseif source == exit_B or source == DS_EX then
		protect = nil
		if msell ~= player then
			triggerServerEvent("Cust",resourceRoot,player,msell)
		end
		if fpis then
			killTimer(fpis)
			fpis = nil
		end
		showCursor(false)
		removeEventHandler("onClientGUIChanged", resourceRoot, OCGCCET) -- edit nu9aif
		detachElements(player)
		destroyElement(FWIND[msell])
		FWIND[msell] = nil
		Silenced_Ammo_E = nil
		Grenade_Ammo_E = nil
		Gas_Ammo_E = nil
		GL_Ammo_E = nil
		DS_SE = nil
		if JobW then
			destroyElement(JobW)
			JobW = nil
		end
		ics = nil
		job = nil
		msell = nil
	elseif source == BL or source == BM or source == BB or source == BH then
		--[[if not packL and msell ~= player then
			packL = getElementData(msell, "DLP")
			cash = 0
			packB = 0
		end]]
		if source == BL and money >= 10 and packL > 0 then
			setElementHealth(player, HP+20)
			cph = getElementHealth(player)
			money = money-10
			if msell ~= player then
				cash = cash+10
				packB = packB+1
				packL = packL-1
			end
		elseif source == BM and money >= 25 and packL > 0 then
			setElementHealth(player, HP+50)
			cph = getElementHealth(player)
			money = money-25
			if msell ~= player then
				cash = cash+25
				packB = packB+1
				packL = packL-1
			end
		elseif source == BB and money >= 50 and packL > 0 then
			setElementHealth(player, HP+100)
			cph = getElementHealth(player)
			money = money-50
			if msell ~= player then
				cash = cash+50
				packB = packB+1
				packL = packL-1
			end
		elseif source == BH and money >= 40 and packL > 0 then
			setElementHealth(player, HP+80)
			cph = getElementHealth(player)
			money = money-40
			if msell ~= player then
				cash = cash+40
				packB = packB+1
				packL = packL-1
			end
		elseif packL < 1 then
			exports["guimessages"]:outputClient(tlng[plng][44], 255, 255, 0)
		else
			exports["guimessages"]:outputClient(tlng[plng][25], 255, 255, 0)
		end
		setElementData(player, "Money", money)
	elseif source == BP then
		if money >= 1500 then
			if getElementData(player, "DLP") > 0 then
				exports["guimessages"]:outputClient(tlng[plng][45], 255, 255, 0)
			else
				setElementData(player, "DLP", 200)
				setElementData(player, "Money", money-1500)
				--setElementData(player, "Scores", getElementData(player, "Scores")+1)
				givePlayerScore (player,1)
			end
		else
			exports["guimessages"]:outputClient(tlng[plng][25], 255, 255, 0)
		end
	elseif source == BE then
		protect = nil
		toggleControl("fire", true)
		toggleControl("forwards", true)
		toggleControl("backwards", true)
		toggleControl("left", true)
		toggleControl("right", true)
		if fpis then
			killTimer(fpis)
			fpis = nil
		end
		if FWIND[msell] then
			detachElements(player)
			destroyElement(FWIND[msell])
			FWIND[msell] = nil
		end
		if msell ~= player then
			if cash > 0 and packB > 0 then
			    triggerServerEvent("GPC",resourceRoot,player,msell,cash,packB) -- nu9aif
			end
			triggerServerEvent("Cust",resourceRoot,player,msell)
		end
		cash = 0
		packL = nil
		packB = 0
		if JobW then
			destroyElement(JobW)
			JobW = nil
		end
		ics = nil
		job = nil
		showCursor(false)
	elseif source == rpeng then
		if getPedOccupiedVehicle(player) then
			if getVehicleOccupant(getPedOccupiedVehicle(player)) == player then
				if money < 350 then
					exports["guimessages"]:outputClient(tlng[plng][25],255,255,0)
				else
					triggerServerEvent("GPC",resourceRoot,player,msell,350,0)
					--triggerServerEvent("Cust",resourceRoot,player,msell)
					setElementHealth(getPedOccupiedVehicle(player),1000)
					setElementData(player,"Money",money-350)
					showCursor(false)
					destroyElement(FWIND[msell])
					FWIND[msell] = nil
					msell = nil
				end
			end
		end
	elseif source == fullf then
		if getPedOccupiedVehicle(player) then
			if getVehicleOccupant(getPedOccupiedVehicle(player)) == player then
				if money < 500 then
					exports["guimessages"]:outputClient(tlng[plng][25],255,255,0)
				else
					triggerServerEvent("GPC",resourceRoot,player,msell,500,0)
					--triggerServerEvent("Cust",resourceRoot,player,msell)
					fixVehicle(getPedOccupiedVehicle(player))
					setElementData(player,"Money",money-500)
					showCursor(false)
					destroyElement(FWIND[msell])
					FWIND[msell] = nil
					msell = nil
				end
			end
		end
	elseif source == cmech then
		triggerServerEvent("Cust",resourceRoot,player,msell)
		showCursor(false)
		destroyElement(FWIND[msell])
		FWIND[msell] = nil
		msell = nil
	elseif source == button_buy then
		thero, thecol = guiGridListGetSelectedItem(sellers_list)
		--sellname = guiGridListGetItemText(sellers_list, thero, sellr)
		msell = getPlayerFromName(guiGridListGetItemText(sellers_list, thero, sellr))
		if msell then
			if not getElementData(msell, "DL") then
				showCursor(false)
				buyWind(msell)
				destroyElement(SWIND)
				SWIND = nil
			else
				exports["guimessages"]:outputClient("there is someone currently buying from him!", 255, 255, 255)
			end
		end
	elseif source == Button_pay then
		therow, thecolumn = guiGridListGetSelectedItem(Grid_playersname)
		if therow > -1 then
			if getElementData(player, "Money") >= CashFdia then
				hostage = guiGridListGetItemText(Grid_playersname, therow, column)
				hostage = getPlayerFromName(hostage)
				if hostage then
					triggerServerEvent("freeH", resourceRoot, player, hostage)
					setElementData(player, "protect", true)
				end
			else
				exports["guimessages"]:outputClient(tlng[plng][25], 255, 255, 0)
			end
		else
			exports["guimessages"]:outputClient(tlng[plng][46], 255, 255, 0)
		end
	elseif source == button_exit then
		protect = nil
		destroyElement(SWIND)
		SWIND = nil
		showCursor(false)
	elseif source == Button_kexit then
		if fpis then
			killTimer(fpis)
			fpis = nil
		end
		protect = nil
		detachElements(player)
		destroyElement(Window_kid)
		Window_kid = nil
		showCursor(false)
	elseif source == knj then
		job = 3
		if job ~= getElementData(player, "Job") then
			ics = true
			JobWind("Kidnapper Job", "Are you sure you want to be Kidnapper?")
		end
	elseif source == adj then
		job = 4
		if job ~= getElementData(player, "Job") then
			ics = true
			JobWind("Arms Dealer Job", "Are you sure you want to be Arms Dealer?")
		end
	elseif source == ddj then
		job = 5
		if job ~= getElementData(player, "Job") then
			ics = true
			JobWind("Drugs Dealer Job", "Are you sure you want to be Drugs Dealer?")
		end
	elseif source == pdj then
		job = 6
		if job ~= getElementData(player, "Job") then
			ics = true
			JobWind("Pizza Delivery Job", "Are you sure you want to be Pizza Delivery?")
		end
	elseif source == bdj then
		job = 7
		if job ~= getElementData(player, "Job") then
			ics = true
			JobWind("Burger Delivery Job", "Are you sure you want to be Burger Delivery?")
		end
	elseif source == cdj then
		job = 8
		if job ~= getElementData(player, "Job") then
			ics = true
			JobWind("Chicken Delivery Job", "Are you sure you want to be Chicken Delivery?")
		end
	elseif source == accJ then
		if dad then
			dad = nil
			setElementData(player, "SDG", 0)
			setElementData(player, "MDG", 0)
			setElementData(player, "EDG", 0)
			if me then
				doSp()
			end
			setElementData ( player, "Offering", nil )
			setElementData ( player, "dealerPack", nil )
			setElementData ( player, "activeDealer", nil )
			destroyElement(JobW)
		else
			if job < 9 and job > 5 then
				toggleControl("fire", true)
				toggleControl("forwards", true)
				toggleControl("backwards", true)
				toggleControl("left", true)
				toggleControl("right", true)
			end
			setElementData(player, "Job", job)
			if getElementData(player, "Job") > 8 then
				setElementData(player, "DLP", 1)
			else
				setElementData(player, "DLP", 0)
			end
			destroyElement(JobW)
			if me then
				CamAndSkin("enter")
			end
			JobW = nil
			ics = nil
			job = nil
		end
		for k,v in pairs(getElementsByType("player")) do
			if FWIND[v] then
				Cwindow(v)
			end
		end
		if fpis then
			killTimer(fpis)
			fpis = nil
		end
		protect = nil
		detachElements(player)
		HideBank()
		if Window_kid then
			destroyElement(Window_kid)
			Window_kid = nil
		end
		showCursor(false)
		removeEventHandler("onClientGUIChanged", resourceRoot, OCGCCET) -- edit nu9aif
		msell = nil
		money = nil
	elseif source == rejJ then
		if job < 9 and job > 5 then
			toggleControl("fire", true)
			toggleControl("forwards", true)
			toggleControl("backwards", true)
			toggleControl("left", true)
			toggleControl("right", true)
		end
		destroyElement(JobW)
		showCursor(false)
		JobW = nil
		ics = nil
		job = nil
		dad = nil
		for k,v in pairs(getElementsByType("player")) do
			if FWIND[v] then
				Cwindow(v)
			end
		end
		if fpis then
			killTimer(fpis)
			fpis = nil
		end
		protect = nil
		detachElements(player)
		HideBank()
		if Window_kid then
			destroyElement(Window_kid)
			Window_kid = nil
		end
		removeEventHandler("onClientGUIChanged", resourceRoot, OCGCCET) -- edit nu9aif
		msell = nil
		money = nil
	elseif source == Dep_B or source == Dep_A or source == WD_B or source == WD_A or source == TF_B then 
		if getPlayerPing (player) < 800 then
			if isTimer(TimeMoney) then 
			    local time = getTimerDetails(TimeMoney)
				exports["guimessages"]:outputClient( "Wait "..math.floor(time/1000,2).." seconds .", 255, 255, 0)
			    return
			end
			depM = tonumber(guiGetText(Dep_E))
			wdM = tonumber(guiGetText(WD_E))
			tfP = tonumber(guiGetText(TF_E_1))
			tfM = tonumber(guiGetText(TF_E_2))
			local rrRober = getElementData(player, "Rob")
			if source == Dep_B and depM > 0 then
			   if rrRober then exports["guimessages"]:outputClient("You are not allowed to deposit money because you've stolen money from someone.", 255, 0, 0) return end
			   triggerServerEvent("BankMoney", resourceRoot, player, BBM, wdM, 1,depM)
			   TimeMoney = setTimer(function() TimeMoney = nil end,1000*20,1)
			   ChickClickDuble()
				guiSetText(TF_E_1, "0")
				guiSetText(TF_E_2, "0")
				guiSetText(Dep_E, "0")
				guiSetText(WD_E, "0")
			elseif source == Dep_A then
				if rrRober then exports["guimessages"]:outputClient("You are not allowed to deposit money because you've stolen money from someone.", 255, 0, 0) return end
			    triggerServerEvent("BankMoney", resourceRoot, player, BBM, wdM, 2,depM)
				TimeMoney = setTimer(function() TimeMoney = nil end,1000*20,1)
			    ChickClickDuble()
				guiSetText(TF_E_1, "0")
				guiSetText(TF_E_2, "0")
				guiSetText(Dep_E, "0")
				guiSetText(WD_E, "0")
			elseif source == WD_B and wdM > 0 then 
			    triggerServerEvent("BankMoney", resourceRoot, player, BBM, wdM, 3,depM)
				TimeMoney = setTimer(function() TimeMoney = nil end,1000*20,1)
			    ChickClickDuble()
				guiSetText(TF_E_1, "0")
				guiSetText(TF_E_2, "0")
				guiSetText(Dep_E, "0")
				guiSetText(WD_E, "0")
			elseif source == WD_A then
				triggerServerEvent("BankMoney", resourceRoot, player, BBM,wdM,4,depM,money)
				TimeMoney = setTimer(function() TimeMoney = nil end,1000*20,1)
				ChickClickDuble()
				guiSetText(TF_E_1, "0")
				guiSetText(TF_E_2, "0")
				guiSetText(Dep_E, "0")
				guiSetText(WD_E, "0")
			elseif source == TF_B and tfM > 0 then 
				if rrRober then exports["guimessages"]:outputClient("You are not allowed to transfer money because you've stolen money from someone.", 255, 0, 0) return end
				if tfM > limitedMoney then return exports["guimessages"]:outputClient( "Is not allowed to withdraw more than "..limitedMoney, 255, 0, 0) end
				if getElementData(player, "ID") == tfP then
					exports["guimessages"]:outputClient(tlng[plng][47], 255, 255, 0)
				else
					if tfM > getElementData(player, "Bank") then
						tfM = getElementData(player, "Bank")
					end
					send = nil
					for k, v in pairs(getElementsByType("player")) do
						if getElementData(v, "ID") == tfP then 
							triggerServerEvent("Transfer", resourceRoot,player, tfP, tfM,v)
							ChickClickDuble()
							send = true
							break
						end
					end
					if send then
					    TimeMoney = setTimer(function() TimeMoney = nil end,1000*20,1)
					else
						exports["guimessages"]:outputClient(tlng[plng][48]..''..tfP, 255, 255, 0)
					end
					guiSetText(TF_E_1, "0")
					guiSetText(TF_E_2, "0")
					guiSetText(Dep_E, "0")
					guiSetText(WD_E, "0")
				end
			end
		else
			exports["guimessages"]:outputClient("Your Ping is hight +800", 255, 0, 0)
		end 
		guiSetText(CB_L, "$"..getElementData(player, "Bank")) 
		if fpis then
			killTimer(fpis)
			fpis = nil
		end
		protect = nil
		detachElements(player)
		exports["bank"]:bankVisible(false)
		Bank_W = nil
		removeEventHandler("onClientGUIChanged", resourceRoot, OCGCCET) -- edit nu9aif
		showCursor(false)
	elseif source == BE_B then
		if fpis then
			killTimer(fpis)
			fpis = nil
		end
		protect = nil
		detachElements(player)
		exports["bank"]:bankVisible(false)
		Bank_W = nil
		removeEventHandler("onClientGUIChanged", resourceRoot, OCGCCET) -- edit nu9aif
		showCursor(false)
	elseif source == GUIEditor.radiobutton[1] then
		if GUIEditor.window[2] then
			destroyElement(GUIEditor.window[2])
			GUIEditor.window[2] = nil
		end
		CHMDL()
		guiSetText(GUIEditor.label[2],"Rent: $"..math.ceil(HNPI[HSPC[1]][1]*getElementData(thebag,"Days") /419).." for "..txtc)
		guiLabelSetColor(GUIEditor.label[2], 0,150,0)
		CRNC = "Money"
	elseif source == GUIEditor.radiobutton[2] then
		if GUIEditor.window[2] then
			destroyElement(GUIEditor.window[2])
			GUIEditor.window[2] = nil
		end
		CHMDL()
		guiSetText(GUIEditor.label[2],"Rent: Ǥ"..math.ceil(HNPI[HSPC[1]][1]*getElementData(thebag,"Days") /419).." for "..txtc)
		guiLabelSetColor(GUIEditor.label[2], 255,200,0)
		CRNC = "PGC"
	elseif source == GUIEditor.button[1] then
	   if isPedInVehicle(player) then return end
		if guiGetText(GUIEditor.button[1]) == "Buy" then
			if not getElementData(player,"MCH") then
				if getElementData(player,CRNC) < math.ceil(HNPI[HSPC[1]][1]*getElementData(thebag,"Days") /419) then
					outputChatBox("You don't have enough money!",255,255,0)
				else
					if not GUIEditor.window[2] then
						GUIEditor.window[2] = guiCreateWindow(w/2.37, h/2.33, w/6.3, h/10.4, "Are you sure?", false)
						guiWindowSetSizable(GUIEditor.window[2], false)

						GUIEditor.button[5] = guiCreateButton(w/124, h/25.6, w/15, h/23.3, "Yes", false, GUIEditor.window[2])
						guiSetProperty(GUIEditor.button[5], "NormalTextColour", "FFAAAAAA")
						GUIEditor.button[6] = guiCreateButton(w/12.2, h/25.6, w/15, h/23.3, "No", false, GUIEditor.window[2])
						guiSetProperty(GUIEditor.button[6], "NormalTextColour", "FFAAAAAA")
					end
				end
			else
				outputChatBox("you already own a house!",255,255,0)
			end
		else
			if getElementData(player,"MCH") == tonumber(getElementID(HNAP)) then
				if getElementData(player,"WantLvl") > 2 or getElementData(player,"Stats") == 1 then
					px,py = getElementPosition(player)
					for k,v in pairs(getElementsWithinColShape(OPWC,"player")) do
						if getPlayerTeam(v) == getTeamFromName("Police") then
							cx,cy = getElementPosition(v)
							dist = getDistanceBetweenPoints2D(px,py,cx,cy)
							if dist < 200 then
								PUC = true
								break
							end
						end
					end
				end
				if not PUC then
					OTx,OTy,OTz = getElementPosition(HNAP)
					TAT = getPlayerName(player)
					TOHO = HNPI[HSPC[1]][3]
					triggerServerEvent("TITH",resourceRoot,player,HNAP,getElementData(player,"ID"))
					OCPL()
				else
					outputChatBox("you can't enter while cops are chasing you!",255,255,0)
					PUC = nil
				end
			else
				OCPL()
			end
		end
	elseif source == GUIEditor.button[2] then
		if TTFT then
			outputChatBox("please wait until you can take another tour again",255,255,0)
		else
		    if isPedInVehicle(player) then return end
			if getElementData(player,"WantLvl") > 2 or getElementData(player,"Stats") == 1 then
				px,py = getElementPosition(player)
				for k,v in pairs(getElementsWithinColShape(OPWC,"player")) do
					if getPlayerTeam(v) == getTeamFromName("Police") then
						cx,cy = getElementPosition(v)
						dist = getDistanceBetweenPoints2D(px,py,cx,cy)
						if dist < 200 then
							PUC = true
							break
						end
					end
				end
				px,py = nil,nil
				cx,cy = nil,nil
				dist = nil
			end
			if not PUC then
				PUC = nil
				TAT = true
				TOHO = HNPI[HSPC[1]][3]
				OTx,OTy,OTz = getElementPosition(HNAP)
				triggerServerEvent("TITH",resourceRoot,player,HNAP)
				OCPL()
			else
				outputChatBox("you can't enter while cops are chasing you!",255,255,0)
				PUC = nil
			end
		end
	elseif source == GUIEditor.button[3] then
	    if isPedInVehicle(player) then return end
		if HSPC[2] > 1 then
			if not GUIEditor.window[3] then
				GUIEditor.window[3] = guiCreateWindow(w/2.25, h/3.25, w/8.8, h/3.1, "Visit", false)
				guiWindowSetSizable(GUIEditor.window[3], false)

				GUIEditor.gridlist[1] = guiCreateGridList(w/151.8, h/28, w/10, h/4.5, false, GUIEditor.window[3])
				pmsc = guiGridListAddColumn(GUIEditor.gridlist[1], "Players", 0.9)
				GUIEditor.button[7] = guiCreateButton(w/124.2, h/3.8, w/22.8, h/23, "Visit", false, GUIEditor.window[3])
				guiSetProperty(GUIEditor.button[7], "NormalTextColour", "FFAAAAAA")
				GUIEditor.button[8] = guiCreateButton(w/17, h/3.8, w/22.8, h/23, "Close", false, GUIEditor.window[3])
				guiSetProperty(GUIEditor.button[8], "NormalTextColour", "FFAAAAAA")
				for k,v in pairs(getElementsByType("player")) do
					if getElementData(v,"MCH") == tonumber(getElementID(HNAP)) and getElementData(v,"PMS") then
						for j,c in pairs(getElementData(v,"PMS")) do
							if c == getPlayerName(player) then
								row = guiGridListAddRow(GUIEditor.gridlist[1])
								guiGridListSetItemText(GUIEditor.gridlist[1],row,pmsc,getPlayerName(v),false,false)
								break
							end
						end
					end
				end
			end
		else
			for k,v in pairs(getElementsByType("player")) do
				if getElementData(v,"MCH") == tonumber(getElementID(HNAP)) then
					if getElementData(v,"PMS") then
						for j,c in pairs(getElementData(v,"PMS")) do
							if c == getPlayerName(player) then
								--PMS = true
								PMS = getElementData(v,"ID")
								TAT = getPlayerName(v)
								break
							end
						end
						--[[if PMS then
							PMS = getElementData(v,"ID")
							TAT = getPlayerName(v)
						end]]
						break
					end
					break
				end
			end
			if PMS then
				if getElementData(player,"WantLvl") > 2 or getElementData(player,"Stats") == 1 then
					px,py = getElementPosition(player)
					for k,v in pairs(getElementsWithinColShape(OPWC,"player")) do
						if getPlayerTeam(v) == getTeamFromName("Police") then
							cx,cy = getElementPosition(v)
							dist = getDistanceBetweenPoints2D(px,py,cx,cy)
							if dist < 200 then
								PMS = nil
								break
							end
						end
					end
					px,py = nil,nil
					cx,cy = nil,nil
					dist = nil
				end
				if PMS then
					OTx,OTy,OTz = getElementPosition(HNAP)
					TOHO = HNPI[HSPC[1]][3]
					triggerServerEvent("TITH",resourceRoot,player,HNAP,PMS)
					OCPL()
				else
					outputChatBox("you can't enter while cops are chasing you!",255,255,0)
					TAT = nil
				end
			else
				outputChatBox("you don't have permission to visit this house",255,255,0)
			end
		end
	elseif source == GUIEditor.button[4] then
	    if isPedInVehicle(player) then return end
		OCPL()
	elseif source == GUIEditor.button[5] then
	   if isPedInVehicle(player) then return end
		triggerServerEvent("ENOR",resourceRoot,player,HNAP,CRNC)
		OCPL()
	elseif source == GUIEditor.button[6] then
	    if isPedInVehicle(player) then return end
		if GUIEditor.window[2] then
			destroyElement(GUIEditor.window[2])
			GUIEditor.window[2] = nil
		end
	elseif source == GUIEditor.button[7] then
		row,column = guiGridListGetSelectedItem(GUIEditor.gridlist[1])
		if row then
			itm = guiGridListGetItemText(GUIEditor.gridlist[1],row,column)
			TAT = getPlayerFromName(itm)
			if TAT then
				PMS = getElementData(TAT,"ID")
				TAT = itm
				if getElementData(player,"WantLvl") > 2 or getElementData(player,"Stats") == 1 then
					px,py = getElementPosition(player)
					for k,v in pairs(getElementsWithinColShape(OPWC,"player")) do
						if getPlayerTeam(v) == getTeamFromName("Police") then
							cx,cy = getElementPosition(v)
							dist = getDistanceBetweenPoints2D(px,py,cx,cy)
							if dist < 200 then
								PMS = nil
								break
							end
						end
					end
					px,py = nil,nil
					cx,cy = nil,nil
					dist = nil
				end
				if PMS then
					OTx,OTy,OTz = getElementPosition(HNAP)
					TOHO = HNPI[HSPC[1]][3]
					triggerServerEvent("TITH",resourceRoot,player,HNAP,PMS)
					OCPL()
				else
					outputChatBox("you can't enter while cops are chasing you!",255,255,0)
					TAT = nil
				end
			else
				guiGridListRemoveRow(GUIEditor.gridlist[1],row)
			end
		end
	elseif source == GUIEditor.button[8] then
		if GUIEditor.window[3] then
			destroyElement(GUIEditor.window[3])
			GUIEditor.window[3] = nil
		end
	elseif source == GUIEditor.button[9] then
		edid = guiGetText(GUIEditor.edit[1])
		if tonumber(edid) then
			if getElementData(player,"ID") == tonumber(edid) then
				outputChatBox("you can't add your self",255,255,0)
			else
				for k,v in pairs(getElementsByType("player")) do
					if getElementData(v,"ID") == tonumber(edid) then
						PHBAD = true
						--for j,c in pairs(guiGridListGetSelectedItems(GUIEditor.gridlist[2])) do
						if guiGridListGetRowCount(GUIEditor.gridlist[2]) > 0 then
							for i=0,(guiGridListGetRowCount(GUIEditor.gridlist[2])-1) do
								if guiGridListGetItemText(GUIEditor.gridlist[2],i,hpmsc) == getPlayerName(v) then
									dnatsm = true
									break
								end
							end
						end
						if not dnatsm then
							row = guiGridListAddRow(GUIEditor.gridlist[2])
							guiGridListSetItemText(GUIEditor.gridlist[2],row,hpmsc,getPlayerName(v),false,false)
							cc = nil
						else
							outputChatBox("player is already added",255,255,0)
							dnatsm = nil
						end
						break
					end
				end
				if not PHBAD then
					outputChatBox("player ID doesn't exist",255,255,0)
				else
					PHBAD = nil
				end
			end
		else
			outputChatBox("you must enter a player ID (Numbers)",255,255,0)
		end
	elseif source == GUIEditor.button[10] then
		row = guiGridListGetSelectedItem(GUIEditor.gridlist[2])
		if row then
			guiGridListRemoveRow(GUIEditor.gridlist[2],row)
		end
	elseif source == GUIEditor.button[11] then
		if getElementData(player,"MCH") then
			TPMS={}
			if guiGridListGetRowCount(GUIEditor.gridlist[2]) > 0 then
				for i=0,(guiGridListGetRowCount(GUIEditor.gridlist[2])-1) do
					TPMS[(i+1)] = guiGridListGetItemText(GUIEditor.gridlist[2],i,hpmsc)
				end
			end
			setElementData(player,"PMS",TPMS)
			--for items
			--table = {}
			--trigger
			--in the server side check again --if getElementData(source,"MCH") then
		end
		if GUIEditor.window[4] then
			destroyElement(GUIEditor.window[4])
			GUIEditor.window[4] = nil
			showCursor(false)
		end
	elseif source == GUIEditor.button[12] then
		if GUIEditor.window[4] then
			destroyElement(GUIEditor.window[4])
			GUIEditor.window[4] = nil
			showCursor(false)
		end
	elseif VUBS[source] then
		if VUBS[source] < 0 and NORB[VUW[NORB[source]]] then
			removeVehicleUpgrade(sveh, NORB[VUW[NORB[source]]])
			playSoundFrontEnd(46)
			NORB[VUW[NORB[source]]] = nil
			Carts[VUW[NORB[source]]] = 0
			CACS(VUB[0])
		elseif VUBS[source] > 17 then
			--VUBS[VUW[GVUS]] = getVehicleUpgradeOnSlot(sveh, i)
			NORB[VUW[GVUS]] = VUBS[source]
			--outputChatBox(VUBS[source])
			addVehicleUpgrade(sveh, VUBS[source])
			playSoundFrontEnd(46)
			Carts[VUW[GVUS]] = Carts[source]
			CACS(VUB[0])
		elseif VUBS[source] > -1 then
			if GVUS and GVUS == VUBS[source] and guiGetVisible(VUW[GVUS]) then
				guiSetVisible(VUW[GVUS], false)
				MZC(1045, -1022.75, 16, 360)
			else
				if GVUS and guiGetVisible(VUW[GVUS]) then
					guiSetVisible(VUW[GVUS], false)
				end
				--VUW[VUBS[source]] = guiCreateWindow(w/1.36, h/3.84, 0, 0,guiGetText(source),false)
				--GVUS = VUBS[source]
				--GVUS = VUS[GVUS]
				--for k,v in pairs(getVehicleCompatibleUpgrades(sveh, VUBS[source])) do
					----GVUS = GVUS[v][1]
					--guiSetSize(VUW[VUBS[source]], w/7.6, h/30*NOB+h/39, false)
					--VUSB[v] = guiCreateRadioButton(w/136.6, h/30*NOB-h/128, w/8.5, h/30,GVUS[v][1].." $"..GVUS[v][2],false,VUW[VUBS[source]])
					--VUBS[VUSB[v]] = v
					--NOB = NOB+1
				--end
				GVUS = VUBS[source]
				gx, gy = guiGetPosition(VUSW[0], false)
				guiSetPosition(VUW[GVUS], gx-w/7.6, gy, false)
				guiSetVisible(VUW[GVUS], true)
				NOB = 1
				gx, gy = nil, nil
				if guiGetText(source) == "Hood" or guiGetText(source) == "Vent" or guiGetText(source) == "Roof" then
					MZC(1046.5, -1021.25, 16, 315)
				elseif guiGetText(source) == "Spoiler" then
					MZC(1046, -1021.75, 15, 135)
				elseif guiGetText(source) == "Sideskirt" or guiGetText(source) == "Wheels" then
					MZC(1046, -1021.75, 14.5, 45)
				elseif guiGetText(source) == "Front Bullbars" or guiGetText(source) == "Front Bumper" or guiGetText(source) == "Misc" then
					MZC(1046.5, -1021.25, 14.5, 315)
				elseif guiGetText(source) == "Exhaust" or guiGetText(source) == "Rear Bumper" then
					MZC(1046.5, -1021.25, 14.5, 135)
				else
					MZC(1045, -1022.75, 16, 360)
				end
			end
		end
	--elseif NORB[source] then
		--NORB[source] = false
		--removeVehicleUpgrade(sveh, NORB[source])
		--playSoundFrontEnd(46)
	elseif source == VUB[8] then
		if getElementData(player,CRNC) >= 200 then
			setElementData(player, CRNC, getElementData(player, CRNC)-200)
			FVA()
			playSoundFrontEnd(46)
		else
			outputChatBox("You don't have enough Money!", 255, 255, 0)
		end
	elseif source == VUB[9] then
		if getElementData(player,CRNC) >= 300 then
			setElementData(player, CRNC, getElementData(player, CRNC)-300)
			setElementHealth(sveh, 1000)
			playSoundFrontEnd(46)
		else
			outputChatBox("You don't have enough Money!", 255, 255, 0)
		end
	elseif source == VUB[10] then
		dcheck = true
		VCLR[17],VCLR[18],VCLR[19],VCLR[20],VCLR[21],VCLR[22],VCLR[23],VCLR[24],VCLR[25],VCLR[26],VCLR[27],VCLR[28] = getVehicleColor(sveh,true)
		for i=14, 28 do
			guiSetVisible(VUB[i], true)
			if i > 16 then
				if not VCLR[i] then
					VCLR[i] = 0
				end
				guiSetText(VUB[i], tostring(VCLR[i]))
				VCLR[i] = nil
			end
		end
		dcheck = nil
	elseif source == VUB[11] then
		dcheck = true
		VCLR[17],VCLR[18],VCLR[19] = getVehicleHeadLightColor(sveh)
		for i=14, 28 do
			if i < 17 or i > 19 then
				guiSetVisible(VUB[i], false)
			end
			if i > 16 and i < 20 then
				guiSetText(VUB[i], tostring(VCLR[i]))
				VCLR[i] = nil
			end
		end
		dcheck = nil
	elseif source == VUB[12] then
		dcheck = true
		
		if VHN then
			VCLR[17],VCLR[18],VCLR[19] = getMarkerColor(VHN)
			--outputChatBox(VCLR[31].."**"..VCLR[32].."**"..VCLR[33])
		else
			VCLR[17],VCLR[18],VCLR[19] = 0,0,0
		end
		--[[if getAttachedElements(sveh)[1] then
			VCLR[17],VCLR[18],VCLR[19] = getMarkerColor(getAttachedElements(sveh)[1])
		else
			VCLR[17],VCLR[18],VCLR[19] = 0,0,0
		end]]
		for i=14, 28 do
			if i < 17 or i > 19 then
				guiSetVisible(VUB[i], false)
			end
			if i > 16 and i < 20 then
				guiSetText(VUB[i], tostring(VCLR[i]))
				VCLR[i] = nil
			end
		end
		dcheck = nil
	elseif source == VUB[29] then
		CACS(VUB[0])
		if guiRadioButtonGetSelected(VUB[10]) then
			playSoundFrontEnd(16)
		else
			playSoundFrontEnd(38)
		end
		if guiRadioButtonGetSelected(VUB[12]) then
			dcheck = true
			Carts[VUB[12]] = 0
			for i=31, 33 do
				guiSetText(VUB[i-14], tostring(VCLR[i]))
			end
			for k,v in pairs(getAttachedElements(sveh)) do
				if getElementType(v) == "marker" then
					setMarkerColor(v, VCLR[31], VCLR[32], VCLR[33])
				end
			end
			dcheck = nil
		elseif guiRadioButtonGetSelected(VUB[11]) then
			dcheck = true
			Carts[VUB[11]] = 0
			for i=2, 4 do
				guiSetText(VUB[i+15], tostring(VCLR[i]))
			end
			setVehicleHeadLightColor(sveh, VCLR[2], VCLR[3], VCLR[4])
			dcheck = nil
		else
			dcheck = true
			Carts[VUB[10]] = 0
			for i=5, 16 do
				guiSetText(VUB[i+12], tostring(VCLR[i]))
			end
			setVehicleColor(sveh, VCLR[5], VCLR[6], VCLR[7], VCLR[8], VCLR[9], VCLR[10], VCLR[11], VCLR[12], VCLR[13], VCLR[14], VCLR[15], VCLR[16])
			dcheck = nil
		end
		Carts[VUSW[3]] = 0
		for i=9, 11 do
			Carts[VUSW[3]] = Carts[VUSW[3]]+Carts[VUB[i]]
		end
		CACS(VUB[0])
	elseif source == VUB[30] then
		Carts[VUSW[4]] = 0
		CACS(VUB[0])
		playSoundFrontEnd(16)
		setVehiclePaintjob(sveh, 3)
	elseif source == VUB[31] then
		if VCLR[1] == 0 then
			Carts[VUSW[4]] = 0
		else
			Carts[VUSW[4]] = 50000
		end
		CACS(VUB[0])
		playSoundFrontEnd(16)
		setVehiclePaintjob(sveh, 0)
	elseif source == VUB[32] then
		if VCLR[1] == 1 then
			Carts[VUSW[4]] = 0
		else
			Carts[VUSW[4]] = 50000
		end
		CACS(VUB[0])
		playSoundFrontEnd(16)
		setVehiclePaintjob(sveh, 1)
	elseif source == VUB[33] then
		if VCLR[1] == 2 then
			Carts[VUSW[4]] = 0
		else
			Carts[VUSW[4]] = 50000
		end
		CACS(VUB[0])
		playSoundFrontEnd(16)
		setVehiclePaintjob(sveh, 2)
	elseif source == VUB[34] then
		Carts[VUSW[5]] = 0
		CACS(VUB[0])
		playSoundFrontEnd(46)
		Neon = nil
		if nn[1] then
			for i=1,4 do
				if nn[i] then
					destroyElement(nn[i])
					nn[i] = nil
				end
			end
			VHN = nil
		elseif VHN then
			for k,v in pairs(getAttachedElements(sveh)) do
				if getElementType(v) == "marker" then
					setElementAlpha(v, 0)
				end
			end
		end
	elseif source == VUB[35] then
		if VON then
			Carts[VUSW[5]] = 0
		else
			Carts[VUSW[5]] = 100000
		end
		CACS(VUB[0])
		playSoundFrontEnd(46)
		Neon = true
		if not VHN then
			if getVehicleType(sveh) == "Automobile" then
				for i=1,4 do
					nn[i] = createMarker(1050, -1017.75, 0, "corona", 1)
					setElementDimension(nn[i], getElementData(player, "ID"))
				end
				attachElements(nn[1], sveh, 0, 2.5, -.5)
				attachElements(nn[2], sveh, 0, -2.3, -.5)
				attachElements(nn[3], sveh, -.8, 0, -.5)
				attachElements(nn[4], sveh, .8, 0, -.5)
			else
				nn[1] = createMarker(1050, -1017.75, 0, "corona", 1)
				setElementDimension(nn[1], getElementData(player, "ID"))
				attachElements(nn[1], sveh, 0, 0, -.5)
			end
			VHN = nn[1]
			VCLR[31],VCLR[32],VCLR[33] = getMarkerColor(VHN)
			--[[attachElements(nn[1], sveh, 0, 4, -.3)
			attachElements(nn[2], sveh, 0, -4, -.3)
			attachElements(nn[3], sveh, 2, 0, -.3)
			attachElements(nn[4], sveh, -2, 0, -.3)]]
			--[[fx, fy, fz = getVehicleComponentPosition(sveh, "bump_front_dummy")
			rx, ry = getVehicleComponentPosition(sveh, "bump_rear_dummy")
			lfx, lfy = getVehicleComponentPosition(sveh, "wheel_lf_dummy")
			lbx, lby = getVehicleComponentPosition(sveh, "wheel_lb_dummy")
			ly = lfy-lby]]
			--[[
			for i=1,4 do
				setTimer(function()
					if i < 2 then
						attachElements(nn[i], sveh, 0, dist, 0)
					elseif i < 3 then
						attachElements(nn[i], sveh, 0, -dist, 0)
					elseif i < 4 then
						attachElements(nn[i], sveh, dist, 0, 0)
					else
						attachElements(nn[i], sveh, -dist, 0, 0)
					end
				end, 50, 1)
			end]]
		else
			for k,v in pairs(getAttachedElements(sveh)) do
				setElementAlpha(v, 255)
			end
		end
	elseif source == VUB[38] then
		Carts[VUSW[6]] = 0
		CACS(VUB[0])
		playSoundFrontEnd(38)
		guiSetText(VUB[37], VCLR[0])
	elseif source == VUB[39] then
		Carts[VUSW[7]] = 0
		--Carts[VUSW[7]] = Carts[VUB[39]]+Carts[VUB[41]]
		CACS(VUB[0])
		VCLR[VUSW[7]] = 255
		--EVar()
		gx, gy = getVehicleVariant(sveh)
		if VCLR[VUSW[7]] ~= gx then
			triggerServerEvent("EqVar", resourceRoot,player, VCLR[VUSW[7]], VCLR[VUSW[8]], true)
			for i=39, 52 do
				if VUB[i] then
					guiSetEnabled(VUB[i],false)
					setTimer(guiSetEnabled,2000,1,VUB[i],true)
				end
			end
		end
		gx, gy = nil, nil
		playSoundFrontEnd(46)
	elseif source == VUB[40] then
		Carts[VUSW[8]] = 0
		--Carts[VUSW[7]] = Carts[VUB[39]]+Carts[VUB[41]]
		CACS(VUB[0])
		VCLR[VUSW[8]] = 255
		--EVar()
		gx, gy = getVehicleVariant(sveh)
		if VCLR[VUSW[8]] ~= gy then
			triggerServerEvent("EqVar", resourceRoot,player, VCLR[VUSW[7]], VCLR[VUSW[8]], true)
			for i=39, 52 do
				if VUB[i] then
					guiSetEnabled(VUB[i],false)
					setTimer(guiSetEnabled,2000,1,VUB[i],true)
				end
			end
		end
		gx, gy = nil, nil
		playSoundFrontEnd(46)
	elseif source == VUB[0] then
		if Cart <= getElementData(player, CRNC) then
			playSoundFrontEnd(46)
			setElementData(player, CRNC, getElementData(player, CRNC)-Cart)
			
			--VCLR[31],VCLR[32],VCLR[33] = 0,0,0
			--if VHN then
				--outputChatBox(VCLR[31].."**"..VCLR[32].."**"..VCLR[33])
				if not Neon then
					VCLR[34],VCLR[35],VCLR[36] = nil,nil,nil
				else
					for k,v in pairs(getAttachedElements(sveh)) do
						if getElementType(v) == "marker" then
							VCLR[34],VCLR[35],VCLR[36] = getMarkerColor(v)
							break
						end
					end
				end
				ra,ga,ba,rb,gb,bb,rc,gc,bc,rd,gd,bd = getVehicleColor(sveh,true)
				re,ge,be = getVehicleHeadLightColor(sveh)
				arga = {ra,ga,ba,rb,gb,bb,rc,gc,bc,rd,gd,bd,re,ge,be,getVehiclePaintjob(sveh),getVehiclePlateText(sveh),getVehicleUpgrades(sveh)}
				triggerServerEvent("EqVar", resourceRoot,player, false,false,false,arga,Neon,VCLR[34],VCLR[35],VCLR[36])
				ra,ga,ba,rb,gb,bb,rc,gc,bc,rd,gd,bd = nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil
			--end
			
			--[[if getAttachedElements(sveh)[1] then
				VCLR[34],VCLR[35],VCLR[36] = getMarkerColor(getAttachedElements(sveh)[1])
				if not Neon then
					VCLR[34],VCLR[35],VCLR[36] = nil,nil,nil
				end
				triggerServerEvent("EqVar", resourceRoot,player, false,false,false,Neon,VCLR[34],VCLR[35],VCLR[36])
			end]]
			CVS()
		else
			outputChatBox("You don't have enough Money!", 255, 255, 0)
		end
	elseif source == VUB[1] then
		setTimer(RVU, 1000, 1)
		CVS()
	elseif source == VURA then
		ctx = "$"
		guiSetText(VUB[0], "Buy $"..Cart)
		--guiLabelSetColor(GUIEditor.label[2], 0,150,0)

		guiSetProperty(VUB[0], "NormalTextColour", "FF005900")
		CRNC = "Money"
	elseif source == VURB then
		ctx = "Ǥ"
		guiSetText(VUB[0], "Buy Ǥ"..Cart)
		--guiLabelSetColor(GUIEditor.label[2], 255,200,0)
		
		guiSetProperty(VUB[0], "NormalTextColour", "FFFF7800")
		CRNC = "PGC"
	else
		for i=2, 7 do
			if source == VUB[i] then
				if guiGetVisible(VUSW[i]) then
					guiSetVisible(VUSW[i], false)
					MZC(1045, -1022.75, 16, 360)
					if i > 6 then
						guiSetVisible(VUSW[i+1], false)
					end
				else
					if LBP and LBP ~= i then
						guiSetVisible(VUSW[LBP], false)
						if LBP > 6 then
							guiSetVisible(VUSW[LBP+1], false)
						end
					end
					if i == 6 then
						MZC(1046.5, -1021.25, 14.5, 135)
					else
						MZC(1045, -1022.75, 16, 360)
					end
					LBP = i
					gx, gy = guiGetPosition(VUSW[1], false)
					guiSetPosition(VUSW[i], gx+w/11.4, gy, false)
					guiSetVisible(VUSW[i], true)
					if i > 6 then
						gx, gy = guiGetPosition(VUSW[i], false)
						gsx, gsy = guiGetSize(VUSW[i], false)
						guiSetPosition(VUSW[i+1], gx, gy+gsy, false)
						guiSetVisible(VUSW[i+1], true)
					end
					gx, gy = nil, nil
				end
			end
		end
		for i=41, 52 do
			if source == VUB[i] then
				ATTI = ATT[getElementModel(sveh)]
				ATTI = ATTI[VCLR[VUB[i]]]
				if i < 47 then
					--outputChatBox(VCLR[29])
					if VCLR[VUB[i]] == VCLR[29] then
						Carts[VUSW[7]] = 0
					else
						Carts[VUSW[7]] = ATTI[2]
					end
					VCLR[VUSW[7]] = VCLR[VUB[i]]
				else
					--outputChatBox(VCLR[30])
					if VCLR[VUB[i]] == VCLR[30] then
						Carts[VUSW[8]] = 0
					else
						Carts[VUSW[8]] = ATTI[2]
					end
					VCLR[VUSW[8]] = VCLR[VUB[i]]
				end
				CACS(VUB[0])
				--Carts[VUSW[7]] = Carts[VUB[39]]+Carts[VUB[41]]
				--EVar()
				gx, gy = getVehicleVariant(sveh)
				if VCLR[VUSW[7]] ~= gx or VCLR[VUSW[8]] ~= gy then
					triggerServerEvent("EqVar", resourceRoot,player, VCLR[VUSW[7]], VCLR[VUSW[8]], true)
					for i=39, 52 do
						if VUB[i] then
							guiSetEnabled(VUB[i],false)
							setTimer(guiSetEnabled,2000,1,VUB[i],true)
						end
					end
				end
				gx, gy = nil, nil
				playSoundFrontEnd(46)
				ATTI = nil
				break
			end
		end
	end
	if source == button_exit or source == button_kexit or source == BE or source == exit_B or source == DS_EX then
		msell = nil
		money = nil
	end
	--setElementData(player, "Money", getPlayerMoney(player))
end
addEventHandler("onClientGUIClick", resourceRoot, OCGUIC) -- edit nu9aif

function MZC(mzx, mzy, mzz, mzrz)
			--[[rx, ry = getElementRotation(policeDoor)
            if ry <= 90 then
                ry = 90-ry
            elseif ry <= 180 then
                ry = 180-ry
            elseif ry <= 270 then
                ry = 270-ry
            elseif ry <= 360 then
                ry = 360-ry
            end
            moveObject(policeDoor, 968, 1544.699, -1630.798, 13.100, 0, ry-90)]]

	rrx, rry, rrz = getElementRotation(Ishop[1])
	mzrz = 360-rrz-(360-mzrz)
	if mzrz > 180 then
		mzrz = mzrz-360
	elseif mzrz < -180 then
		mzrz = mzrz+360
	end
	moveObject(Ishop[11], 300, mzx, mzy, mzz)
	moveObject(Ishop[1], 300, 1050, -1017.75, 14, 0, 0, mzrz)
	rrx, rry, rrz = nil,nil,nil
	if Ishop[12] then
		resetTimer(Ishop[12])
	else
		addEventHandler("onClientRender",root,RFCM)
		Ishop[12] = setTimer(function()
			Ishop[12] = nil
			removeEventHandler("onClientRender",root,RFCM)
			mzx, mzy, mzz = nil,nil,nil
		end, 350, 1)
	end
end

function RFCM()
	mzx, mzy, mzz = getElementPosition(Ishop[11])
	setCameraMatrix(mzx, mzy, mzz, 1050, -1017.75, 14.5)
end

function FVA()
	for i=0, 6 do
		if i < 4 then
			setVehicleLightState(sveh, i, 0)
		end
		if i < 6 then
			setVehicleDoorState(sveh, i, 0)
		end
		setVehiclePanelState(sveh, i, 0)
	end
	setVehicleWheelStates(sveh, 0, 0, 0, 0)
end

function ChickClickDuble()
end

function HNAW()
	if not GUIEditor.window[1] then
		HSPC = getElementData(HNAP,"HSPC")
		--txta = "Apartments"
		--txtb = "Apartments: "..HSPC[3].."/"..HSPC[2]
		GUIEditor.window[1] = guiCreateWindow(w/2.3, h/3.2, w/7.76, h/2.95, "Apartments", false)--txta
		guiWindowSetSizable(GUIEditor.window[1], false)
		GUIEditor.radiobutton[1] = guiCreateRadioButton(w/27.32, h/9.6, w/45.53, h/51.2, "$", false, GUIEditor.window[1])
        guiSetProperty(GUIEditor.radiobutton[1], "NormalTextColour", "FF009600")
        GUIEditor.radiobutton[2] = guiCreateRadioButton(w/15.18, h/9.6, w/45.53, h/51.2, "Ǥ", false, GUIEditor.window[1])
        guiSetProperty(GUIEditor.radiobutton[2], "NormalTextColour", "FFFFAA00")
		if HSPC[3] < HSPC[2] then
			r,g,b = 0,255,0
		else
			r,g,b = 255,0,0
		end
		GUIEditor.label[1] = guiCreateLabel(w/71.9, h/24, w/9.49, h/42.67, "Apartments: "..HSPC[3].."/"..HSPC[2], false, GUIEditor.window[1])--txtb
		guiLabelSetColor(GUIEditor.label[1], r,g,b)
		if HNPI[HSPC[1]][2] then
			ctx = "Ǥ"
			guiRadioButtonSetSelected(GUIEditor.radiobutton[2], true)
			guiSetEnabled(GUIEditor.radiobutton[1],false)
			r,g,b = 255,200,0
			CRNC = "PGC"
		else
			ctx = "$"
			guiRadioButtonSetSelected(GUIEditor.radiobutton[1], true)
			r,g,b = 0,150,0
			CRNC = "Money"
		end
		CHMDL()
		GUIEditor.label[2] = guiCreateLabel(w/71.9, h/12.8, w/9.49, h/51.2, "Rent: "..ctx..""..math.ceil(HNPI[HSPC[1]][1]*getElementData(thebag,"Days") /419).." for "..txtc, false, GUIEditor.window[1])
		guiLabelSetColor(GUIEditor.label[2], r,g,b)
		GUIEditor.button[1] = guiCreateButton(w/85.38, h/7.68, w/9.49, h/25.6, "Buy", false, GUIEditor.window[1])
		guiSetProperty(GUIEditor.button[1], "NormalTextColour", "FFAAAAAA")
		GUIEditor.button[2] = guiCreateButton(w/85.38, h/5.49, w/9.49, h/25.6, "Tour", false, GUIEditor.window[1])
		guiSetProperty(GUIEditor.button[2], "NormalTextColour", "FFAAAAAA")
		GUIEditor.button[3] = guiCreateButton(w/85.38, h/4.27, w/9.49, h/25.6, "Visit", false, GUIEditor.window[1])
		guiSetProperty(GUIEditor.button[3], "NormalTextColour", "FFAAAAAA")
		if tonumber(getElementID(HNAP)) == getElementData(player,"MCH") then
			guiSetText(GUIEditor.button[1],"Enter")
			guiSetEnabled(GUIEditor.button[2],false)
			guiSetEnabled(GUIEditor.button[3],false)
		elseif getElementData(player,"MCH") or getPlayerTeam(player) == getTeamFromName("Police") then
			guiSetEnabled(GUIEditor.button[1],false)
		end
		--[[if getElementData(player,"WantLvl") > 2 and getElementData(player,"Stats") ~= 0 then
			guiSetEnabled(GUIEditor.button[2],false)
		end]]
		GUIEditor.button[4] = guiCreateButton(w/85.38, h/3.49, w/9.49, h/25.6, "Exit", false, GUIEditor.window[1])
		guiSetProperty(GUIEditor.button[4], "NormalTextColour", "FFAAAAAA")
		showCursor(true)
		r,g,b = nil,nil,nil
	end
end

function CHMDL()
	if getElementData(thebag,"Days") > 60 then
		txtc = math.floor(getElementData(thebag,"Days")/60).." days"
	else
		txtc = math.floor((getElementData(thebag,"Days")/60) *24).." hours"
	end
end

addEvent("DITM",true)
function FDITM(x,y,z,r)
	if source == player then
		--toggleAllControls(false)
		setElementPosition(player,x,y,z)
		setTimer(function() setPedRotation(player,r) fadeCamera(true,1) setTimer(setCameraTarget,50,1,player) end,700,1)
		if not EHM then
			EHM = createMarker(x,y,z-1,"cylinder",1)
		end
		setElementInterior(EHM,getElementInterior(player))
		setElementDimension(EHM,getElementDimension(player))
		fadeCamera(false,0)
		if TOHO then
			for k,v in pairs(TOHO) do
				setElementDimension(v,getElementDimension(player))
			end
		end
		if getPlayerFromName(tostring(TAT)) then
			addEventHandler("onClientPlayerQuit",getPlayerFromName(TAT),TTF)
		elseif not TTFT and TAT then
			TAT = nil
			TTFT = setTimer(function() TTFT = nil TTF() end,60000,1)
			outputChatBox("welcome you can take a tour in this house for 1 minute or you can leave it by pressing enter/exit at the door",0,255,255)
		end
		--setTimer(function() toggleAllControls(true) end,1000,1)
	end
end
addEventHandler("DITM",root,FDITM)

addEvent("CHB",true)
function FCHB(cr)--PLRs
	--for k,v in pairs(PLRs) do
		--if v == player then
			if cr and not MCH then
				for k,v in pairs(getElementsByType("pickup")) do
					if getElementModel(v) == 1273 and tonumber(getElementID(v)) == getElementData(player,"MCH") then
						MCH = createBlipAttachedTo(v,31)
						break
					end
				end
			elseif MCH then
				destroyElement(MCH)
				MCH = nil
			end
			--break
		--end
	--end
end
addEventHandler("CHB",root,FCHB)

isProject = {}
function TeamColor (psource,player)  
    if isTimer(isProject[psource]) then killTimer(isProject[psource]) isProject[psource] = nil end 
    if psource == player then
        for k,v in pairs(getElementsByType("player")) do 
            setElementCollidableWith(psource, v, false)
        end 
        isProject[psource] = setTimer(function(pla1) 
        for k,v in pairs(getElementsByType("player")) do 
                setElementCollidableWith(pla1, v, true) 
            end
            setElementAlpha(pla1,255) 
            isProject[pla1] = nil
        end,10000,1,psource)
	else
        setElementCollidableWith(psource, player, false)
        isProject[psource] = setTimer(function(pla1,pla2) 
        if isElement(pla1) and isElement(pla2) then
			setElementCollidableWith(pla1,pla2, true)
			setElementAlpha(pla1,255)
		end
		isProject[pla1] = nil
		end,10000,1,psource, player)
	end 		
	setElementAlpha(psource,100) 
    if getPlayerTeam(player) == getTeamFromName("Police") then
		if psource == player then
			for k,v in pairs(getElementsByType("player")) do
				PSBC(v)
			end
		else
			PSBC(psource)
		end
	else
		if psource == player then
			for k,v in pairs(getElementsByType("player")) do
				SBC(v)
			end
		else
			SBC(psource)
		end
	end
end	 
	

function SpawnColor (data)
    if data then
		TeamColor (source,player)
	end
end
addEventHandler("onClientPlayerSpawn", root, SpawnColor)

addEvent("DRB", true)
function Foffer(data,oldv)
	--outputChatBox("data changed")
	if data == "Unknown" or data == "Quit" or data == "Kicked" or data == "Banned" or data == "Bad Connection" or data == "Timed out" then
		if jicon[source] then 
			jicon[source] = nil
		end
		--outputChatBox("d = q")
		if kidnapped == source then
			setElementData(player, "Prisoners", 0)
		end
		if source == robber and data == "Quit" then
			--outputChatBox("s = r a q")
			if robM then
				--outputChatBox("rM")
				if source == player and robber == player or oldv == player and robber == player then
					--outputChatBox("ov = p a rr = p")
					setElementData(player, "Money", getElementData(player, "Money")-robM)
					--setElementData(player, "Scores", getElementData(player, "Scores")-1)
					givePlayerScore (player,-1)
					if oldv == player then
						setElementData(source, "Rob", nil)
					end
					exports["guimessages"]:outputClient(tlng[plng][30], 255, 0, 0)
				elseif robbed == player then
					--outputChatBox("rd = p")
					setElementData(player, "Money", getElementData(player, "Money")+robM)
					--setElementData(player, "Scores", getElementData(player, "Scores")+1)
					givePlayerScore (player,1)
					setElementData(player, "protect", nil)
					exports["guimessages"]:outputClient(tlng[plng][31], 0, 255, 0)
				end
				robber = nil
				robbed = nil
				robM = nil
			end
		end
		if source == player then
			if bbag then
				triggerServerEvent("DBFR", resourceRoot,player, bx, by, gz)
				bbag = nil
			end
		else
			if getElementData(player, "DL") then
				if getElementData(player, "DL") == source then
					setElementData(player, "DL", nil)
				end
			end
			if FWIND[source] then
				Cwindow(source)
			end
		end
	end
	if Window_kid then
		if getElementType(source) == "player" then
			if knh == getElementData(source, "KidH") or getElementData(source, "KidH") < 1 then
				if data == "KidH" and getElementData(source, "KidH") > 0 then
					row[source] = guiGridListAddRow(Grid_playersname)
					guiGridListSetItemText(Grid_playersname, row[source], column, getPlayerName(source), false, false)
				elseif data == "KidH" and getElementData(source, "KidH") < 1 or data == "Unknown" or data == "Quit" or data == "Kicked" or data == "Banned" or data == "Bad Connection" or data == "Timed out" then
					guiGridListRemoveRow(Grid_playersname, row[source])
				end
			end
		end
	end
	--[[elseif Window_bet then
		if getElementType(source) == "player" then
			if data == "Wrestler" then
				if getElementData(source, "Wrestler") then
					wweBR[source] = guiGridListAddRow(Grid_bet)
					guiGridListSetItemText(Grid_bet, wweBR[source], wweBC, getPlayerName(source), false, false)
				else
					guiGridListRemoveRow(Grid_bet, wweBR[source])
				end
			end
		end
	elseif getElementData(player, "Wrestler") then
		if data == "Wrestlers" then
			if getElementData(thebag, "Wrestlers") > 1 then
				wwe = true
				if executeCommandHandler("leave") then
					removeCommandHandler("leave")
				elseif aclT then
					killTimer(aclT)
					aclT = false
				end
			else
				aclT = setTimer(function()
						aclT = false
						if not wwe then
							outputChatBox(lmctext, 0, 255, 0)
							addCommandHandler("leave", function() triggerServerEvent("SEndWWE", player, player) end)
						end
				end, 30000, 1)
			end
		end
	elseif data == "Wrestlers" and Window_wwe then
		guiSetText(lbl_fighters, 'The wrestlers: '..getElementData(thebag, "Wrestlers"))
	end]]--@--
	if data == "Stats" and getPlayerTeam(player) == getTeamFromName("Police") or data == "WantLvl" and getPlayerTeam(player) == getTeamFromName("Police") then
		PSBC(source)
	elseif data == "Stats" and source == player then
		if getElementData(player, data) > 1 then
			if fpis then
				killTimer(fpis)
				fpis = nil
			end
			protect = nil
			detachElements(player)
			showCursor(false)
			if FWIND[msell] then
				destroyElement(FWIND[msell])
				FWIND[msell] = nil
				removeEventHandler("onClientGUIChanged", resourceRoot, OCGCCET) -- edit nu9aif
				Silenced_Ammo_E = nil
				Grenade_Ammo_E = nil
				Gas_Ammo_E = nil
				GL_Ammo_E = nil
				DS_SE = nil
			end
			cash = 0
			packL = nil
			packB = 0
			if JobW then
				destroyElement(JobW)
				JobW = nil
			end
			ics = nil
			job = nil
			msell = nil

			if Window_CarsForCr then
				guiSetVisible(Window_CarsForCr, false)
			end
			setTimer(setElementFrozen,250,1,player,false)
			setElementFrozen(player,false)
		end
	elseif data == "Stats" and getElementData(source, data) > 1 and getElementData(source, data) < 4 then
		--outputChatBox("d = q")
		if source == robber then
			--outputChatBox("s = r a q")
			if robM then
				--outputChatBox("rM")
				if source == player and robber == player then
					
					if oldv == player then
						setElementData(source, "Rob", nil)
					end 
				elseif robbed == player then
					--outputChatBox("rd = p")
					if robber then
					triggerServerEvent("RobMoney",resourceRoot,robber,robbed,robM,tlng[plng][30],tlng[plng][31])
					end 
				end
				robber = nil
				robbed = nil
				robM = nil
			end
		end
		if source == player then
			setPedWeaponSlot(player,0)
			unbindKey("group_control_back", "down", Pticket)
			unbindKey("sub_mission", "down", Pticket)
			if bbag then
				triggerServerEvent("DBFR", resourceRoot,player, bx, by, gz)
				bbag = nil
			end
			if GUIEditor.window[1] then
				destroyElement(GUIEditor.window[1])
				GUIEditor.window[1] = nil
				txtc = nil
			end
			if GUIEditor.window[2] then
				destroyElement(GUIEditor.window[2])
				GUIEditor.window[2] = nil
			end
			if GUIEditor.window[3] then
				destroyElement(GUIEditor.window[3])
				GUIEditor.window[3] = nil
			end
			HNAP = nil
			HSPC = nil
			PMS = nil
			OCPQ(source,true)
		else
			if getElementData(player, "DL") then
				if getElementData(player, "DL") == source then
					setElementData(player, "DL", nil)
				end
			--[[elseif getElementData(source, "Job") > 3 then
				if FWIND[source] then
					Cwindow(source)
				end]]
			end
		end
		if FWIND[source] then
			Cwindow(source)
		end
	elseif data == "Hits" and getElementData(player, "Job") < 2 and getPlayerTeam(player) == getTeamFromName("No Taem") then
	       TeamColor (source,player,data)
	elseif data == "Job" then
		--outputChatBox("d = j")
		if source ~= player and getElementData(player,"Stats") > 3 then
			--outputChatBox("s > 3")
			if source == getPlayerFromName(getElementData(player, "Kid")) then
				--outputChatBox("s = k")
				if getElementData(source, "Hits") then
					--outputChatBox("h")
					if getElementData(source, "Job") ~= 3 then
						--outputChatBox("j ~= 3")
						setElementData(player, "Stats", 0)
						triggerServerEvent("freeK", resourceRoot, player)
					end
				end
			end
		end
		if source == player then
			--outputChatBox("s = p")
			if getElementData(player, "Job") > 4 then
				if not showp then
					showp = true
					addCommandHandler("offer", toggoff)
					setElementData(player, "Offering", true)
					--[[if not somtext then
						somtext = "Shop opened"
					end]]
					exports["guimessages"]:outputClient(tlng[plng][49], 0, 255, 0)
					if getElementData(player,"DL") then
						setElementData(player,"DL",nil)
					end
					if getElementData(player, "Job") < 9 then
						addEventHandler("onClientRender", root, showPack)
					end
				elseif getElementData(player, "Job") > 8 and showp then
					removeEventHandler("onClientRender", root, showPack)
				end
			else
				if showp then
					showp = nil
					removeEventHandler("onClientRender", root, showPack)
					removeCommandHandler("offer", toggoff)
					setElementData(player, "Offering", nil)
				end
			end
			if getElementData(player, "Job") < 2 and getPlayerTeam(player) == getTeamFromName("No Team") and not hits then
				hits = call(getResourceFromName("scoreboard"), "scoreboardAddColumn", "Hits")
			elseif hits then
				call(getResourceFromName("scoreboard"), "scoreboardRemoveColumn", "Hits")
				hits = nil
			end
			if getElementData(player, "Job") == 2 then
				--outputChatBox("j = 2")
				erob = setTimer(function()
						erob = nil
				end, 30000, 1)
				--bindKey("aim_weapon", "down", toggle)
				--bindKey("aim_weapon", "up", toggle)
			else
				--if oldv == 2 then
					--unbindKey("aim_weapon", "down", toggle)
					--unbindKey("aim_weapon", "up", toggle)
					unbindKey("action", "up", rob, player)
				--end
			end
		--elseif getElementData(source, "Job") > 3 then
			--CMOCRS(source)
		end
	elseif data == "Offering" then
		--outputChatBox("data changed0-1")
		if getElementType(source) == "player" and source == player and getElementData(player,"DL") then
			--outputChatBox("data changed0-2")
			setElementData(player, "DL", nil)
			--CMOCRS(source)
		end
	elseif data == "DL" and source == player then
		local PLR = getElementData(player,data)
		if PLR then
			outputChatBox(getPlayerName(PLR).." is shopping from you",0,255,255)
		elseif getPlayerTeam(player) then
			outputChatBox("Your customer has finished shopping from you",255,0,255)
		end
	--[[
	elseif data == "DL" and source == msell then
		--outputChatBox("closing...")
		if getElementType(source) == "player" and getElementData(source, data) then
			if getElementData(source, data) ~= player then
			--outputChatBox("closing...2")
				protect = false
				detachElements(player)
				showCursor(false)
				destroyElement(FWIND[msell])
				FWIND[msell] = false
				if Silenced_Ammo_E or DS_SE then
					removeEventHandler("onClientGUIChanged", resourceRoot, OCGCCET) -- edit nu9aif
					Silenced_Ammo_E = false
					Grenade_Ammo_E = false
					Gas_Ammo_E = false
					GL_Ammo_E = false
					DS_SE = false
				else
					if msell ~= player and cash and packB then
						triggerServerEvent("GPC", msell, msell, cash, packB)
					end
				end
				cash = 0
				packL = false
				packB = 0
				if JobW then
					destroyElement(JobW)
					JobW = false
				end
				ics = false
				job = false
				msell = false
			end
		end
		--]]
	elseif data == "protect" and source == player then
		--setElementData(source, data, getElementData(source, data))
		if getElementData(player, data) then
			ptt = setTimer(function() ptt = nil setElementData(player, "protect", nil) end, 1440000, 1)
		end
	elseif data == "Prisoners" and source == player and getElementData(player, "Prisoners") < 1 then
		destroyMjail ()
		if knhoB1 then
			destroyElement(knhoB1)
			knhoB1 = nil
		end
		if knhoB2 then
			destroyElement(knhoB2)
			knhoB2 = nil
		end
		if knhoB3 then
			destroyElement(knhoB3)
			knhoB3 = nil
		end
	elseif data == "Bank" and Bank_W then
		--guiSetText(CB_L, "$"..getElementData(player, "Bank"))
	elseif data == "Money" and source == player then
		setPlayerMoney(getElementData(source, data))
	elseif data == "MCH" then
		if source == player and not getElementData(source,data) then
			outputChatBox("Period of rent of your home has ended",255,255,0)
			if GUIEditor.window[4] then
				destroyElement(GUIEditor.window[4])
				GUIEditor.window[4] = nil
				showCursor(false)
			end
			TTF()
		elseif source == TAT then
			outputChatBox("Period of rent of your friend's home has ended",255,255,0)
			TTF()
		end
	elseif data == "PLVL" or data == "GLVL" then
		if oldv and oldv > 0 and getElementData(source,data) > oldv and not LUMK[source] then
			LUMK[source] = {}
			LUMK[source][1] = guiCreateLabel(0,0,w/11,h/38,"Promoted Level "..getElementData(source,data),false)--w/11,h/38
			guiSetFont(LUMK[source][1],"default-bold-small")
			guiSetVisible(LUMK[source][1],false)
			x,y,z = getElementPosition(source)
			LUMK[source][2] = {}
			LUMK[source][2][1] = createMarker(x,y,z,"cylinder",.1,math.random(0,255),math.random(0,255),math.random(0,255))
			LUMK[source][3] = playSound3D("sounds/1.mp3",x,y,z)
			setSoundMaxDistance(LUMK[source][3],60)
			setTimer(function(PLR)
				if LUMK[PLR] then
					destroyElement(LUMK[PLR][1])
					for k,v in pairs(LUMK[PLR][2]) do
						destroyElement(v)
					end
					LUMK[PLR] = nil
				end
			end,getSoundLength(LUMK[source][3])*1000,1,source)
			attachElements(LUMK[source][3],source)
			attachElements(LUMK[source][2][1],source,0,0,-1)
			if not lur then
				lur = true
				addEventHandler("onClientRender",root,RDLU)
			end
		end
	elseif data == "CPTGS" then
		if MST and STE then
			if getElementData(source,"TFT") == getTeamName(getPlayerTeam(player)) then
				if getElementAlpha(MST) == 255 then
					CER(STE,"GXP","GLVL")
					vT = {}
					vT[player] = {"+"..math.ceil(STE).." Tag"}
					FOPEC(vT)
					MST,STE = nil,nil
				end
			elseif not getElementData(source,"TFT") and getElementData(source,"TFG") == getTeamName(getPlayerTeam(player)) then
				if getElementAlpha(MST) == 1 then
					CER(STE,"GXP","GLVL")
					vT = {}
					vT[player] = {"+"..math.ceil(STE).." Tag"}
					FOPEC(vT)
					--
					MST,STE = nil,nil
				end
			end
		end
	end
	if source == player then
		if data == "GXP" or data == "PXP" or data == "PLVL" or data == "GLVL" then
			if getElementData(source,MCTL) > 0 then
			    DXLEVEL = getElementData(player,MCTL)
		        DXXP = getElementData(player,MCTX)
				onWonXP ()
			end
		elseif data == "KidH" then
		    if oldv and not getElementData(source,data) then
                if Rransom then
                   Rransom = false
				   removeEventHandler("onClientRender", root, ransom)
                   unbindKey("group_control_back", "down", FpayR, player)
                   toggleControl("fire", true)
                   toggleControl("enter_exit", true)
                   toggleControl("next_weapon", true)
                   toggleControl("previous_weapon", true)
                end   
			end
		elseif data == "HSHTR" then
			if not getElementData(player,"HSHTR") then
				if oldv and type(oldv) == "table" then
					setElementAlpha(player,255)
					if isElement(oldv[1]) then
						setElementAlpha(oldv[1],255)
					end
					if WATH[player] and isElement(WATH[player]) then
						setElementAlpha(WATH[player],255)
						if WATHb[player] and isElement(WATHb[player]) then
							setElementAlpha(WATHb[player],255)
						end
					end
				end
				unbindKey("next_weapon","down",MPHS)
				unbindKey("previous_weapon","down",MPHS)
				unbindKey("jump","down",MPHS)
				unbindKey("enter_exit","down",MPHS)
				MCW = nil
			end
		end
	end
end
addEventHandler("onClientElementDataChange", root, Foffer)
addEventHandler("DRB", root, Foffer)

function toggoff(cmd)
if toggoTime then return end
toggoTime = true
setTimer(function() toggoTime = nil end,2000,1)
	if cmd == "offer" then
		if getElementData(player, "Offering") then
			setElementData(player, "Offering", nil)
			exports["guimessages"]:outputClient(tlng[plng][50], 255, 0, 0)
		else
			setElementData(player, "Offering", true)
			exports["guimessages"]:outputClient(tlng[plng][49], 0, 255, 0)
		end
	elseif cmd == "sd" or cmd == "md" or cmd == "ed" then
		if healT then
			exports["guimessages"]:outputClient(tlng[plng][51], 255, 255, 0)
		elseif noD then
			exports["guimessages"]:outputClient(tlng[plng][52], 255, 255, 0)
		elseif getElementHealth(player) < 100 and getElementData(player, "Stats") < 2 and not getElementData(player, "Wrestler") and not fan then
			if cmd == "sd" and getElementData(player, "SDG") > 0 then
				HTime = 2000
				plusH = 2
				drugG = 2
				ddata = "SDG"
				dheal()
			elseif cmd == "md" and getElementData(player, "MDG") > 0 then
				HTime = 1000
				plusH = 1
				drugG = 1
				ddata = "MDG"
				dheal()
			elseif cmd == "ed" and getElementData(player, "EDG") > 0 then
				HTime = 1000
				plusH = 2
				drugG = 1
				ddata = "EDG"
				dheal()
			else
				exports["guimessages"]:outputClient(tlng[plng][53], 255, 255, 0)
			end
		else
			exports["guimessages"]:outputClient(tlng[plng][52], 255 , 255, 0)
		end
	elseif cmd == "td" then
		if healT then
			exports["guimessages"]:outputClient(tlng[plng][54], 255, 255, 0)
			killTimer(healT)
			healT = nil
			HTime = nil
			plusH = nil
			drugG = nil
			ddata = nil
			noD = setTimer(function()
				noD = nil
			end, 120000, 1)
		else
			exports["guimessages"]:outputClient(tlng[plng][52], 255, 255, 0)
		end
	end
	--triggerServerEvent("SED", root, player, off)
end
addCommandHandler("sd", toggoff)
addCommandHandler("md", toggoff)
addCommandHandler("ed", toggoff)
addCommandHandler("td", toggoff)

function dheal()
	--outputChatBox("1")
	healT = setTimer(function()
		--outputChatBox("2")
		if getElementHealth(player) < 1 then
			killTimer(healT)
			healT = nil
			HTime = nil
			plusH = nil
			drugG = nil
			ddata = nil
		else
			if getElementData(player, ddata) < 1 then
				setElementData(player, ddata, 0)
				killTimer(healT)
				healT = nil
				HTime = nil
				plusH = nil
				drugG = nil
				ddata = nil
				noD = setTimer(function()
					noD = nil
				end, 120000, 1)
			else
				if getElementData(player, ddata) < 2 then
					plusH = 1
					drugG = 1
				end
				setElementHealth(player, getElementHealth(player)+plusH)
				cph = getElementHealth(player)
				setElementData(player, ddata, getElementData(player, ddata)-drugG)
				if getElementHealth(player) > 99 then
					setElementHealth(player, 100)
					cph = getElementHealth(player)
					killTimer(healT)
					healT = nil
					HTime = nil
					plusH = nil
					drugG = nil
					ddata = nil
					noD = setTimer(function()
						noD = nil
					end, 120000, 1)
				end
				if getElementData(player, "WantLvl") < 3 then
					x, y, z = getElementPosition(player)
					for k,v in pairs(getElementsWithinColShape(OPWC,"player")) do
						--if getElementData(player, "WantLvl") < 3 then
							if getPlayerTeam(v) == getTeamFromName("Police") then
								--x, y, z = getElementPosition(player)
								vx, vy, vz = getElementPosition(v)
								dist = getDistanceBetweenPoints3D(x, y, z, vx, vy, vz)
								if dist < 30 then
									setElementData(player, "WantLvl", 3)
									break
								end
							end
						--end
					end
				end
			end
		end
	end, HTime, 0)
end

function SToffer()
	--if getElementHealth(player) > 0 then
	--outputChatBox(offers)
	if getElementData(player, "Stats") < 2 and not getElementData(player, "Wrestler") and not Bank_W then
		local offers,num,veh = 0,5,getPedOccupiedVehicle(localPlayer)
		for _,t in pairs({drugsD,pizzaD,burgerD,cluckD,mechD}) do
			for k,v in pairs(t) do
				--outputChatBox(k)
				local PLR = getPlayerFromName(k)
				if not PLR or PLR and not isElementWithinColShape(PLR,jiconr) or not t[k] or PLR and getElementData(PLR,"Job") ~= num then
					--outputChatBox("R")
					t[k] = nil
					--table.remove(t,k)
				elseif t[k] and getElementData(PLR,"Offering") and getElementData(PLR,"DLP") and getElementData(PLR,"DLP") > 0 and getElementData(PLR,"Stats") < 2 and getElementData(player,"Stats") < 2 then
					if t ~= mechD or t == mechD and veh and getVehicleOccupant(veh) == localPlayer then
						--outputChatBox("ok")
						offers = offers+1--outputChatBox("ok")
					end
				end
			end
			num = num+1
		end
		--outputChatBox(offers)
		--local offers = #drugsD+#pizzaD+#burgerD+#cluckD
		if offers > 0 then
			--outputChatBox("g")
			if offers > 1 then
				showCursor(true)
				if not SWIND then
					SWIND = guiCreateWindow(w/5,h/1.5,w/2.87,h/2.94,"sellers",false)
					guiWindowSetSizable(SWIND,false)

					sellers_list = guiCreateGridList(w/57,h/30,w/4.6,h/3.68,false,SWIND)
					guiGridListSetSelectionMode(sellers_list,2)

					sellr = guiGridListAddColumn(sellers_list,"Sellers",0.6)
					sells = guiGridListAddColumn(sellers_list,"Offers",0.3)

					button_buy = guiCreateButton(w/4,h/17.2,w/12.5,h/6.6,"buy",false,SWIND)
					button_exit = guiCreateButton(w/4,h/4.2,w/12.5,h/13.3,"Exit",false,SWIND)
				end
			end
			showit = nil
			for k,v in pairs(getElementsWithinColShape(jiconr,"player")) do
				if offers == 1 then
					if drugsD[getPlayerName(v)] or pizzaD[getPlayerName(v)] or burgerD[getPlayerName(v)] or cluckD[getPlayerName(v)] or mechD[getPlayerName(v)] then
						showit = v
						break
					end
				else
					Swindow(v)
				end
			end
			if showit then
				buyWind(showit)
			end
		end
	end
	unbindKey("conversation_no", "down", SToffer)
	unbindKey("sub_mission", "down", SToffer)
	setTimer(function() bindKey("conversation_no", "down", SToffer) bindKey("sub_mission", "down", SToffer) end,2000,1)
end
bindKey("conversation_no", "down", SToffer)
bindKey("sub_mission", "down", SToffer)

function buyWind(v)
	if getElementData(v, "DL") then
		exports["guimessages"]:outputClient(tlng[plng][55], 255, 255, 0)
	elseif getElementData(v, "Stats") < 2 and getElementData(player, "Stats") < 2 then
		--outputChatBox("opening...")
		triggerServerEvent("Cust",resourceRoot,player,v,player) 
		--[[
		if drugsD[getPlayerName(v)] and getTeamN(player) ~= "Police" then
			if getElementData(v, "DLP") > 0 then
				SDSW(v)
				addEventHandler("onClientGUIChanged", resourceRoot, OCGCCET) -- edit nu9aif
				showCursor(true)
			else
				drugsD[getPlayerName(v)] = nil
				--table.remove(drugsD,getPlayerName(v))
			end
		else--]]
		if pizzaD[getPlayerName(v)] then
			ResN = "Well Stacked Pizza Co."
			GUICB(v)
			GUICPZ(v)
			showCursor(true)
		elseif burgerD[getPlayerName(v)] then
			ResN = "Burger Shot"
			GUICB(v)
			GUICBS(v)
			showCursor(true)
		elseif cluckD[getPlayerName(v)] then
			ResN = "Cluckin' Bell"
			GUICB(v)
			GUICCB(v)
			showCursor(true)
		elseif mechD[getPlayerName(v)] then
			msell = v
			FWIND[v] = guiCreateWindow(369,256,255,148,"Mechinic",false)
			rpeng = guiCreateButton(32,33,188,32,"Repair engine $350",false,FWIND[v])
			fullf = guiCreateButton(32,74,188,32,"full fix $500",false,FWIND[v])
			cmech = guiCreateButton(111,116,23,18,"X",false,FWIND[v])
			showCursor(true)
		end
	end
end

function Swindow(v)
	if drugsD[getPlayerName(v)] then
		JNrow[v] = 'drugs'
	elseif pizzaD[getPlayerName(v)] then
		JNrow[v] = 'pizza'
	elseif burgerD[getPlayerName(v)] then
		JNrow[v] = 'burger'
	elseif cluckD[getPlayerName(v)] then
		JNrow[v] = 'chicken'
	elseif mechD[getPlayerName(v)] then
		JNrow[v] = 'Mechanic'
	end
	if JNrow[v] then
		srow[v] = guiGridListAddRow(sellers_list)
		guiGridListSetItemText(sellers_list, srow[v], sellr, getPlayerName(v), false, false)
		guiGridListSetItemText(sellers_list, srow[v], sells, JNrow[v], false, false)
	end
end

function Cwindow(v,arga)
	--outputChatBox("-1 offers")
	if arga then
		--[[offers = offers-1
		if offers < 0 then
			offers = 0
		end]]
		if drugsD[getPlayerName(v)] then
			drugsD[getPlayerName(v)] = nil
			--table.remove(drugsD,getPlayerFromName(v))
			--drugsD[v] = nil
			--drugsDs = drugsDs-1
		elseif pizzaD[getPlayerName(v)] then
			pizzaD[getPlayerName(v)] = nil
			--table.remove(pizzaD,getPlayerName(v))
			--pizzaD[v] = nil
			--pizzaDs = pizzaDs-1
		elseif burgerD[getPlayerName(v)] then
			burgerD[getPlayerName(v)] = nil
			--table.remove(burgerD,getPlayerName(v))
			--burgerD[v] = nil
			--burgerDs = burgerDs-1
		elseif cluckD[getPlayerName(v)] then
			cluckD[getPlayerName(v)] = nil
			--table.remove(cluckD,getPlayerName(v))
			--cluckD[v] = nil
			--cluckDs = cluckDs-1
		elseif mechD[getPlayerName(v)] then
			mechD[getPlayerName(v)] = nil
			--table.remove(mechD,getPlayerName(v))
			--mechD[v] = nil
		end
	end
	if FWIND[v] then
		--outputChatBox("closing")
		protect = nil
		if Silenced_Ammo_E or DS_SE then
			removeEventHandler("onClientGUIChanged", resourceRoot, OCGCCET) -- edit nu9aif
		end
		if msell ~= player and v == msell then
			if cash > 0 and packB > 0 then
				triggerServerEvent("GPC",resourceRoot,player,msell,cash,packB)
			end
			triggerServerEvent("Cust",resourceRoot,player,msell)
		end
		detachElements(player)
		destroyElement(FWIND[msell])
		FWIND[msell] = nil
		Silenced_Ammo_E = nil
		Grenade_Ammo_E = nil
		Gas_Ammo_E = nil
		GL_Ammo_E = nil
		DS_SE = nil
		Wlvl = nil
		msell = nil
		cash = 0
		packL = nil
		packB = 0
		if JobW then
			destroyElement(JobW)
			JobW = nil
		end
		ics = nil
		job = nil
		showCursor(false)
	elseif SWIND then
		guiGridListRemoveRow(sellers_list ,srow[v])
	end
end
addEventHandler("onClientPlayerSpawn", root, Foffer)
addEventHandler("onClientPlayerQuit", root, Foffer)
setTimer(Foffer, 1000, 1)

FSalp = true
function SCT(arga)
	if source == player then
		if getElementData(source,"Kills") < 0 then
			setElementData(source,"Kills",0)
		end
		if arga == getTeamFromName("Police") then
			MCTX = "PXP"
			MCTL = "PLVL"
		else
			MCTX = "GXP"
			MCTL = "GLVL"
		end
		if DXLEVEL then
		    DXLEVEL = getElementData(player,MCTL)
		    DXXP = getElementData(player,MCTX) 
		end
		cph = getElementHealth(player)
		cpa = getPedArmor(player)
		setElementData(source, "Alive", true)
		setCameraTarget(source)
		if not getElementData(source, "Job") then
			setElementData(source, "Job", 1)
		end
		if getElementData(source, "Job") < 2 and getPlayerTeam(source) == getTeamFromName("No Team") and not hits then
			hits = call(getResourceFromName("scoreboard"), "scoreboardAddColumn", "Hits")
		elseif getElementData(source, "Job") < 2 and getPlayerTeam(source) ~= getTeamFromName("No Team") and hits then
			call(getResourceFromName("scoreboard"), "scoreboardRemoveColumn", "Hits")
			hits = nil
		elseif getElementData(source, "Job") > 4 and not showp then
			showp = true
			addCommandHandler("offer", toggoff)
			setElementData(player, "Offering", true)
			exports["guimessages"]:outputClient(tlng[plng][49], 0, 255, 0)
			setElementData(player, "DL", nil)
			addEventHandler("onClientRender", root, showPack)
		end
		if getElementData(player, "Stats") > 3 then
			--outputChatBox(getElementData(player, "KidJ"))
			if getPlayerFromName(getElementData(player, "Kid")) then
				--outputChatBox("fe")
				if getElementData(getPlayerFromName(getElementData(player, "Kid")), "Job") == 3 then
					--outputChatBox("fe1")
					triggerServerEvent("Kidnapped", resourceRoot, player, false, getElementData(player, "KidH"))
				else
					--outputChatBox("fe2")
					setElementData(player, "Stats", 0)
					triggerServerEvent("freeK", resourceRoot, player)
				end
			elseif getElementData(player, "KidJ") == 3 then
				--outputChatBox("kj = 3")
				triggerServerEvent("Kidnapped", resourceRoot, player, false, getElementData(player, "KidH"))
			else
				--outputChatBox("e")
				setElementData(player, "Stats", 0)
				triggerServerEvent("freeK", resourceRoot, player)
			end
		end
		if getElementData(player,"DRep") then
			if not Salp and not FSalp then
				Salp = 0
				addEventHandler("onClientRender", root, showRep)
				setTimer(function()
					removeEventHandler("onClientRender", root, showRep)
					Salp = nil
				end, 3000, 1)
			else
				FSalp = nil
			end
			if not RepT then
				RepT = setTimer(function()
					dxUpdateScreenSource(scr[scrn])
					scrn = scrn+1
					if scrn > 30 then
						scrn = 1
					end
				end,100, 0)
			end
		end
	end
end
addEventHandler("onClientPlayerSpawn", player, SCT)

function showPack()
  if getElementData(player,"Job" ) ~= 4 then
	dxDrawFramedText('Pack: '..getElementData(player, "DLP"), w/136.6, h/1.09, w/8, h/30, tocolor(0, 255, 0, 255), 1)
   end
end

function PSBC(v)
	csx, csy, csz = getElementPosition(v)
	ATEL = getAttachedElements(v)
	for k,element in pairs(ATEL) do
		if getElementType(element) == "blip" then
			--if csx == -4000 and csy == -4000 or csx == 0 and csy == 0 then
				--setBlipColor(element, 0, 0, 0, 0)
			if getPlayerTeam(v) == getTeamFromName("Police") then
				setPlayerNametagColor(v, 0, 0, 255)
				setBlipColor(element, 0, 0, 255, 255)
			elseif getElementData(v, "Stats") > 1 then
				setPlayerNametagColor(v, 0, 0, 0)
				setBlipColor(element, 0, 0, 0, 255)
			elseif getElementData(v,"WantLvl") then
				if getElementData(v, "WantLvl") < 1 then
					setPlayerNametagColor(v, 255, 255, 255)
					setBlipColor(element, 255, 255, 255, 255)
				elseif getElementData(v, "WantLvl") < 3 then
					setPlayerNametagColor(v, 255, 255, 0)
					setBlipColor(element, 255, 255, 0, 255)
				elseif getElementData(v, "WantLvl") < 5 then
					setPlayerNametagColor(v, 255, 128, 0)
					setBlipColor(element, 255, 128, 0, 255)
				elseif getElementData(v, "WantLvl") < 7 then
					setPlayerNametagColor(v, 255, 0, 0)
					setBlipColor(element, 255, 0, 0, 255)
				end
			end
		end
	end
end

function SBC(v) 
	ATEL = getAttachedElements(v)
	for k,element in pairs(ATEL) do
		if getElementType(element) == "blip" then 
		    local team = getPlayerTeam(v)
			if team and team ~= getTeamFromName("No Team") then 
		        local r, g, b = getTeamColor ( team )
				setPlayerNametagColor(v, r, g, b )
				setBlipColor(element, r, g, b , 255)
			elseif team and team == getTeamFromName("No Team") then
				setPlayerNametagColor(v, 255, 255, 255)
				setBlipColor(element, 255, 255, 255, 255)
			end
			if getElementData(player, "Job") < 2 and getElementData(v, "Hits") and getPlayerTeam(player) == getTeamFromName("No Team") then
				setBlipColor(element, 255, 0, 0, 255)
			end 
		end
	end
end

-------------------------------------------------------------------------------------------------
--[[armsDs = 0
drugsDs = 0
pizzaDs = 0
burgerDs = 0
cluckDs = 0]]

cash = 0

--offers = 0
jicon = {}

FWIND = {}
armsD = {}
drugsD = {}
pizzaD = {}
burgerD = {}
cluckD = {}
mechD = {}
JNrow = {}

pzr1 = createMarker(374, -119, 1002, "corona", 1) --, 255, 0, 0, 255
pzr2 = createMarker(376, -119, 1002, "corona", 1)
pzr3 = createMarker(378, -119, 1002, "corona", 1)

bsr1 = createMarker(376, -68, 1002, "corona", 1)
bsr2 = createMarker(378, -68, 1002, "corona", 1)

cbr1 = createMarker(369, -6, 1002, "corona", 1)
cbr2 = createMarker(372, -6, 1002, "corona", 1)

function GUICB(v)
    --[[
	if guiGetVisible(animationWindow) then
		guiSetVisible(animationWindow,false)
		showCursor(false)
	end
	--]]
	FWIND[v] = guiCreateWindow(w/4, h/2.3, w/2, h/1.82, ResN,false)
	--guiWindowSetMovable(FWIND[v],false)
	guiWindowSetSizable(FWIND[v],false)

	BL = guiCreateButton(w/80, math.ceil(h/5.2174), math.ceil(w/4.4444), h/30, "$10", false, FWIND[v])
	BM = guiCreateButton(math.ceil(w/3.8095), math.ceil(h/5.2174), math.ceil(w/4.4444), h/30, "$25", false, FWIND[v])
	BB = guiCreateButton(w/80, h/2.4, math.ceil(w/4.4444), h/30, "$50", false, FWIND[v])
	BH = guiCreateButton(math.ceil(w/3.8095), h/2.4, math.ceil(w/4.4444), h/30, "$40", false, FWIND[v])
	BE = guiCreateButton(w/80, h/2, math.ceil(w/1.6667), h/30, "Exit", false, FWIND[v])

	cash = 0
	packB = 0
	if v == player then
		fpis = setTimer(function()
			fpis = nil
			x, y, z = getElementPosition(player)
			SetElementPosition(el, x, y, z)
			attachElements(player, el)
		end, 500, 1)
		packL = 1
	else
		packL = getElementData(v, "DLP")
	end
	msell = v
end

function GUICPZ(v)
	guiCreateStaticImage(0, h/60, w/4, h/6, "food/PIZLOW.png", false , FWIND[v])
	guiCreateStaticImage(w/4, h/60, w/4, h/6, "food/PIZMED.png", false , FWIND[v])
	guiCreateStaticImage(0, math.ceil(h/4.2857), w/4, h/6, "food/PIZHIG.png", false , FWIND[v])
	guiCreateStaticImage(w/4, math.ceil(h/4.2857), w/4, h/6, "food/PIZHEAL.png", false , FWIND[v])
	if v == player then
		if getElementData(v, "Job") == 6 then
			BP = guiCreateButton(w/80, h/2.17, math.ceil(w/1.6667), h/30, "200 food $1500", false, FWIND[v])
		elseif getPlayerTeam(v) == getTeamFromName("No Team") then
			pdj = guiCreateButton(w/80, h/2.17, math.ceil(w/1.6667), h/30, "Pizza Delivery Job", false, FWIND[v])
		end
	end
end

function GUICBS(v)
	guiCreateStaticImage(0, h/60, w/4, h/6, "food/BURLOW.png", false , FWIND[v])
	guiCreateStaticImage(w/4, h/60, w/4, h/6, "food/BURMED.png", false , FWIND[v])
	guiCreateStaticImage(0, math.ceil(h/4.2857), w/4, h/6, "food/BURHIG.png", false , FWIND[v])
	guiCreateStaticImage(w/4, math.ceil(h/4.2857), w/4, h/6, "food/BURHEAL.png", false , FWIND[v])
	if v == player then
		if getElementData(v, "Job") == 7 then
			BP = guiCreateButton(w/80, h/2.17, math.ceil(w/1.6667), h/30, "200 food $400", false, FWIND[v])
		elseif getPlayerTeam(v) == getTeamFromName("No Team") then
			bdj = guiCreateButton(w/80, h/2.17, math.ceil(w/1.6667), h/30, "Burger Delivery Job", false, FWIND[v])
		end
	end
end

function GUICCB(v)
	guiCreateStaticImage(0, h/60, w/4, h/6, "food/CLULOW.png", false , FWIND[v])
	guiCreateStaticImage(w/4, h/60, w/4, h/6, "food/CLUMED.png", false , FWIND[v])
	guiCreateStaticImage(0, math.ceil(h/4.2857), w/4, h/6, "food/CLUHIG.png", false , FWIND[v])
	guiCreateStaticImage(w/4, math.ceil(h/4.2857), w/4, h/6, "food/CLUHEAL.png", false , FWIND[v])
	if v == player then
		if getElementData(v, "Job") == 8 then
			BP = guiCreateButton(w/80, h/2.17, math.ceil(w/1.6667), h/30, "200 food $400", false, FWIND[v])
		elseif getPlayerTeam(v) == getTeamFromName("No Team") then
			cdj = guiCreateButton(w/80, h/2.17, math.ceil(w/1.6667), h/30, "Chicken Delivery Job", false, FWIND[v])
		end
	end
end

addEventHandler("onClientPedDamage", root, cancelEvent)
addEventHandler("onClientPedChoke", root, cancelEvent)

-------------------------------------------------------------------------------------------------

setGarageOpen(8, true)
setGarageOpen(11, true)
setGarageOpen(12, true)

pns1 = createColCuboid(2057, -1836, 13, 14, 9, 4)
pnsd1 = createColCuboid(2070, -1834, 13, 1.5, 5, 4)

pns2 = createColCuboid(1022, -1029, 30, 6, 11, 4)
pnsd2 = createColCuboid(1022, -1029, 30, 6, 1.5, 4)

pns3 = createColCuboid(483, -1747, 9, 7, 12, 7)
pnsd3 = createColCuboid(483, -1735, 9, 7, -1.5, 7)

jea = createColRectangle(1554.2, -1672.8, -1, 3)
jeb = createColRectangle(1587.3, -1675.2, 3, -1)

function DrawB()
	--GVCU = getVehicleCompatibleUpgrades(sveh, VUSN)
	for i=0, 16 do
		for k,v in pairs(getVehicleCompatibleUpgrades(sveh, i)) do
			--outputChatBox(v)
			--outputChatBox(getVehicleUpgradeSlotName(i).." = "..v)
			--if v == 1013 or v == 1024 or v == 1111 or v == 1112 or v == 1109 or v == 1110 then
				--outputChatBox(v)
			--end
			if not VUBS[VUSB[i]] then
				--for l,b in pairs(VUS[VUSN]) do
					--if v == b then--and not VUBS[VUSB[VUSN]] 
					GVUS = VUS[i]
					if GVUS[v] then
						--outputChatBox(getVehicleUpgradeSlotName(i))
						--outputChatBox(VUSN)
						--outputChatBox("Creating Button")
						VUSB[i] = guiCreateButton(w/136.6, h/20*NOB-h/128, w/13.66, h/30,getVehicleUpgradeSlotName(i),false,VUSW[0])
						guiSetFont(VUSB[i],"default-bold-small")
						VUBS[VUSB[i]] = i
						NOB = NOB+1
						VUW[i] = guiCreateWindow(w, h, w, h,getVehicleUpgradeSlotName(i),false)
						guiWindowSetSizable(VUW[i], false)
						guiSetVisible(VUW[i], false)
						Carts[VUW[i]] = 0
						NURB[VUW[i]] = guiCreateRadioButton(w/136.6, h/30-h/128, w/9, h/30,"None",false,VUW[i])
						guiRadioButtonSetSelected(NURB[VUW[i]], true)
						guiSetProperty(NURB[VUW[i]], "NormalTextColour", "FF00FF00")
						guiSetFont(NURB[VUW[i]],"default-bold-small")
						VUBS[NURB[VUW[i]]] = -1
						NORB[NURB[VUW[i]]] = i
						NORB[VUW[i]] = 2
					end
					--GVUS = VUS[i]
				--end
			end
			guiSetSize(VUW[i], w/7.6, h/30*NORB[VUW[i]]+h/39, false)
			VUSRB[v] = guiCreateRadioButton(w/136.6, h/30*NORB[VUW[i]]-h/128, w/8.5, h/30,GVUS[v][1].." $"..GVUS[v][2],false,VUW[i])
			guiSetFont(VUSRB[v],"default-bold-small")
			Carts[VUSRB[v]] = GVUS[v][2]
			VUBS[VUSRB[v]] = v
			NORB[VUW[i]] = NORB[VUW[i]]+1
		end
	end
	--if VUSN > 14 then
		NOB = NOB-.2
		VURA = guiCreateRadioButton(w/54, h/20*NOB-h/128, w/45.53, h/51.2, "$", false, VUSW[0])
		guiSetProperty(VURA, "NormalTextColour", "FF009600")
		VURB = guiCreateRadioButton(w/21, h/20*NOB-h/128, w/45.53, h/51.2, "Ǥ", false, VUSW[0])
		guiSetProperty(VURB, "NormalTextColour", "FFFFAA00")
		NOB = NOB+.5
		guiRadioButtonSetSelected(VURA, true)
		ctx = "$"
		CRNC = "Money"

		VUB[0] = guiCreateButton(w/136.6, h/20*NOB-h/128, w/13.66, h/30,"Buy $0",false,VUSW[0])
		guiSetProperty(VUB[0], "NormalTextColour", "FF005900")
		NOB = NOB+1
		guiSetSize(VUSW[0], w/11.4, h/20*NOB+h/24, false)
		VUB[1] = guiCreateButton(w/136.6, h/20*NOB-h/128, w/13.66, h/30,"Exit",false,VUSW[0])
		--removeEventHandler("onClientRender", root, DrawB)

		showCursor(true)
		GVUS = nil
		NOB = 1
		
	for i=0, 16 do
		--for k,v in pairs(getVehicleUpgrades(sveh)) do
		if getVehicleUpgradeOnSlot(sveh, i) and VUSRB[getVehicleUpgradeOnSlot(sveh, i)] then
			--VUBS[VUW[i]] = getVehicleUpgradeOnSlot(sveh, i)
			NORB[VUW[i]] = VUBS[VUSRB[getVehicleUpgradeOnSlot(sveh, i)]]
			guiSetProperty(NURB[VUW[i]], "NormalTextColour", "FFFFFFFF")
			guiRadioButtonSetSelected(VUSRB[getVehicleUpgradeOnSlot(sveh, i)], true)
			guiSetProperty(VUSRB[getVehicleUpgradeOnSlot(sveh, i)], "NormalTextColour", "FF00FF00")
			Carts[VUSRB[getVehicleUpgradeOnSlot(sveh, i)]] = 0
		elseif VUW[i] then
				NORB[VUW[i]] = nil
			--end
		end
		--end
	end
	--end
	--VUSN = VUSN+1
end

VSa = createColCuboid(1038.4, -1025.4, 30, 6.6, 18.4, 6)
VSad = createColCuboid(1038.4, -1025.4, 30, 6.6, 1.5, 6)
createBlip(1042,-1015,0,27,2,255,0,0,255,0,400)

function onSpray(p)
local CSH = source
	if source == OPWC and getElementData(player,"EPerk") and isElement(getElementData(player,"EPerk")) and getElementType(getElementData(player,"EPerk")) == "object" then
		if isElement(p) then
			if getElementType(p) == "player" or getElementType(p) == "vehicle" then
				setElementCollidableWith(getElementData(player,"EPerk"),p,false)
			end
		end
	end
	if getElementData(source,"Stinger") and isPedInVehicle(player) and wheel[p] then
		if getElementData(player,"Stats") ~= 0 or getElementData(player,"WantLvl") > 0 then
			--if p == wlf or p == wrf or p == wlb or p == wrb or p == wft or p == wre then
				if not WRC then
					WRC = source
					--addEventHandler("onClientRender",root,RWPCC)
					--outputChatBox("hit")
				end
				CCWP(p)
			--end
		end
	end
	if getElementType(p) == "vehicle" then
		driver = getVehicleOccupant(p)
		if driver == player then
			if CSH == Mbag then
				bagm = true
			elseif CSH == pns1 or CSH == pns2 or CSH == pns3 then
				spray = true
			elseif CSH == VSa then
				vshop = true
			end
		end
	elseif p == player then
		bbd = nil
		ee1 = nil
		jj = nil
		ojj = nil
		dbank = nil
		bagm = nil
		if getPlayerTeam(p) == getTeamFromName("Police") then
			if CSH == cb then
				bbd = true
			elseif CSH == ce1 then
				ee1 = true
			elseif CSH == c1 then
				jj = 1
			elseif CSH == c2 then
				jj = 2
			elseif CSH == c3 then
				jj = 3
			elseif CSH == c4 then
				jj = 4
			elseif CSH == c5 then
				jj = 5
			elseif CSH == c6 then
				jj = 6
			elseif CSH == c7 then
				jj = 7
			elseif CSH == c8 then
				jj = 8
			elseif CSH == c9 then
				jj = 9
			elseif CSH == c10 then
				jj = 10
			elseif CSH == c11 then
				jj = 11
			elseif CSH == c12 then
				jj = 12
			elseif CSH == c13 then
				jj = 13
			elseif CSH == c14 then
				jj = 14
			elseif CSH == c15 then
				jj = 15
			elseif CSH == c16 then
				jj = 16
			elseif CSH == c17 then
				jj = 17
			elseif CSH == c18 then
				jj = 18
			elseif CSH == c19 then
				jj = 19
			elseif CSH == c20 then
				jj = 20
			elseif CSH == c21 then
				jj = 21
			elseif CSH == c22 then
				jj = 22
			elseif CSH == c23 then
				jj = 23
			elseif CSH == c24 then
				jj = 24
			elseif CSH == c25 then
				jj = 25
			elseif CSH == c26 then
				jj = 26
			elseif CSH == c27 then
				jj = 27
			elseif CSH == c28 then
				jj = 28
			elseif CSH == c29 then
				jj = 29
			elseif CSH == c30 then
				jj = 30
			elseif CSH == c31 then
				jj = 31
			elseif CSH == c32 then
				jj = 32
			elseif CSH == c33 then
				jj = 33
			elseif CSH == c34 then
				jj = 34
			elseif CSH == c35 then
				jj = 35
			elseif CSH == c36 then
				jj = 36
			elseif CSH == cr then
				jj = 37
			elseif CSH == ce2 then
				jj = 38
			end
		else
			if getElementData(p, "Stats") > 2 then
				if CSH == jea or CSH == jeb then
					removeEventHandler("onClientRender", root, jailTime)
					if jte then
						unbindKey("group_control_back", "down", bailing)
						jte = nil
					end
					triggerServerEvent("JailEscape", resourceRoot, player, bc1, bc2)
					jTime = nil
				end
			end
			if getPlayerTeam(p) ~= getTeamFromName("Medic") then
				if CSH == oj then
					ojj = true
					--guiSetVisible(animationWindow,false)
					showCursor(false)
				elseif CSH == bdc then
					dbank = true
				end
			end
		end
		if CSH == Mbag then
			bagm = true
		end
	elseif isElement(p) and getElementType(p) == "player" then
		if source == jiconr then
			if getElementData(p,"Offering") and getElementData(p,"DLP") and getElementData(p,"DLP") > 0 and getElementData(p,"Stats") < 2 and getElementData(player,"Stats") < 2 then
				if getElementData(p,"Job") < 6 and getPlayerTeam(player) ~= getTeamFromName("Police") or getElementData(p,"Job") > 5 then
					jicon[p] = getElementData(p,"Job")
				end
				--offers = offers+1
			 
				if getElementData(p,"Job") == 5 and getPlayerTeam(player) ~= getTeamFromName("Police") then
					drugsD[getPlayerName(p)] = true
				elseif getElementData(p,"Job") == 6 then
					pizzaD[getPlayerName(p)] = true
				elseif getElementData(p,"Job") == 7 then
					burgerD[getPlayerName(p)] = true
				elseif getElementData(p,"Job") == 8 then
					cluckD[getPlayerName(p)] = true
				elseif getElementData(p,"Job") == 9 then
					mechD[getPlayerName(p)] = true
				end
				if SWIND then
					Swindow(p)
				end
			end
			if not jicon[p] and getElementData(p,"Mute") then
				jicon[p] = "m"
			end
		elseif source == OPWC then
			if robT and isTimer(robT) then
				killTimer(robT)
			end
		end
	end
end
addEventHandler("onClientColShapeHit", root, onSpray)

function Spray(p,arga,argb)
local CSL = source
	if isElement(p) then
		if p == player then
			if argb then
				tpiiav = nil
				setPedWeaponSlot(player,0)
			end
			if CSL == cb then
				bbd = nil
			elseif CSL == ce1 then
				ee1 = nil
			elseif CSL == oj then
				if hlspdpc then
					triggerServerEvent("HPCF", resourceRoot,player)
					hlspdpc = nil
				 end
				ojj = nil
			elseif CSL == bdc then
				dbank = nil
			elseif bagm then
				bagm = nil
			else
				jj = nil
			end
		elseif getElementType(p) == "vehicle" then
			driver = getVehicleOccupant(p)
			if driver == player then
				if CSL == pnsd1 or CSL == pnsd2 or CSL == pnsd3 then
					if spray then
						if  getElementData(player, "Money") >= 100 then
							sprayd = true
						else
							exports["guimessages"]:outputClient(tlng[plng][25], 255, 255, 0)
						end
					else
						sprayd = nil
						spray = nil
					end
				elseif CSL == VSad then
					if vshop then
						local dacc
						if getElementData(player, "WantLvl") > 2 then
							for k,v in pairs(getElementsWithinColShape(OPWC,"player")) do
								if getPlayerTeam(v) == getTeamFromName("Police") then
									x,y,z = getElementPosition(player)
									vx,vy,vz = getElementPosition(v)
									dist = getDistanceBetweenPoints3D(x,y,z,vx,vy,vz)
									if dist < 200 then
										dacc = true
										break
									end
								end
							end
						end
						if dacc then
							--dacc = nil
							outputChatBox("You need to lose the cops before entering the shop!", 255, 255, 0)
						else
							dacc = nil
							for k,v in pairs(getVehicleOccupants(veh)) do
								if v and v ~= player then
									dacc = true
									break
								end
							end
							if dacc then
								outputChatBox("All passengers must leave the vehicle before entering the shop!", 255, 255, 0)
							else
								vshopd = true
							end
							--dacc = nil
						end
					else
						vshopd = nil
						vshop = nil
					end
				else
					sprayd = nil
					spray = nil
					vshopd = nil
					vshop = nil
				end
			end
		elseif getElementType(p) == "player" then
			if source == jiconr then
				if jicon[p] then 
					jicon[p] = nil
				end
				if FWIND[p] then
					Cwindow(p)
				end
			elseif source == OPWC then
				if not isTimer(robT) then
					robT = setTimer(function()
						robT = nil
						if robber == player then
							outputChatBox("The money you have robbed it before in now yours!",0,255,0)
							setElementData(robber,"Rob",nil)
						end
						robber = nil
						robbed = nil
						robM = nil
					end,300000,1)
				end
			end
		end
		if source == OPWC then
			if getElementType(p) == "player" and p ~= player then
				if WATH[p] then
					DTWSTPB(p,WATH,WATHb)
				end
				if WPP[p] then
					DTWSTPB(p,WPP,WPPb)
				end
				if WPH[p] then
					DTWSTPB(p,WPH,WPHb)
				end
				if WPM[p] then
					DTWSTPB(p,WPM,WPMb)
				end
				if WPA[p] then
					DTWSTPB(p,WPA)
				end
				if WPN[p] then
					DTWSTPB(p,WPN)
				end
			elseif getElementData(player,"EPerk") and isElement(getElementData(player,"EPerk")) and p == getElementData(getElementData(player,"EPerk"),"Stinger") then
				triggerServerEvent("DSPPE",resourceRoot,player,"EPerk")
			end
		end
	end
end
addEventHandler("onClientVehicleStartExit", root, Spray)
addEventHandler("onClientColShapeLeave", root, Spray)

function CCWP(hitp)
	veh = getPedOccupiedVehicle(player)
	xx,yy,zz = getElementPosition(veh)
	x,y,z = getVehicleComponentPosition(veh,wheel[hitp][1])
	xx,yy,zz = xx+x,yy+y,zz+z
	gz = getGroundPosition(xx,yy,zz)
	x,y,z = getElementPosition(hitp)
	--outputChatBox(gz.." - "..z.." = "..gz-z)
	gz = z-gz
	sx,sy,sz = getElementPosition(getElementData(WRC,"Stinger"))
	--outputChatBox(getDistanceBetweenPoints3D(x,y,z,sx,sy,sz))
	if gz < .2 and gz > -.4  and getDistanceBetweenPoints3D(x,y,z,sx,sy,sz) < 2.7 then
		wfl,wrl,wfr,wrr = getVehicleWheelStates(veh)
		--if hitp == wlf or hitp == wft then
		if wheel[hitp][2] == 1 then
			setVehicleWheelStates(veh,1,wrl,wfr,wrr)
		--elseif hitp == wlb or hitp == wre then
		elseif wheel[hitp][2] == 2 then
			setVehicleWheelStates(veh,wfl,1,wfr,wrr)
		--elseif hitp == wrf then
		elseif wheel[hitp][2] == 3 then
			setVehicleWheelStates(veh,wfl,wrl,1,wrr)
		--elseif hitp == wrb then
		elseif wheel[hitp][2] == 4 then
			setVehicleWheelStates(veh,wfl,wrl,wfr,1)
		end
	end
	veh,xx,yy,zz,x,y,z,gz,wfl,wrl,wfr,wrr,sx,sy,sz = nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil
end

function OCPQ(PLR,arga)
	if WATH[PLR] and arga then
		DTWSTPB(PLR,WATH,WATHb)
	end
	if WPP[PLR] then
		DTWSTPB(PLR,WPP,WPPb)
	end
	if WPH[PLR] then
		DTWSTPB(PLR,WPH,WPHb)
	end
	if WPM[PLR] then
		DTWSTPB(PLR,WPM,WPMb)
	end
	if WPA[PLR] then
		DTWSTPB(PLR,WPA)
	end
	if WPN[PLR] then
		DTWSTPB(PLR,WPN)
	end
end
--addEventHandler("onClientPlayerQuit",root,OCPQ)

function HWASCSAC(key,state,pass)
	if state == "down" then
		if getPedWeaponSlot(player) < 1 and getElementData(player,"EPerk") and getElementType(getElementData(player,"EPerk")) == "object" then
			toggleControl("enter_exit",false)
		else
			if not wicdm then
				toggleControl("fire",true)
			end
			if getPedWeapon(player) == 34 or getPedWeapon(player) == 43 then
				if not DAH or pass then
					DAH = true
				--if getPedWeapon(player) == 34 or getPedWeapon(player) == 43 then
					if not getPedTask(player,"primary",0) and not getPedTask(player,"primary",1) and not getPedTask(player,"primary",2) and not getPedTask(player,"primary",3) then
						addEventHandler("onClientRender",root,DCCH)
					else
						setTimer(HWASCSAC,50,1,key,state,true)
					end
				end
			end
		end
	elseif state == "up" then
		if getPedWeaponSlot(player) > 1 and getPedWeaponSlot(player) < 8 then
			toggleControl("fire",false)
		else
			if getPedWeaponSlot(player) < 1 and getElementData(player,"EPerk") and getElementType(getElementData(player,"EPerk")) == "object" then
				toggleControl("enter_exit",true)
			else
				if wicdm then
					toggleControl("fire",true)
				end
			end
		end
		if DAH then
			DAH = nil
			if WATH[player] or getPedWeapon(player) == 43 then
				if WATH[player] then
					setElementAlpha(WATH[player],255)
				end
				if WPP[player] then
					setElementAlpha(WPP[player],255)
				end
				if WPPb[player] then
					setElementAlpha(WPPb[player],255)
				end
				if WPH[player] then
					setElementAlpha(WPH[player],255)
				end
				if WPHb[player] then
					setElementAlpha(WPHb[player],255)
				end
				if WPM[player] then
					setElementAlpha(WPM[player],255)
				end
				if WPMb[player] then
					setElementAlpha(WPMb[player],255)
				end
				if WPA[player] then
					setElementAlpha(WPA[player],255)
				end
				if WPN[player] then
					setElementAlpha(WPN[player],255)
				end
			end
			removeEventHandler("onClientRender",root,DCCH)
		end
	end
	toggle(key,state)
end

function DCCH()
	if not getPedTask(player,"primary",0) then
		if WATH[player] and getElementAlpha(WATH[player]) > 0 or getPedWeapon(player) == 43 then
			if WATH[player] then
				setElementAlpha(WATH[player],0)
			end
			if WPP[player] then
				setElementAlpha(WPP[player],0)
			end
			if WPPb[player] then
				setElementAlpha(WPPb[player],0)
			end
			if WPH[player] then
				setElementAlpha(WPH[player],0)
			end
			if WPHb[player] then
				setElementAlpha(WPHb[player],0)
			end
			if WPM[player] then
				setElementAlpha(WPM[player],0)
			end
			if WPMb[player] then
				setElementAlpha(WPMb[player],0)
			end
			if WPA[player] then
				setElementAlpha(WPA[player],0)
			end
			if WPN[player] then
				setElementAlpha(WPN[player],0)
			end
		end
	elseif getPedTask(player,"primary",0) then
		if WATH[player] and getElementAlpha(WATH[player]) < 1 or getPedWeapon(player) == 43 then
			if WATH[player] then
				setElementAlpha(WATH[player],255)
			end
			if WPP[player] then
				setElementAlpha(WPP[player],255)
			end
			if WPPb[player] then
				setElementAlpha(WPPb[player],255)
			end
			if WPH[player] then
				setElementAlpha(WPH[player],255)
			end
			if WPHb[player] then
				setElementAlpha(WPHb[player],255)
			end
			if WPM[player] then
				setElementAlpha(WPM[player],255)
			end
			if WPMb[player] then
				setElementAlpha(WPMb[player],255)
			end
			if WPA[player] then
				setElementAlpha(WPA[player],255)
			end
			if WPN[player] then
				setElementAlpha(WPN[player],255)
			end
		end
	end
end

function RSOWS()
	resetWorldSounds()
	toggleAllControls(true, true, false)
	setElementFrozen(player,false)
	detachElements(player)
	setElementData(player,"Kills",nil)
	setElementData(player,"Deaths",nil)
end
addEventHandler("onClientResourceStop",resourceRoot,RSOWS)

function Action(key, keyState)
	if key == "action" or key == "sub_mission" then
		if keyState == "down" and getElementHealth(player) > 0 then
			if ojj then
				if ojj then
					hlspdpc = true
				end
				triggerServerEvent("TOCJ", resourceRoot, player, ojj, false, false, false)
				ojj = nil
				--dbank = nil
				--guiSetVisible(animationWindow,false)
				showCursor(false)
			end
		end
	end
end
bindKey("action", "down", Action)
bindKey("sub_mission", "down", Action)

--[[function RepairSFE()
	playSoundFrontEnd(46)
	if not Rsound then
		Rsound = true
		setTimer(RepairSFE, 200, 9)
	end
end]]

-----------------------------------------------------------------------------------------

function onrend()
	dxDrawFramedText(getElementData(player, "GLA"), w/80, h/60, w/1.31, h/7, tocolor(255,255,255,255), w/800, "bankgothic","right")
end

function ONWPSwitch(ps,cs)
	--outputDebugString("ONWPSwitch")
	if getPedWeapon(player) > 29 and getPedWeapon(player) < 32 then
		if getPedStat(source,weapFunc[getPedWeapon(player)][4]) > 500 then
			if not arh then
				addEventHandler("onClientRender", root, onrend)
				bindKey("sprint", "down", throwGrenade)
				arh = true
			end
		end
	else
		if arh then
			removeEventHandler("onClientRender", root, onrend)
			unbindKey("sprint", "down", throwGrenade)
			arh = nil
		end
	end
	if thebag and getElementData(thebag, "HAC") > 0 and not aswc then
		if getPedWeapon(source, 1) > 1 and getPedTotalAmmo(source, 1) > 0 and getPedWeapon(source, 1) ~= 3 or getPedWeapon(source, 2) > 1 and getPedTotalAmmo(source, 2) > 1500 or getPedWeapon(source, 3) > 1 and getPedTotalAmmo(source, 3) > 1000 or getPedWeapon(source, 4) > 1 and getPedTotalAmmo(source, 4) > 2000 or getPedWeapon(source, 5) > 1 and getPedTotalAmmo(source, 5) > 3000 or getPedWeapon(source, 6) > 1 and getPedTotalAmmo(source, 6) > 1000 or getPedWeapon(source, 7) > 1 and getPedTotalAmmo(source, 7) > 0 or getPedWeapon(source, 8) > 1 and getPedTotalAmmo(source, 8) > 4 or getPedWeapon(source, 8) > 17 and getPedTotalAmmo(source, 8) > 0 or getPedWeapon(source, 9) > 1 and getPedTotalAmmo(source, 9) > 999999999 or getPedWeapon(source, 10) > 1 and getPedTotalAmmo(source, 10) > 0 or getPedWeapon(source, 11) > 1 and getPedTotalAmmo(source, 11) > 0 and getPedWeapon(source, 11) ~= 46 or getPedWeapon(source, 12) > 1 and getPedTotalAmmo(source, 12) > 0 then
			triggerServerEvent("ABAC", resourceRoot,player, getWeaponNameFromID(getPedWeapon(player)))
			aswc = setTimer(function() aswc = nil end, 5000, 1)
		end
	end
	if not NewWeapon then return end
	if ps > 1 and ps < 7 then
		mwp = getElementData(player,"MAW")
		if getPedTotalAmmo(player,ps) < 1 and mwp[ps] then
			mwp[ps] = nil
			setElementData(player,"MAW",mwp)
			mwp = nil
		elseif getPedTotalAmmo(player,ps) > 0 and not mwp[ps] then
			mwp[ps] = true
			setElementData(player,"MAW",mwp)
			mwp = nil
		end
	end
	if cs > 1 and cs < 7 then
		if not getControlState("aim_weapon") then
			toggleControl("fire",false)
		end
		setPlayerHudComponentVisible("weapon",false)
		--isSgun = false
	else
		if not wicdm then
			toggleControl("fire",true)
		end
		setPlayerHudComponentVisible("weapon",true)
		--isSgun = false
	end
	if getElementData(source,"Stats") > -1 and getElementData(source,"Stats") < 2 and not isSgun then
		CNRSWID(source)
	else
		OCPQ(source,true)
	end
	ARSTP(source,cs,true)
end
addEventHandler("onClientPlayerWeaponSwitch", player, ONWPSwitch)

OPWC = createColSphere(0,0,0,300)
attachElements(OPWC,player)
function COPWCS()
 --if not isSgun then
	for k,v in pairs(getElementsWithinColShape(OPWC,"player")) do
		if v and getPedWeapon(v) then
			if v ~= player then
				if getElementData(v,"Stats") > -1 and getElementData(v,"Stats") < 2 and getElementHealth(v) > 0 then
					CNRSWID(v)
				else
					OCPQ(v,true)
				end
			end
			ARSTP(v,getPedWeaponSlot(v))
		end
	end
  --end	
end

function ARSTP(PLR,cs,argd)
	arga = getElementData(PLR,"EPerk")
	if arga and getElementType(arga) == "object" then
		if isPedInVehicle(PLR) then
			setElementAlpha(arga,0)
		else
			setElementAlpha(arga,255)
			if cs == 0 then
				if PLR == player and argd then
					toggleControl("fire",false)
				end
				exports.bone_attach:attachElementToBone(arga,PLR,9,.1,.15,.35,30,195,-70)
				if getPedTask(PLR,"secondary",0) == "TASK_SIMPLE_FIGHT" then
					setElementCollisionsEnabled(arga,true)
				else
					setElementCollisionsEnabled(arga,false)
				end
			else
				if PLR == player and argd then
					if cs > 1 and cs < 7 then
						toggleControl("fire",false)
					elseif not wicdm then
						toggleControl("fire",true)
					end
				end
				setElementCollisionsEnabled(arga,false)
				exports.bone_attach:attachElementToBone(arga,PLR,3,0,-.15,-.2,0,0,180)
			end
		end
	end
end

function throwGrenade()
	--outputDebugString("throwGrenade")
	if isPedOnGround(player) then
		if getElementData(player,"GLType") >= 0 and getElementData(player,"GLType") <= 3 and getElementInterior(player) == 0 and getElementDimension(player) == 0 then
			pedSlot = getPedWeaponSlot ( player )
			if pedSlot == 5 then
				grenades = getElementData(player,"GLA")
				if grenades > 0 then
					if (getControlState("aim_weapon") == true) then
						unbindKey("sprint", "down", throwGrenade, player)
						playSound("sounds/launcher_fire.mp3", false)
						setTimer(function()
							setPedAnimationN(player,"TEC","TEC_reload",1,false,false)
							setTimer(function()
								playSound("sounds/launcher_open.mp3")
								setTimer(function()
									playSound("sounds/launcher_insert.mp3")
									setTimer(function()
										playSound("sounds/launcher_close.mp3")
										setTimer(function()
											setPedAnimationN(player,"TEC","TEC_reload",-1,false,false)
											setTimer(function()
												setPedAnimationN(player)
												bindKey("sprint","down",throwGrenade)
												toggleControl("aim_weapon",true)
												toggleControl("jump",true)
												toggleControl("fire",true)
												toggleControl("next_weapon",true)
												toggleControl("previous_weapon",true)
											end,50,1)
										end,350,1)
									end,50,1)
								end,600,1)
							end,300,1)
						end,700,1)
						grenades = grenades-1
						setElementData(player, "GLA", grenades)

						toggleControl ("aim_weapon", false)
						toggleControl ("next_weapon", false)
						toggleControl ("previous_weapon", false)
						toggleControl ("jump", false)
						toggleControl ("fire", false)

						local cax,cay,caz = getCameraMatrix()--,tcx,tcy,tcz,roll,fov
						local tx,ty,tz = getWorldFromScreenPosition(w/1.89,h/2.5,5)
						local sx,sy,sz = (tx-cax)/5,(ty-cay)/5,(tz-caz)/5
						local arga
						if getElementData(player,"GLType") > 0 then
							arga = 17
						else
							arga = 21
							setElementData(player,"PV",{sx,sy,sz})
						end
						local x,y,z = getPedWeaponMuzzlePosition(player)
						local rx,ry = getElementRotation(WATH[player])
						createProjectile(player,arga,x,y,z,1,nil,ry,0,180+getPedCameraRotation(player),sx,sy,sz)--342
					end
				end
			end
		end
	end
end

addEventHandler("onClientProjectileCreation",root,function(arga)
	if getProjectileType(source) == 21 then
		argb = getElementData(arga,"PV")
		setElementVelocity(source,argb[1],argb[2],argb[3])
	end
  	
	if getElementType(arga) ~= "vehicle" and getPedWeapon(arga) < 32 and getPedWeapon(arga) > 29 then
		local x,y,z = getPedWeaponMuzzlePosition(arga)
		local rx,ry = getElementRotation(WATH[arga])
		createEffect("gunsmoke",x,y,z,ry,0,-getPedRotation(arga))
	end
end)
--[[
function Greload()
	--outputDebugString("Greload")
	setPedAnimationN(player, "TEC", "TEC_reload", 1, false, false)
end

function open()
	--outputDebugString("open")
	playSound("sounds/launcher_open.mp3", false)
	setTimer(insert, 600, 1)
end

function insert()
	--outputDebugString("insert")
	playSound("sounds/launcher_insert.mp3", false)
	setTimer(Sclose, 50, 1)
end

function Sclose()
	--outputDebugString("close")
	playSound("sounds/launcher_close.mp3", false)
	setTimer (Gbind, 350, 1)
end

function Gbind()
	--outputDebugString("Gbind")
	setPedAnimationN(player, "TEC", "TEC_reload", -1, false, false)
	setTimer (ttrue, 50, 1)
end

function ttrue()
	--outputDebugString("ttrue")
	setPedAnimationN(player)
	bindKey("sprint", "down", throwGrenade)
	toggleControl("aim_weapon", true)
	toggleControl("jump", true)
	toggleControl("fire", true)
	toggleControl("next_weapon", true)
	toggleControl("previous_weapon", true)
end
]]
--------------------------------------------------------------------

function kiddPs()
	Window_kid = guiCreateWindow(w/3, h/6 ,w/2.16,h/1.4,"Kidnapped players in this house",false)
	--guiWindowSetMovable(Window_kid,false)
	guiWindowSetSizable(Window_kid,false)

	Grid_playersname = guiCreateGridList(w/80,h/23,w/3.8,h/1.52,false,Window_kid)
	guiGridListSetSelectionMode(Grid_playersname,2)
	guiGridListSetSortingEnabled(Grid_playersname, false)

	column = guiGridListAddColumn(Grid_playersname, "Kidnapped players", .8)

	lbl_ransommoney = guiCreateLabel(w/3.52,h/6,w/5.84,h/27,"Ransom: $"..CashFdia,false,Window_kid)
	guiSetFont(lbl_ransommoney,"clear-normal")

	Button_pay = guiCreateButton(w/3.3,h/3.12,w/7.8,h/4.88,"Pay                 the               ransom",false,Window_kid)
	guiSetFont(Button_pay,"clear-normal")

	Button_kexit = guiCreateButton(w/3.25,h/1.67,w/8.16,h/16.2,"Exit",false,Window_kid)
	guiSetFont(Button_kexit,"clear-normal")
	if getElementData(player, "Job") ~= 3 and getPlayerTeam(player) == getTeamFromName("No Team") then
		knj = guiCreateButton(w/3.25,h/1.88,w/8.16,h/16.2,"Kidnapper Job",false,Window_kid)
	end
	fpis = setTimer(function()
		fpis = nil
		x, y, z = getElementPosition(player)
		SetElementPosition(el, x, y, z)
		attachElements(player, el)
	end, 500, 1)
end
 

-------------------------------------------- Hit-Man ---------------------------------------------

function placeHit(cmdN, id, amount)
if hitTime then return end
hitTime = true
setTimer(function() hitTime = nil end,30000,1)
	if id then
		id = tonumber(id)
		if id then
			if amount then
				amount = tonumber(amount)
				if amount then
					amount = math.ceil(amount)
					if amount > 0 then
						if amount <= getElementData(player, "Money") then
							send = nil
							for k, v in pairs(getElementsByType("player")) do
								if getElementData(v, "ID") == id then
									send = true
									triggerServerEvent("PHit", resourceRoot, player, id, amount)
									break
								end
							end
							if not send then
								exports["guimessages"]:outputClient(tlng[plng][48]..' '..id, 255, 255, 0)
							end
						else
							exports["guimessages"]:outputClient(tlng[plng][25], 255, 255, 0)
						end
					else
						exports["guimessages"]:outputClient(tlng[plng][56], 255, 0, 0)--"the amount of money must be over (0)!"
					end
				else
					exports["guimessages"]:outputClient(tlng[plng][56], 255, 0, 0)--"the amount of money should be a number only!"
				end
			else
				exports["guimessages"]:outputClient("/hit id money", 255, 255, 0)--"enter the amount of money hit"
			end
		else
			exports["guimessages"]:outputClient(tlng[plng][56], 255, 0, 0)--"the ID must be a number only!"
		end
	else
		exports["guimessages"]:outputClient("/hit id money", 255, 255, 0)--"enter a player id to place a hit on him"
	end
end
--addCommandHandler("hit", placeHit)

----------------------------------------------- Pickpocket -------------------------------------

PickpocketMark = {
{-74, -212, 6},
{577, 1223, 12.2},
{-2552.04639 , 927.07416 , 64},
{-2109.48242 , 1.04932 , 34.5},
}
isPickpocketMark = {}
for k,v in pairs(PickpocketMark) do
	local ppj = createMarker(v[1], v[2], v[3], "corona", 1)
	SetElementInterior(ppj, 1)
	isPickpocketMark[ppj] = true
	local bppj = createBlipAttachedTo(ppj, 34, 2.5, 0, 255, 0, 255, 0, 250)
	local cppj = createMarker(v[1], v[2], v[3]-1.5, "cylinder", 1, 255, 255, 255, 128)
end

function rob()
	targ = getPedTarget(player)
	if targ and isElement(targ) and not fan and not getElementData(player, "Wrestler") and not getElementData(player, "InMission") and not isElementWithinColShape(player, BlockKillInHospital) then
		if getElementType(targ) == "player" then
			if getPedWeapon(player) < 2 and arob and getElementHealth(player) > 0 and targ ~= player and getElementData(player, "Stats") < 2 and getElementData(targ, "Stats") < 2 and not isElementInMarkers (targ) then
				if targ then
					if getElementType(targ) == "player" then
						if getElementData(targ, "protect") then --if getElementHealth(targ) > 0 then
							exports["guimessages"]:outputClient(tlng[plng][57], 255, 255, 0)
						else
							x, y, z = getElementPosition(player)
							tx, ty, tz = getElementPosition(targ)
							dist = getDistanceBetweenPoints3D(x, y, z, tx, ty, tz)
							if dist < 2 and not isPedDead(targ) then
								if not erob then
									if not isTimer(robT) then
										sucper = math.random(1, 4)
										if sucper < 2 then
											triggerServerEvent("DRob", resourceRoot, player, targ)
											--erob = setTimer(function() erob = nil
											--end, 180000, 1)
											--if getPlayerTeam(targ) == getTeamFromName("Police") then
												if getElementData(player, "WantLvl") < 3 then
													setElementData(player, "WantLvl", 3)
												end
											--else
												--SPWLAR()
											--end
										else
											--[[if getPlayerTeam(targ) == getTeamFromName("Police") then
												if getElementData(player, "WantLvl") < 2 then
													setElementData(player, "WantLvl", 2)
												end
											else]]
												SPWLAR()
											--end
											exports["guimessages"]:outputClient(tlng[plng][58]..' '..getPlayerName(targ)..' !', 255, 0, 0)
											erob = setTimer(function()
												erob = nil
											end, 120000, 1)
										end
									else
										outputChatBox("please stay out of sight from that guy you have robbed him before!",255,160,0)
									end
								else
									exports["guimessages"]:outputClient(tlng[plng][59], 255, 255, 0)
								end
							end
						end
					end
				end
			end
		end
	end
end

function SPWLAR()
	if getElementData(player, "WantLvl") < 3 then
		x, y, z = getElementPosition(player)
		for k,v in pairs(getElementsWithinColShape(OPWC,"player")) do
			if getPlayerTeam(v) == getTeamFromName("Police") then--and getElementData(player, "WantLvl") < 2
				--x, y, z = getElementPosition(player)
				vx, vy, vz = getElementPosition(v)
				dist = getDistanceBetweenPoints3D(x, y, z, vx, vy, vz)
				if dist < 30 then
					setElementData(player,"WantLvl",3)
					break
				end
			end
		end
	end
end

addEvent("robamount", true)
function Frobamount(rbr, rbd, cash)
	--if rbr == player or rbd == player then
		robber = rbr
		robbed = rbd
		robM = cash
		vTT = {}
		if rbr == player then
			vTT[player] = tlng[plng][60]..''..robM..' '..tlng[plng][61]..' '..getPlayerName(rbd)
			exports["guimessages"]:outputClient(vTT[player], 0, 255, 0)
			checkntf('g', 'pp', 'g',vTT)
			--setElementData(rbr, "Money", getElementData(rbr, "Money")+robM)
			--setElementData(rbr, "Scores", getElementData(rbr, "Scores")+1)
			givePlayerScore (rbr,1)
			--setElementData(rbr, "Rob", robM)
		elseif rbd == player then
			vTT[player] = getPlayerName(rbr)..' '..tlng[plng][62]..''..robM..' '..tlng[plng][63]
			exports["guimessages"]:outputClient(vTT[player], 255, 0, 0)
			checkntf('r', 'pp', 'r', vTT)
			--setElementData(rbd, "Money", getElementData(rbd, "Money")-robM)
			--setElementData(rbd, "Scores", getElementData(rbd, "Scores")-1)
			givePlayerScore (rbd,-1)
		end
		vTT = nil
		robT = setTimer(function()
			robT = nil
			if robber == player then
				outputChatBox("The money you have robbed it before in now yours!",0,255,0)
				setElementData(robber,"Rob",nil)
			end
			robber = nil
			robbed = nil
			robM = nil
		end,300000,1)
	--end
end
addEventHandler("robamount", root, Frobamount)

function toggle(key, keystate)
	if getElementData(player,"Job") == 2 then
		if keystate == "up" then
			arob = nil
			unbindKey("action", "up", rob, player)
		elseif keystate == "down" then
			arob = true
			bindKey("action", "up", rob, player)
		end
	end
end

----------------------------------------------- Bank ----------------------------------------
bk1 = createMarker(610.9 , -1257.8 , 1299, "corona", 1)
bk2 = createMarker(604.9 , -1257.8 , 1299, "corona", 1)


cbk1 = createMarker(610.9 , -1257.8, 1298.2, "cylinder", 1, 255, 255, 0, 128)
cbk2 = createMarker(604.9 , -1257.8, 1298.2, "cylinder", 1, 255, 255, 0, 128)


SetElementInterior(cbk1, 1)
SetElementInterior(cbk2, 1)


atm1 = createMarker(2069.8, -1770,12.4, "cylinder", 1, 255, 255, 0, 255)
atm2 = createMarker(2312, -1315, 23, "cylinder", 1, 255, 255, 0, 255)
atm3 = createMarker(1463, -1583.4, 12.5, "cylinder", 1, 255, 255, 0, 255)
atm5 = createMarker(364.25525,-2048.9, 6.78, "cylinder", 1, 255, 255, 0, 255)
atm6 = createMarker(1609.5, 1124.9, 9.8, "cylinder", 1, 255, 255, 0, 255)
atm7 = createMarker(2086, 2066.8, 10, "cylinder", 1, 255, 255, 0, 255)

atm8 = createMarker( -1981.72888 , 122.54002 , 26.5, "cylinder", 1, 255, 255, 0, 255)
atm9 = createMarker( -2439.33984 , 304.49142 , 34, "cylinder", 1, 255, 255, 0, 255)
atm10 = createMarker( -1647.71033 , 1214.65393 , 6.2, "cylinder", 1, 255, 255, 0, 255)

batm1 = createBlipAttachedTo(atm1, 52, 2, 255, 255, 255, 255, 0, 200)
batm2 = createBlipAttachedTo(atm2, 52, 2, 255, 255, 255, 255, 0, 200)
batm3 = createBlipAttachedTo(atm3, 52, 2, 255, 255, 255, 255, 0, 200)
batm5 = createBlipAttachedTo(atm5, 52, 2, 255, 255, 255, 255, 0, 200)
batm6 = createBlipAttachedTo(atm6, 52, 2, 255, 255, 255, 255, 0, 200)
batm7 = createBlipAttachedTo(atm7, 52, 2, 255, 255, 255, 255, 0, 200)

batm8 = createBlipAttachedTo(atm8, 52, 2, 255, 255, 255, 255, 0, 200)
batm9 = createBlipAttachedTo(atm9, 52, 2, 255, 255, 255, 255, 0, 200)
batm10 = createBlipAttachedTo(atm10, 52, 2, 255, 255, 255, 255, 0, 200)

setBlipVisibleDistance(batm1, 250)
setBlipVisibleDistance(batm2, 250)
setBlipVisibleDistance(batm3, 250)
setBlipVisibleDistance(batm5, 250)
setBlipVisibleDistance(batm6, 250)
setBlipVisibleDistance(batm7, 250)

setBlipVisibleDistance(batm8, 250)
setBlipVisibleDistance(batm9, 250)
setBlipVisibleDistance(batm10, 250)

objatm1 = createObject(2942, 2068.9, -1770,13.2,0,0,90)
objatm2 = createObject(2942, 2312.8, -1315, 23.5,0,0,270)
objatm3 = createObject(2942, 1463, -1582.5, 13)
objatm5 = createObject(2942, 364.25525,-2049.91626, 7.45,0,0,180)
objatm6 = createObject(2942, 1609.5, 1124, 10.4,0,0,180)
objatm7 = createObject(2942, 2085.1, 2066.8, 10.7,0,0,90)
objatm8 = createObject(2942, -1980.6, 122.5, 27,0,0,266)
objatm9 = createObject(2942, -2440.5, 304.8, 34.6,0,0,70)
objatm10 = createObject(2942, -1648, 1214, 6.8,0,0,134)

setObjectBreakable(objatm1, false)
setObjectBreakable(objatm2, false)
setObjectBreakable(objatm3, false)
setObjectBreakable(objatm5, false)
setObjectBreakable(objatm6, false)
setObjectBreakable(objatm7, false)
setObjectBreakable(objatm8, false)
setObjectBreakable(objatm9, false)
setObjectBreakable(objatm10, false)

setElementFrozen(objatm1, true)
setElementFrozen(objatm2, true)
setElementFrozen(objatm3, true)
setElementFrozen(objatm5, true)
setElementFrozen(objatm6, true)
setElementFrozen(objatm7, true)
setElementFrozen(objatm8, true)
setElementFrozen(objatm9, true)
setElementFrozen(objatm10, true)


MarkersBank = {
[1]= {261.29160 , 73.11038 , 977.4328},
[2]= {261.29160 , 70.7 , 977.4328},
[3]= {261.29160 , 68.7 , 977.4328},
[4]= {261.29160 , 66.9 , 977.4328},
[5]= {261.29160 , 75 , 977.4328},
[6]= {261.29160 , 87.6 , 977.4328},
[7]= {261.29160 , 90 , 977.4328},
[8]= {261.29160 , 92 , 977.4328},
[9]= {261.29160 , 94.4 , 977.4328},
[10]= {261.29160 , 96.5 , 977.4328},

}
isMarkersBank = {}

for i,v in ipairs(MarkersBank) do
    local marker = createMarker(v[1] , v[2] , v[3]+1, "corona", 1)
	isMarkersBank[marker] = true
	setElementAlpha(marker,0)
    local mm = createMarker(v[1] , v[2] , v[3], "cylinder", 1, 255, 255, 0, 128)
	setElementInterior(mm, 3)
	setElementDimension(mm,63)
end

function GUICBW()
	if exports["bank"]:bankVisible(true) then
		Bank_W = true
	end
end

vehicles = {596,598,597,523,599,427}

local screX, screY = guiGetScreenSize()
window = guiCreateWindow(screX / 2 - 100, screY / 2 - 150, 200, 350, "Selecting Vehicles Menu", false)
guiSetVisible(window, false)
guiWindowSetSizable(window, false)
local list = guiCreateGridList(0, 0.07, 1, 0.66, true, window)
local column = guiGridListAddColumn(list, "vehicle", 0.9)
local selectB = guiCreateButton(0.05, 0.75, 1, 0.1, "Select!", true, window)
local closeB = guiCreateButton(0.05, 0.86, 1, 0.1, "Close", true, window)

function onWaste()
     guiSetVisible(window, false)
     showCursor(false)
setTimer(setElementFrozen,50,1,player,false)
end
--@--addEventHandler("onClientPlayerWasted", getLocalPlayer(), onWaste)
addEventHandler("onClientGUIClick", closeB, onWaste, false)

for i,car in pairs(vehicles) do
	local row = guiGridListAddRow(list)
	guiGridListSetItemText(list, row, column, getVehicleNameFromModel(tonumber(car)), false, false)
end

if getPlayerTeam(player) == getTeamFromName("Police") then
	M1 = createMarker(1560, -1608.38, 12.4, "corona", 1.5, 0, 0, 255, 150)
	M2 = createMarker(1572, -1608.38, 12.4, "corona", 1.5, 0, 0, 255, 150)
	M3 = createMarker(1587.5, -1608.38, 12.4, "corona", 1.5, 0, 0, 255, 150)
	M4 = createMarker(1587.11, -1710.39, 5, "corona", 1.5, 0, 0, 255, 150)
	M5 = createMarker(1564.03, -1711.77, 5, "corona", 1.5, 0, 0, 255, 150)
                    -- new
					M6 = createMarker(2251.5, 2477, 10, "corona", 1.5, 0, 0, 255, 150)
                    M7 = createMarker(2258.8, 2477, 10, "corona", 1.5, 0, 0, 255, 150)
                    M8 = createMarker(2268.8, 2477, 10, "corona", 1.5, 0, 0, 255, 150)
                    M9 = createMarker(2277.2, 2477, 10, "corona", 1.5, 0, 0, 255, 150)
					
					
					-- new new
                    M10 = createMarker(-1592.65051 , 750.98499 , -5.5, "corona", 1.5, 0, 0, 255, 150)
                    M11 = createMarker(-1604.66931 , 749.09814 , -5.5, "corona", 1.5, 0, 0, 255, 150)
                    M12 = createMarker( -1600.68213 , 694.18231 , -5.5, "corona", 1.5, 0, 0, 255, 150)
					
  
					MM1 = createMarker(1560, -1608.38, 12.4, "cylinder", 1.5, 0, 0, 255, 150)
                    MM2 = createMarker(1572, -1608.38, 12.4, "cylinder", 1.5, 0, 0, 255, 150)
                    MM3 = createMarker(1587.5, -1608.38, 12.4, "cylinder", 1.5, 0, 0, 255, 150)
                    MM4 = createMarker(1587.11, -1711, 5, "cylinder", 1.5, 0, 0, 255, 150)
                    MM5 = createMarker(1564.03, -1711, 5, "cylinder", 1.5, 0, 0, 255, 150)
                    -- new
					MM6 = createMarker(2251.5, 2477, 10, "cylinder", 1.5, 0, 0, 255, 150)
                    MM7 = createMarker(2258.8, 2477, 10, "cylinder", 1.5, 0, 0, 255, 150)
                    MM8 = createMarker(2268.8, 2477, 10, "cylinder", 1.5, 0, 0, 255, 150)
                    MM9 = createMarker(2277.2, 2477, 10, "cylinder", 1.5, 0, 0, 255, 150)
					-- new new
                    MM10 = createMarker(-1592.65051 , 750.98499 , -5.5, "cylinder", 1.5, 0, 0, 255, 150)
                    MM11 = createMarker(-1604.66931 , 749.09814 , -5.5, "cylinder", 1.5, 0, 0, 255, 150)
                    MM12 = createMarker( -1600.68213 , 694.18231 , -5.5, "cylinder", 1.5, 0, 0, 255, 150)
end

function createTheChoosenCar()
	local row = guiGridListGetSelectedItem(list)
	if row and row >= 0 then
		guiSetVisible(window, false)
		setTimer(setElementFrozen,50,1,player,false)
		showCursor(false)
		triggerServerEvent("onCreatePoliceCar",resourceRoot, player, guiGridListGetItemText(list, row, column))
	end
end
addEventHandler("onClientGUIClick", selectB, createTheChoosenCar, false)
addEventHandler("onClientGUIDoubleClick", list, createTheChoosenCar, false)

addEventHandler("onClientElementDataChange",root,
function(dataName,old)
	if getElementType(source) == "player" and source == player and dataName == "Alive" then
		setTimer(function(source)
			if getElementData(source,"Alive") == true and not old then
				if getPlayerTeam(source) and getPlayerTeam(source) == getTeamFromName("Police") then
					if isElement(M1) then destroyElement(M1) end
					if isElement(M2) then destroyElement(M2) end
                    if isElement(M3) then destroyElement(M3) end
                    if isElement(M4) then destroyElement(M4) end
                    if isElement(M5) then destroyElement(M5) end
                    if isElement(M6) then destroyElement(M6) end
                    if isElement(M7) then destroyElement(M7) end
                    if isElement(M8) then destroyElement(M8) end
                    if isElement(M9) then destroyElement(M9) end
                    if isElement(M10) then destroyElement(M10) end
					if isElement(M11) then destroyElement(M11) end
					if isElement(M12) then destroyElement(M12) end
					
					if isElement(MM1) then destroyElement(MM1) end
                    if isElement(MM2) then destroyElement(MM2) end
                    if isElement(MM3) then destroyElement(MM3) end
                    if isElement(MM4) then destroyElement(MM4) end
                    if isElement(MM5) then destroyElement(MM5) end
					-- new
                    if isElement(MM6) then destroyElement(MM6) end
                    if isElement(MM7) then destroyElement(MM7) end
                    if isElement(MM8) then destroyElement(MM8) end
                    if isElement(MM9) then destroyElement(MM9) end
					-- new new
					if isElement(MM10) then destroyElement(MM10) end
					if isElement(MM11) then destroyElement(MM11) end
					if isElement(MM12) then destroyElement(MM12) end					
                    M1 = createMarker(1560, -1608.38, 12.4, "corona", 1.5, 0, 0, 255, 150)
                    M2 = createMarker(1572, -1608.38, 12.4, "corona", 1.5, 0, 0, 255, 150)
                    M3 = createMarker(1587.5, -1608.38, 12.4, "corona", 1.5, 0, 0, 255, 150)
                    M4 = createMarker(1587.11, -1711, 5, "corona", 1.5, 0, 0, 255, 150)
                    M5 = createMarker(1564.03, -1711, 5, "corona", 1.5, 0, 0, 255, 150)
                    -- new
					M6 = createMarker(2251.5, 2477, 10, "corona", 1.5, 0, 0, 255, 150)
                    M7 = createMarker(2258.8, 2477, 10, "corona", 1.5, 0, 0, 255, 150)
                    M8 = createMarker(2268.8, 2477, 10, "corona", 1.5, 0, 0, 255, 150)
                    M9 = createMarker(2277.2, 2477, 10, "corona", 1.5, 0, 0, 255, 150)
					-- new new
                    M10 = createMarker(-1592.65051 , 750.98499 , -5.5, "corona", 1.5, 0, 0, 255, 150)
                    M11 = createMarker(-1604.66931 , 749.09814 , -5.5, "corona", 1.5, 0, 0, 255, 150)
                    M12 = createMarker( -1600.68213 , 694.18231 , -5.5, "corona", 1.5, 0, 0, 255, 150)
					
					MM1 = createMarker(1560, -1608.38, 12.4, "cylinder", 1.5, 0, 0, 255, 150)
                    MM2 = createMarker(1572, -1608.38, 12.4, "cylinder", 1.5, 0, 0, 255, 150)
                    MM3 = createMarker(1587.5, -1608.38, 12.4, "cylinder", 1.5, 0, 0, 255, 150)
                    MM4 = createMarker(1587.11, -1711, 5, "cylinder", 1.5, 0, 0, 255, 150)
                    MM5 = createMarker(1564.03, -1711, 5, "cylinder", 1.5, 0, 0, 255, 150)
                    -- new
					MM6 = createMarker(2251.5, 2477, 10, "cylinder", 1.5, 0, 0, 255, 150)
                    MM7 = createMarker(2258.8, 2477, 10, "cylinder", 1.5, 0, 0, 255, 150)
                    MM8 = createMarker(2268.8, 2477, 10, "cylinder", 1.5, 0, 0, 255, 150)
                    MM9 = createMarker(2277.2, 2477, 10, "cylinder", 1.5, 0, 0, 255, 150)
					-- new new
                    MM10 = createMarker(-1592.65051 , 750.98499 , -5.5, "cylinder", 1.5, 0, 0, 255, 150)
                    MM11 = createMarker(-1604.66931 , 749.09814 , -5.5, "cylinder", 1.5, 0, 0, 255, 150)
                    MM12 = createMarker( -1600.68213 , 694.18231 , -5.5, "cylinder", 1.5, 0, 0, 255, 150)
					
				else
					if isElement(M1) then destroyElement(M1) end
                    if isElement(M2) then destroyElement(M2) end
                    if isElement(M3) then destroyElement(M3) end
                    if isElement(M4) then destroyElement(M4) end
                    if isElement(M5) then destroyElement(M5) end
					-- new
                    if isElement(M6) then destroyElement(M6) end
                    if isElement(M7) then destroyElement(M7) end
                    if isElement(M8) then destroyElement(M8) end
                    if isElement(M9) then destroyElement(M9) end
					-- new new
					if isElement(M10) then destroyElement(M10) end
					if isElement(M11) then destroyElement(M11) end
					if isElement(M12) then destroyElement(M12) end
					
					if isElement(MM1) then destroyElement(MM1) end
                    if isElement(MM2) then destroyElement(MM2) end
                    if isElement(MM3) then destroyElement(MM3) end
                    if isElement(MM4) then destroyElement(MM4) end
                    if isElement(MM5) then destroyElement(MM5) end
					-- new
                    if isElement(MM6) then destroyElement(MM6) end
                    if isElement(MM7) then destroyElement(MM7) end
                    if isElement(MM8) then destroyElement(MM8) end
                    if isElement(MM9) then destroyElement(MM9) end
					-- new new
					if isElement(MM10) then destroyElement(MM10) end
					if isElement(MM11) then destroyElement(MM11) end
					if isElement(MM12) then destroyElement(MM12) end					
				end
			end
		end,1000,1,source)
     end
end)

addEventHandler("onClientMarkerHit", root,
function(pp)
	if getElementType(pp) ~= "player" or pp ~= player or isPedInVehicle(pp) or getPlayerTeam(pp) ~= getTeamFromName("Police") then return end
	if source == M1 or source == M2 or source == M3 or source == M4 or source == M5 or source == M6 or source == M7 or source == M8 or source == M9 or source == M10 or source == M11 or source == M12 then
		if isOnTheHeightRange(pp, source) then
		
		if source == M1 or source == M2 or source == M3 or source == M4 or source == M5 then
                     if not addHeli then
                          if getElementData(pp,"PLVL") >= 10 then
                                addHeli = true
	                            local row = guiGridListAddRow(list)
	                            guiGridListSetItemText(list, row, column, getVehicleNameFromModel(tonumber(497)), false, false)				
			               end
                     end
		elseif addHeli then
		        for row=0,guiGridListGetRowCount(list)-1 do
					       if ( guiGridListGetItemText ( list, row, column ) == getVehicleNameFromModel(tonumber(497)) ) then
						        guiGridListRemoveRow ( list, row )
								addHeli = false
								
						   end
                     end			
		end
		setTimer(function(pp,source) local x, y, z = getElementPosition(source) local xx, yy, zz = getElementPosition(pp) SetElementPosition(pp, xx, yy, z+0.5) setElementFrozen(player,true) end,150,1,pp,source)
			guiSetVisible(window, true)
			showCursor(true)
		end
	end
end)

-- Cancel Heli Damge
function cancelDeath()
	cancelEvent()
end
addEventHandler("onClientPlayerHeliKilled", getLocalPlayer(), cancelDeath)

-- Cant Use Grnade inside the bulding !

--[[addEventHandler("onClientPreRender", root,
function()
	if getElementInterior(localPlayer) ~= 0 then
		local wp = getPedWeapon(localPlayer)
		if wp == 16 or wp == 17 or wp == 39 then
			if isControlEnabled("fire") then
				toggleControl("fire", false)
				stat = 0
			end
		elseif wp ~= 16 and wp ~= 17 and wp ~= 39 then
			if not isControlEnabled("fire") and stat == 0 then
				toggleControl("fire", true)
				stat = 1
			end
		end
	end
end)]]

--[[function ClientExplosionFunction()
 if getElementInterior(source) ~= 0  then
  cancelEvent ()
 end
end
addEventHandler("onClientExplosion", root, ClientExplosionFunction)]]--added to Iphone with FX sparks

-- ADD HEAL PLAYERS !

waitTimerHealth = {}

addEventHandler("onClientPlayerDamage", root,
function(attacker, weapon)
	if attacker and getElementType(attacker) == "player" and attacker ~= source then
		local Model = getElementModel(attacker)
		local Team = getPlayerTeam(attacker)
		if Team and (getTeamName(Team) == "Medic") and (weapon == 41) and (Model > 273 and Model < 277) then
			cancelEvent()
			if not isTimer(waitTimerHealth[source]) then
				--triggerServerEvent("healPlayer", attacker, source, attacker)--missing
				waitTimerHealth[source] = setTimer(function(p) waitTimerHealth[p] = nil end, 1500, 1, source)
			end
		end
	end
end)

function isOnTheHeightRange(player, marker)
	local _, _, Pz = getElementPosition(player)
	local _, _, Mz = getElementPosition(marker)
	if Mz + 5 >= Pz then
		return true
	end
end

-- HOLSTEN (TAPL = -_-""")
---- Vehicles Spawner

local x, y, z, r
local MarkersTable = {}
local vehicles = {458,483,489,543,542,462}
local MarkersPosition = {
	[1] = {1679, -2327.5, 12.5, 0}, -- LS AIR PORT 
	[2] = {-1385, -355, 13, 100}, -- SF AIR PORT
	[3] = {1711, 1517, 9.7, 180}, -- LV AIR PORT
	[4] = {2499, -1651.32 ,12.53, 175  , "Grove Street"}, -- GROVE STREET
	[5] = {1359, -1754, 12.4, 0}, -- POLICE LS
	[6] = {2216.80591, -1314.92834, 22.98438, 270  , "Ballas"}, -- BALLAS 
	[7] = {2292.79, -1115.81 ,36.98, 90, "Vagos"}, -- Vagus
	[8] = {1803.1, -1933.42 ,12.39, 0  , "Aztec"}, -- Azetcas 
	[10] = {1151.09,-1222.3,16.6, 180}, -- LS HOSPITAL
	[11] = {2680.76, -1697.33 ,8.41, 55}, -- WWE
	[12] = {1194.19, -1756.06 ,12.58, 90}, -- NO TEAM
	[13] = {1144.47, -1465.78 ,14.79, 0}, -- NO TEAM
	[14] = {1535.13, -1476.71 ,8.5, 0}, -- NO TEAM
	[15] = {2489.13, -1953.85, 12.42, 0}, -- NO TEAM
	[16] = {1427.47, -1056.45, 22.16, 0}, -- NO TEAM
	[17] = {1974.27, -1278.81, 22.82, 0}, -- NO TEAM
	[18] = {1946.59, -1362.73, 17.58, 90}, -- NO TEAM
	[19] = {-1861.45, 595.74, 34.17, 0}, -- BANK
	[20] = {-2136.47, -78.1, 34.32, 0}, -- WAREHOUSE
	[21] = {333.81, -1519.94, 34.87, 319}, -- Club
	[22] = {1771.77, -1344.41, 14.76, 177}, -- NO TEAM
	[23] = {1722.63, -1609.57, 12.55 , 1}, -- NO TEAM
	[24] = {-2022.86, 155.56, 27.83594 , 0}, -- RIFA
	[25] = {-2175.38, 704.29, 52.89063 , 180}, -- Champions
	[26] = {-2107.17, 903.50, 75.48021 , 360}, -- Champions2
	[27] = {-2621.01, 1379.10, 6.14884 , 180}, -- Mafia
	[28] = {-1704.59, 1339.44, 6.18072 , 136}, -- Russians
	[29] = {1624, 1820, 9.7, 0}, -- LV HOSPITAL
	
-- Fegas -------------------------
[30] = { -2749.18140 , -281.41211 , 7.03906-1.2,180 },
[31] = { -2656.72754 , -55.36950 , 4.33594-1.2,180 },
[32] = { -2562.88696 , 642.69104 , 14.45920-1.2 ,180},
[33] = { -2124.04614 , 387.40347 , 35.17188-1.2 ,180},
[34] = { -2507.48804 , 1219.48999 , 37.42833-1.2 ,180},
[35] = { -2752.80127 , -195.85204 , 7.01328-1.2 ,266.8},
[36] = { -2858.79224 , 1027.32605 , 36.65981-1.2 ,180},
[37] = { -2134.42798 , -404.42239 , 35.34301-1.2 ,90},
[38] = { -2451.39502 , 744.21808 , 35.01563-1.2 ,180},

-- LV -------------------------
[39] = { 1677.68921 , 1424.24951 , 10.77562-1.2 ,180},
[40] = { 2451.80322 , 1951.61462 , 10.56856-1.2 ,180},
[41] = { 1643.67468 , 2191.12476 , 10.8203-1.2 ,180},
[42] = { 1665.10266 , 1953.36548 , 10.82031-1.2 ,180},
-- New Los Anglos ---- 
[43] = { 2755.60,-1944.5,12.6 ,270},
[44] = { 892.2,-1658.8,12.5 ,180},
[45] = { 1098.5,-1101.3,24.39 ,90},
[46] = { 540.40,-1803,5 ,0}, 
[47] = { 975.8,-920.09,44.8 ,90},
[48] = { 1551.4,-1110.5,22.99 ,270}, 
---
[49] = { -2391.3,-221.2,40.7 ,90},
[50] = { -2365.3,-19.2,34.2 ,90}, 
}


local Window_CarsForCr = guiCreateWindow(screX/2 - 100, screY/2 - 150, 200, 350, "Selecting Vehicles Menu", false)
guiSetVisible(Window_CarsForCr, false)
guiWindowSetSizable(Window_CarsForCr, false)
local list_Cars = guiCreateGridList(0, 0.07, 1, 0.66, true, Window_CarsForCr)
local column_cars = guiGridListAddColumn(list_Cars, "vehicle", 0.9)
local selectBB = guiCreateButton(0.05, 0.75, 1, 0.1, "Select!", true, Window_CarsForCr)
local closeBBB = guiCreateButton(0.05, 0.86, 1, 0.1, "Close", true, Window_CarsForCr)

local list_Medic = guiCreateGridList(0, 0.07, 1, 0.66, true, Window_CarsForCr)
guiSetVisible(list_Medic, false)
local column_Medic = guiGridListAddColumn(list_Medic, "vehicle", 0.9)
guiGridListSetItemText(list_Medic, guiGridListAddRow(list_Medic), column_Medic, "Ambulance", false, false)

Rott = {}

local medic1 = createMarker(1139.9000244141,-1356.5,12.89999961853, "cylinder", 2, 0, 255, 255, 100)
local medic2 = createMarker(1185.3000488281,-1361.3000488281,12.89999961853, "cylinder", 2, 0, 255, 255, 100)
Rott[medic1] = tostring(180)
Rott[medic2] = tostring(180)

function onWaste()
	guiSetVisible(Window_CarsForCr, false)
	showCursor(false)
	setTimer(setElementFrozen, 50, 1, player, false)
end
addEventHandler("onClientPlayerWasted", player, onWaste)
addEventHandler("onClientGUIClick", closeBBB, onWaste, false)

for _,car in pairs(vehicles) do
	local row = guiGridListAddRow(list_Cars)
	guiGridListSetItemText(list_Cars, row, column_cars, getVehicleNameFromModel(tonumber(car)), false, false)
end


for _, Pos in pairs(MarkersPosition) do
    local r,g,b = math.random(255),math.random(255),math.random(255)
	local marker = createMarker(Pos[1], Pos[2], Pos[3]-0.3, "cylinder", 2, r,g,b, 100) 
	--setElementID(marker, tostring(Pos[4]))
	Rott[marker] = tostring(Pos[4])
	MarkersTable[marker] = true
	   if Pos[5] then
	           setElementData(marker,"GangsBase",Pos[5])
	   end
end

function createTheChoosenCarr()
	if not guiGetVisible(list_Cars) then return end
	local row = guiGridListGetSelectedItem(list_Cars)
	if row and row >= 0 then
		guiSetVisible(Window_CarsForCr, false)
		setTimer(setElementFrozen,50,1,player,false)
		showCursor(false)
		triggerServerEvent("onSpawnVehicle",resourceRoot, player, guiGridListGetItemText(list_Cars, row, column_cars), Mx, My, Mz, Mr,addHeli2)
	end
end
addEventHandler("onClientGUIClick", selectBB, createTheChoosenCarr, false)
addEventHandler("onClientGUIDoubleClick", list_Cars, createTheChoosenCarr, false)

function createTheChoosenCarrm()
	if not guiGetVisible(list_Medic) then return end
	local row = guiGridListGetSelectedItem(list_Medic)
	if row and row >= 0 then
		guiSetVisible(Window_CarsForCr, false)
		setTimer(setElementFrozen,50,1,player,false)
		showCursor(false)
		triggerServerEvent("onSpawnVehicle",resourceRoot,player,guiGridListGetItemText(list_Medic,row,column_Medic), Mx, My-3, Mz, Mr)
	end
end
addEventHandler("onClientGUIClick", selectBB, createTheChoosenCarrm, false)
addEventHandler("onClientGUIDoubleClick", list_Medic, createTheChoosenCarrm, false)

CarsId = {}
CarsId["Grove Street"] = {492 , 567 , 600 , 445 , 581}
CarsId["Vagos"] = {576 , 474 , 467 , 535 , 581}
CarsId["Ballas"] = {566 , 603 , 529 , 412 , 468 }
CarsId["Aztec"] = {550 , 534 , 419 , 466 , 463}

addEventHandler("onClientMarkerHit", resourceRoot,
function(pp)
	if getElementType(pp) ~= "player" or pp ~= player or isPedInVehicle(pp) then return end
	if MarkersTable[source] and isOnTheHeightRange(pp, source) and getElementData(pp, "Stats") < 2 then
	  
	      if getElementData(source,"GangsBase") then 
	           if getElementData(source,"GangsBase") == getTeamName(getPlayerTeam(pp)) then
			       if not addHeli2 then
			          if getElementData(pp,"GLVL") >= 10 then
					      addHeli2 = getElementData(source,"GangsBase") 
						  for _,car in pairs(CarsId[getTeamName(getPlayerTeam(pp))]) do
	                          local row = guiGridListAddRow(list_Cars)
	                          guiGridListSetItemText(list_Cars, row, column_cars, getVehicleNameFromModel(tonumber(car)), false, false)
                          end
						  local row = guiGridListAddRow(list_Cars)
	                      guiGridListSetItemText(list_Cars, row, column_cars, getVehicleNameFromModel(tonumber(487)), false, false)
					   end 
                   end
			   else 
			         guiGridListClear(list_Cars)
					 for _,car in pairs(vehicles) do
	                      local row = guiGridListAddRow(list_Cars)
	                      guiGridListSetItemText(list_Cars, row, column_cars, getVehicleNameFromModel(tonumber(car)), false, false)
                     end
					 addHeli2 = false
			   end
		 else
                     guiGridListClear(list_Cars)
					 for _,car in pairs(vehicles) do
	                      local row = guiGridListAddRow(list_Cars)
	                      guiGridListSetItemText(list_Cars, row, column_cars, getVehicleNameFromModel(tonumber(car)), false, false)
                     end
					 addHeli2 = false
	      end
		guiSetVisible(list_Cars, true)
		guiSetVisible(list_Medic, false)
		setTimer(function(pp,source)
			Mx, My, Mz = getElementPosition(source)
			Mr = Rott[source]--getElementID(source)
			local xx, yy, zz = getElementPosition(pp)
			SetElementPosition(pp, xx, yy, Mz+0.8)
			setElementFrozen(player,true)
		end, 150, 1, pp, source)
		guiSetVisible(Window_CarsForCr, true)
		showCursor(true)
	end
end)

addEventHandler("onClientMarkerHit", resourceRoot,
function(pp)
	if getElementType(pp) ~= "player" or pp ~= player or isPedInVehicle(pp) then return end
	if source == medic1 or source == medic2 then
		if isOnTheHeightRange(pp, source) and getElementData(pp, "Stats") < 2 and getPlayerTeam(pp) == getTeamFromName("Medic") then
			guiSetVisible(list_Cars, false)
			guiSetVisible(list_Medic, true)
			setTimer(function(pp,source)
				Mx, My, Mz = getElementPosition(source)
				Mr = Rott[source]--getElementID(source)
				local xx, yy, zz = getElementPosition(pp)
				SetElementPosition(pp, xx, yy, Mz+0.5)
				setElementFrozen(player,true)
			end, 150, 1, pp, source)
			guiSetVisible(Window_CarsForCr, true)
			showCursor(true)
		end
	end
end)

addEventHandler("onClientMarkerLeave", resourceRoot,
function(pp)
	if getElementType(pp) ~= "player" or pp ~= player or isPedInVehicle(pp) then return end
	if MarkersTable[source] or source == medic1 or source == medic2 then
		guiSetVisible(Window_CarsForCr, false)
		setTimer(setElementFrozen,250,1,player,false)
		setElementFrozen(player,false)
		showCursor(false)
	end
end)

addEvent("Tcheckntf", true)
function checkntf(c, e, s, t) 
	if t[player] then 
		if ntf then
		   if SetRender then
			removeEventHandler("onClientRender", root, notification)
			SetRender = nil 
		   end
			destroyElement(ntf)
			destroyElement(ntfe)
			destroyElement(ntft)
			ntf = nil
			ntfe = nil
			ntft = nil
			if isTimer (dntf) then
				killTimer(dntf)
				dntf = nil
			end
		end
		notification(c, e, s, t[player] or t )
	end
end
addEventHandler("Tcheckntf", root, checkntf)
--bindKey("z", "down", checkntf)

function notification(red, je, sound, text)--(c, e)

	c, e, s, t = red , je, sound, text
	if ntf then
		ntfa = guiGetAlpha(ntf)+0.2
		if ntfa > 1 then
			guiSetAlpha(ntf, 1)
			guiSetAlpha(ntfe, 1)
			dntf = setTimer(function()
				destroyElement(ntf)
				destroyElement(ntfe)
				destroyElement(ntft)
				ntf = nil
				ntfe = nil
				ntft = nil
				dntf = nil
			  end, 60000, 1)
			if SetRender then
			removeEventHandler("onClientRender", root, notification)
			SetRender = nil
			end
		else
			guiSetAlpha(ntf, ntfa)
			guiSetAlpha(ntfe, ntfa)
			guiSetAlpha(ntft, ntfa)
		end
	else 
		playSound('sounds/'..s..'.mp3')
		ntf = guiCreateStaticImage(w/1.12, h/1.25, w/11.38, h/6.4, 'images/'..c..'.png', false)
		ntfe = guiCreateStaticImage(w/1.11, h/1.228, w/13.66, h/7.68, 'images/'..e..'.png', false)
		ntft = guiCreateLabel(0, h/1.15, w/1.13, 30, t, false)
		guiLabelSetHorizontalAlign(ntft, "right")
		guiSetFont(ntft, "clear-normal")

		guiSetAlpha(ntf, 0)
		guiSetAlpha(ntfe, guiGetAlpha(ntf))
		guiSetAlpha(ntft, guiGetAlpha(ntf))
		if not SetRender then
		addEventHandler("onClientRender", root, notification)
		SetRender = true
		end
	end
end

HackPcBar = guiCreateProgressBar(0.05, 0.5, 0.15, 0.033, true)
guiLabelSetColor(guiCreateLabel(0.35, 0.2, 1, 1, "Hacking PC", true, HackPcBar), 255, 0, 0)
guiSetVisible(HackPcBar, false)

addEvent("onHackPc", true)
addEventHandler("onHackPc", root,
function(Stat)
	if Stat and hlspdpc then
		guiProgressBarSetProgress(HackPcBar, 0)
		guiSetVisible(HackPcBar, true)
		if isTimer(HackPcTimer) then killTimer(HackPcTimer) end
		if isElement(HackingSound) then destroyElement(HackingSound) end
		HackingSound = playSound("sounds/hack.mp3", true)
		setSoundVolume(HackingSound, 1.0)
		HackPcTimer = setTimer(function()
			local task = getPedSimplestTask(player)
			setElementData(player, "Task", task)
			guiProgressBarSetProgress(HackPcBar, guiProgressBarGetProgress(HackPcBar) + 1)
			if guiProgressBarGetProgress(HackPcBar) == 100 then
				triggerServerEvent("onHackPcComplete", resourceRoot, player)
				if isElement(HackingSound) then destroyElement(HackingSound) end
			end
		end, 1200, 100)
	else
		if isTimer(HackPcTimer) then killTimer(HackPcTimer) end
		if isElement(HackingSound) then destroyElement(HackingSound) end
		guiSetVisible(HackPcBar, false)
	end
end)

-- GATE FOR THE POLICE

policeDoor = createObject(968, 1544.699, -1630.798, 13.100, 0, 90, 90)
col = createMarker(1544.4, -1626.8, 10, "cylinder", 12, 0, 0, 0, 0)
createObject(970, 1544.9000244141 , -1622 , 13.10000038147 , 0 ,0 ,90)
createObject(970, 1544.9000244141 , -1617.9000244141 , 13.10000038147 , 0 ,0 ,90)
createObject(970, 1544.9000244141 , -1634.9000244141 , 13.199999809265 , 0 ,0 ,90)

moving = nil
closed = true
movetime = 968

function openDoor(player)
	if getElementType(player) == "player" then
		if not isPedInVehicle(player) or getPlayerTeam(player) ~= getTeamFromName("Police") then return end
		if closed then
			rx, ry = getElementRotation(policeDoor)
			if ry <= 90 then
				ry = 90-ry
			elseif ry <= 180 then
				ry = 180-ry
			elseif ry <= 270 then
				ry = 270-ry
			elseif ry <= 360 then
				ry = 360-ry
			end
			moveObject(policeDoor, 968, 1544.699, -1630.798, 13.100, 0, ry-90)
			closed = nil
		end
	end
end
addEventHandler("onClientMarkerHit", col, openDoor)

function closeDoor(player)
	if getElementType(player) == "player" then
		if not isPedInVehicle(player) or getPlayerTeam(player) ~= getTeamFromName("Police") then return end
		if not closed then
			rx, ry = getElementRotation(policeDoor)
			moveObject(policeDoor, 968, 1544.699, -1630.798, 13.100, 0, 90-ry)
			closed = true
		end
	end
end
addEventHandler("onClientMarkerLeave", col, closeDoor)


---------------------------------------Bribe-------------------------
function offB(cmd)
if offerStart then return end
offerStart = true
offerTimer = setTimer(function() offerStart = false end, 1000, 1)
   if isPedDead(player) then return end
  if getElementData(player,"RecounectBug") ~= true then
	if cmd == "bribe" then
	    if getElementData(player, "Stats") ~= 3 then return end
		if isElement(GateJail) and getElementData(GateJail,"TimeOut") then return end
		if getPlayerTeam(player) ~= getTeamFromName("Police") and not isElementWithinColShape(player, oj) and not isTimer(HackPcTimer) then
			if getElementData(player, "WantLvl") > 2 and getElementData(player, "Stats") < 1 or getElementData(player, "Stats") == 3 then
				if getElementData(player, "Money") >= (getElementData(player, "WantLvl")*1000) and getElementData(player, "Stats") < 1 or getElementData(player, "Stats") == 3 and getElementData(player, "Money") >= bail and bail ~= 0 then
					for k,v in pairs(getElementsWithinColShape(jiconr,"player")) do
						if getPlayerTeam(v) == getTeamFromName("Police") then
							--[[x, y, z = getElementPosition(player)
							vx, vy, vz = getElementPosition(v)
							dist = getDistanceBetweenPoints3D(x, y, z, vx, vy, vz)
							if dist < 20 then]]
								if not Obribe[v] then
									bribed = v
									break
								end
							--end
						end
					end
					if bribed then
						if getElementData(player, "Stats") < 1 then
							triggerServerEvent("offerB", resourceRoot, player, bribed)
						else
							triggerServerEvent("offerB", resourceRoot, player, bribed, bail)
						end
						bribed = false
					else
						exports["guimessages"]:outputClient(tlng[plng][64], 255, 255, 0)
					end
				else
					exports["guimessages"]:outputClient(tlng[plng][25], 255, 255, 0)
				end
			end
		end
	elseif cmd == "acc" then
	    if getElementData(Obriber, "Stats") ~= 3 then return end
	    if isPedDead(Obriber) then 
		    Obriber = false
			removeCommandHandler("acc", offB) 
		return
		end
		if not isElementWithinColShape(Obriber, oj) then
			if getElementData(Obriber, "Stats") < 1 and getElementData(Obriber, "WantLvl") > 2 and getElementData(Obriber, "Money") >= (getElementData(Obriber, "WantLvl")*1000) or getElementData(Obriber, "Stats") == 3 and getElementData(Obriber, "Money") >= Obribe then
				triggerServerEvent("ACCB", resourceRoot, Obriber, player)
				Obriber = false
				removeCommandHandler("acc", offB)
			end
		end
	end
	else
	exports["guimessages"]:outputClient("You may not bribe the police for violation of rules", 255, 255, 0)
	end
end
addCommandHandler("bribe", offB)

Obribe = {}

addEvent("CofferB", true)
function FCofferB(briber, bribed, bribe)
	if bribed == player then
		if getElementData(briber, "Stats") < 1 and getElementData(briber, "WantLvl") > 2 then
			exports["guimessages"]:outputClient(getPlayerName(briber)..' '..tlng[plng][65]..''..getElementData(briber, "WantLvl")*1000, 0, 255, 0)
		elseif getElementData(briber, "Stats") == 3 then
			exports["guimessages"]:outputClient(getPlayerName(briber)..' '..tlng[plng][65]..''..bribe, 0, 255, 0)
		end
		Obriber = briber
		Obribe = bribe
		setTimer(function()
			Obriber = false
			removeCommandHandler("acc", offB)
			Obribe = {}
		end, 120000, 1)
		addCommandHandler("acc", offB)
	elseif briber == player then
		if getElementData(briber, "Stats") < 1 and getElementData(briber, "WantLvl") > 2 then
			exports["guimessages"]:outputClient(tlng[plng][66]..''..(getElementData(briber, "WantLvl")*1000)..' '..tlng[plng][67]..' '..getPlayerName(bribed), 0, 255, 0)
		elseif getElementData(briber, "Stats") == 3 then
			exports["guimessages"]:outputClient(tlng[plng][66]..''..bribe..' '..tlng[plng][67]..' '..getPlayerName(bribed), 0, 255, 0)
		end
		Obribe[bribed] = true
		setTimer(function()
			Obribe[bribed] = false
		end, 120000, 1)
	end
end
addEventHandler("CofferB", resourceRoot, FCofferB)

addEvent("CACCB", true)
function FCACCB(briber, bribed)
	if bribed == player then
		setTimer(function() setElementData(player, "OfferAcc", false) end, 5000, 1)
		exports["guimessages"]:outputClient(tlng[plng][68]..' '..getPlayerName(briber), 0, 255, 0)
		if getElementData(briber, "Stats") < 1 and getElementData(briber, "WantLvl") > 2 then
			setElementData(player, "Money", getElementData(player, "Money")+(getElementData(briber, "WantLvl")*1000))
			--setElementData(player, "Scores", getElementData(player, "Scores")-(getElementData(briber, "WantLvl")*2))
			givePlayerScore (player,-((getElementData(briber, "WantLvl") or 0) *2))
		elseif getElementData(briber, "Stats") == 3 then
		    local money = math.ceil(Obribe)
			setElementData(player, "Money", getElementData(player, "Money")+money) 
			--setElementData(player, "Scores", getElementData(player, "Scores")-12)
			givePlayerScore (player,-12)
		end
		Obriber = false
		Obribe = {}
		removeCommandHandler("acc", offB)
	elseif briber == player then
		setTimer(function() setElementData(player, "BribeAcc", false) end, 5000, 1)
		exports["guimessages"]:outputClient(getPlayerName(bribed)..' '..tlng[plng][69], 0, 255, 0)
		if getElementData(player, "Stats") < 1 and getElementData(player, "WantLvl") > 2 then
			setElementData(player, "Money", getElementData(player, "Money")-(getElementData(player, "WantLvl")*1000))
			--setElementData(player, "Scores", getElementData(player, "Scores")+(getElementData(player, "WantLvl")*2))
			givePlayerScore (player,-((getElementData(player, "WantLvl") or 0)*2))
			setElementData(player, "WantLvl", 0)
			setElementData(player, "Stats", 0)
		elseif getElementData(briber, "Stats") == 3 then
			setElementData(player, "Money", getElementData(player, "Money")-bail)
			--setElementData(player, "Scores", getElementData(player, "Scores")+12) 
			givePlayerScore (player,12)
			SecsLeft = 0
			MinsLeft = 0
			bail = 0
		end
		Obribe[bribed] = false
	end
end
addEventHandler("CACCB", resourceRoot, FCACCB) 

-----------------------------------------------Fixed Bug F4 -------------------------------------------------------------------
addEventHandler("onClientElementDataChange", localPlayer,
function(data, old)
  if getElementType(source) == "player" then
	 if data == "Stats" then
		if selecting and getElementData(source, "Stats") == 2 then
			MinsLeft = 6
			SecsLeft = 0
			bail = 6000 
		end    
	 elseif data == "Language" and getElementData(source,data) then
		if getElementData(source,"Language") == 1 then
			plng = 2
			triggerServerEvent("Lang",resourceRoot,player,plng)
		else
			plng = 1
			triggerServerEvent("Lang",resourceRoot,player,plng)
		end
     end
  end
end)

--- new --

MarkersSea = {
     ['MarkerCar1'] = createMarker( 2616,602,7.5, 'cylinder', 1.3, 255, 0, 0, 255 ), 
     ['MarkerCar2'] = createMarker( 73,-1512,3.5, 'cylinder', 1.3, 255, 0, 0, 255 ), 
     ['MarkerCar3'] = createMarker( -1246,478.5,6.5, 'cylinder', 1.3, 255, 0, 0, 255 )
    };

	createBlip ( 2616,602,7.5,9,2,255,0,0,255,0,400 )
	createBlip ( 73,-1512,3.5,9,2,255,0,0,255,0,400 )
	createBlip ( -1246,478.5,6.5,9,2,255,0,0,255,0,400 )

idCar = {
        SeaId = {493,454,473}, -- ارقام السيارات
    };

local screX, screY = guiGetScreenSize()
local windowSea = guiCreateWindow(screX / 2 - 100, screY / 2 - 150, 200, 350, "Selecting Vehicles Menu", false)
guiSetVisible(windowSea, false)
guiWindowSetSizable(windowSea, false)
local list = guiCreateGridList(0, 0.07, 1, 0.66, true, windowSea)
local column = guiGridListAddColumn(list, "vehicle", 0.9)
local selectB = guiCreateButton(0.05, 0.75, 1, 0.1, "Select!", true, windowSea)
local closeB = guiCreateButton(0.05, 0.86, 1, 0.1, "Close", true, windowSea)

function onWaste()
     guiSetVisible(windowSea, false)
     showCursor(false)
setTimer(setElementFrozen,50,1,localPlayer,false)
             if guiGetVisible(GUIJail.window[1]) then
                 guiSetVisible(GUIJail.window[1], false)
				 showCursor(false)
			 end	
end
addEventHandler("onClientPlayerWasted", getLocalPlayer(), onWaste)
addEventHandler("onClientGUIClick", closeB, onWaste, false)

addEventHandler('onClientMarkerHit', root,
function(pp)
	if getElementType(pp) ~= "player" or pp ~= player or isPedInVehicle(pp) then return end
     if ( source == MarkersSea['MarkerCar1'] ) or ( source == MarkersSea['MarkerCar2'] ) or ( source == MarkersSea['MarkerCar3'] ) then
	  if isOnTheHeightRange(pp, source) and getElementData(pp, "Stats") < 2 then
		   if pp == localPlayer then
			setElementFrozen ( localPlayer, true )
			guiSetVisible(windowSea,true)
			showCursor( true )
		   end
		end
      end
    end
)

for i,car in pairs(idCar.SeaId) do
     local row = guiGridListAddRow(list)
     guiGridListSetItemText(list, row, column, getVehicleNameFromModel(tonumber(car)), false, false)
end

function createTheChoosenCar2 ()
     local row = guiGridListGetSelectedItem(list)
     if row and row >= 0 then
          guiSetVisible(windowSea, false)
          setTimer(setElementFrozen,50,1,localPlayer,false)
          showCursor(false)
          triggerServerEvent("CreateCarInSea",resourceRoot,localPlayer, guiGridListGetItemText(list, row, column))
     end
end
addEventHandler("onClientGUIClick", selectB, createTheChoosenCar2 , false)

addEventHandler("onClientResourceStart",resourceRoot,function()
	txd11 = engineLoadTXD("models/object-s.txd")
	engineImportTXD(txd11,9314)
end)



addEvent ( "IPhoneSyste:Spawn:SaveArea", true )
addEventHandler ( "IPhoneSyste:Spawn:SaveArea", root,
 function ( table )
  local i = table
     TownOld = i.LosSantos
  TownNew = i.SanFierro
  TownNewOld = i.LasVenturas
 end
)

addEvent ( "WeaponShop:SetProtectValue", true )
addEventHandler ( "WeaponShop:SetProtectValue", root,
 function ( v )
  protect = v
 end
)


RSS = {}
RST = {}
SRSS = {}
SRST = {}

function PSORSH(loss,atk)
	if getElementModel(source) == 3081 then
		if getPedWeapon(atk) > 21 and getPedWeapon(atk) < 35 or getPedWeapon(atk) == 38 then
			if RSS[source] then
				if SRSS[source] then
					stopSound(SRSS[source])
					if SRST[source] then
						killTimer(SRST[source])
					end
				end
				tmsl = getTimerDetails(RST[source])
				killTimer(RST[source])
				if tmsl >= 50 then
					SRST[source] = setTimer(function(PLR) SRSS[PLR] = nil SRST[PLR] = nil end,tmsl,1,source)
					SRSS[source] = RSS[source]
				else
					SRSS[source] = nil
					SRST[source] = nil
				end
				tmsl = nil
			end
			x,y,z = getElementPosition(source)
			RSS[source] = playSound3D("sounds/0"..math.random(1,5)..".mp3",x,y,z)
			RST[source] = setTimer(function(PLR) RSS[PLR] = nil RST[PLR] = nil end,getSoundLength(RSS[source])*1000,1,source)
		end
		cancelEvent()
	end
end
addEventHandler("onClientObjectDamage",root,PSORSH)

addEvent("DCWE",true)
function FDCWE(rsd)
	--if source == player then
		--RShield = rsd
		for k,v in pairs(getElementsWithinColShape(OPWC,"player")) do
			setElementCollidableWith(rsd,v,false)
		end
		for k,v in pairs(getElementsWithinColShape(OPWC,"vehicle")) do
			setElementCollidableWith(rsd,v,false)
		end
		--setElementCollidableWith(rsd,getCamera(),false)
	--end
end
addEventHandler("DCWE",root,FDCWE)

EBQ = {}
LUMK = {}
--EGL = {}
addEvent("OPEC",true)
function FOPEC(val)
	if val[player] then
		--for k,v in pairs(val[player]) do
			--outputChatBox(v)
			for i=#val[player],1,-1 do
				CEG(val[player][i])
			end
		--end
	end
end
addEventHandler("OPEC",root,FOPEC)

DXR = 0
--GIS = {}
function CEG(val)
	for k,v in pairs(EBQ) do
		--if EBQ[i-1][1] then
			x,y = guiGetPosition(k,false)
			if y > (h/1.536) then
				if v[1] then
					destroyElement(v[1])
				end
				EBQ[k] = nil
				--table.remove(EBQ,k)
				destroyElement(k)
				--collectgarbage()
			else
				guiSetPosition(k,x,y+h/38.4,false)
				if v[1] then
					guiSetPosition(v[1],x,y+h/38.4,false)
				end
			end
		--end
	end
	lll = guiCreateLabel(w/1.6,h/2.4,w/6.8,h/38.4,"   "..val,false)
	guiSetFont(lll,GEF)
	ggg = guiCreateStaticImage(w/1.6,math.ceil(h/2.42),string.len(val)*(w/124),h/38.4,"images/EFE.png",false)
	EBQ[ggg] = {lll,0}
	guiSetVisible(lll,false)
	guiSetAlpha(ggg,.2)
	EQT = setTimer(function(ggg,val)
		if EBQ[ggg] then
			if val == EQT then
				EQT = nil
			end
			guiSetVisible(ggg,true)
			if DXR < 1 then
				addEventHandler("onClientRender",root,RGS)
			end
			DXR = DXR+1
			setTimer(function() if not EQT then EBQ = {} end end,500,1)
		end
	end,2000,1,ggg,EQT)
	if DXR < 1 then
		addEventHandler("onClientRender",root,RGS)
	end
	DXR = DXR+1
	ggg = nil
end

function RGS()
	for k,v in pairs(EBQ) do
		vis = guiGetVisible(k)
		if vis then
			--outputChatBox("rendering...")
			if EBQ[k][2] > 2 then
				if guiGetAlpha(k) > .125 then
					guiSetAlpha(k,guiGetAlpha(k)-.125)
				else
					EBQ[k] = nil
					--table.remove(EBQ,k)
					destroyElement(k)
					DXR = DXR-1
					if DXR < 1 then
						removeEventHandler("onClientRender",root,RGS)
					end
					--collectgarbage()
				end
			elseif EBQ[k][2] > 1 then
				if guiGetAlpha(k) < 1 then
					guiSetAlpha(k,guiGetAlpha(k)+.125)
				else
					EBQ[k][2] = 3
					destroyElement(EBQ[k][1])
					EBQ[k][1] = nil
				end
			elseif EBQ[k][2] > 0 then
				if guiGetAlpha(k) > .125 then
					--outputChatBox(guiGetAlpha(k))
					guiSetAlpha(k,guiGetAlpha(k)-.125)
				else
					EBQ[k][2] = 2
					guiSetVisible(k,false)
					DXR = DXR-1
					if DXR < 1 then
						removeEventHandler("onClientRender",root,RGS)
					end
					--outputChatBox("image not visible")
				end
			else
				if guiGetAlpha(k) < 1 then
					--outputChatBox(guiGetAlpha(k))
					guiSetAlpha(k,guiGetAlpha(k)+.125)
				else
					EBQ[k][2] = 1
					guiSetVisible(EBQ[k][1],true)
					--outputChatBox("text visible")
				end
			end
		end
	end
end

function SLUOCPQ()
	if source ~= player then
		OCPQ(source,true)
		if source == robbed and not isTimer(robT) then
			robT = setTimer(function()
				robT = nil
				if robber == player then
					outputChatBox("The money you have robbed it before in now yours!",0,255,0)
					setElementData(robber,"Rob",nil)
				end
				robber = nil
				robbed = nil
				robM = nil
			end,300000,1)
		end
	end
	if LUMK[source] then
		stopSound(LUMK[source][3])
		destroyElement(LUMK[source][1])
		for k,v in pairs(LUMK[source][2]) do
			destroyElement(v)
		end
		LUMK[source] = nil
	end
end
addEventHandler("onClientPlayerQuit",root,SLUOCPQ)

function RDLU()
	for k,v in pairs(getElementsByType("player")) do
		if LUMK[v] then
			dslur = true
			x,y,z = getElementPosition(v)
			z = z+1.1
			xx,yy,zz = getCameraMatrix()
			dist = getDistanceBetweenPoints3D(x,y,z,xx,yy,zz)
			if dist < 60 then
				hit = processLineOfSight(x,y,z,xx,yy,zz,true,false,false)
				if not hit then
					guiSetVisible(LUMK[v][1],true)
					xa,ya = getScreenFromWorldPosition(x,y,z)
					if xa and ya then
						guiSetVisible(LUMK[v][1],true)
						guiSetPosition(LUMK[v][1],xa-w/27,ya,false)
						guiLabelSetColor(LUMK[v][1],math.random(0,255),math.random(0,255),math.random(0,255))
					else
						guiSetVisible(LUMK[v][1],false)
					end
				else
					guiSetVisible(LUMK[v][1],false)
				end
			else
				guiSetVisible(LUMK[v][1],false)
			end
			for _,i in pairs(LUMK[v][2]) do
				--detachElements(i)
				if i then
					setMarkerSize(i,getMarkerSize(i)+.1)
					setElementInterior(i,getElementInterior(v))
					setElementDimension(i,getElementDimension(v))
					if getMarkerSize(i) > 2.55 then
						setMarkerSize(i,.1)
						--setMarkerColor(i,math.random(0,255),math.random(0,255),math.random(0,255),255)
					else
						setMarkerColor(i,math.random(0,255),math.random(0,255),math.random(0,255),255-(getMarkerSize(i)*100))
						--r,g,b = getMarkerColor(i)
						--setMarkerColor(i,r,g,b,255-(getMarkerSize(i)*100))
						if getMarkerSize(i) > .85 and not LUMK[v][2][2] then
							LUMK[v][2][2] = createMarker(x,y,z,"cylinder",.1,math.random(0,255),math.random(0,255),math.random(0,255))
							attachElements(LUMK[v][2][2],v,0,0,-1)
						elseif getMarkerSize(i) > 1.7 and not LUMK[v][2][3] then
							LUMK[v][2][3] = createMarker(x,y,z,"cylinder",.1,math.random(0,255),math.random(0,255),math.random(0,255))
							attachElements(LUMK[v][2][3],v,0,0,-1)
						end
					end
				end
				--attachElements(i,v,0,0,-1)
			end
		end
	end
	if not dslur then
		LUMK = {}
		lur = nil
		removeEventHandler("onClientRender",root,RDLU)
	end
	dslur = nil
end

FSC = dxCreateScreenSource (w, h)
flash = {}
smokea = {}
smokeb = {}
smokec = {}
smoked = {}
smokee = {}
function OCPC(thr)
	--proj = source
	if getProjectileType(source) == 17 then
		local arga,argb
		if getPedWeaponSlot(thr) == 5 then--getPedWeapon(thr) > 17
			arga = "GLType"
		else
			arga = "GType"
		end
		if getElementData(thr,arga) == 2 then
			setTimer(function(proj)
				local x,y,z = getCameraMatrix()
				local ax,ay,az = getElementPosition(proj)
				argb = createEffect("explosion_door",ax,ay,az)
				--setEffectDensity(argb,10)
				local hita, hx, hy, hz = processLineOfSight(x, y, z, ax, ay, az+1, true, true, false)
				local bx, by, bz = getPedBonePosition(player, 8)
				local hitb, hx, hy, hz = processLineOfSight(bx, by, bz, ax, ay, az+1, true, true, false)
				flash[proj] = createMarker(ax, ay, az, "corona", 30, 255, 255)
				setElementInterior(flash[proj], getElementInterior(proj))
				--if getElementData(localPlayer,"EXPLE") then
					local es = playSFX3D("genrl",45,4,ax,ay,az+1)
					setSoundMaxDistance(es,80)
					setElementDimension(es,getElementDimension(source))
				--else
					--createExplosion(ax,ay,az+11, 8, true, 0, false)
				--end
				setTimer(function(flash)
						destroyElement(flash)
						flash = nil
				end, 50, 1, flash[proj])
				destroyElement(proj)
				if not hita or not hitb then
					local dist
					if blind then
						dist = getDistanceBetweenPoints3D(bx,by,bz,ax,ay,az)
						if dist <= 51 then
							dxUpdateScreenSource(FSC)
							tim = 6-dist*.116
							fwalp = 255-dist*1.6
							falp = 255-dist*5
							if unbt then
								tl, tc, tt = getTimerDetails(unbt)
								if tim > tl then
									--tim = ftim
									--dist = fdist
									killTimer(unbt)
									unbt = setTimer(function()
											unbt = nil
											dalp = true
									end, math.ceil(tim*500), 1)
								end
								Fvol = 1
								stopSound(fbt)
								fbt = playSound("sounds/00.mp3")
							elseif tim > 3 then
								dalp = nil
								Falp = 255
								if not Falp then
									Falp = 255
									addEventHandler("onClientRender", root, SEFC)
									Fvol = 1
									stopSound(fbt)
									fbt = playSound("sounds/00.mp3")
								end
								if not walp then
									walp = 255
									addEventHandler("onClientRender", root, WEFC)
									Fvol = 1
									stopSound(fbt)
									fbt = playSound("sounds/00.mp3")
								end
								walp = 255
								Falp = 255
								unbt = setTimer(function()
										unbt = nil
										dalp = true
								end, math.ceil(tim*500), 1)
							elseif falp > Falp then --walp and fwalp > walp or
								walp = fwalp
								Falp = falp
							end
						end
					else
						dist = getDistanceBetweenPoints3D(bx,by,bz,ax,ay,az)
						if dist <= 51 then
							blind = true
							dxUpdateScreenSource(FSC)
							--if dist <= 25.5 then
								tim = 6-dist*.117
								fbt = playSound("sounds/00.mp3")
								Fvol = 1
								addEventHandler("onClientRender", root, SEFC)
								addEventHandler("onClientRender", root, WEFC)
								if tim > 3 then
									walp = 255
									Falp = 255
									--addEventHandler("onClientRender", root, SEFC)
									--addEventHandler("onClientRender", root, WEFC)
									unbt = setTimer(function()
											unbt = nil
											dalp = true
											--addEventHandler("onClientRender", root, SEFC)
									end, math.ceil(tim*500), 1)
									--fbt = playSound("fbt.mp3")
								else
									walp = 255-dist*1.6
									Falp = 255-dist*5
									dalp = true
									--addEventHandler("onClientRender", root, WEFC)
									--addEventHandler("onClientRender", root, SEFC)
									--fbt = playSound("fbt.mp3")
								end
							--else
								--Falp = 255
							--end
						end
					end
				end
			end, 2000, 1, source)
		elseif getElementData(thr,arga) == 1 then
			setTimer(function(proj)
				local x, y, z = getElementPosition(proj)
				local z = getGroundPosition(x, y, z)
				argb = createEffect("explosion_door",x,y,z)
				--setEffectDensity(argb,10)
				--hit, x, y, z = processLineOfSight(x, y, z, x, y, z+1000, true, false, false, true, true, true, false, true)
				smokea[proj] = createObject(2780, x+5, y, z)
				smokeb[proj] = createObject(2780, x-5, y, z)
				smokec[proj] = createObject(2780, x, y+5, z)
				smoked[proj] = createObject(2780, x, y-5, z)
				smokee[proj] = createObject(2780, x, y, z)

				setElementAlpha(smokea[proj], 0)
				setElementAlpha(smokeb[proj], 0)
				setElementAlpha(smokec[proj], 0)
				setElementAlpha(smoked[proj], 0)
				setElementAlpha(smokee[proj], 0)

				setElementInterior(smokea[proj], getElementInterior(proj))
				setElementInterior(smokeb[proj], getElementInterior(proj))
				setElementInterior(smokec[proj], getElementInterior(proj))
				setElementInterior(smoked[proj], getElementInterior(proj))
				setElementInterior(smokee[proj], getElementInterior(proj))

				setElementCollisionsEnabled(smokea[proj], false)
				setElementCollisionsEnabled(smokeb[proj], false)
				setElementCollisionsEnabled(smokec[proj], false)
				setElementCollisionsEnabled(smoked[proj], false)
				setElementCollisionsEnabled(smokee[proj], false)

				moveObject(smokee[proj], 1000, x, y, z+5)
				setTimer(function(smokea, smokeb, smokec, smoked, smokee)
						destroyElement(smokea)
						destroyElement(smokeb)
						destroyElement(smokec)
						destroyElement(smoked)
						destroyElement(smokee)
						smokea = nil
						smokeb = nil
						smokec = nil
						smoked = nil
						smokee = nil
				end, 30000, 1, smokea[proj], smokeb[proj], smokec[proj], smoked[proj], smokee[proj])
				destroyElement(proj)
			end, 2000, 1, source)
		end
	end
	--proj = false
end
addEventHandler("onClientProjectileCreation", root, OCPC)

function WEFC()
	dxDrawImage(0, 0, w, h, "images/wb.png", 0, 0, 0, tocolor(255, 255, 255, walp))
	if dalp then
		walp = walp-7.2
		if walp < 1 then
			removeEventHandler("onClientRender", root, WEFC)
			walp = nil
		end
	end
end

function SEFC()
	dxDrawImage(0, 0, w, h, FSC, 0, 0, 0, tocolor(255, 255, 255, Falp))
	if dalp then
		Falp = Falp-2.4
		if Falp < 86 then
			setSoundVolume(fbt, Fvol)
			Fvol = Fvol - .02
			if Fvol < 0 then
				Fvol = 0
			end
		end
		if Falp < 1 then
			Falp = 0
			if Fvol == 0 then
				stopSound(fbt)
				removeEventHandler("onClientRender", root, SEFC)
				Falp = nil
				dalp = nil
				blind = nil
				fbt = nil
				Fvol = nil
				if walp then
					removeEventHandler("onClientRender", root, WEFC)
					walp = nil
				end
			end
		end
	end
end

function PSOG()
	--[[if getElementData(player,"Stinger") then
		setElementData(player,"Stinger",false)
	else]]
	if getPlayerTeam(player) == getTeamFromName("Police") and getElementData(player,"PPerk") == 1 and getElementData(player,"PLVL") > 4 and not isPedInVehicle(player) and not getControlState("aim_weapon") then
		setPedAnimation(player,"BOMBER","BOM_Plant",3000,false,true,true,false)
		unbindKey("z","down",PSOG)
		setTimer(function() bindKey("z","down",PSOG) end,4000,1)
		x,y,z = getElementPosition(player)
		stgra = createObject(2899,x,y,z)
		stgrb = createObject(2899,x,y,z)
		stgrc = createObject(2899,x,y,z)
		stgrd = createObject(2899,x,y,z)
		stgre = createObject(2899,x,y,z)
		stgrf = createObject(2899,x,y,z)
		setElementAlpha(stgra,0)
		setElementAlpha(stgrb,0)
		setElementAlpha(stgrc,0)
		setElementAlpha(stgrd,0)
		setElementAlpha(stgre,0)
		setElementAlpha(stgrf,0)
		attachElements(stgra,player,0,2.5,1)
		attachElements(stgrb,stgra,.6,-2.5)
		attachElements(stgrc,stgra,-.6,-2.5)
		attachElements(stgrd,stgra,.6,2.5)
		attachElements(stgre,stgra,-.6,2.5)
		attachElements(stgrf,stgra,0,2.5,1)
		setTimer(function()
			x,y,r = getElementRotation(stgra)
			xa,ya,za = getElementPosition(player)
			za = getGroundPosition(xa,ya,za+1)
			xb,yb,zb = getElementPosition(stgrb)
			zb = getGroundPosition(xb,yb,zb+1)
			xc,yc,zc = getElementPosition(stgrc)
			zc = getGroundPosition(xc,yc,zc+1)
			x,y,z = getElementPosition(stgra)
			xf,yf,zf = getElementPosition(stgrf)
			z = getGroundPosition(xf,yf,zf+.5)
			if z == 0 then
				z = getGroundPosition(xf,yf,zf+1)
			end
			if z == 0 then
				z = getGroundPosition(xf,yf,zf+1.5)
			end
			if z == 0 then
				z = getGroundPosition(xf,yf,zf+2)
			end
			if z == 0 then
				z = getGroundPosition(xf,yf,zf+2.5)
			end
			if zb ~= zc then
				zb = zc-zb
				dist = getDistanceBetweenPoints2D(xb,yb,xc,yc)
				zb = zb/dist
				zb = math.deg(math.atan(zb))
				if zb < 0 and r < 180 or zb > 0 and r > 180 then
					zb = zb*-1
				end
			else
				zb = 0
			end
			if za ~= z then
				za = z-za
				dist = getDistanceBetweenPoints2D(xa,ya,xf,yf)
				za = za/dist
				za = math.deg(math.atan(za))
			else
				za = 0
			end
			x,y = getElementPosition(stgra)
			xx,yy,zz = getElementPosition(stgra)
			zz = getGroundPosition(x,y,zz+.5)
			if zz == 0 then
				zz = getGroundPosition(x,y,zz+1)
			end
			if zz == 0 then
				zz = getGroundPosition(x,y,zz+1.5)
			end
			if zz == 0 then
				zz = getGroundPosition(x,y,zz+2)
			end
			if zz == 0 then
				zz = getGroundPosition(x,y,zz+2.5)
			end
			if zz == 0 then
				xx,yy,zz = getElementPosition(stgra)
			end
			zz = zz+.1
			attachElements(stgra,player,0,2.5,1,za,zb)
			setTimer(function()
				x,y = getElementPosition(stgra)
				xb,yb = getElementPosition(stgrb)
				xc,yc = getElementPosition(stgrc)
				xd,yd = getElementPosition(stgrd)
				xe,ye = getElementPosition(stgre)
				detachElements(stgra)
				detachElements(stgrb)
				detachElements(stgrc)
				detachElements(stgrd)
				detachElements(stgre)
				detachElements(stgrf)
				--outputChatBox(za.."**"..zb)
				triggerServerEvent("SPSOG",resourceRoot,player,x,y,zz,za,zb,r,xb,yb,xc,yc,xd,yd,xe,ye)
				x,y,z,r,xa,ya,za,xb,yb,zb,xc,yc,zc,xd,yd,xe,ye = nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil
				destroyElement(stgra)
				destroyElement(stgrb)
				destroyElement(stgrc)
				destroyElement(stgrd)
				destroyElement(stgre)
				destroyElement(stgrf)
				stgra = nil
				stgrb = nil
				stgrc = nil
				stgrd = nil
				stgre = nil
				stgrf = nil
				playSoundFrontEnd(42)
			end,50,1)
		end,150,1)
	end
end
bindKey("z","down",PSOG)

scr = {}
scrn = 1

for i=1,30 do
	scr[i] = dxCreateScreenSource (w/6, h/6)
end

function showRep()
	dxDrawImage(w/50, h/2, w/6, h/6, scr[scrn], 0, 0, 0, tocolor(255, 255, 255, Salp), true)
	if Salp < 255 then
		Salp = Salp+17
	end
end

MCWC = 0
function MPHS(key)
	--if getElementData(player,"action") then
	if key == "vehicle_mouse_look" or key == "enter_exit" then
		if isPedInVehicle(player) then
			if getPedTotalAmmo(player,2) > 0 or getPedTotalAmmo(player,3) > 0 or getPedTotalAmmo(player,4) > 0 or getPedTotalAmmo(player,5) > 0 or getPedTotalAmmo(player,6) > 0 then
				arga = getPedOccupiedVehicle(player)
				if getVehicleType(arga) == "Helicopter" then
					for k,v in pairs(getVehicleOccupants(arga)) do
						if v == player and k ~= 0 then
							if getElementData(arga,"HSHTR") and not getElementData(arga,"HSHTR")[k] or not getElementData(arga,"HSHTR") then
								setElementData(player,"HSHTR",{arga,k})
							end
							break
						end
					end
				end
			end
		elseif getElementData(player,"HSHTR") then
			arga = getElementData(player,"HSHTR")[1]
			argb = getElementData(player,"HSHTR")[2]
			if not getVehicleOccupant(arga,argb) then
				setElementData(player,"HSHTRH",getElementData(player,"HSHTR")[1])
			end
		end
	elseif key == "next_weapon" then
		MCW = getPedWeaponSlot(player)
		NWPS()
	elseif key == "previous_weapon" then
		MCW = getPedWeaponSlot(player)
		PWPS()
	elseif key == "jump" then
		setElementData(player,"HSHTR",nil)
	end
	--end
end

addEventHandler("onClientElementDestroy",root,function()
	if getElementType(source) == "vehicle" then
		OEDOVE(source)
	end
end)

function OEDOVE(exveh)
	if not exveh then
		exveh = source
	end
	if exveh == getPedOccupiedVehicle(player) then
		unbindKey("vehicle_mouse_look","down",SPDGDB)
	end
	if getElementData(player,"HSHTR") then
		if exveh == getPedOccupiedVehicle(player) or getElementData(player,"HSHTR")[1] == exveh then
			setElementAlpha(player,255)
			setElementAlpha(exveh,255)
			if WATH[player] and isElement(WATH[player]) then
				setElementAlpha(WATH[player],255)
				if WATHb[player] and isElement(WATHb[player]) then
					setElementAlpha(WATHb[player],255)
				end
			end
			setElementData(player,"HSHTR",nil)
			setElementData(player,"HSHTRH",nil)
			unbindKey("next_weapon","down",MPHS)
			unbindKey("previous_weapon","down",MPHS)
			unbindKey("jump","down",MPHS)
			unbindKey("enter_exit","down",MPHS)
			MCW = nil
			unbindKey("vehicle_mouse_look","down",MPHS)
			for k,v in pairs(getAttachedElements(exveh)) do
				if isElement(v) then
					destroyElement(v)
				end
			end
		end
	end
end
addEventHandler("onClientVehicleExplode",root,OEDOVE)

addEventHandler("onClientVehicleDamage",root,function(attacker,arg,arg,arg,arg,arg,argc)
	argd = getPedOccupiedVehicle(player)
	if argd and source == argd then
		atk = nil
		if attacker then
			if getElementType(attacker) == "vehicle" then
				atk = getVehicleOccupant(attacker)
			elseif getElementType(attacker) == "player" then
				atk = attacker
			end
		end
		if atk and atk ~= player then
			if getPlayerTeam(atk) ~= getTeamFromName("No Team") and getPlayerTeam(atk) == getPlayerTeam(player) then
				cancelEvent()
			elseif getPlayerTeam(atk) == getTeamFromName("Police") then
				if getElementData(player,"WantLvl") < 3 then
					cancelEvent()
				elseif getElementData(player,"Stats") == 1 and not argc then
					cancelEvent()
				end
			end
		end
	end
end)

function NWPS()
	MCWC = MCWC+1
	if MCWC ~= 6 then
		if MCW > 5 then
			MCW = 2
		else
			MCW = MCW+1
		end
		if getPedTotalAmmo(player, MCW) > 0 then
			setPedWeaponSlot(player, MCW)
			MCWC = 0
		else
			NWPS()
		end
	end
end

function PWPS()
	MCWC = MCWC-1
	if MCWC ~= 6 then
		if MCW < 3 then
			MCW = 6
		else
			MCW = MCW-1
		end
		if getPedTotalAmmo(player, MCW) > 0 then
			setPedWeaponSlot(player, MCW)
			MCWC = 0
		else
			PWPS()
		end
	end
end

function showHI(atk)
	x, y = getCameraMatrix()
	ax, ay = getElementPosition(player)
	vica = 360-math.deg(math.atan2((ax-x), (ay-y)))
	Ialp = nil
	for k,v in pairs(atks) do
		if v[1] > 0 then
			Ialp = true
			vica = vica-v[2]
			if vica >= 720 then
				vica = vica - 720
			elseif vica >= 360 then
				vica = vica - 360
			elseif vica < 0 then
				vica = vica + 360
			end
			dxDrawImage(0, 0, w, h, "images/hi.png", vica, 0, 0, tocolor(255, 255, 255, v[1]), true)
			atks[k][1] = v[1]-1.4
		end
	end
	if not Ialp then
		atks = {}
		removeEventHandler("onClientRender", root, showHI)
	end
end
setElementData(player,"GType",1)
setElementData(player,"GLType",1)

setElementData(player,"ES",2,false)
setWorldSoundEnabled(5,3,false)
setWorldSoundEnabled(5,4,false)
setWorldSoundEnabled(5,6,false)
setWorldSoundEnabled(5,7,false)
setWorldSoundEnabled(5,76,false)
setWorldSoundEnabled(5,77,false)
setWorldSoundEnabled(5,24,false)
setWorldSoundEnabled(5,73,false)
setWorldSoundEnabled(5,74,false)
setWorldSoundEnabled(5,21,false)
setWorldSoundEnabled(5,22,false)
setWorldSoundEnabled(5,29,false)
setWorldSoundEnabled(5,30,false)
setWorldSoundEnabled(5,0,false)
setWorldSoundEnabled(5,1,false)
setWorldSoundEnabled(5,17,false)
setWorldSoundEnabled(5,18,false)
setWorldSoundEnabled(5,33,false)
setWorldSoundEnabled(5,53,false)
setWorldSoundEnabled(5,52,false)
setWorldSoundEnabled(5,26,false)
setWorldSoundEnabled(5,27,false)

setElementData(player,"EA",true,false)


setElementData(player,"DRep",true,false)
setElementData(player,"HInd",true,false)
--setTimer(function()
	--bindKey("aim_weapon","down",HWASCSAC)
	--bindKey("aim_weapon","up",HWASCSAC)
	
	------------------------------convert commands it to Iphone----------------------------------
	addCommandHandler("ws",function(cmd,id)
		if id == "0" then
			setElementData(player,"ES",0,false)
			setWorldSoundEnabled(5,3,true)
			setWorldSoundEnabled(5,4,true)
			setWorldSoundEnabled(5,6,true)
			setWorldSoundEnabled(5,7,true)
			setWorldSoundEnabled(5,76,true)
			setWorldSoundEnabled(5,77,true)
			setWorldSoundEnabled(5,24,true)
			setWorldSoundEnabled(5,73,true)
			setWorldSoundEnabled(5,74,true)
			setWorldSoundEnabled(5,21,true)
			setWorldSoundEnabled(5,22,true)
			setWorldSoundEnabled(5,29,true)
			setWorldSoundEnabled(5,30,true)
			setWorldSoundEnabled(5,0,true)
			setWorldSoundEnabled(5,1,true)
			setWorldSoundEnabled(5,17,true)
			setWorldSoundEnabled(5,18,true)
			setWorldSoundEnabled(5,33,true)
			setWorldSoundEnabled(5,53,true)
			setWorldSoundEnabled(5,52,true)
			setWorldSoundEnabled(5,26,true)
			setWorldSoundEnabled(5,27,true)
		else
			setElementData(player,"ES",getElementData(player,"ES")+1,false)
			if id == "2" then
				setWorldSoundEnabled(5,3,false)
				setWorldSoundEnabled(5,4,false)
				setWorldSoundEnabled(5,6,false)
				setWorldSoundEnabled(5,7,false)
				setWorldSoundEnabled(5,76,false)
				setWorldSoundEnabled(5,77,false)
				setWorldSoundEnabled(5,24,false)
				setWorldSoundEnabled(5,73,false)
				setWorldSoundEnabled(5,74,false)
				setWorldSoundEnabled(5,21,false)
				setWorldSoundEnabled(5,22,false)
				setWorldSoundEnabled(5,29,false)
				setWorldSoundEnabled(5,30,false)
				setWorldSoundEnabled(5,0,false)
				setWorldSoundEnabled(5,1,false)
				setWorldSoundEnabled(5,17,false)
				setWorldSoundEnabled(5,18,false)
				setWorldSoundEnabled(5,33,false)
				setWorldSoundEnabled(5,53,false)
				setWorldSoundEnabled(5,52,false)
				setWorldSoundEnabled(5,26,false)
				setWorldSoundEnabled(5,27,false)
			end
		end
	end)

	addCommandHandler("wa",function(cmd,id)
		if id == "0" then
			setElementData(player,"EA",nil,false)
			for k,v in pairs(getElementsByType("player")) do
				OCPQ(v)
			end
		else
			setElementData(player,"EA",true,false)
		end
	end)

	function MVW()
		removeCommandHandler("hp",MVW)
		setTimer(function() addCommandHandler("hp",MVW) end,2000,1)
		if getElementData(player,"MCH") then
			if not GUIEditor.window[4] then
				GUIEditor.window[4] = guiCreateWindow(w/2.25, h/3.25, w/8.87, h/2.36, "House Permissions", false)
				guiWindowSetSizable(GUIEditor.window[4], false)

				GUIEditor.gridlist[2] = guiCreateGridList(w/151.8, h/28.4, w/10.2, h/4.5, false, GUIEditor.window[4])
				hpmsc = guiGridListAddColumn(GUIEditor.gridlist[2], "Players", 0.9)
				GUIEditor.button[9] = guiCreateButton(w/124.2, h/3.76, w/22.4, h/23.3, "Add", false, GUIEditor.window[4])
				guiSetProperty(GUIEditor.button[9], "NormalTextColour", "FFAAAAAA")
				GUIEditor.button[10] = guiCreateButton(w/16.46, h/3.76, w/22.4, h/23.3, "Remove", false, GUIEditor.window[4])
				guiSetProperty(GUIEditor.button[10], "NormalTextColour", "FFAAAAAA")
				GUIEditor.button[11] = guiCreateButton(w/124.2, h/2.7, w/10.2, h/23.3, "Done", false, GUIEditor.window[4])
				guiSetProperty(GUIEditor.button[11], "NormalTextColour", "FFAAAAAA")  
				GUIEditor.button[12] = guiCreateButton(w/16.46, h/3.1, w/22.4, h/23.3, "Cancel", false, GUIEditor.window[4])
				guiSetProperty(GUIEditor.button[12], "NormalTextColour", "FFAAAAAA")
				GUIEditor.edit[1] = guiCreateEdit(w/47, h/3.1, w/30, h/26.5, "", false, GUIEditor.window[4])
				GUIEditor.label[3] = guiCreateLabel(w/124.2, h/3, w/91, h/40.4, "ID", false, GUIEditor.window[4])
				if getElementData(player,"PMS") then
					for k,v in pairs(getElementData(player,"PMS")) do
						row = guiGridListAddRow(GUIEditor.gridlist[2])
						guiGridListSetItemText(GUIEditor.gridlist[2],row,hpmsc,v,false,false)
					end
				end
				showCursor(true)
			end
		else
			outputChatBox("You need to buy a house first!",255,255,0)
		end
	end
	addCommandHandler("hp",MVW)

	addCommandHandler("dr",function(cmd,id)
		if id == "0" then
			setElementData(player,"DRep",nil,false)
			if RepT then
				killTimer(RepT)
				RepT = nil
			end
			scr = {}
		else
			scr = {}
			scrn = 1
			for i=1,30 do
				scr[i] = dxCreateScreenSource (w/6, h/6)
			end
			setElementData(player,"DRep",true,false)
			RepT = setTimer(function()
				dxUpdateScreenSource(scr[scrn])
				scrn = scrn+1
				if scrn > 30 then
					scrn = 1
				end
			end,100, 0)
		end
	end)

	addCommandHandler("hi",function(cmd,id)
		if id == "0" then
			setElementData(player,"HInd",nil,false)
		else
			setElementData(player,"HInd",true,false)
		end
	end)
--end,1000,1)


addEventHandler("onClientPlayerDamage", root,
function(attacker, weapon)
	if attacker and getElementType(attacker) == "player" and attacker ~= source then 
		if (weapon == 41) then
			cancelEvent()

		end
	end
end)

function starsEscape(player)
    triggerServerEvent("JailEscape", resourceRoot, player)
end


GUIJail = {
    gridlist = {},
    window = {},
    button = {}
}
 
        GUIJail.window[1] = guiCreateWindow(454, 185, 309, 294, "Paid Bail", false)
        guiWindowSetSizable(GUIJail.window[1], false)
        guiSetVisible(GUIJail.window[1], false)
        GUIJail.gridlist[1] = guiCreateGridList(14, 28, 281, 184, false, GUIJail.window[1])
        guiGridListAddColumn(GUIJail.gridlist[1], "Names", 0.5)
        guiGridListAddColumn(GUIJail.gridlist[1], "Price", 0.5)
        GUIJail.button[1] = guiCreateButton(13, 220, 282, 26, "Paid Bail Player", false, GUIJail.window[1])
        GUIJail.button[2] = guiCreateButton(13, 256, 282, 26, "Close", false, GUIJail.window[1])

	
function setPlayersInJailsColum	()
         guiGridListClear(GUIJail.gridlist[1])
		 countPlayersInJail = false
		  for i,v in ipairs(getElementsByType("player")) do
		      local data = (getElementData(v,"Stats") or 0 )
		         if data == 3 and getPlayerTeam(v) then
				     countPlayersInJail = true
				     local row = guiGridListAddRow(GUIJail.gridlist[1])
		                         guiGridListSetItemText(GUIJail.gridlist[1], row, 1, getPlayerName(v), false, false)
				                 guiGridListSetItemColor(GUIJail.gridlist[1], row, 1,255,255,0)
								 guiGridListSetItemText(GUIJail.gridlist[1], row, 2, "12,000", false, false)
				                 guiGridListSetItemColor(GUIJail.gridlist[1], row, 2,255,255,0)
				 end
		  end

end
		
BribeMarker =  createMarker (1595.96,-1677.85,82 , "cylinder", 1.5, 0, 255, 152, 100)
setElementInterior(BribeMarker,200)
setElementDimension(BribeMarker,200)

function ActionBribeMarker (key, keyState,marker,obj )
	if key == "action"then
		if keyState == "down" and isElementWithinMarker(localPlayer,marker) and getTeamN(localPlayer) ~= "Police"  then
		    if not isTimer(isPlayerBlockedJail2) and guiGetVisible(GUIJail.window[1]) == false then
			    if getElementData(localPlayer,"WantLvl") == 0 and getElementData(localPlayer,"Money") >= 12000 then
					guiSetVisible(GUIJail.window[1], true)
					setPlayersInJailsColum	() 
					showCursor(true)
			    elseif getElementData(player, "WantLvl") == 1 and getElementData(player,"Money") >= 200 then
					setElementData(player, "Money", getElementData(player,"Money")-200)
					setElementData(player, "WantLvl",0) 
					isPlayerBlockedJail2 = setTimer(function() end,30000,1)
					if isTimer(chance) then killTimer(chance) chance = nil end
			    elseif getElementData(player, "WantLvl") == 2 and getElementData(player,"Money") >= 500  then
					setElementData(player, "Money", getElementData(player,"Money")-500)
					setElementData(player, "WantLvl",0)
					isPlayerBlockedJail2 = setTimer(function() end,30000,1)
					if isTimer(chance) then killTimer(chance) chance = nil end
	            end
		    end	
        end
    end
end
bindKey("action", "down", ActionBribeMarker,BribeMarker )
  
addEventHandler( "onClientMarkerLeave", BribeMarker, function (pl,demin)
    if pl == localPlayer and demin then
        if guiGetVisible(GUIJail.window[1]) then
            guiSetVisible(GUIJail.window[1], false)
            showCursor(false)
        end	 
    end
end)  



function onGuiClick (button, state, absoluteX, absoluteY) 
	if (source == GUIJail.button[1]) and guiGridListGetSelectedItem(GUIJail.gridlist[1]) ~= -1 then
		local wc = getPlayerFromName(guiGridListGetItemText(GUIJail.gridlist[1],guiGridListGetSelectedItem(GUIJail.gridlist[1]),1))
		guiSetVisible(GUIJail.window[1], false)
		showCursor(false)
		if wc then
			triggerServerEvent("BAIL2", wc,localPlayer)  
			isPlayerBlockedJail2 = setTimer(function() end,30000,1)
			setElementData(player, "Money", getElementData(player,"Money")-12000)
		end	 
	elseif (source == GUIJail.button[2])  then
		guiSetVisible(GUIJail.window[1], false)
		showCursor(false)
    end
end
addEventHandler("onClientGUIClick", resourceRoot, onGuiClick)

function isElementInMarkers (targ)
	local isinMarker 
	for marker,v in pairs(isMarkersBank) do
		if isElementWithinMarker(targ, marker) then
			isinMarker = true
		end
	end	
    if isElementWithinMarker(targ, wm1) or isElementWithinMarker(targ, wm2) or isElementWithinMarker(targ, wm4) 
	or isElementWithinMarker(targ, wm3) or isElementWithinMarker(targ, pzr1) or isElementWithinMarker(targ, pzr2) 
	or isElementWithinMarker(targ, pzr3) or isElementWithinMarker(targ, bsr1) or isElementWithinMarker(targ, bsr2) 
	or isElementWithinMarker(targ, cbr1) or isElementWithinMarker(targ, cbr2) or isElementWithinMarker(targ, bk1) 
	or isElementWithinMarker(targ, bk2) 
	or isElementWithinMarker(targ, atm1) or isElementWithinMarker(targ, atm2) or isElementWithinMarker(targ, atm3) 
	or isElementWithinMarker(targ, atm5) or isElementWithinMarker(targ, atm6) or isElementWithinMarker(targ, atm7) 
	or isElementWithinMarker(targ, atm8) or isElementWithinMarker(targ, atm9) or isElementWithinMarker(targ, atm10) 
	or isElementWithinMarker(targ, knho1) or isElementWithinMarker(targ, knho2) or isElementWithinMarker(targ, knho3) 
	or isElementWithinMarker(targ, drus) or isinMarker then
	    return true
	end
end
 
function ocmsd ()
	local stats = getElementData(player,"Stats") or 0
	if stats == 3 and bail == 0 then
	    bailing()
	end	
end
addCommandHandler("qj",ocmsd)

collectgarbage("collect")

if fileExists("GW_c.lua") then fileDelete("GW_c.lua") end

end )