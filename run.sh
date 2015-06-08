
docker stop minecraft-forge-1.7.10
docker rm minecraft-forge-1.7.10

docker run --restart=always \
    --name minecraft-forge-1.7.10 \
    -v `pwd`/logs:/minecraft/logs \
    -v `pwd`/world:/minecraft/world \
    -v `pwd`/mods:/minecraft/mods \
    -p 25565:25565 \
    -d soichih/minecraft-forge:1.7.10

docker logs -f minecraft-forge-1.7.10
