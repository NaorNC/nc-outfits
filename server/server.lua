FrameWork = nil
Outfits = {}
TriggerEvent(Config.TriggerPrefix .. ':GetObject', function(obj) FrameWork = obj end)

CreateThread(function()
    Wait(500)
    local fetch = json.decode(LoadResourceFile(GetCurrentResourceName(), "./database.json"))
    if fetch then
        Outfits = fetch
    end
end)

RegisterServerEvent("nc-outfits:server:createOutfit")
AddEventHandler("nc-outfits:server:createOutfit", function(slot, data)
    local src = source
    local xPlayer = FrameWork.Functions.GetPlayer(src)
    local citizenid = xPlayer.PlayerData.citizenid
    local slot = tonumber(slot)
    local char = xPlayer.PlayerData.citizenid

    if not slot then
        return
    end

    if not Outfits[citizenid] then
        Outfits[citizenid] = {}
    end

    exports.ghmattimysql:execute("SELECT * FROM playersTattoos WHERE citizenid = '" .. char .. "'", {}, function(result)
        if(#result > 0) then
            data['tats'] = json.decode(result[1].tattoos)
            exports.ghmattimysql:execute("UPDATE playersTattoos SET tattoos = '{}' WHERE citizenid = '" .. char .. "'")
        else
            data['tats'] = {}
			exports.ghmattimysql:execute("INSERT INTO playersTattoos (citizenid, tattoos) VALUES ('" .. char .. "', '{}')")
        end
    end)

    while not data['tats'] do
        Wait(1)
    end

    if not Outfits[citizenid][slot] then
        Outfits[citizenid][slot] = { outfit = data }
    end

    TriggerClientEvent("FrameWork:Notify",src, "Saved outfit number " .. slot)
    SaveResourceFile(GetCurrentResourceName(), "./database.json", json.encode(Outfits), -1)
end)

RegisterServerEvent("nc-outfits:server:delete")
AddEventHandler("nc-outfits:server:delete", function(data)
    local src    = source
    local Player = FrameWork.Functions.GetPlayer(src)
    local slot   = tonumber(data.slot)

    if not slot or not Outfits[Player.PlayerData.citizenid] then
        return
    end

    if Outfits[Player.PlayerData.citizenid][slot] then
        Outfits[Player.PlayerData.citizenid][slot] = nil
    end

    TriggerClientEvent("FrameWork:Notify",src, "Deleted outfit number " .. slot, "error")
    SaveResourceFile(GetCurrentResourceName(), "./database.json", json.encode(Outfits), -1)
end)

RegisterServerEvent("nc-outfits:server:setOutfit")
AddEventHandler("nc-outfits:server:setOutfit", function(data)
    local src    = source
    local Player = FrameWork.Functions.GetPlayer(src)
    local slot   = tonumber(data.slot)

    if not slot or not Outfits[Player.PlayerData.citizenid] then
        return
    end

    if Outfits[Player.PlayerData.citizenid][slot] then
        local outfit = Outfits[Player.PlayerData.citizenid][slot]['outfit']
        TriggerClientEvent("nc-outfits:client:SetClothing", src, outfit)
    end
end)

FrameWork.Commands.Add("outfits", "Outfits Menu", {}, false, function(source, args)
    local src    = source
    local Player = FrameWork.Functions.GetPlayer(src)
    local force  = false

    if(#args == 1 and args[1] == "--force") then
        force = true
    end

    local l = Outfits[Player.PlayerData.citizenid] ~= nil and #Outfits[Player.PlayerData.citizenid] or 0

    if(Outfits[Player.PlayerData.citizenid] == nil or l == 0) then
        Outfits[Player.PlayerData.citizenid] = {}
        SaveResourceFile(GetCurrentResourceName(), "./database.json", json.encode(Outfits), -1)
        return TriggerClientEvent("FrameWork:Notify", source, "You don't have any outfits.", "error")
    end

    TriggerClientEvent("nc-outfits:client:openMenu", src, Outfits[Player.PlayerData.citizenid])
end)

RegisterNetEvent("nc-outfits:server:openUI")
AddEventHandler("nc-outfits:server:openUI", function()
    local src    = source
    local Player = FrameWork.Functions.GetPlayer(src)
    local force  = false

    if(#args == 1 and args[1] == "--force") then
        force = true
    end

    local l = Outfits[Player.PlayerData.citizenid] ~= nil and #Outfits[Player.PlayerData.citizenid] or 0

    if(Outfits[Player.PlayerData.citizenid] == nil or l == 0) then
        Outfits[Player.PlayerData.citizenid] = {}
        SaveResourceFile(GetCurrentResourceName(), "./database.json", json.encode(Outfits), -1)
        return TriggerClientEvent("FrameWork:Notify", source, "You don't have any outfits.", "error")
    end

    TriggerClientEvent("nc-outfits:client:openMenu", src, Outfits[Player.PlayerData.citizenid])
end)

FrameWork.Commands.Add("saveoutfit", "Save your outfit", {{name="number", help="Number"}}, true, function(source, args)
    local outfitNumber = tonumber(args[1])

    if(outfitNumber == nil) then
        return TriggerClientEvent("FrameWork:Notify", source, "Wrong outfit number [1 - 25]", "error")
    end

    if(outfitNumber <= 0 or outfitNumber > 25) then
        return TriggerClientEvent("FrameWork:Notify", source, "Wrong outfit number [1 - 25]", "error")
    end

    TriggerClientEvent("nc-outfits:client:saveOutfit", source, outfitNumber)

end, "user")