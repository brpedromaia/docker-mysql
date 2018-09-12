FROM centos:centos6
LABEL Pedro Maia Martins de Sousa <brpedromaia@gmail.com> and  Rodolfo Silva <Homaru> 


RUN yum -y update; yum clean all
RUN yum -y install epel-release; yum clean all
RUN yum -y install mysql-server mysql pwgen supervisor bash-completion psmisc net-tools nc; yum clean all

ADD ./mysql-entrypoint.sh /start.sh
ADD ./mysql-configuration.sh /config_mysql.sh
ADD ./supervisord.conf /etc/supervisord.conf

# RUN echo %sudo	ALL=NOPASSWD: ALL >> /etc/sudoers

RUN chmod 755 /start.sh
RUN chmod 755 /config_mysql.sh
RUN /config_mysql.sh

EXPOSE 3306

CMD ["/bin/bash", "/start.sh"]
