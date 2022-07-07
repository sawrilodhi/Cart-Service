FROM openjdk:8
EXPOSE 9094
ADD target/cart-service-0.0.1.jar cart-service-0.0.1.jar
ENTRYPOINT ["java", "-jar", "/cart-service-0.0.1.jar"] 