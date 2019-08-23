from alpine

ENV MIRTH_CONNECT_VERSION 3.6.0.b2287


RUN apk add openjdk8
RUN \
  cd /tmp && \
  wget http://downloads.mirthcorp.com/connect/$MIRTH_CONNECT_VERSION/mirthconnect-$MIRTH_CONNECT_VERSION-unix.tar.gz && \
  tar xvzf mirthconnect-$MIRTH_CONNECT_VERSION-unix.tar.gz && \
  mkdir -p /opt/mirth-connect && \
  rm -f mirthconnect-$MIRTH_CONNECT_VERSION-unix.tar.gz && \
  mv Mirth\ Connect/* /opt/mirth-connect/

WORKDIR /opt/mirth-connect

EXPOSE 8080 8443

# edit mirth.properties
ARG DATABASE=mysql
ENV DATABASE=$DATABASE
ARG DATABASE_NAME=mirthdb
ENV DATABASE_NAME=$DATABASE_NAME
ARG DATABASE_URL=jdbc:mysql://mysql:3306/${DATABASE_NAME}
ENV DATABASE_URL=$DATABASE_URL
ARG DATABASE_USER=mirth
ENV DATABASE_USER=$DATABASE_USER
ARG DATABASE_PASSWORD=passwd
ENV DATABASE_PASSWORD=$DATABASE_PASSWORD

#edit mcserver
ARG XMX=1G
ENV XMX=$XMX
ARG XMS=512m
ENV XMS=$XMS


COPY entrypoint.sh /tmp
RUN chmod 777 -R /tmp/entrypoint.sh
ENTRYPOINT ["/bin/sh","/tmp/entrypoint.sh"]

CMD ["java", "-jar", "mirth-server-launcher.jar"]
