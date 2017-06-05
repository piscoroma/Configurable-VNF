FROM generic-configuration-agent
MAINTAINER Politecnico di Torino

RUN apt-get update
RUN apt-get install -y iptables bridge-utils
ADD sysctl.conf /etc/sysctl.conf

RUN pip3 install python-iptables

#########################################################################
#									#
#			Script boot					#
#									#
#########################################################################

WORKDIR /configuration_agent
RUN mkdir nat_config
ADD nat_config nat_config
RUN chmod +x nat_config

RUN mkdir model
ADD model model
RUN chmod +x model

WORKDIR /
ADD ./start_nat.sh start_nat.sh
RUN chmod +x start_nat.sh
ADD ./start_nat_agent.sh start_nat_agent.sh
RUN chmod +x start_nat_agent.sh
ADD start.sh start.sh
RUN chmod +x start.sh


