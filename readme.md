# Tools for Dell PowerEdge R410

Scripts and utilities for a Dell PowerEdge R410 running Proxmox VE.

## Fan controller

Reduces noise by controlling the fan speed with IPMI commands. Based on [perryclements/r410-fancontroller](https://github.com/perryclements/r410-fancontroller).

### Installation

Run `install-fan.sh` or follow instructions below. Should work on any Debian-based OS.

```bash
# Install prerequisites
apt install ipmitool lm-sensors

# Place the service file in the systemd directory
cp fan/fan-controller.service /etc/systemd/system/fan-controller.service

# Make executable
chmod 644 /etc/systemd/system/fan-controller.service

# Place the Python file in the root/scripts directory
cp fan/fan.py /root/scripts/fan.py

# Make executable
chmod 644 /root/scripts/fan.py

# Reload systemd, then enable the service and start it
systemctl daemon-reload
systemctl enable fan-controller.service
systemctl start fan-controller.service

# Check to see if it's running
service fan-controller status
```

## Dell OpenManage installer for Proxmox VE 7.x

Installs Dell OpenManage on a Proxmox VE server, based on [this guide](https://forum.proxmox.com/threads/dell-openmanage-on-proxmox-6-x.57932/). Written for Proxmox VE 7.x, but may work on other Debian-based distros.

To install, run `install-ome.sh`.

## Disclaimer

These scripts and utilities are provided as is. I cannot be held responsible for anything bad happening to your server, home, or love life because of them.
