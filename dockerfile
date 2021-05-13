FROM openjdk:16
RUN mkdir -p /app/hello-world
WORKDIR /app/hello-world
# copy jar into image
COPY ./hello-world.jar .
# run application with this command line 
CMD ["java", "-jar", "/app/hello-world/hello-world.jar"]

# FROM alpine:3.13.5
# Run apk --no-cache add openjdk11 --repository=http://dl-cdn.alpinelinux.org/alpine/edge/community
# Run apk add bash vim curl wget jq docker git tar unzip bash-completion ca-certificates
# Run cd /opt && curl -sSl http://mirror.vorboss.net/apache/maven/maven-3/3.6.3/binaries/apache-maven-3.6.3-bin.tar.gz | tar -xz
# env PATH "$PATH:/opt/apache-maven-3.6.3/bin"
