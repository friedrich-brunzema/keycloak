FROM centos:7.3.1611
USER root
RUN yum -y update && yum install -y zip unzip bash-completion screen  curl dhclient   firewalld    iproute iprutils iptables iputils less man-db ncurses  passwd rootfiles rpm rsyslog setup shadow-utils tar vim-minimal java-1.8.0-openjdk mariadb
COPY rhsso-7.1.1.tar.gz /tmp
COPY mysql-create-db.sql /tmp
COPY keycloak.db.sql /tmp
RUN tar -xzvf /tmp/rhsso-7.1.1.tar.gz -C /
COPY docker-entrypoint.sh /opt/jboss
RUN chmod +x /opt/jboss/docker-entrypoint.sh
EXPOSE 8443
EXPOSE 8080
RUN rm /tmp/rhsso-7.1.1.tar.gz
ENTRYPOINT ["/opt/jboss/docker-entrypoint.sh"]
CMD ["-b","0.0.0.0"]
