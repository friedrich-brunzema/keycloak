#!/bin/bash

until mysql -u root -ppassword -h mysql -e 'use keycloak' > /dev/null 2>&1; do
    mysql -u root -ppassword -h mysql < /tmp/mysql-create-db.sql    
    sleep 3
done
rm /tmp/*.sql -f
exec /opt/jboss/rh-sso-7.1/bin/standalone.sh -c standalone-ha.xml $@
exit $?