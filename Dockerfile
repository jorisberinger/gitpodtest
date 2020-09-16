FROM gradle
ENV TZ=Europe/Berlin

RUN mkdir /home/gradle/app
WORKDIR /home/gradle/app

COPY build.gradle build.gradle
# COPY settings.gradle settings.gradle
# COPY gradle.properties gradle.properties
COPY src src

RUN gradle build

CMD ["/bin/bash", "-c", "java -jar ./build/libs/gs-spring-boot-docker-0.1.0.jar"]
