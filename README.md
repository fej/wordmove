# wordmove
Wordmove on distro Alpine with ssh and lftp utils

## download
```bash
docker pull fejita/wordmove
```

## build
```bash
./build.sh wordmove <tag> .
```

## push in docker hub 
1. docker login
2. docker images
3. docker tag <imageID> fejita/wordmove:<tagName>
4. docker push fejita/wordmove


