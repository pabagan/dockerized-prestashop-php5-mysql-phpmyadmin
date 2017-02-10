echo "PrestaShop: "
docker inspect prestashop | grep IPAddress
echo "mysql: "
docker inspect mysql | grep IPAddress