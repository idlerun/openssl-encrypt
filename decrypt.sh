#!/bin/bash
echo -n Password: 
read -s PASSWD
export PASSWD
echo

for var in "$@"
do
  NAME=$(echo $var | sed -e 's/\.enc$//')
  echo "Decrypt $var => $NAME"
  openssl aes-256-cbc -d -in "$var" -out "$NAME" -pass env:PASSWD
done

