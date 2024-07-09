FROM jenkins/inbound-agent:3206.vb_15dcf73f6a_9-3
USER root
ADD requirements.txt .
RUN apt update && curl -fsSL https://get.docker.com | sh
RUN usermod -aG docker jenkins
RUN curl -LO https://storage.googleapis.com/kubernetes-release/release/$(curl -s https://storage.googleapis.com/kubernetes-release/release/stable.txt)/bin/linux/amd64/kubectl
RUN chmod +x ./kubectl
RUN mv ./kubectl /usr/local/bin
RUN apt install -y python3.11 \
	&& apt install -y python3-pip \	
	&& pip install -r requirements.txt --break-system-packages