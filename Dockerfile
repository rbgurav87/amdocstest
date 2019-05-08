FROM openjdk:11-jre-slim
COPY target/ ./
EXPOSE 443
EXPOSE 8443
ENTRYPOINT ["java","-jar","helloworld-0.0.1-SNAPSHOT.jar"]