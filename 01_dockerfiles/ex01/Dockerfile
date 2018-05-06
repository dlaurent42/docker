# run with `docker build -t debian .`

FROM debian
RUN apt-get -y update
RUN apt-get -y upgrade
RUN apt-get -y install wget
RUN wget http://dl.4players.de/ts/releases/3.0.11.2/teamspeak3-server_linux-amd64-3.0.11.2.tar.gz
RUN tar -zxvf teamspeak3-server_linux-amd64-3.0.11.2.tar.gz
RUN rm teamspeak3-server_linux-amd64-3.0.11.2.tar.gz
RUN chmod -R 777 /teamspeak3-server_linux-amd64

# Opening file tranfers (tcp) port
EXPOSE 30033 

# Opening listening port
EXPOSE 10011

# Opening server default port
EXPOSE 9987/udp

CMD ./teamspeak3-server_linux-amd64/ts3server_minimal_runscript.sh

#docker run -it -p 9987:9987/udp -p 10011:10011 -p 30033:30033 plop:plop
