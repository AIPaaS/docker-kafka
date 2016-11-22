docker_kafka

docker build -t 10.1.245.4:5000/kafka:2.11-0.9.0.1 .

docker push 10.1.245.4:5000/kafka:2.11-0.9.0.1

docker pull 10.1.245.4:5000/kafka:2.11-0.9.0.1

docker run -d --name kafka0 --net=host -p 39091:39091 -e "port=39091" -e "brokerId=0" -e "hostId=10.1.245.5" -e "adPort=39091" -e "adHostId=10.1.245.5" -e "zookeepers=10.1.245.5:2181,10.1.245.7:2181,10.1.245.9:2181" 10.1.245.4:5000/kafka:2.11-0.9.0.1

docker run -d --name kafka1 --net=host -p 49091:49091 -e "port=49091" -e "brokerId=1" -e "hostId=10.1.245.6" -e "adPort=49091" -e "adHostId=10.1.245.6" -e "zookeepers=10.1.245.5:2181,10.1.245.7:2181,10.1.245.9:2181" 10.1.245.4:5000/kafka:2.11-0.9.0.1

docker run -d --name kafka2 --net=host -p 59091:59091 -e "port=59091" -e "brokerId=2" -e "hostId=10.1.245.7" -e "adPort=59091" -e "adHostId=10.1.245.7" -e "zookeepers=10.1.245.5:2181,10.1.245.7:2181,10.1.245.9:2181" 10.1.245.4:5000/kafka:2.11-0.9.0.1
