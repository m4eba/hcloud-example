hcloud server list -o noheader -o columns=name,ipv4 | grep "haproxy-4vps" | while read -r name ip; do ssh-keygen -f ~/.ssh/known_hosts -R "$ip" ; done 