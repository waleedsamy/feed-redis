# feed-redis
> Feeding redis with data

#### Build & Run
```bash
  $ awk -F ";" -f tab2json.awk g.csv > g.json
  $ docker build -t feed-redis .
  $ docker run --name redis -d redis:3-alpine redis-server --appendonly yes
  $ docker run --name feed -d --link redis feed-redis
```
