package com.example.educationsystem;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import jakarta.servlet.http.HttpSession;

@Controller
public class LeaveController {

    @Autowired
    private JdbcTemplate jdbc;

    @GetMapping("/leave")
    public String leave(HttpSession session, Model model) {
        String name = (String) session.getAttribute("name"); // Assuming name is stored in session
        if (name != null) {
            String sql = "SELECT name, email FROM users WHERE name = ?";
            Map<String, Object> user = jdbc.queryForMap(sql, name);
            model.addAttribute("user", user);
        } else {
            return "redirect:/login"; 
        }
        return "leave"; 
    }

    @GetMapping("/view_leave")
    public String viewLeave(Model model, HttpSession session) {
        // Retrieve email from session
        String email = (String) session.getAttribute("email");

        if (email == null) {
            // Handle case where user is not logged in or session expired
            return "redirect:/login"; // Redirect to login or error page
        }

        // Fetch leave data for the logged-in user
        String sql = "SELECT * FROM view_leave WHERE email = ?";
        List<Map<String, Object>> leaveList = jdbc.queryForList(sql, email);

        // Add the leave data to the model
        model.addAttribute("view_leave", leaveList);

        // Return the view name
        return "view_leave";
    }

    @PostMapping("/submitLeave")
    public String submitLeave(
            @RequestParam("name") String name,
            @RequestParam("email") String email,
            @RequestParam("fromDate") String fromDate,
            @RequestParam("toDate") String toDate,
            @RequestParam("reason") String reason,
            RedirectAttributes redirectAttributes) {

        String sql = "INSERT INTO view_leave (name, email, from_date, to_date, reason) VALUES (?, ?, ?, ?, ?)";
        jdbc.update(sql, name, email, fromDate, toDate, reason);

        redirectAttributes.addFlashAttribute("message", "Leave application submitted successfully!");

        return "redirect:/leave"; // Redirect back to the leave page
    }
   @GetMapping("/manage_leave")
    public String manage_leave(Model model){
        List<Map<String, Object>> li=jdbc.queryForList("select * from view_leave");
        model.addAttribute("manage_leave", li);
        return "manage_leave";
    }

    @PostMapping("/action_leave")
    public String manageLeave(@RequestParam("id") String id,
                              @RequestParam("action") String action,
                              RedirectAttributes redirectAttributes) {
    
        String status = "approve".equalsIgnoreCase(action) ? "Approved" : "Denied";
        String sql = "UPDATE view_leave SET status = ? WHERE id = ?";
    
        int rowsUpdated = jdbc.update(sql, status, id);
    
        if (rowsUpdated > 0) {
            redirectAttributes.addFlashAttribute("message", "Leave request " + action + "d successfully.");
        } else {
            redirectAttributes.addFlashAttribute("message", "Failed to " + action + " leave request.");
        }
    
        return "redirect:/manage_leave";
         // Redirect back to the leave management page
    }
    
}
