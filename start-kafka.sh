#!/bin/sh
SERVER_PROPERTIES="/opt/kafka/config/server.properties"
echo $SERVER_PROPERTIES
# output config info
echo "broker.id=" ${brokerId}  >> ${SERVER_PROPERTIES}
echo "port=" ${port} >> ${SERVER_PROPERTIES}
echo "host.name=" ${hostId}  >> ${SERVER_PROPERTIES}
echo "advertised.port=" ${adPort} >> ${SERVER_PROPERTIES}
echo "advertised.host.name=" ${adHostId}  >> ${SERVER_PROPERTIES}
echo "zookeeper.connect=" ${zookeepers}  >> ${SERVER_PROPERTIES}

# start kafka service
sh /opt/kafka/bin/kafka-server-start.sh /opt/kafka/config/server.properties
