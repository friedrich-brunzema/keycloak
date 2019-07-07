Redhat SSO Docker image

Development Redhat SSO docker container for OneOmics

Usage

To boot the container (default is HA mode)

$docker run {image name}

The configuration will automatically connect the MySQL instance (db name MySQL) with hardcorded user and password.  Once connected it will create the keycloak database.  This will occur only on the first run

You can reach the Admin CLI Realms via
https://{ipaddress}:8443/auth/realms/SciexCloud

To boot via docker compose
$docker-compose up -d

