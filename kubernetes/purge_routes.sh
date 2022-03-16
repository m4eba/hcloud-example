network_name=$(grep network_name ../terraform.tfvars | cut -d "=" -f2 | xargs echo -n | sed 's/^"\(.*\)"$/\1/')

last_page='2'

while [ "$last_page" != "1" ] 
do
  network_json=$(hcloud network describe $network_name -o json)
  last_page=$(echo $network_json | jq '.meta.pagination.last_page')
  for row in $(echo $network_json | jq -c '.networks[0].routes[]'); do
    destination=$(echo $row | jq -r '.destination')
    gateway=$(echo $row | jq -r '.gateway')
    hcloud network remove-route $network_name --destination $destination --gateway $gateway
  done
done
