print("Now inside main.lc")

--- config
tmr.delay(1000000)
hum = 0
tem = 0
contentLength = 0

-- get settings from files             
dofile("settings.lc")
http = require("site")

--- calc content-length
function calcLength(type)
    print(type)
    contentLength = string.len(type) + 40
    print("Content-Length: "..contentLength) 
end
--- send data
function sendData(type, name)
    calcLength(type)
    print("Sending data ...")
    conn=net.createConnection(net.TCP, 0) 
    conn:on("receive", function(conn, payload) print(payload) end)
    conn:connect(pimaticPort,pimaticServer)
    conn:send("PATCH /api/variables/"..name.." HTTP/1.1\r\n")
    conn:send("Authorization: Basic "..base64login.."\r\n")
    conn:send("Host: "..pimaticServer.."\r\n")
    conn:send("Content-Type:application/json\r\n")
    conn:send("Content-Length: "..contentLength.."\r\n\r\n")
    conn:send("{\"type\": \"value\", \"valueOrExpression\": "..type.."}")
    ---
    conn:on("sent",function(conn)
        print("Closing connection")
        conn:close()
    end)
    conn:on("disconnection", function(conn)
        print("Got disconnection...")
    end)
---
end
--- main loop 
http.site()

tmr.alarm(0, (interval*1000), 1, function() 

      t = require("temperature")
      t.read(PIN,device)
      tem = t.getTemperature()
      hum = t.getHumidity()
      t = nil
      package.loaded["temperature"] = nil
      sendData(hum, hum_var)
      tmr.delay(1000000)
      sendData(tem, tem_var)
end )
