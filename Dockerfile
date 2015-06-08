
FROM webhippie/minecraft-vanilla:1.7.10

MAINTAINER Soichi Hayashi <soichih@gmail.com>

ENV FORGE_INSTALLER_PATH http://files.minecraftforge.net/maven/net/minecraftforge/forge/1.7.10-10.13.3.1428-1.7.10
ENV FORGE_INSTALLER_NAME forge-1.7.10-10.13.3.1428-1.7.10-installer.jar

RUN curl ${FORGE_INSTALLER_PATH}/${FORGE_INSTALLER_NAME} -o /minecraft/${FORGE_INSTALLER_NAME} && \
  cd /minecraft && \
  java -jar ${FORGE_INSTALLER_NAME} --installServer && \
  rm -f /minecraft/${FORGE_INSTALLER_NAME}

#VOLUME ["/minecraft/merge", "/minecraft/world", "/minecraft/logs"]
ADD /minecraft-default /minecraft

EXPOSE 25565 25575

WORKDIR /minecraft
CMD ["java", "-XX:MaxPermSize=128M", "-Xmx2048M", "-Xms512M", "-jar", "forge-1.7.10-10.13.3.1428-1.7.10-universal.jar", "nogui"]

