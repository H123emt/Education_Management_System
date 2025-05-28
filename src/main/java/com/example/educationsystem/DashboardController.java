package com.example.educationsystem;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/api")
public class DashboardController {

    @Autowired
    private JdbcTemplate jdbcTemplate;

    @GetMapping("/getDashboardData")
    public Map<String, Integer> getDashboardData() {
        Map<String, Integer> response = new HashMap<>();

        // Query to count number of faculty
        Integer numberOfFaculty = jdbcTemplate.queryForObject("SELECT COUNT(*) FROM users WHERE role = 'faculty'", Integer.class);

        // Query to count number of students
        Integer numberOfStudents = jdbcTemplate.queryForObject("SELECT COUNT(*) FROM users WHERE role = 'student'", Integer.class);

        response.put("faculty", numberOfFaculty != null ? numberOfFaculty : 0);
        response.put("students", numberOfStudents != null ? numberOfStudents : 0);

        return response;
    }
}
