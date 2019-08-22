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
COPY mirth.properties /tmp
RUN \cp /tmp/mirth.properties /opt/mirth-connect/conf/mirth.properties

CMD ["java", "-jar", "mirth-server-launcher.jar"]
