FROM centos:centos6
MAINTAINER kvaps <kvapss@gmail.com>
ENV REFRESHED_AT 2016-01-08


RUN yum -y install epel-release

RUN yum -y install clamd

ADD clamd-wrapper.sh /bin/clamd-wrapper.sh

ADD start.sh /bin/start.sh


ENTRYPOINT ["/bin/start.sh"]

WORKDIR /root

# Attach data volume
VOLUME ["/data"]

EXPOSE 3310
