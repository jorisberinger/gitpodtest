FROM gradle:jre14
ENV TZ=Europe/Berlin

RUN apt update && apt install -y software-properties-common

RUN apt-key adv --keyserver keyserver.ubuntu.com --recv-key C99B11DEB97541F0 && apt-add-repository https://cli.github.com/packages && apt update && apt install gh

RUN mkdir /home/gradle/app
WORKDIR /home/gradle/app

COPY build.gradle build.gradle
# COPY settings.gradle settings.gradle
# COPY gradle.properties gradle.properties
COPY src src

RUN gradle build

CMD ["/bin/bash", "-c", "java -jar ./build/libs/gs-spring-boot-docker-0.1.0.jar"]
