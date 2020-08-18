FROM debian:jessie

MAINTAINER dario dario@dariozanzico.com; 
MAINTAINER melvin@labelbox.com

RUN \
  apt-get update && apt-get install -y curl && apt-get update && apt-get install -y postfix mailutils && \
  apt-get install -y openssl heirloom-mailx && \
  rm -fr /var/lib/apt/lists/*

COPY files/ssl-cert-check-v3.29 /ssl-cert-check
COPY files/run.sh /run.sh
COPY files/mailrc.template /tmp/

RUN chmod +x /ssl-cert-check
RUN chmod +x /run.sh

#CMD service postfix start && /run.sh
CMD /run.sh

