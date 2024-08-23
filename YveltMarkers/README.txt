Hi, here's a script that lets you manage all your markers in one place.
And interact with your scripts to create or delete them as needed.
How to register a marker?

local markerInfos = {
    pos = vec3(-348.4, -760.3, 47.5),
    marker = {
        type = 25,
        rot = {0, 0, 0},
        scale = {0.7, 0.7, 0.7},
        rgba = {200, 200, 200, 150},
        bobUpAndDown = false,
        faceCamera = false,
        rotate = false
    },
    displayDistance = 10.0,
    interactDistance = 1.3,
    interactKey = 38,
    helpMsg = 'Press ~INPUT_PICKUP~ for interact with marker',
    showCondition = function()
        return true
    end,
    onInteract = function()
        print('You have interacted with the marker')
    end,
}
local markerId = exports.YveltMarkers:registerMarker(markerInfos) -- Use export for call the function

-- For delete this marker you can use this function :

exports.YveltMarkers:unregisterMarker(markerId)