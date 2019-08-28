#! /bin/sh

echo '# Mirth Connect configuration file

# directories
dir.appdata = appdata
dir.tempdata = ${dir.appdata}/temp

# ports
http.port = 8080
https.port = 8443

# password requirements
password.minlength = 0
password.minupper = 0
password.minlower = 0
password.minnumeric = 0
password.minspecial = 0
password.retrylimit = 0
password.lockoutperiod = 0
password.expiration = 0
password.graceperiod = 0
password.reuseperiod = 0
password.reuselimit = 0

# keystore
keystore.path = ${dir.appdata}/keystore.jks
keystore.storepass = 81uWxplDtB
keystore.keypass = 81uWxplDtB
keystore.type = JCEKS

# server
http.contextpath = /
server.url = 

http.host = 0.0.0.0
https.host = 0.0.0.0

https.client.protocols = TLSv1.2,TLSv1.1
https.server.protocols = TLSv1.2,TLSv1.1,SSLv2Hello
https.ciphersuites = TLS_ECDHE_ECDSA_WITH_AES_256_GCM_SHA384,TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384,TLS_RSA_WITH_AES_256_GCM_SHA384,TLS_ECDH_ECDSA_WITH_AES_256_GCM_SHA384,TLS_ECDH_RSA_WITH_AES_256_GCM_SHA384,TLS_DHE_RSA_WITH_AES_256_GCM_SHA384,TLS_DHE_DSS_WITH_AES_256_GCM_SHA384,TLS_ECDHE_ECDSA_WITH_AES_128_GCM_SHA256,TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256,TLS_RSA_WITH_AES_128_GCM_SHA256,TLS_ECDH_ECDSA_WITH_AES_128_GCM_SHA256,TLS_ECDH_RSA_WITH_AES_128_GCM_SHA256,TLS_DHE_RSA_WITH_AES_128_GCM_SHA256,TLS_DHE_DSS_WITH_AES_128_GCM_SHA256,TLS_ECDHE_ECDSA_WITH_AES_256_CBC_SHA384,TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384,TLS_RSA_WITH_AES_256_CBC_SHA256,TLS_ECDH_ECDSA_WITH_AES_256_CBC_SHA384,TLS_ECDH_RSA_WITH_AES_256_CBC_SHA384,TLS_DHE_RSA_WITH_AES_256_CBC_SHA256,TLS_DHE_DSS_WITH_AES_256_CBC_SHA256,TLS_ECDHE_ECDSA_WITH_AES_256_CBC_SHA,TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA,TLS_RSA_WITH_AES_256_CBC_SHA,TLS_ECDH_ECDSA_WITH_AES_256_CBC_SHA,TLS_ECDH_RSA_WITH_AES_256_CBC_SHA,TLS_DHE_RSA_WITH_AES_256_CBC_SHA,TLS_DHE_DSS_WITH_AES_256_CBC_SHA,TLS_ECDHE_ECDSA_WITH_AES_128_CBC_SHA256,TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256,TLS_RSA_WITH_AES_128_CBC_SHA256,TLS_ECDH_ECDSA_WITH_AES_128_CBC_SHA256,TLS_ECDH_RSA_WITH_AES_128_CBC_SHA256,TLS_DHE_RSA_WITH_AES_128_CBC_SHA256,TLS_DHE_DSS_WITH_AES_128_CBC_SHA256,TLS_ECDHE_ECDSA_WITH_AES_128_CBC_SHA,TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA,TLS_RSA_WITH_AES_128_CBC_SHA,TLS_ECDH_ECDSA_WITH_AES_128_CBC_SHA,TLS_ECDH_RSA_WITH_AES_128_CBC_SHA,TLS_DHE_RSA_WITH_AES_128_CBC_SHA,TLS_DHE_DSS_WITH_AES_128_CBC_SHA,TLS_EMPTY_RENEGOTIATION_INFO_SCSV
https.ephemeraldhkeysize = 2048

# CORS headers
server.api.accesscontrolalloworigin = *
server.api.accesscontrolallowcredentials = false
server.api.accesscontrolallowmethods = GET, POST, DELETE, PUT
server.api.accesscontrolallowheaders = Content-Type
server.api.accesscontrolexposeheaders = 
server.api.accesscontrolmaxage = 

# Determines whether or not channels are deployed on server startup.
server.startupdeploy = true

# Determines whether libraries in the custom-lib directory will be included on the server classpath.
# To reduce potential classpath conflicts you should create Resources and use them on specific channels/connectors instead, and then set this value to false.
server.includecustomlib = false

# administrator
administrator.maxheapsize = 512m

# properties file that will store the configuration map and be loaded during server startup
configurationmap.path = ${dir.appdata}/configuration.properties

# options: derby, mysql, postgres, oracle, sqlserver
database = '"${DATABASE}"'

# examples:
#	Derby		jdbc:derby:${dir.appdata}/mirthdb;create=true
#	PostgreSQL	jdbc:postgresql://localhost:5432/mirthdb
# 	MySQL		jdbc:mysql://localhost:3306/mirthdb
#	Oracle		jdbc:oracle:thin:@localhost:1521:DB
#	SQLServer	jdbc:jtds:sqlserver://localhost:1433/mirthdb
database.url = '"${DATABASE_URL}"'

# if using a custom driver, specify it here
#database.driver = 

# maximum number of connections allowed for the connection pool
database.max-connections = 20

# database credentials
database.user = '"${DATABASE_USER}"'
database.password = '"${DATABASE_PASSWORD}"'
'>/opt/mirth-connect/conf/mirth.properties

echo "-server
-Xmx"${XMX}"
-Djava.awt.headless=true
-Dapple.awt.UIElement=true
-Dcom.sun.management.jmxremote.port=9293
-Dcom.sun.management.jmxremote.rmi.port=9293
-Dcom.sun.management.jmxremote.local.only=false 
-Dcom.sun.management.jmxremote.ssl=false
-Djava.rmi.server.hostname=localhost
-Dcom.sun.management.jmxremote.authenticate=false">/opt/mirth-connect/mcserver.vmoptions

echo "-Dcom.sun.management.jmxremote.port=9293
-Dcom.sun.management.jmxremote.rmi.port=9293
-Dcom.sun.management.jmxremote.local.only=false 
-Dcom.sun.management.jmxremote.ssl=false
-Djava.rmi.server.hostname=localhost
-Dcom.sun.management.jmxremote.authenticate=false">>/opt/mirth-connect/mcservice.vmoptions

#debug
#cat /opt/mirth-connect/conf/mirth.properties
#cat /opt/mirth-connect/mcserver.vmoptions
cat /opt/mirth-connect/mcservice.vmoptions

java -jar /opt/mirth-connect/mirth-server-launcher.jar
