#!/bin/bash
if grep -qs "Ubuntu 16.04" /etc/os-release; then
bash Server/ubuntu1604.sh
else
bash Server/openvpn.sh
fi