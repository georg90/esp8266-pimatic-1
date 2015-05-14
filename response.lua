local M = {}
local setting			

local function filter(Payload)
header={string.find(Payload,"interv=")}
if header[2]~=nil then 
    setting=string.sub(Payload,header[2]+1,#Payload) 
    if setting ~= _G.interval then
        file.open("time_set.lua", "w+")
        file.write(setting)
        file.flush()
        file.close()
        node.restart()
    end    
else 
    header={string.find(Payload,"pinNum=")}
    if header[2]~=nil then
        setting=string.sub(Payload,header[2]+1,#Payload)
        file.open("pin_set.lua", "w+")
        file.write(setting)
        file.flush()
        file.close()
        _G.PIN = setting
    else
        header={string.find(Payload,"device=")}
        if header[2]~=nil then
            setting=string.sub(Payload,header[2]+1,#Payload)
            file.open("dev_set.lua", "w+")
            file.write(setting)
            file.flush()
            file.close()
            _G.device = setting
        else
            header={string.find(Payload,"IPaddress=")}
            if header[2]~=nil then
                setting=string.sub(Payload,header[2]+1,#Payload)
                file.open("ip_set.lua", "w+")
                file.write(setting)
                file.flush()
                file.close()
                _G.pimaticServer = setting
            else
                header={string.find(Payload,"Port=")}
                if header[2]~=nil then
                    setting=string.sub(Payload,header[2]+1,#Payload)
                    file.open("port_set.lua", "w+")
                    file.write(setting)
                    file.flush()
                    file.close()
                    _G.pimaticPort = setting
                else
                    header={string.find(Payload,"credent=")}
                    if header[2]~=nil then
                        setting=string.sub(Payload,header[2]+1,#Payload)
                        file.open("pw_set.lua", "w+")
                        file.write(setting)
                        file.flush()
                        file.close()
                        _G.base64login = setting
                    else
                        header={string.find(Payload,"hum=")}
                        if header[2]~=nil then
                            setting=string.sub(Payload,header[2]+1,#Payload)
                            file.open("hum_set.lua", "w+")
                            file.write(setting)
                            file.flush()
                            file.close()
                            _G.hum_var = setting
                            ---
                        else
                            header={string.find(Payload,"tem=")}
                            if header[2]~=nil then
                                setting=string.sub(Payload,header[2]+1,#Payload)
                                file.open("tem_set.lua", "w+")
                                file.write(setting)
                                file.flush()
                                file.close()
                                _G.tem_var = setting
                                ---
                            end
                        end
                    end
                end 
            end
        end
    end     
end
end

M.filter = filter
return M
