FROM ubuntu:18.04
MAINTAINER weij
ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update
RUN apt-get install -y apache2
RUN apt-get install -y tzdata
RUN ln -fs /usr/share/zoneinfo/Asia/Taipei /etc/localtime
RUN dpkg-reconfigure -f noninteractive tzdata
RUN apt-get install -y php
RUN apt-get install -y git
RUN chmod -R 777 /mnt
VOLUME ["/mnt/data"]
EXPOSE 80
COPY ./start.sh /start.sh
CMD ["/start.sh"]
