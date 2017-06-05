FROM generic-image
MAINTAINER Politecnico di Torino

RUN apt-get update && apt-get install -y \
    isc-dhcp-server

ADD sysctl.conf /etc/sysctl.conf

RUN pip3 install --upgrade pip
RUN pip3 install netifaces netaddr iptools jsonschema

#########################################################################
#									#
#			Script boot					#
#									#
#########################################################################

# Copy the agent into the docker
RUN mkdir -p /configuration_agent
WORKDIR configuration_agent
ADD ./tmp/dhcp dhcp
ADD ./tmp/config config
ADD ./tmp/common common
ADD ./tmp/agent.py agent.py
ADD ./tmp/rest_start.py rest_start.py
ADD ./tmp/start.sh start.sh
RUN chmod +x start.sh

WORKDIR /
