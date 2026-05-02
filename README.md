#######################################
# 
#  README.md file for Project:  reptor-interretialis
#
######################################
# Brief discription of the project
#
# This appears under TASKS.md file
#
#  Table of Contents:
#  
#  * Overview
#  * Features
#  * Usage
#  * Configuration info
#  * License
#
######################################

# Features:
1. Dockerfile configured to use alpine with nginx
   clear the conf file and copy the user created one
2. Docker-compose.yml contain configuration working folder, docker name and port.
3. nginx_config_generator.sh script in order to enter the domain wanted, and will generate the subdomains.
4. nginx.conf template exist, this will be updated after running the nginx_config_generator.sh


# Installation
1. if config file already contain the wanted domain and subdomains please skip to step  4.
2. if you do not have permissions to run script under scripts folder please run:
   chmod +x nginx_config_generator.sh
3. then run the script in scripts folder using: ./nginx_config_generator.sh
   and the script will prompt you for a domain to enter (e.g mydomain.com) and will update the nginx.conf file accordingally.
4. then in docker folder please run the following command: 
   docker compose up -d --build
5. try and connect to th domain to check (via browser or e.g -> curl http://test.mydomain.com)


# Configuration
1. this works on http only
2. please configure domain in order to update config file before.


# License Info
This project is licensed under the MIT License - see the LICENSE file for more detailes