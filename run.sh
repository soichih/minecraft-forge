
docker stop mcf1710
docker rm mcf1710

docker run --restart=always \
    --name mcf1710 \
    -v `pwd`/logs:/minecraft/logs \
    -v `pwd`/world:/minecraft/world \
    -v `pwd`/mods:/minecraft/mods \
    -p 25565:25565 \
    -d soichih/mcf:1.7.10

docker logs -f mcf1710
