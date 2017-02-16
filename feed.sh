awk -F ";" -f tab2json.awk giataobject.csv | redis-cli --raw -h redis --pipe
