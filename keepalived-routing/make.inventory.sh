echo "[server]" > inventory
cat terraform.inventory >> inventory
echo "" >> inventory
echo "[keepalived]" >> inventory
echo "keepalived1" >> inventory
echo "keepalived2" >> inventory
echo "keepalived3" >> inventory