# Stage 1: Build the Spring Boot application
FROM maven:3.8.4-openjdk-17-slim AS builder

# Set the working directory for the build process
WORKDIR /app

# Copy the pom.xml and src directory to the container
COPY pom.xml .
COPY src ./src

# Build the Spring Boot application, skipping tests for faster builds
RUN mvn clean package -DskipTests

# Stage 2: Create the runtime image (smaller final image)
FROM openjdk:17-jdk-slim

# Set the working directory for the application
WORKDIR /app

# Copy the built .jar file from the builder stage to the runtime stage
COPY --from=builder /app/target/imarker-gateway.jar app.jar

# Expose the port that your Spring Boot app will run on (default 8080)
EXPOSE 8080

# Run the Spring Boot application with environment variables
ENTRYPOINT ["java", "-jar", "/app/app.jar"]
