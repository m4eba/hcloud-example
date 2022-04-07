echo "[server]" > inventory
cat vps.inventory >> inventory
echo "pi ansible_host=192.168.0.100 ansible_user=pi" >> inventory
echo "" >> inventory
echo "[wireguard]" >> inventory
echo "vps1" >> inventory
echo "pi" >> inventory
echo "" >> inventory
