FROM maven:3.5-jdk-8-alpine as build
WORKDIR /app
COPY pom.xml pom.xml
COPY jpa jpa
COPY backend__s_t_s___b_u_s___v_1_5__f7d1ef6d_d9f3_4c13_b890_f259efb5cc9b backend__s_t_s___b_u_s___v_1_5__f7d1ef6d_d9f3_4c13_b890_f259efb5cc9b
RUN mvn clean package -DnoTest=true

FROM openjdk:8-jre-alpine
WORKDIR /app
COPY --from=build /app/backend__s_t_s___b_u_s___v_1_5__f7d1ef6d_d9f3_4c13_b890_f259efb5cc9b/target/_s_t_s___b_u_s___v_1_5_-0.0.1-SNAPSHOT.jar /app
EXPOSE 8080
ENTRYPOINT ["sh", "-c"]
CMD ["java -jar _s_t_s___b_u_s___v_1_5_-0.0.1-SNAPSHOT.jar"]