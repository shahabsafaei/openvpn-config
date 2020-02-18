#!/bin/bash
# Change line 14 to your own home path if it is not working

cat << EOF | sudo tee > /etc/systemd/system/myovpn.service &&\
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
