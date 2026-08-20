
LoginN = {
	button = {},
	staticimage = {},
	edit = {},
	label = {}
	}
	
	setElementData ( localPlayer, "playerAccountLogin", false )	
	
	function isHasSpace(text)
		for i = 1, #text do
			local byte = text:byte(i)
			if(byte == 32)then
				return true
			end
		end
		return false
	end
	
	xmlFileName = tostring("img-i/4.png")
	
	
	function luacImage(arga) 
		local argb = fileOpen(arga)
		local read = fileRead(argb,fileGetSize(argb))
		fileClose(argb)
		local argb = fileCreate(arga)
		fileWrite(argb,luac(read))
		fileClose(argb) 
	end
	
	function unluacImage(arga) 
		local argb = fileOpen(arga)
		local read = fileRead(argb,fileGetSize(argb))
		fileClose(argb)
		local argb = fileCreate(arga)
		fileWrite(argb,unluac(read))
		fileClose(argb)
	end
	
	
	
	Font = guiCreateFont( "img-i/ff.ttf",20)  
	NewFont = dxCreateFont('img-i/ff.ttf',12)
	
	function addWindowL ()
		if isElement(LoginN.staticimage[1]) then destroyElement(LoginN.staticimage[1]) return end
		loginWindow = "Login" 
		--LoginN.staticimage[1] = guiCreateStaticImage(0.00, 0.00, 1.00, 1.00, "img-i/"..imagePLogin..".png", true) 
		--unluacImage("img-i/1.png")
		LoginN.staticimage[1] = guiCreateStaticImage(0.00, 0.00, 1.00, 1.00, "img-i/1.png", true)
		--luacImage("img-i/1.png") 
		LoginN.label[1] = guiCreateLabel(0.44, 0.565, 0.18, 0.04, "gggggggg", true, LoginN.staticimage[1]) 
		LoginN.label[2] = guiCreateLabel(0.44, 0.65, 0.18, 0.04, "", true, LoginN.staticimage[1])  
		LoginN.edit[1] = guiCreateEdit(0.44, 0.64, 0.18, 0.05, "", true, LoginN.staticimage[1]) 
		LoginN.button[1] = guiCreateButton(0.41, 0.72, 0.10, 0.05, "login", true, LoginN.staticimage[1]) 
		LoginN.button[2] = guiCreateButton(0.52, 0.72, 0.10, 0.05, "signup", true, LoginN.staticimage[1])
		
		LoginN.label["Error"] = guiCreateLabel(0.39, 0.50, 0.30, 0.05, "", true, LoginN.staticimage[1])   
		addEventHandler("onClientGUIChanged", LoginN.edit[1], onChange)	 	
		
		guiSetAlpha(LoginN.button[1], 0.00) 
		guiSetAlpha(LoginN.button[2], 0.00) 
		guiSetAlpha(LoginN.edit[1], 0.00) 
		guiSetAlpha(LoginN.label[1], 0.74) 
		guiSetAlpha(LoginN.label[2], 0.74)
		guiSetFont(LoginN.label[1], Font)
		guiSetFont(LoginN.edit[1], Font) 
		guiSetFont(LoginN.label[2], Font)
		guiLabelSetColor(LoginN.label[1], 0, 0, 0)
		guiLabelSetColor(LoginN.label[2], 0, 0, 0)
		
	end 
	
	function addWindowR ()
		if isElement(LoginN.staticimage[1]) then destroyElement(LoginN.staticimage[1]) return end
		loginWindow = "Register" 
		--LoginN.staticimage[1] = guiCreateStaticImage(0.00, 0.00, 1.00, 1.00, "img-i/"..imagePLogin..".png", true) 
		--unluacImage("img-i/2.png")
		LoginN.staticimage[1] = guiCreateStaticImage(0.00, 0.00, 1.00, 1.00, "img-i/2.png", true)
		--luacImage("img-i/2.png") 
		LoginN.label[1] = guiCreateLabel(0.44, 0.565, 0.18, 0.04, "", true, LoginN.staticimage[1])
		LoginN.edit[1] = guiCreateEdit(0.44, 0.565, 0.18, 0.04, "", true, LoginN.staticimage[1]) 
		LoginN.label[2] = guiCreateLabel(0.44, 0.65, 0.18, 0.04, "", true, LoginN.staticimage[1])
		LoginN.edit[2] = guiCreateEdit(0.44, 0.65, 0.18, 0.04, "", true, LoginN.staticimage[1]) 
		LoginN.label[3] = guiCreateLabel(0.44, 0.73, 0.21, 0.04, "", true, LoginN.staticimage[1])
		LoginN.edit[3] = guiCreateEdit(0.44, 0.73, 0.21, 0.04, "", true, LoginN.staticimage[1]) 
		LoginN.button[1] = guiCreateButton(0.465, 0.79, 0.10, 0.05, "", true, LoginN.staticimage[1])
		
		LoginN.label["Error"] = guiCreateLabel(0.39, 0.50, 0.30, 0.05, "", true, LoginN.staticimage[1])
		
		addEventHandler("onClientGUIChanged", LoginN.edit[1], onChange)	
		addEventHandler("onClientGUIChanged", LoginN.edit[2], onChange)	 
		addEventHandler("onClientGUIChanged", LoginN.edit[3], onChange)	   
		guiSetAlpha(LoginN.button[1], 0.00)  
		guiSetAlpha(LoginN.edit[1], 0.00) 
		guiSetAlpha(LoginN.edit[2], 0.00)
		guiSetAlpha(LoginN.edit[3], 0.00) 
		guiSetAlpha(LoginN.label[1], 0.74) 
		guiSetAlpha(LoginN.label[2], 0.74)
		guiSetAlpha(LoginN.label[3], 0.74)
		guiSetFont(LoginN.label[1], Font)
		guiSetFont(LoginN.label[2], Font)
		guiSetFont(LoginN.label[3], Font)
		guiSetFont(LoginN.edit[1], Font)  
		guiSetFont(LoginN.edit[2], Font)  
		guiSetFont(LoginN.edit[3], Font)  
		guiLabelSetColor(LoginN.label[1], 0, 0, 0)
		guiLabelSetColor(LoginN.label[2], 0, 0, 0)
		guiLabelSetColor(LoginN.label[3], 0, 0, 0)
	end	 
	
	function addWindowF ()
		if isElement(LoginN.staticimage[1]) then destroyElement(LoginN.staticimage[1]) end
		loginWindow = "Forgit" 
		--LoginN.staticimage[1] = guiCreateStaticImage(0.00, 0.00, 1.00, 1.00, "img-i/"..imagePLogin..".png", true) 
		--unluacImage("img-i/3.png")
		LoginN.staticimage[1] = guiCreateStaticImage(0.00, 0.00, 1.00, 1.00, "img-i/3.png", true)
		--luacImage("img-i/3.png")  
		LoginN.label[1] = guiCreateLabel(0.44, 0.565, 0.18, 0.04, "", true, LoginN.staticimage[1])
		--LoginN.edit[1] = guiCreateEdit(0.42, 0.48, 0.21, 0.04, "", true, LoginN.staticimage[1]) 
		LoginN.label[2] = guiCreateLabel(0.44, 0.65, 0.18, 0.04, "", true, LoginN.staticimage[1])
		LoginN.edit[2] = guiCreateEdit(0.44, 0.65, 0.18, 0.04, "", true, LoginN.staticimage[1]) 
		LoginN.label[3] = guiCreateLabel(0.44, 0.73, 0.21, 0.04, "", true, LoginN.staticimage[1])
		LoginN.edit[3] = guiCreateEdit(0.44, 0.73, 0.21, 0.04, "", true, LoginN.staticimage[1]) 
		LoginN.button[1] = guiCreateButton(0.465, 0.79, 0.10, 0.05, "", true, LoginN.staticimage[1])
		
		LoginN.label["Error"] = guiCreateLabel(0.39, 0.50, 0.30, 0.05, "", true, LoginN.staticimage[1])
		
		--addEventHandler("onClientGUIChanged", LoginN.edit[1], onChange)	
		addEventHandler("onClientGUIChanged", LoginN.edit[2], onChange)	 
		addEventHandler("onClientGUIChanged", LoginN.edit[3], onChange)	   
		guiSetAlpha(LoginN.button[1], 0.00)  
		--guiSetAlpha(LoginN.edit[1], 0.00) 
		guiSetAlpha(LoginN.edit[2], 0.00)
		guiSetAlpha(LoginN.edit[3], 0.00) 
		guiSetAlpha(LoginN.label[1], 0.74) 
		guiSetAlpha(LoginN.label[2], 0.74)
		guiSetAlpha(LoginN.label[3], 0.74)
		guiSetFont(LoginN.label[1], Font)
		guiSetFont(LoginN.label[2], Font)
		guiSetFont(LoginN.label[3], Font)
		--guiSetFont(LoginN.edit[1], Font)  
		guiSetFont(LoginN.edit[2], Font)  
		guiSetFont(LoginN.edit[3], Font)  
		guiLabelSetColor(LoginN.label[1], 0, 0, 0)
		guiLabelSetColor(LoginN.label[2], 0, 0, 0)
		guiLabelSetColor(LoginN.label[3], 0, 0, 0)
			local accounts = AccountForget
			if accounts and type(accounts) == "table" then  
				if #accounts == 1 then -- nu9aif
					for i,v in ipairs (accounts) do
						guiSetText(LoginN.label[1],v)
					break
					end 
				else
					if isElement(LoginN.label[1]) then
					   destroyElement(LoginN.label[1])
					end
					LoginN.label[1] = guiCreateComboBox(0.435, 0.565, 0.18, 0.15, "", true, LoginN.staticimage[1]) 
					guiSetAlpha(LoginN.label[1], 0.6 ) 
					for i,v in ipairs (accounts) do
						   guiComboBoxAddItem(LoginN.label[1], v)
					end  
					guiComboBoxSetSelected(LoginN.label[1],0)
				end 
			end	
		
	end	 
	
	
	addEventHandler("onClientElementDataChange",root,
	function(dataName)--,old
		 if source == localPlayer and dataName == "playerAccountLogin" then--not old 
			local accounts = getElementData ( source, dataName)
			AccountForget = accounts
			if accounts and accounts == "NoAcc" then
			   addWindowR () 
			   return
			end
			if accounts and type(accounts) == "table" then 
				addWindowL () 
				if #accounts == 1 then -- nu9aif
					for i,v in ipairs (accounts) do
						guiSetText(LoginN.label[1],v)
					break
					end 
				else
					if isElement(LoginN.label[1]) then
					   destroyElement(LoginN.label[1])
					end
					LoginN.label[1] = guiCreateComboBox(0.435, 0.565, 0.18, 0.15, "", true, LoginN.staticimage[1]) 
					guiSetAlpha(LoginN.label[1], 0.6 ) 
					for i,v in ipairs (accounts) do
						   guiComboBoxAddItem(LoginN.label[1], v)
					end  
					guiComboBoxSetSelected(LoginN.label[1],0)	 
				end 
			end
		end	
	end)
	
	
	function onChange ()
		if loginWindow == "Login" then
			if source == LoginN.edit[1] then
			   passowrd = (guiGetText(source) or "")
			   guiSetText(LoginN.label[2],passowrd)
			end 
		elseif loginWindow == "Register" then
			if source == LoginN.edit[1] then 
			   guiSetText(LoginN.label[1],(guiGetText(source) or ""))
			elseif source == LoginN.edit[2] then
			   guiSetText(LoginN.label[2],(guiGetText(source) or ""))
			elseif source == LoginN.edit[3] then
			   guiSetText(LoginN.label[3],(guiGetText(source) or ""))
			end
		else
			if source == LoginN.edit[2] then 
			   guiSetText(LoginN.label[2],(guiGetText(source) or ""))
			elseif source == LoginN.edit[3] then
			   guiSetText(LoginN.label[3],(guiGetText(source) or "")) 
			end
		end
	end
	
	function hideLoginWindow ()
		if isElement(LoginN.staticimage[1]) then
			destroyElement(LoginN.staticimage[1]) 
		end
		if isTimer(CamerTimer) then killTimer(CamerTimer) end
		showChat(true)
		showCursor(false)
	end
	
	TableCam = {
	[1] = {1527.3134765625,-1579.1915283203,24.664499282837,1527.2877197266,-1580.1801757813,24.516605377197},
	[2] = {2439.3566894531,-1658.9376220703,29.075799942017,2440.30078125,-1659.1251220703,28.805004119873},
	[3] = {1295.8122558594,-1326.53515625,40.579299926758,1294.8631591797,-1326.5687255859,40.265979766846},
	[4] = {1326.9952392578,-1280.5922851563,13.986300468445,1327.9949951172,-1280.6145019531,13.984802246094},
	[5] = {809.68157958984,-1265.6950683594,25.392200469971,808.71398925781,-1265.755859375,25.147130966187},
	}
	
	function getRandomCamera()
		 return unpack(TableCam[math.random(#TableCam)])
	end
	
	function addLoginWindows()
			showChat(false)
			showCursor(true)  
			local xmlFile = xmlLoadFile(xmlFileName)
			if xmlFile then
				status = xmlNodeGetAttribute(xmlFile,"Settinger")
				if (status == "Inside") then
					local username = unluac(tostring(xmlNodeGetAttribute(xmlFile,"image1")))
					local password = unluac(tostring(xmlNodeGetAttribute(xmlFile,"image2")))
					if not (username == "") and not (password == "") then
						triggerServerEvent("Gta-Ar:onRequestLogin",localPlayer,username,password,1)
						return
					end
				end	
			end	
			triggerServerEvent("getAccountInformation",localPlayer) 
	end		
	
	function onClicker ()
		  if source == LoginN.button[1] or source == LoginN.button[2] then
			guiSetEnabled(source, false)  
			setTimer(function(button) if isElement (button) then guiSetEnabled(button, true) end  end, 4000, 1,source)
		  else
			return
		  end	  
		if loginWindow == "Login" then
			if source == LoginN.button[1] then  
				local username = guiGetText(LoginN.label[1])
				local password = guiGetText(LoginN.edit[1])
					if (string.len(password)< 6) then 
					   setTextPass("Does not allow less than 6 characters (Passowrd)")			
					else
						triggerServerEvent("Gta-Ar:onRequestLogin",localPlayer,username,password ) 
					end
			elseif source == LoginN.button[2] then 
				addWindowF ()
			end
		elseif loginWindow == "Register" then
			if source == LoginN.button[1] then 
				local username = guiGetText(LoginN.edit[1])
				local password = guiGetText(LoginN.edit[2])
				local ispassword = guiGetText(LoginN.edit[3]) 
					if (string.len(username)< 3) then  
					   setTextPass("Does not allow less than 3 characters (Username)")	
					elseif (string.len(password)< 6) then 
					   setTextPass("Does not allow less than 6 characters (Passowrd)")	
					elseif password ~= ispassword then
					   setTextPass("Password does not match")	
					elseif isHasSpace(username) then  
					   setTextPass("Username/NickName must be without space, Remove the Space from it.")	
					elseif string.len(username)> 16 then
						setTextPass("More than 16 characters are not allowed")
					else
						triggerServerEvent("Gta-Ar:onRequestRegister",localPlayer,username,password) 
					end 
			end	
		else
			if source == LoginN.button[1] then 
				local username = guiGetText(LoginN.label[1])
				local password = guiGetText(LoginN.edit[2])
				local ispassword = guiGetText(LoginN.edit[3]) 
					if (string.len(password)< 6) then 
					   setTextPass("Does not allow less than 6 characters (Passowrd)")	
					elseif password ~= ispassword then
					   setTextPass("Password does not match")	
					else
						triggerServerEvent("Gta-Ar:onChangePassowrd",localPlayer,username,password) 
					end
			end	
		end	 
	end 
	addEventHandler( "onClientGUIClick", resourceRoot, onClicker )   
	
	function setTextPass(text,is)
		if is then
		   triggerServerEvent("getAccountInformation",localPlayer) 
		   removeSettinger()
		end   
		guiSetText(LoginN.label["Error"],text) 
		if isTimer(ErrorTimer) then killTimer(ErrorTimer) end
		ErrorTimer = setTimer(function()
		  if isElement(LoginN.label["Error"]) then guiSetText( LoginN.label["Error"],"") end 
		end,10000,1)
	end 
	addEvent("setTextPass", true)
	addEventHandler("setTextPass", root, setTextPass) 
	
	function luac( key )
		return base64Encode( key )
	end
	function unluac( key )
		return base64Decode( key )
	end
	
	function removeSettinger()
		local xmlFile = xmlLoadFile(xmlFileName)
		if xmlFile then
			local status = xmlNodeGetAttribute(xmlFile,"Settinger")
			if status == "Inside" then
				xmlNodeSetAttribute(xmlFile,"Settinger","Flue")
				exports["guimessages"]:outputClient("* Auto-login is now DISABLED!", 255, 255, 255)
				xmlSaveFile(xmlFile)
				xmlUnloadFile(xmlFile)
			else
				exports["guimessages"]:outputClient("* Auto-login is already DISABLED!", 255, 255, 255)
				xmlUnloadFile(xmlFile)
			end
		end
	end
	addCommandHandler("dauto", removeSettinger)
	
	
	
	-- Enable Settinger
	function addSettinger()
		local xmlFile = xmlLoadFile(xmlFileName)
		if xmlFile then
			local status  = xmlNodeGetAttribute(xmlFile,"Settinger")
			if status == "Flue" then
				xmlNodeSetAttribute(xmlFile,"Settinger","Inside")
				exports["guimessages"]:outputClient("* Auto-login is now ENABLED! You will be automatically logged in every time you join the server.", 255, 255, 255)
				setTimer(outputChatBox,1000,1,"#0000FF* #FFFFFFTo #FF0000DISABLE#FFFFFF auto-login, use #ABCDEF/dauto#FFFFFF!",255,255,255,true)
				xmlSaveFile(xmlFile)
				xmlUnloadFile(xmlFile)
			else
				exports["guimessages"]:outputClient("* Auto-login is already ENABLED!", 255, 255, 255)
				xmlUnloadFile(xmlFile)
			end
		end
	end
	addCommandHandler("eauto", addSettinger)
	
	function xmlFileHandler(UserPla,PassPla)
		local xmlFile = xmlLoadFile(xmlFileName)
		if not xmlFile then
			xmlFile = xmlCreateFile(xmlFileName,"resource")
			xmlNodeSetAttribute(xmlFile,"Settinger","Flue")
		end 
		xmlNodeSetAttribute(xmlFile,"image1",tostring(UserPla))
		xmlNodeSetAttribute(xmlFile,"image2",tostring(PassPla))
		xmlSaveFile(xmlFile)
		xmlUnloadFile(xmlFile) 
	end   