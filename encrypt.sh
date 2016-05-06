#!/bin/bash
echo -n Password: 
read -s PASSWD
export PASSWD
echo

for var in "$@"
do
  NAME="$var.enc"
  echo "Encrypt $var => $NAME"
  openssl aes-256-cbc -in "$var" -out "$NAME" -pass env:PASSWD
done

