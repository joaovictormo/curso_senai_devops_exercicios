FROM ubuntu
RUN apt-get -y update
RUN apt-get -y install cowsay
RUN apt-get -y install fortune
COPY run.sh /
RUN chmod +x /run.sh
ENTRYPOINT ["/run.sh"]

