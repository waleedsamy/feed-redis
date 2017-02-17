#!/bin/sh
set -e

download () {
  echo downloading $1
  wget $1 -O dtemp;
}

extract () {
  gunzip -c dtemp > etemp
}

feed (){
  awk -F ";" -f tab2json.awk etemp | redis-cli --raw -h redis --pipe
}

download $1
extract
feed
