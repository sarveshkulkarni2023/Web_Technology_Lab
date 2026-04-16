package com.helloworld.controller;

import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.autoconfigure.web.servlet.AutoConfigureMockMvc;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.web.servlet.MockMvc;

import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.*;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.*;
import static org.hamcrest.Matchers.containsString;

/**
 * Unit Tests for HelloWorldController
 * 
 * @SpringBootTest loads the entire application context for integration testing
 * @AutoConfigureMockMvc provides MockMvc for testing REST endpoints without starting server
 */
@SpringBootTest
@AutoConfigureMockMvc
class HelloWorldControllerTest {

    @Autowired
    private MockMvc mockMvc;

    @Test
    void testHelloEndpoint() throws Exception {
        mockMvc.perform(get("/api/hello"))
                .andExpect(status().isOk())
                .andExpect(content().string(containsString("Hello-World")));
    }

    @Test
    void testWelcomeEndpoint() throws Exception {
        mockMvc.perform(get("/api/"))
                .andExpect(status().isOk())
                .andExpect(content().string(containsString("Welcome")));
    }

    @Test
    void testGreetWithNamePathVariable() throws Exception {
        mockMvc.perform(get("/api/greet/Alice"))
                .andExpect(status().isOk())
                .andExpect(content().string(containsString("Hello, Alice")));
    }

    @Test
    void testGreetingWithQueryParameters() throws Exception {
        mockMvc.perform(get("/api/greeting")
                .param("name", "Bob")
                .param("role", "Student"))
                .andExpect(status().isOk())
                .andExpect(content().string(containsString("Bob")))
                .andExpect(content().string(containsString("Student")));
    }

    @Test
    void testHealthCheckEndpoint() throws Exception {
        mockMvc.perform(get("/api/health"))
                .andExpect(status().isOk())
                .andExpect(content().string(containsString("UP")));
    }
}
