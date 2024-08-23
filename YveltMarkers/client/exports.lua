-- @param data table (Markers infos)
-- @return boolean / number (Return the markerId or nil)
function registerMarker(data)
    if type(data) == 'table' then
        for k, v in pairs(data) do
            local varType = nil
            for _k, _v in pairs(Config.checkVars) do
                if _v.varName == k then
                    varType = _v.varType
                    break
                end
            end
            if not varType or varType ~= type(v) then
                printError('A problem has been detected in your script.')
                printError('To solve this problem, you need to define markers infos in a lua table (Args "'..k..'" argument must be a '..varType..')')
                break
            end
        end

        local markerId = Yvelt.markerId
        Yvelt.markerId = Yvelt.markerId + 1

        Yvelt.markers['id:'..markerId] = data

        printDebug('New marker was registerd (markerId: '..markerId..')')
        return markerId
    else
        printError('A problem has been detected in your script.')
        printError('To solve this problem, you need to define markers infos in a lua table')
    end

    return false
end

-- @param markerId number (Marker Id)
-- @return boolean (Return if the marker exist before delete)
function unregisterMarker(markerId)
    if markerId and Yvelt.markers['id:'..markerId] then
        Yvelt.markers['id:'..markerId] = nil
        printDebug('Marker was unregisterd (markerId: '..markerId..')')
        return true
    end
    return false
end

exports('registerMarker', registerMarker)
exports('unregisterMarker', unregisterMarker)