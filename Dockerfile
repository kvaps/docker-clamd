FROM centos:centos6
MAINTAINER kvaps <kvapss@gmail.com>
ENV REFRESHED_AT 2015-09-02


RUN mv /etc/localtime /etc/localtime.old; ln -s /usr/share/zoneinfo/Europe/Moscow /etc/localtime
RUN localedef -v -c -i en_US -f UTF-8 en_US.UTF-8; $(exit 0)
#RUN localedef -v -c -i ru_RU -f UTF-8 ru_RU.UTF-8; $(exit 0)
ENV LANG en_US.UTF-8

RUN yum -y install epel-release

RUN yum -y install clamd

ADD clamd-wrapper.sh /bin/clamd-wrapper.sh

ADD start.sh /bin/start.sh


ENTRYPOINT ["/bin/start.sh"]

WORKDIR /root

# Attach data volume
VOLUME ["/data"]

EXPOSE 3310
