package com.example.educationsystem;

import java.io.IOException;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import jakarta.servlet.http.HttpSession;

@Controller
public class AdminController {
    @Autowired
    JdbcTemplate jdbc;

    @GetMapping("/adminhome")
    public String adminhome() {
        return "adminhome";
    }

    @GetMapping("/question")
    public String question(Model model) {
        System.out.println("call...");
        List<Map<String, Object>> li = jdbc.queryForList("select * from question");
        model.addAttribute("question", li);
        return "question";

    }

    @GetMapping("/profile")
    public String profile(HttpSession session, Model model) {
        String email = (String) session.getAttribute("email");
        String sql = "Select name,users.email, role,photo,age from users left join profile on users.email=profile.email where users.email='"
                + email + "'";
        List<Map<String, Object>> userprofile = jdbc.queryForList(sql);
        model.addAttribute("userprofile", userprofile);
        return "profile";
    }

    @PostMapping("/upload")
    public String upload(HttpSession session, Model model, @RequestParam("f") MultipartFile f,
            @RequestParam("age") String age) throws IOException {
        String email = (String) session.getAttribute("email");
        String sql1 = "delete from profile where email=?";
        jdbc.update(sql1, email);
        String sql2 = "INSERT INTO profile (email,photo,age) values(?,?,?)";
        jdbc.update(sql2, email, f.getBytes(), age);
        return profile(session, model);
    }

    @PostMapping("/manageusers")
    public String manageusers(@RequestParam("email") String email, @RequestParam("btn") String btn, Model model) {
        if (btn.equalsIgnoreCase("delete")) {
            String sql = "delete from users where email=?";
            jdbc.update(sql, email);
            return user(model);
        } else {
            String sql = "select * from users where email='" + email + "'";
            List<Map<String, Object>> userMaster = jdbc.queryForList(sql);
            model.addAttribute("user_master", userMaster);
            return "editusers";
        }
    }

    @PostMapping("/updateusers")
    public String updateusers(@RequestParam("email") String email, @RequestParam("name") String name,
            @RequestParam("status") String status, @RequestParam("mobile") String mobile, Model model) {
        String sql = "update users set name=?, status=? ,mobile=? where email=?";
        jdbc.update(sql, name, status, mobile, email);
        return user(model);

    }

    @GetMapping("/users")
    public String user(Model model) {
        List<Map<String, Object>> li = jdbc.queryForList("select * from users where role !='admin'");
        model.addAttribute("user_mast", li);
        return "users";
    }

    @GetMapping("/add_faq")
    public String add_faq() {
        return "add_faq";
    }

    @PostMapping("/add_faq")
    public String add_faq(Model model, @RequestParam("question") String question,
            @RequestParam("answer") String answer) {
        jdbc.execute("insert into faq(question,answer) values('" + question + "','" + answer + "')");
        model.addAttribute("res", "sussesfully added..");
        return "add_faq";
    }

    @GetMapping("/view_faq")
    public String view_faq(Model model) {
        List<Map<String, Object>> li = jdbc.queryForList("select * from faq");
        model.addAttribute("view_faq", li);
        return "view_faq";
    }

    @PostMapping("/managefaq")
    public String managefaq(@RequestParam("slno") String slno, @RequestParam("btn") String btn, Model model) {
        if (btn.equalsIgnoreCase("delete")) {
            String sql = "delete from faq where slno=?";
            jdbc.update(sql, slno);
            return view_faq(model);
        } else {
            String sql = "select * from faq where slno='" + slno + "'";
            List<Map<String, Object>> view_faq = jdbc.queryForList(sql);
            model.addAttribute("view_faq", view_faq);
            return "editfaq";
        }
    }

    @PostMapping("/updatefaq")
    public String update_faq(@RequestParam("slno") String slno, @RequestParam("question") String question,
            @RequestParam("answer") String answer, Model model) {
        String sql = "update faq set question=?, answer=? where slno=?";
        jdbc.update(sql, question, answer, slno);
        return view_faq(model);
    }
}
