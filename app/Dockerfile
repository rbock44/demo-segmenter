FROM openjdk:8-jre-alpine
WORKDIR /opt/docker
ADD --chown=daemon:daemon target/scala-2.12/ /opt/docker
USER daemon
ENTRYPOINT ["java", "-jar", "app-assembly-1.jar" ]
CMD []

