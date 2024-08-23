function printError(_)
    print('^1[ERROR]^0 => ^1'.._ or 'Unknow error'..'^0')
end

function printDebug(_)
    print('^2[LOG]^0 => ^2'.._ or 'Unknow error'..'^0')
end

-- @param msg string (Displayed text)
function showHelpText(msg)
    BeginTextCommandDisplayHelp('STRING')
    AddTextComponentSubstringPlayerName(msg)
    EndTextCommandDisplayHelp(0, false, true, -1)
end