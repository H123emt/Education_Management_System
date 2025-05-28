

package com.example.educationsystem;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import jakarta.servlet.http.HttpSession;

@Controller
public class AnoController {
    
  
    
    
    @GetMapping("/forgetpassword")
    public String forgetpassword(){
        return "forgetpassword";
    }
    
    @GetMapping("/")
    public String index(){
        return "index";
    }
    @GetMapping("/view_contact")
    public String view_contact(Model model){
        String sql="select * from contact";
        List<Map<String,Object>> view_contact=jdbc.queryForList(sql);
        model.addAttribute("view_contact",view_contact);
        return "view_contact";
    }
    @GetMapping("/about")
    public String about(){
        return "about";
    }
    @GetMapping("/blog")
    public String blog(){
        return "blog";
    }
    @GetMapping("/service")
    public String service(){
        return "service";
    }
    @GetMapping("/contact")
    public String contact(){
        return "contact";
    }
    
    @GetMapping("/register")
    public String register(){
        return "register";
    }
 
    @GetMapping("/login")
    public String login(){
        return "login";
    }
    @GetMapping("/home")
    public String home(){
        return "home";
    }

    @GetMapping("/maintenance")
    public String maintenance(){
        return "maintenance";
    }
    
    @Autowired
    JdbcTemplate jdbc;
    
    @PostMapping("/chk_login")
    public String chk_login(HttpSession session, Model model, @RequestParam("email") String email,
            @RequestParam("password") String password) {
        ArrayList<String> ali = new ArrayList<String>();
        String sql = "select * from users where email='" + email + "'and password= '" + password + "'";
        jdbc.query(sql, new RowMapper<String>() {
            public String mapRow(ResultSet rs, int rowNum) throws SQLException {
                ali.add(rs.getString(1));//name
                ali.add(rs.getString(2));//user id/email
                ali.add(rs.getString(3));//password
                ali.add(rs.getString(4));//mobile
                ali.add(rs.getString(5));//role
                ali.add(rs.getString(6));//status
                return "";
            }
        });
        if (ali.isEmpty()) {
            model.addAttribute("res", "invalid details");
            return "login";
        } else {
            if ((ali.get(5)).equalsIgnoreCase("1"))
            {
                session.setAttribute("name", ali.get(0));
                session.setAttribute("email", ali.get(1));
                if ((ali.get(4)).equalsIgnoreCase("admin"))
                {
                    return "adminhome";
                }else if ((ali.get(4)).equalsIgnoreCase("faculty")) {
                    return "facultyhome";
                }else if ((ali.get(4)).equalsIgnoreCase("student")) {
                    return "studenthome";
                }else {
                    model.addAttribute("res", "some error...");
                    return "login";
                }

            }else{
                model.addAttribute("res", "plz contact to admin");
                return "login";
            }
        }
    }
    @GetMapping("/faq")
    public String showFAQs(Model model) {     
        String sql = "SELECT * FROM faq";
        List<Map<String, Object>> faqs = jdbc.queryForList(sql);
        model.addAttribute("faqs", faqs);
        return "faq";
    }
    @PostMapping("/contact")
    public String contact_save(@RequestParam("name") String name,
                                 @RequestParam("email") String email,
                                @RequestParam("mobile") String mobile,
                                @RequestParam("message") String message,Model model){
      jdbc.execute("insert into contact (Name, Email, Mobile, Message) values('"+name+"','"+email+"','"+mobile+"','"+message+"')");
      model.addAttribute("msg","save_success");
     return "contact";
    

    }
    @GetMapping("/logout")
public String logout(HttpSession session) {
    session.invalidate();
    return "redirect:/logout-success";
}
@GetMapping("/logout-success")
public String logoutSuccess() {
    return "logout-success";
}



    @PostMapping("/save_user")
    public String save_user(Model model, @RequestParam("name") String name, @RequestParam("email") String email,
                            @RequestParam("password") String password, @RequestParam("mobile") String mobile, @RequestParam("role") String role) {
        jdbc.execute("insert into users (name,email,password,mobile,role) values('"+name+"','"+email+"','"+password+"','"+mobile+"','"+role+"')");
        model.addAttribute("res", "register success");
        return "register";
    }

    @GetMapping("/forgot")
    public static String forgot() {
        return "forgot";
    }


    // Reset password using qus and ans
    @PostMapping("/resetPassword")
    // give return type List
    public String saveorder(@RequestParam("password") String password, @RequestParam("oemail_to") String email,
            Model m) {

        String sql = "update user_master set password=? where email=?";
        jdbc.update(sql, password, email);
        m.addAttribute("sms", "Password Reset Successful");

        return "login";
    }

    @GetMapping("/sendmail")
    public static String sendmail() {
        return "sendmail";
    }
    @GetMapping("/editcontact")
    public static String editcontact() {
        return "editcontact";
    }
    
    @PostMapping("/manage_contact")
    public String manage_contact(Model model,@RequestParam("id") String id,@RequestParam("btn") String btn)
    {
        if(btn.equalsIgnoreCase("delete")){
            String sql="delete from contact where Id=?";
            jdbc.update(sql,id);
            return   view_contact(model);
        }
        String sql="select * from contact where Id='"+id+"'";
        List<Map<String,Object>> view_contact=jdbc.queryForList(sql);
        model.addAttribute("view_contact",view_contact);
        return "editcontact";
        }
@PostMapping("/updatecontact")
public String updatecontact(Model model,@RequestParam("id")  String id,@RequestParam("name")String name,
@RequestParam("email")String email,@RequestParam("mobile") String mobile,@RequestParam("message") String message){
    String sql="update contact set Name=?, Email=?, Mobile=?,Message=? where Id=?";
    jdbc.update(sql,name,email,mobile,message,id);
    return view_contact(model);
}



}

