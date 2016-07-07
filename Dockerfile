FROM centos:7

RUN yum install -y java-1.8.0-openjdk

ADD kafka_2.11-0.9.0.1.tgz /opt/

RUN mv /opt/kafka_2.11-0.9.0.1 /opt/kafka \
    && mkdir -p /tmp/kafka_data/logs \
	&& mkdir -p /tmp/kafka_bin

ADD ./start-kafka.sh /tmp/kafka_bin/
RUN chmod 777 /tmp/kafka_bin/start-kafka.sh

ADD ./stop-kafka.sh /tmp/kafka_bin/
RUN chmod 777 /tmp/kafka_bin/stop-kafka.sh

RUN chmod 777 /opt/kafka/bin/kafka-server-start.sh

WORKDIR /opt/kafka

VOLUME [/tmp/kafka_data/logs"]

#EXPOSE 9092

CMD ["/tmp/kafka_bin/start-kafka.sh"]
