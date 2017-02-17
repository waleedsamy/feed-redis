# feed-redis
> Feeding redis with csv data using awk and redis-mass insert

[![Docker Hub](https://img.shields.io/badge/docker-ready-blue.svg)](https://registry.hub.docker.com/u/waleedsamy/feed-redis/)

#### Build
```bash
  $ docker build -t feed-redis .
```

#### Run
```bash
  $ docker run --name redis -d redis:3 redis-server --appendonly yes
  $ docker run -d --link redis waleedsamy/feed-redis {DOWNLOADABLE_LINK}
```

#### How does it work?
 * downlaod and unzip gz file
 * use awk to build redis `SET` expression with first columns of the csv as the **KEY**
 * use [mass-insert](https://redis.io/topics/mass-insert) to insert in redis as `cat data.txt | redis-cli --raw --pipe`
 * you can use the awk program as `awk -F ";" -f tab2json.awk big.csv`



#### Notes:
 * escape single quote in string

  ```bash
     $ echo "Pierre & Vacances Hôtel de l'Esterel" | awk  -v ESQUOTE="\\\'" '{gsub( "[:'\'']",ESQUOTE); print $0;}'
     > Pierre & Vacances Hôtel de l\'Esterel
  ```
 * you can find awk `tab2json` gist [here](https://gist.github.com/drjerry/3481798)
