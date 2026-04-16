package com.helloworld;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

/**
 * Main Spring Boot Application Class
 * 
 * @SpringBootApplication is a convenience annotation that adds:
 * - @Configuration (declares class as a source of bean definitions)
 * - @EnableAutoConfiguration (tells Spring Boot to auto-configure based on classpath)
 * - @ComponentScan (scans for components, services, and other annotated classes)
 */
@SpringBootApplication
public class HelloWorldApplication {

    public static void main(String[] args) {
        /**
         * SpringApplication.run() starts the Spring Boot application
         * It:
         * 1. Starts the embedded Tomcat server on port 8080
         * 2. Bootstraps the Spring Application Context
         * 3. Initializes all Spring beans and components
         */
        SpringApplication.run(HelloWorldApplication.class, args);
        System.out.println("✓ Hello-World Spring Boot Service is running!");
    }
}
