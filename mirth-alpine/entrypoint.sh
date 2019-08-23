echo $DATABASE
echo $DATABASE_URL

sed -i 's/database = derby/database = '"${DATABASE}"'/g' /opt/mirth-connect/conf/mirth.properties
sed -i 's!database.url =.*!database.url = '"${DATABASE_URL}"'!g' /opt/mirth-connect/conf/mirth.properties
sed -i 's/database.username =.*/database.user = '"${DATABASE_USER}"'/g' /opt/mirth-connect/conf/mirth.properties
sed -i 's/database.password =.*/database.password = '"${DATABASE_PASSWORD}"'/g' /opt/mirth-connect/conf/mirth.properties
cat /opt/mirth-connect/conf/mirth.properties
