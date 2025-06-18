# Dockerfile
FROM eclipse-temurin:24-jdk

WORKDIR .

COPY app.jar .

ARG ENV=prod
COPY application.yaml ./application.yaml
COPY application-${ENV}.yaml ./application-${ENV}.yaml

EXPOSE 8080

CMD ["java", "-jar", "app.jar", "--spring.config.location=classpath:/,file:./application.yaml"]
