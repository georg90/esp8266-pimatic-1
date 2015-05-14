# esp8266-pimatic
Send DHT22 or DS18B20 temperature and humidity data to pimatic server using an esp8266

![WebUI](https://raw.githubusercontent.com/georg90/esp8266-pimatic-1/9495706ba802bfd2b19eb042fd6e1e813dc2884c/screenshots/esp8266pimatic.png)

Setup:

ESP8266
- Add WiFi credentials to init.lua
- Flash the esp8266 with the *.bin file here (or use your own custom build: http://frightanic.com/nodemcu-custom-build for more memory!)
- upload ether the *.lc version or *.lua version of the files & compile + upload all config files *_set.lua / init.lua
- Go to your esp8266 ip address and configure your client

Pimatic
- pimatic has to have two variables names can be custom --> see esp8266 config.
- to show the data on the homescreen add a VariablesDevice in pimatic

```
    {
      "id": "esp01-outside-wifi-temp-device",
      "name": "Outside",
      "class": "VariablesDevice",
      "variables": [
        {
          "name": "outsideTemp",
          "expression": "$variableName",
          "type": "number",
          "unit": "°C"
        }
      ]
    }
```

TODO:
- [x] Add custom variable support
- [x] implement "restart proofed variables
- [ ] add base64 encoding back (not enough memory for now)
- [ ] Support for PIR etc.
- [ ] Better way of storing the config..
- [ ] Change interval without resetting the device
- [ ] no humidity when using DS18B20
