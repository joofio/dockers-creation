FROM centos

# defining args for build changes
ARG MIRTH_CONNECT_VERSION="3.8.0.b2464"
ARG MIRTH_DOWNLOAD_URL="http://downloads.mirthcorp.com/connect/"


RUN yum makecache && yum install -y wget java-1.8.0-openjdk unzip
RUN yum clean all & rm -rf /var/cache/yum

# download and configure mirth product
RUN  cd /tmp && wget $MIRTH_DOWNLOAD_URL$MIRTH_CONNECT_VERSION/mirthconnect-$MIRTH_CONNECT_VERSION-unix.tar.gz && \
  tar xvzf mirthconnect-$MIRTH_CONNECT_VERSION-unix.tar.gz && \
  mkdir -p /opt/mirth-connect && \
  mv Mirth\ Connect/* /opt/mirth-connect/ && \
  rm -f mirthconnect-$MIRTH_CONNECT_VERSION-unix.tar.gz

# configure FHIR connector extensions
COPY fhir-3.8.0.b1172.zip /tmp
RUN unzip /tmp/fhir-3.8.0.b1172.zip -d /opt/mirth-connect/extensions && \
    rm /tmp/fhir-3.8.0.b1172.zip

# edit mirth.properties
COPY mirth.properties /tmp
RUN \cp /tmp/mirth.properties /opt/mirth-connect/conf/mirth.properties

# COPY docker-entrypoint.sh /
# ENTRYPOINT ["sh","/docker-entrypoint.sh"]


EXPOSE 8080 8443
WORKDIR /opt/mirth-connect

CMD ["java", "-jar", "mirth-server-launcher.jar"]
