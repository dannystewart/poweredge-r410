# Install Dell OpenManage on Proxmox

# Create installation directory
mkdir -p /opt/dell/srvadmin/sbin

# Add repository and key
echo "deb http://linux.dell.com/repo/community/openmanage/10100/focal/ focal main" > /etc/apt/sources.list.d/linux.dell.com.sources.list
wget -qO - https://linux.dell.com/repo/pgp_pubkeys/0x1285491434D8786F.asc | apt-key add -
apt update

# Install dependencies
dpkg -i ./deps/libwsman-curl-client-transport1_2.6.5-0ubuntu3_amd64.deb
dpkg -i ./deps/libwsman-client4_2.6.5-0ubuntu3_amd64.deb
dpkg -i ./deps/libwsman1_2.6.5-0ubuntu3_amd64.deb
dpkg -i ./deps/libwsman-server1_2.6.5-0ubuntu3_amd64.deb
dpkg -i ./deps/libcimcclient0_2.2.8-0ubuntu2_amd64.deb
dpkg -i ./deps/openwsman_2.6.5-0ubuntu3_amd64.deb
dpkg -i ./deps/cim-schema_2.48.0-0ubuntu1_all.deb
dpkg -i ./deps/libsfcutil0_1.0.1-0ubuntu4_amd64.deb
dpkg -i ./deps/sfcb_1.4.9-0ubuntu5_amd64.deb
dpkg -i ./deps/libcmpicppimpl0_2.0.3-0ubuntu2_amd64.deb

# Update repositories again
apt update

# Install OpenManage
apt install -y srvadmin-all libncurses5 libxslt-dev

# Enable and start service
/opt/dell/srvadmin/sbin/srvadmin-services.sh enable
/opt/dell/srvadmin/sbin/srvadmin-services.sh start
