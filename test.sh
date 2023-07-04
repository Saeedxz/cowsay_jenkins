#!/bin/bash

app_url="http://0.0.0.0:$1"

response=$(curl -s -o /dev/null -w "%{http_code}" "$app_url")

if [ "$response" = "200" ]; then
  echo "Cowsay web app is online"
  exit 0  # Success code
else
  echo "Cowsay web app is offline"
  exit 1  # Failure code
fi