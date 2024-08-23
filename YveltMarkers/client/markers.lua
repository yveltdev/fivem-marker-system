Yvelt = {
    markers = {},
    markerId = 1,
}

CreateThread(function()
    while true do
        local spam = false
        local pos = GetEntityCoords(PlayerPedId())
        for k, v in pairs(Yvelt.markers) do
            if #(pos - v.pos) < v.displayDistance then
                if v.showCondition() then
                    spam = true
                    DrawMarker(v.marker.type, v.pos, 0, 0, 0, v.marker.rot[1], v.marker.rot[2], v.marker.rot[3], v.marker.scale[1], v.marker.scale[2], v.marker.scale[3], v.marker.rgba[1], v.marker.rgba[2], v.marker.rgba[3], v.marker.rgba[4], v.marker.bobUpAndDown, v.marker.faceCamera, 0, v.marker.rotate, 0, 0, 0)
                    if #(pos - v.pos) < v.interactDistance then
                        showHelpText(v.helpMsg)
                        if IsControlJustPressed(0, v.interactKey) then
                            CreateThread(function()
                                v.onInteract()
                            end)
                        end
                    end
                end
            end
        end
        if spam then
            Wait(1)
        else
            Wait(2000)
        end
    end
end)