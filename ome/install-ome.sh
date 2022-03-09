# Install Dell OpenManage on Proxmox

# Create installation directory
mkdir -p /opt/dell/srvadmin/sbin

# Add repository and key
echo "deb http://linux.dell.com/repo/community/openmanage/10100/focal/ focal main" > /etc/apt/sources.list.d/linux.dell.com.sources.list
wget -qO - https://linux.dell.com/repo/pgp_pubkeys/0x1285491434D8786F.asc | apt-key add -
apt update

# Install dependencies
chmod 644 ./install-deps.sh
./install-deps.sh

# Update repositories again
apt update

# Install OpenManage
apt install -y srvadmin-all libncurses5 libxslt-dev

# Enable and start service
/opt/dell/srvadmin/sbin/srvadmin-services.sh enable
/opt/dell/srvadmin/sbin/srvadmin-services.sh start
