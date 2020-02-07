#!/bin/bash
if grep -qs "Ubuntu 16.04" /etc/os-release; then
bash ubuntu1604.sh
else
bash openvpn.sh
fi

