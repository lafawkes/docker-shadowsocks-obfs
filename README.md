# Shadowsocks obfs - Docker
Deploy shadowsocks server \


## Deploy Configuration
**Method**: All updated shdadowsocks ciphers will do but mentioned ones are recommended as they have more security and support within clients.

```
chacha20-ietf-poly1305
aes-256-gcm
aes-128-gcm
```

**App Name** & **Password** can be configured as desired.

## Client Configuration
Host: `APP_NAME.herokuapp.com` \
Port: `80` \
Password: `Provided password on deploy` \
Encryption: `Provided method on deploy` \
Plugin: `simple-obfs` \
Plugin Options: `obfs=http;obfs-host=APP_NAME.herokuapp.com`

### Note
> All mentioned **APP_NAME** variables should change to your **App Name** configured during deployment stage.

## Supported Clients
- Windows
- Mac
- Linux 
- Android
- iOS

## Client Configuration Examples

![MacOS - ShadowsocksX-NG](https://raw.githubusercontent.com/lafawkes/shadowsocks-obfs/main/assets/ShadowsocksX-NG.png)

![iOS - Potatso Lite](https://raw.githubusercontent.com/lafawkes/shadowsocks-obfs/main/assets/PotatsoIOS.jpeg)
