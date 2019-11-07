FROM ubuntu
RUN apt-get -y update
RUN apt-get -y install nmap
ENTRYPOINT ["nmap", "-p", "1-1000", "-sV", "-sS", "-T4"]
CMD ["8.8.8.8"]
