#From openjdk:11-jdk-slim
#WORKDIR usr/lib
##ENV MONGO_DATABASE=niitdb
##ENV MONO_URL=mongodb://localhost:27017/niitdb
#ADD ./target/tutorialsproject-0.0.1-SNAPSHOT.jar /usr/lib/tutorialsproject-0.0.1-SNAPSHOT.jar
#EXPOSE 8081
#ENTRYPOINT["java","-jar","tutorialsproject-0.0.1-SNAPSHOT.jar"]



#
# Build stage
#
FROM maven:3.8.2-jdk-11 AS build
COPY . .
RUN mvn clean package -Pprod -DskipTests

#
# Package stage
#
FROM openjdk:11-jdk-slim
COPY --from=build /target/tutorialsproject-0.0.1-SNAPSHOT.jar tutorialsproject-0.0.1-SNAPSHOT.jar
# ENV PORT=8081
ENTRYPOINT ["java","-jar","tutorialsproject-0.0.1-SNAPSHOT.jar"]
