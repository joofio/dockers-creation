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


EXPOSE 8080 8443
WORKDIR /opt/mirth-connect

# edit mirth.properties
ARG DATABASE=mysql
ENV DATABASE=$DATABASE
ARG DATABASE_NAME=mirthdb
ENV DATABASE_NAME=$DATABASE_NAME
ARG DATABASE_URL=jdbc:mysql://mariadb:3306/${DATABASE_NAME}
ENV DATABASE_URL=$DATABASE_URL
ARG DATABASE_USER=mirth
ENV DATABASE_USER=$DATABASE_USER
ARG DATABASE_PASSWORD=passwd
ENV DATABASE_PASSWORD=$DATABASE_PASSWORD

COPY entrypoint.sh /tmp
RUN chmod 777 -R /tmp/entrypoint.sh
ENTRYPOINT ["/bin/bash","/tmp/entrypoint.sh"]

CMD ["java", "-jar", "mirth-server-launcher.jar"]
