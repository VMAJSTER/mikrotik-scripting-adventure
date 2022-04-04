# mikrotik-scripting-adventure
    some little shit specially for Mikrotik Family devices    

## Usage:
>/import name-of-script.rsc variable1ifneeded variable2ifneeded    

ꝿ all are compatible with 1st initial defconf   
ꝿ tested at RoSv6 6.48.6    
ꝿ use CMD+F or CTRL+F to find tut for interested script
## NordVPN:  
Using VPN of any device connected to your local network (WiFi etc.)   
Edit variables inside of script (or later, after loaded)
### ToDo
- [x] working
- [ ] Add inputs for those settings:tada:

### Default settings:

    username=empty    
GoTo: IP -> IPSEC -> Identities   

    password=empty    
GoTo: IP -> IPSEC -> Identities   

    network=192.168.77.0/24 #assingned to bridge named "bridge" and Address List called "NordVPN"    
GoTo: IP -> Adresses    
GoTo: IP -> FIREWALL -> Address Lists   

    server=ua62.nordvpn.com #slava-ukraini    
GoTo: IP -> IPSEC -> Peers    
