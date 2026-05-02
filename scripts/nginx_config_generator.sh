#!/bin/bash
###############################################
# Purpose: Auto build nginx conf file according to entered domain
# Developer: Yaron Segev, Yar.Segev@gmail.com
# Version: 0.0.3
# Date: 02.05.2026
set -o errexit
set -o nounset
set -o pipefail
###############################################

BASE_DIR="$(cd "$(dirname "$0")/.." && pwd)"
NGINX_CONF="$BASE_DIR/nginx/nginx.conf"

SUBDOMAINS=(
  "www"
  "app"
  "api"
  "beta"
  "test"
  "dev"
  "staging"
)
###########################################

get_domain() {
    read -p "Enter main domain (e.g. mydomain.com): " DOMAIN
}

write_config_header() {
    cat > "$NGINX_CONF" <<EOF
    upstream backend_stream {
EOF
}

write_upstream_servers() {
    for sub in "${SUBDOMAINS[@]}"; do
    echo "        server $sub.$DOMAIN;" >> "$NGINX_CONF"
    done
}

write_confblock() {
    cat >> "$NGINX_CONF" <<EOF
    }

    server {
       listen 80;
       server_name $DOMAIN;

       location / {
       proxy_pass http://backend_stream;
       proxy_set_header Host \$host;
       proxy_set_header X-Real-IP \$remote_addr;
       proxy_set_header X-Forwarded-For \$proxy_add_x_forwarded_for;
    }
}
EOF

}

done_message() {
    echo "nginx.conf generated at $NGINX_CONF"
}


main() {
   get_domain
   write_config_header
   write_upstream_servers
   write_confblock
   done_message
}


##################################3
main