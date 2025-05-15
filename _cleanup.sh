#!/bin/bash 

./stop-conjur

rm -f data_key testhost.json 		\
	policy/*			\
	conjur-quickstart/my_app_data	\
	conjur-quickstart/admin_data	\
	conjur-quickstart/data_key 	\
	conjur-quickstart/conjur_token


exit

export IMAGES="svagi/openssl:latest
cfmanteiga/alpine-bash-curl-jq
postgres:9.4
cyberark/conjur
nginx:1.13.6-alpine
cyberark/conjur-cli:5"

# to delete images - remove exit above
for img in $IMAGES; do
 docker rmi $img
done
