FROM amazoncorretto:8

# Change the working directory
WORKDIR /usr/src/app

# Copy all of the source code
COPY . .

# Build the project
RUN ./mvnw package

# Expose port 8080
EXPOSE 8080

# Run the project
CMD ["java", "-jar", "./target/docker-example-1.1.3.jar"]
