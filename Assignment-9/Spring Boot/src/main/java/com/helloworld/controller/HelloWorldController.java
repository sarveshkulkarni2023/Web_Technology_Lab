package com.helloworld.controller;

import org.springframework.web.bind.annotation.*;

/**
 * REST Controller for Hello-World Service
 * 
 * @RestController combines @Controller and @ResponseBody
 * - Marks this class as a REST controller
 * - Methods automatically serialize return values to JSON/XML
 * 
 * @RequestMapping("/api") sets the base path for all endpoints
 */
@RestController
@RequestMapping("/api")
public class HelloWorldController {

    /**
     * Simple GET endpoint that returns a hello message
     * 
     * @GetMapping maps HTTP GET requests to this method
     * Access: http://localhost:8080/api/hello
     */
    @GetMapping("/hello")
    public String hello() {
        return "Hello-World! Welcome to Spring Boot.";
    }

    /**
     * GET endpoint at root that returns a greeting
     * Access: http://localhost:8080/api/
     */
    @GetMapping("/")
    public String welcome() {
        return "Welcome to Hello-World Spring Boot Service!";
    }

    /**
     * GET endpoint that accepts a path variable
     * Demonstrates request parameter handling
     * 
     * @PathVariable binds URL template variables to method parameters
     * Access: http://localhost:8080/api/greet/John
     */
    @GetMapping("/greet/{name}")
    public String greetUser(@PathVariable String name) {
        return "Hello, " + name + "! Welcome to Spring Boot.";
    }

    /**
     * GET endpoint that accepts query parameters
     * Demonstrates query parameter handling
     * 
     * @RequestParam binds HTTP query parameters to method parameters
     * Access: http://localhost:8080/api/greeting?role=Student&name=Alice
     */
    @GetMapping("/greeting")
    public String greeting(
            @RequestParam(value = "name", defaultValue = "User") String name,
            @RequestParam(value = "role", defaultValue = "Guest") String role) {
        return String.format("Hello %s! You are accessing as a %s.", name, role);
    }

    /**
     * POST endpoint that accepts JSON data
     * Demonstrates request body handling
     * 
     * Access via POST request to http://localhost:8080/api/welcome
     * With JSON body: {"name": "Student", "module": "Faculty"}
     */
    @PostMapping("/welcome")
    public String postWelcome(@RequestBody GreetingRequest request) {
        return String.format("Hello %s! You are from the %s module.", 
                           request.getName(), request.getModule());
    }

    /**
     * Health check endpoint
     * Access: http://localhost:8080/api/health
     */
    @GetMapping("/health")
    public String health() {
        return "Service is UP and running!";
    }

    /**
     * Inner class to handle incoming JSON requests
     */
    public static class GreetingRequest {
        private String name;
        private String module;

        // Getters and Setters
        public String getName() {
            return name;
        }

        public void setName(String name) {
            this.name = name;
        }

        public String getModule() {
            return module;
        }

        public void setModule(String module) {
            this.module = module;
        }
    }
}
