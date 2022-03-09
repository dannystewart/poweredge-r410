# Install prerequisites
apt install ipmitool lm-sensors

# Place the service file in the systemd directory
cp fan-controller.service /etc/systemd/system/fan-controller.service

# Make executable
chmod 644 /etc/systemd/system/fan-controller.service

# Place the Python file in the root/scripts directory
cp fan.py /root/scripts/fan.py

# Make executable
chmod 644 /root/scripts/fan.py

# Reload systemd, then enable the service and start it
systemctl daemon-reload
systemctl enable fan-controller.service
systemctl start fan-controller.service

# Check to see if it's running
service fan-controller status
