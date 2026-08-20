-------------------------------------------------
--[[

// GIE ( GUI Interpolate Effects ) - v 1.0
    -- File : GIE.lua
    -- Author : PaiN^

--]]

local screen = { guiGetScreenSize( ) }
local active_gui_elements = 
{
}

local easingTypes =
{
    "Linear", "InQuad", "OutQuad", "InOutQuad", "OutInQuad", "InElastic", "OutElastic", "InOutElastic",
    "OutInElastic", "InBack", "OutBack", "InOutBack", "OutInBack", "InBounce", "OutBounce", 
    "InOutBounce", "OutInBounce", "SineCurve", "CosineCurve" 
}

function isGUIElementActive( window )
    if not window then
        return false
    end
    if active_gui_elements[window] then
        return true
    end
    return false
end

function isGUIElement( element )
    if isElement( element ) then
        if getElementType( element ):find( "gui-" ) then
            return true
        end
    end
    return false
end

function interpolate( gui_element )
    if not isGUIElementActive( gui_element ) then
        return false
    end
    
    local tick = getTickCount( )
    local timePassed = tick - active_gui_elements[gui_element].startTime
    local difference = active_gui_elements[gui_element].endTime - active_gui_elements[gui_element].startTime
    local progress = timePassed / difference
    local x, y = interpolateBetween(
        active_gui_elements[gui_element].startPosition[1], active_gui_elements[gui_element].startPosition[2], 0,
        active_gui_elements[gui_element].endPosition[1], active_gui_elements[gui_element].endPosition[2], 0,
        progress, active_gui_elements[gui_element].easingTypes[1] )
    local w, h = interpolateBetween(
        active_gui_elements[gui_element].startSize[1], active_gui_elements[gui_element].startSize[2], 0,
        active_gui_elements[gui_element].endSize[1], active_gui_elements[gui_element].endSize[2], 0,
        progress, active_gui_elements[gui_element].easingTypes[2] )
    guiSetPosition( gui_element, x, y, false )
    guiSetSize( gui_element, w, h, false )
    guiSetAlpha (gui_element, guiGetAlpha (gui_element) - 0.005)
    if active_gui_elements[gui_element].showing == true then
        if not guiGetVisible( gui_element ) then
            guiSetVisible( gui_element, true )
            guiBringToFront( gui_element )
        end
    end
    if tick >= active_gui_elements[gui_element].endTime then
        removeEventHandler( "onClientRender", root, active_gui_elements[gui_element].func )
        if active_gui_elements[gui_element].showing == false then
            guiSetVisible( gui_element, false )
        end
        guiSetEnabled( gui_element, true )
        active_gui_elements[gui_element] = nil
        return true
    end
    return false
end

function guiEffect( gui_element, startX, startY, startW, startH, endX, endY, endW, endH, progressTime, position_easingType, size_easingType, showing )
    local check 
    if not isGUIElement( gui_element ) then
        outputChatBox( "Not GUI Element" )
        check = false
    end
    startX = tonumber( startX )
    startY = tonumber( startY )
    startW = tonumber( startW )
    startH = tonumber( startH )
    endX = tonumber( endX )
    endY = tonumber( endY )
    endW = tonumber( endW )
    endH = tonumber( endH )
    coordinates = 
    {
        startX, startY, startW, startH, endX, endY, endW, endH
    }
    for i = 1, #coordinates do
        if not coordinates[i] then
            check = false
        end
    end
    for i = 1, #easingTypes do
        if check == false then
            return
        end
        if easingTypes[i] == position_easingType and easingTypes[i] == size_easingType then
            check = true
        end
    end
    if active_gui_elements[gui_element] then
        check = false
    end
    if check == false then
        return false
    else
        guiSetEnabled( gui_element, false )
        progressTime = tonumber( progressTime )
        if not progressTime then progressTime = 2 end
        active_gui_elements[gui_element] = 
        {
        }
        active_gui_elements[gui_element].startTime = getTickCount( )
        active_gui_elements[gui_element].endTime = active_gui_elements[gui_element].startTime + ( progressTime * 1000 )
        active_gui_elements[gui_element].startPosition = { coordinates[1], coordinates[2] }
        active_gui_elements[gui_element].startSize = { coordinates[3], coordinates[4] }
        active_gui_elements[gui_element].endPosition = { coordinates[5], coordinates[6] }
        active_gui_elements[gui_element].endSize = { coordinates[7], coordinates[8] }
        active_gui_elements[gui_element].easingTypes = { position_easingType, size_easingType }
        active_gui_elements[gui_element].showing = showing
        active_gui_elements[gui_element].func = function( )
            interpolate( gui_element )
        end
        addEventHandler( "onClientRender", root, active_gui_elements[gui_element].func )
        return true
    end
    return false
end 

local sx, sy = guiGetScreenSize ()

function randomPics ()
  return pic1
end

function InteroStart()
    local data = getSetting ("SkipIntroN")
	if data == "true" then
		setElementData(localPlayer,"Kills",-1)
		setElementData(localPlayer,"Deaths",0)
		local vv = getSetting ("Weapons")
		if vv == "No" then
			ShowChoseWeapon()
		else
			if vv == "false" then
				NewWeapon = false
			else
				NewWeapon = true
			end
			setElementData(localPlayer,"NewWeapon",NewWeapon)
			addLoginWindows()
		end
        return
    end
      pic1 = guiCreateStaticImage ((sx / 1366) * 0, (sy / 768) * 0, (sx / 1366) * 1366, (sy / 768) * 768, "img-i/3.jpg", false)
      local p1 = randomPics ()
      guiEffect (p1, (sx / 1366) * 596, (sy / 768) * 321, (sx / 1366) * 175, (sy / 768) * 126, (sx / 1366) * 0, (sy / 768) * 0, (sx / 1366) * 1366, (sy / 768) * 768, 1, "InQuad", "InQuad", true)

	setTimer(function ()
	    --guiSetVisible (pic1, false)
		createIntro ( )
	end
	,1500,1) 
end
  
function reset()
      local p1, p2, p3, p4 = randomPics ()
	  guiSetVisible (p1, true)
	  guiEffect(p1, (sx / 1366) * 0, (sy / 768) * 0, (sx / 1366) * 1366, (sy / 768) * 768, (sx / 1366) * 596, (sy / 768) * 321, (sx / 1366) * 175, (sy / 768) * 126, 3, "InQuad", "InQuad", true)
      setTimer (guiEffect, 4000, 1, p1, (sx / 1366) * 596, (sy / 768) * 321, (sx / 1366) * 175, (sy / 768) * 126, (sx / 1366) * 596, (sy / 768) * -130, (sx / 1366) * 175, (sy / 768) * 126, 2, "InQuad", "InQuad", false)
	  setTimer(
	    function ()
		    imagePLogin = "i-"..math.random (1,2)
		    guiSetVisible(p1,false)
            setElementData(localPlayer,"Kills",-1)
            setElementData(localPlayer,"Deaths",0)
            local vv = getSetting ("Weapons")--getElementData(localPlayer,"NewWeapons")
            if vv == "No" then
                ShowChoseWeapon()
            else
                if vv == "false" then
                    NewWeapon = false
                else
                    NewWeapon = true
                end
                setElementData(localPlayer,"NewWeapon",NewWeapon)
                addLoginWindows()
            end
			if isElement(IntroSound) then
			    stopSound(IntroSound)
			end
	    end
	  ,6000,1) 
end


GUIWeb = {
    button = {},
    window = {}
} 
function ShowChoseWeapon()
        setTime( 12, 0 )
        fadeCamera(true,5)
		setPlayerHudComponentVisible( "radar", false )
		local x,y,z,xx,yy,zz = getRandomCamera()
		setCameraMatrix(x,y,z,xx,yy,zz)
		CamerTimer = setTimer(
		function ()
		    fadeCamera(false)
		    local x,y,z,xx,yy,zz = getRandomCamera()
		    setCameraMatrix(x,y,z,xx,yy,zz)
			fadeCamera(true,5)
		end,5000,0
		)
    local screenW, screenH = guiGetScreenSize()
    GUIWeb.window[1] = guiCreateWindow((screenW - 344) / 2, (screenH - 131) / 2, 344, 131, "Chose Style Weapons", false)
    guiWindowSetSizable(GUIWeb.window[1], false)

    GUIWeb.button[1] = guiCreateButton(10, 27, 324, 33, "Default Weapons (الاسلحة الأفتراضية)", false, GUIWeb.window[1])
    guiSetProperty(GUIWeb.button[1], "NormalTextColour", "FFAAAAAA")
    GUIWeb.button[2] = guiCreateButton(10, 79, 324, 33, "New Weapons (الاسلحة الجديدة)", false, GUIWeb.window[1])
    guiSetProperty(GUIWeb.button[2], "NormalTextColour", "FFAAAAAA")
	showCursor(true)
end 

function onnnnclick ()
    if source == GUIWeb.button[1] then
	    addLoginWindows()
		NewWeapon = false
		setElementData(localPlayer,"NewWeapon",NewWeapon,false)
		if isElement(GUIWeb.window[1]) then destroyElement(GUIWeb.window[1]) end
		--showCursor(false)
	elseif source == GUIWeb.button[2] then
	    addLoginWindows()
		NewWeapon = true
		setElementData(localPlayer,"NewWeapon",NewWeapon,false)
		if isElement(GUIWeb.window[1]) then destroyElement(GUIWeb.window[1]) end
		--showCursor(false)
	end
end
addEventHandler("onClientGUIClick", resourceRoot, onnnnclick) 

--===================================================================================


function createIntro ( )

    IntroSound = playSound("sounds/Intro.mp3")
    local screenW, screenH = guiGetScreenSize( )
    intro1 = guiCreateStaticImage ( 0, 0, screenW, screenH, "img-i/1.jpg", false )
    intro2 = guiCreateStaticImage ( 0, 0, screenW, screenH, "img-i/2.jpg", false )
    intro3 = guiCreateStaticImage ( 0, 0, screenW, screenH, "img-i/3.jpg", false ) 
    guiSetAlpha ( intro1, 1 )
    guiSetAlpha ( intro2, 0 )
    guiSetAlpha ( intro3, 0 )
    setTimer ( destroyIntro, 5200, 1 ) 
    introTimer  = setTimer ( function ( ) 
        if guiGetAlpha ( intro1 ) ~= 0 and guiGetAlpha ( intro2 ) == 0 and guiGetAlpha ( intro3 ) == 0 then
        guiSetAlpha ( intro1, guiGetAlpha ( intro1 ) - 0.1 )
        elseif guiGetAlpha ( intro1 ) == 0 and guiGetAlpha ( intro2 ) ~= 1 and guiGetAlpha ( intro3 ) == 0 then
            guiSetAlpha ( intro2, guiGetAlpha ( intro2 ) + 0.1 )
        elseif guiGetAlpha ( intro1 ) == 0 and guiGetAlpha ( intro2 ) > 0 and guiGetAlpha ( intro3 ) ~= 1 then
            guiSetAlpha ( intro2, guiGetAlpha ( intro2 ) - 0.1 )
            guiSetAlpha ( intro3, guiGetAlpha ( intro3 ) + 0.1 )
        elseif guiGetAlpha ( intro1 ) == 0 and guiGetAlpha ( intro2 ) == 0 and guiGetAlpha ( intro3 ) ~= 0 then
            guiSetAlpha ( intro3, guiGetAlpha ( intro3 ) - 0.1 )
        end 
    end, 100, 40 )
end

function destroyIntro ( )
    reset()
    guiSetVisible ( intro1, false )
    guiSetVisible ( intro2, false )
    guiSetVisible ( intro3, false ) 
	if isTimer(introTimer) then
        killTimer ( introTimer )
	end	
end

-----------------------------

xfile = tostring("setting/setting.xml")

function setAutoSetting()
	local xmlFile = xmlLoadFile(xfile)
	if not xmlFile then
		xmlFile = xmlCreateFile(xfile,"setting")
		xmlNodeSetAttribute(xmlFile,"SkipIntroN","false")
		xmlNodeSetAttribute(xmlFile,"WeaponsNew","No")
		xmlSaveFile(xmlFile)
		xmlUnloadFile(xmlFile) 
	end
end

function setSkipIntro(value)
	local xmlFile = xmlLoadFile(xfile)
	if not xmlFile then
		xmlFile = xmlCreateFile(xfile,"setting")
		xmlNodeSetAttribute(xmlFile,"SkipIntroN","false")
		xmlNodeSetAttribute(xmlFile,"WeaponsNew","No")
	end
	if value then
		xmlNodeSetAttribute(xmlFile,"SkipIntroN","true")
		setElementData ( localPlayer, "SkipIntroN",true)
	else
		xmlNodeSetAttribute(xmlFile,"SkipIntroN","false")
		setElementData ( localPlayer, "SkipIntroN",false)
	end
	xmlSaveFile(xmlFile)
	xmlUnloadFile(xmlFile) 
end

function setWeaponStat(value)
	local xmlFile = xmlLoadFile(xfile)
	if not xmlFile then
		xmlFile = xmlCreateFile(xfile,"setting")
		xmlNodeSetAttribute(xmlFile,"SkipIntroN","false")
		xmlNodeSetAttribute(xmlFile,"WeaponsNew","No")
	end
	if value == "No" then
		xmlNodeSetAttribute(xmlFile,"WeaponsNew","No")
		setElementData ( localPlayer, "NewWeapons",false)
	elseif value == "true" then
		xmlNodeSetAttribute(xmlFile,"WeaponsNew","true")
		setElementData ( localPlayer, "NewWeapons",true)
	elseif value == "false" then
		xmlNodeSetAttribute(xmlFile,"WeaponsNew","false")
		setElementData ( localPlayer, "NewWeapons",true)
	end
	xmlSaveFile(xmlFile)
	xmlUnloadFile(xmlFile)
end

function getSetting (value)
	local xmlFile = xmlLoadFile(xfile)
	if not xmlFile then
		xmlFile = xmlCreateFile(xfile,"setting")
		xmlNodeSetAttribute(xmlFile,"SkipIntroN","false")
		xmlNodeSetAttribute(xmlFile,"WeaponsNew","No")
	end
	if value == "SkipIntroN" then
		local skip = xmlNodeGetAttribute(xmlFile,"SkipIntroN")
		if not skip or skip ~= "true" and skip ~= "false" then
			xmlNodeSetAttribute(xmlFile,"SkipIntroN","false")
		end
		local skip = xmlNodeGetAttribute(xmlFile,"SkipIntroN")
		if skip == "true" then
			setElementData ( localPlayer, "SkipIntroN",true)
		end
		xmlSaveFile(xmlFile)
		xmlUnloadFile(xmlFile)
		return skip
	elseif value == "Weapons" then
		local weapon = xmlNodeGetAttribute(xmlFile,"WeaponsNew")
		if not weapon or weapon ~= "true" and weapon ~= "false" and weapon ~= "No" then
			xmlNodeSetAttribute(xmlFile,"WeaponsNew","No")
		end
		local weapon = xmlNodeGetAttribute(xmlFile,"WeaponsNew")
		if weapon == "true" or weapon == "false" then
			setElementData ( localPlayer, "NewWeapons",true)
		end
		xmlSaveFile(xmlFile)
		xmlUnloadFile(xmlFile)
		return weapon
	end
end

setAutoSetting()
