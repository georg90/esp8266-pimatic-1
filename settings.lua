--First lets read the settings files
file.open("ip_set.lua", "r")
_G.pimaticServer = file.readline()  
file.close()

file.open("port_set.lua", "r")
_G.pimaticPort = file.readline()  
file.close()

file.open("pin_set.lua", "r")
_G.PIN = file.readline()  
file.close()

file.open("pw_set.lua", "r")
_G.base64login = file.readline()  
file.close()

file.open("time_set.lua", "r")
_G.interval = file.readline()  
file.close()

file.open("dev_set.lua", "r")
_G.device = file.readline()  
file.close()

file.open("hum_set.lua", "r")
_G.hum_var = file.readline()  
file.close()

file.open("tem_set.lua", "r")
_G.tem_var = file.readline()  
file.close()