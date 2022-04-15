# variables
:global login ""; # put from https://my.nordaccount.com/dashboard/nordvpn/
:global passwd ""; # put from https://my.nordaccount.com/dashboard/nordvpn/
:global network "192.168.77.0/24"; # put your network which will be router throught NordVPN
:global gateway "192.168.77.1"; # put your router ip address from u'r network which will be gateway for all u'r devices routing to NordVPN ex. 192.168.77.1 if network is set to 192.168.77.0/2 
:global server "ua62.nordvpn.com"; # put your fav server from https://nordvpn.com/pl/servers/tools
#
#
# magic
/tool fetch url="https://downloads.nordcdn.com/certificates/root.der"; # cert download 4nord
:delay 2 # w8 to download above
/certificate import file-name=root.der name=NordVPN passphrase=""; # import cert 4nord
/file remove "root.der"; # rm downloaded cert
/ip ipsec profile add name=NordVPN; # create new profile 4nord
/ip ipsec proposal add name=NordVPN pfs-group=none; # create proposal 4nord
/ip ipsec policy group add name=NordVPN; # create new policy 4nord
/ip ipsec policy add dst-address=0.0.0.0/0 group=NordVPN proposal=NordVPN src-address=0.0.0.0/0 template=yes comment="NordVPN"; # create new group policy (reusable for new tunnel)
/ip ipsec mode-config add name=NordVPN responder=no; # cfg mode 4nord
/ip ipsec peer add addres="$server" exchange-mode=ike2 name=NordVPN profile=NordVPN disable=yes; # creating connection (if you want disable tunnel, do this there!)
/ip ipsec identity add auth-method=eap certificate=NordVPN eap-methods=eap-mschapv2 generate-policy=port-strict mode-config=NordVPN peer=NordVPN policy-template-group=NordVPN username="$login" password="$passwd"; # login credentials
/ip firewall address-list add address=$network list=NordVPN; # create new list of networks, whitch be routed throw VPN
/ip ipsec mode-config set [find name=NordVPN] src-address-list=NordVPN; # attach list of networks to NordVPN profile
/ip address add address=$gateway interface=bridge comment=NordVPN # idk if we need that stuff, but i think, we need that shit to able to set gateway on devices 
#
# done
beep frequency=0900 length=0.07;
:delay 1
beep frequency=0900 length=0.07;
#
/file remove "NordVPN.rsc"; # remove myself
