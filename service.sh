#!/bin/bash
sudo echo "[Unit]
Description=Ovpn service

[Service]
Type=simple
User=root
Group=root
WorkingDirectory=$HOME
ExecStart=openvpn .openvpn
Restart=on-failure

[Install]
WantedBy=multi-user.target" | tee User/Linux/bg.sh
echo "Place your openvpn config at $HOME/.openvpn"