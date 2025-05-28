package com.example.educationsystem;

import java.util.Random;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

import jakarta.servlet.http.HttpSession;

@RestController
public class ForgotPasswordController {

    @Autowired
    private JdbcTemplate jdbcTemplate;

    @Autowired
    private JavaMailSender mailSender;  // Inject JavaMailSender

    // Check if user exists based on email
    @PostMapping("/checkUserExists")
    public boolean checkUserExists(@RequestBody String email) {
        String query = "SELECT COUNT(*) FROM users WHERE email = ?";
        Integer count = jdbcTemplate.queryForObject(query, Integer.class, email);
        return count != null && count > 0;
    }

    // Send OTP to user if they exist
    @PostMapping("/sendOtp")
    public String sendOtp(@RequestBody String email, HttpSession session) {
        // First, check if the user exists
        boolean userExists = checkUserExists(email);

        if (userExists) {
            // Generate OTP
            Random random = new Random();
            int otp = 100000 + random.nextInt(900000);

            // Store OTP in session for validation later
            session.setAttribute("otp", otp);
            session.setAttribute("email", email);

            // Send OTP via email
            SimpleMailMessage message = new SimpleMailMessage();
            message.setTo(email);
            message.setSubject("Your OTP for Password Reset");
            message.setText("Your OTP is: " + otp);

            mailSender.send(message);

            return "OTP sent to " + email;
        } else {
            return "User not found";
        }
    }

    // Validate the OTP
    @PostMapping("/validateOtp")
    public String validateOtp(@RequestBody String otpInput, HttpSession session) {
        int otp = (int) session.getAttribute("otp");

        if (Integer.parseInt(otpInput) == otp) {
            return "OTP validated";
        } else {
            return "Invalid OTP";
        }
    }
    
    
    // Update the password after validation
    @PostMapping("/updatePassword")
    public String updatePassword(@RequestBody PasswordForm passwordForm, HttpSession session) {
        String newPassword = passwordForm.getNewPassword();
        String confirmPassword = passwordForm.getConfirmPassword();

        String email = (String) session.getAttribute("email");

        if (!newPassword.equals(confirmPassword)) {
            return "Passwords do not match";
        }
        // Update password in the database
        String query = "UPDATE users SET password = ? WHERE email = ?";
        int update = jdbcTemplate.update(query, newPassword, email);

        if (update > 0) {
            return "Password updated successfully";
        } else {
            return "Error updating password";
        }
    }
}

// Helper class for password form data
class PasswordForm {
    private String newPassword;
    private String confirmPassword;

    // Getters and setters
    public String getNewPassword() {
        return newPassword;
    }

    public void setNewPassword(String newPassword) {
        this.newPassword = newPassword;
    }

    public String getConfirmPassword() {
        return confirmPassword;
    }

    public void setConfirmPassword(String confirmPassword) {
        this.confirmPassword = confirmPassword;
    }
}