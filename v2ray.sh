#!/bin/sh

# config v2ray
cat << EOF > /etc/config.json
{
  "inbounds":[
    {
      "port": $PORT,
      "protocol": "$PROTOCOL",
      "settings": {
        "decryption": "none",
        "clients": [
          {
            "id": "$UUID",
            "alterId":$ALTERID
          }
        ]
      },
      "streamSettings": {
        "network": "ws",
        "security": "tls",
        "tlsSettings": {
          "allowInsecure": true,
          "serverName": null
        },
        "wsSettings": {
          "connectionReuse": true,
          "path": "$WSPATH",
          "headers": null
        }
      }
    }
  ],
  "outbounds": [
    {
      "protocol": "freedom"
    }
  ]
}		
EOF

# run v2ray
/usr/bin/v2ray -config /etc/config.json
