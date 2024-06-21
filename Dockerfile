FROM jenkins/inbound-agent:3206.vb_15dcf73f6a_9-3
USER root
RUN apt update && curl -fsSL https://get.docker.com | sh
RUN usermod -aG docker jenkins