#!/bin/bash

cat << EOF | sudo tee > /etc/systemd/system/openvpn.service &&\
echo "Place your openvpn config at $HOME/.openvpn" &&\
sudo systemctl daemon-reload
[Unit]
Description=Ovpn service

[Service]
Type=simple
User=root
Group=root
WorkingDirectory=\$HOME
ExecStart=openvpn .openvpn
Restart=on-failure

[Install]
WantedBy=multi-user.target
EOF