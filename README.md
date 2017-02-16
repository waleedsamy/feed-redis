# feed-redis
> Feeding redis with csv data using awk and redis-mass insert

#### Build & Run
```bash
  $ head giataobject.csv
  > HOTELID;ORTID;LANDCODE;HOTELNAME;ALTERNATIVNAME;TYP;BREITENGRAD;LAENGENGRAD;HOTELKETTENID
  > "3";"6071";"EG";"Sofitel Legend Old Cataract";"";"1";"24.082284426992";"32.887715399265";"1001"
  > "4";"2";"EG";"Ibis Styles Dahab Lagoon";"";"1";"28.479180941035";"34.49981957674";"2178"
  # https://gist.github.com/drjerry/3481798
  $ awk -F ";" -f tab2json.awk giataobject.csv > giataobject.json
  $ docker build -t feed-redis .
  $ docker run --name redis -d redis:3-alpine redis-server --appendonly yes
  $ docker run --name feed -d -v ~/code/github.com/feed-redis:/feed --link redis feed-redis
```
