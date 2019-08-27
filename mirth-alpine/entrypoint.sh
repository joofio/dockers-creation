sed -i 's/database = derby/database = '"${DATABASE}"'/g' /opt/mirth-connect/conf/mirth.properties
sed -i 's!database.url =.*!database.url = '"${DATABASE_URL}"'!g' /opt/mirth-connect/conf/mirth.properties
sed -i 's/database.username =.*/database.user = '"${DATABASE_USER}"'/g' /opt/mirth-connect/conf/mirth.properties
sed -i 's/database.password =.*/database.password = '"${DATABASE_PASSWORD}"'/g' /opt/mirth-connect/conf/mirth.properties
sed -i 's/Xmx.*/Xmx'"${XMX}"'/g' /opt/mirth-connect/mcserver.vmoptions
sed -i 's/Xms.*/Xms'"${XMS}"'/g' /opt/mirth-connect/mcserver.vmoptions
echo "-Dcom.sun.management.jmxremote.port=9293
-Dcom.sun.management.jmxremote.rmi.port=9293
-Dcom.sun.management.jmxremote.local.only=false 
-Dcom.sun.management.jmxremote.ssl=false
-Djava.rmi.server.hostname=localhost
-Dcom.sun.management.jmxremote.authenticate=false">>/opt/mirth-connect/mcserver.vmoptions
echo "-Dcom.sun.management.jmxremote.port=9293
-Dcom.sun.management.jmxremote.rmi.port=9293
-Dcom.sun.management.jmxremote.local.only=false 
-Dcom.sun.management.jmxremote.ssl=false
-Djava.rmi.server.hostname=localhost
-Dcom.sun.management.jmxremote.authenticate=false">>/opt/mirth-connect/mcservice.vmoptions

#debug
cat /opt/mirth-connect/conf/mirth.properties
cat /opt/mirth-connect/mcserver.vmoptions
