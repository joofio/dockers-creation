FROM rocker/r-base:latest

## install debian packages
RUN apt-get update -qq && apt-get -y --no-install-recommends install \
libxml2-dev \
libcairo2-dev \
libsqlite3-dev \
libmariadbd-dev \
libpq-dev \
libssh2-1-dev \
unixodbc-dev \
libcurl4-openssl-dev \
libssl-dev

## Get Java (for h2o R package)
RUN apt-get update -qq \
  && apt-get -y --no-install-recommends install \
    cmake \
    default-jdk \
    default-jre \
  && R CMD javareconf


COPY install_packages.R /install_packages.R


RUN Rscript /install_packages.R

