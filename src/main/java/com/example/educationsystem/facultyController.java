package com.example.educationsystem;
import java.io.File;
import java.nio.file.Path;
import java.nio.file.Paths;
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
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import jakarta.servlet.http.HttpSession;

@Controller
public class facultyController {
    @Autowired
    JdbcTemplate jdbc;

    @GetMapping("/uploadvideo")
    public String uploadvideo(){
      return"uploadvideo";
    }
    @PostMapping("/uploadvideo")
    public String save_uploadvideo(@RequestParam("videoFile") MultipartFile file,Model model,HttpSession session){
        if(file.isEmpty()){
            model.addAttribute("error", "please select a video");
        }
        try{
            Path currentPath=Paths.get("");
            String projectDir=currentPath.toAbsolutePath().toString();
            String uploadDir=projectDir + "/src/main/resources/static/videos/";
            File directory=new File( uploadDir);
            if(!directory.exists()){
                directory.mkdirs();
    
    
            }
            File uploadFile=new File(uploadDir+ file.getOriginalFilename());
            file.transferTo(uploadFile);
             String teacherid=session.getAttribute("email").toString();
             String sql="insert into video_master(teacher_id,video_name,likes,comments)values(?,?,?,?)";
             jdbc.update(sql, teacherid,file.getOriginalFilename(),0,0);
             model.addAttribute("error", "video uploaded successfully"+file.getOriginalFilename());
    
    
        }catch(Exception e){
            model.addAttribute("error", "failed to create directory for video"+e.getMessage());
            e.printStackTrace();
            return"uploadvideo";
        }
        return "uploadvideo";
    }
       
    @GetMapping("/managevideos")
    public String manageVideos(Model model, HttpSession session) {
        String teacherId = session.getAttribute("email").toString();
        String sql = "SELECT * FROM video_master WHERE teacher_id = ?";
        List<Map<String, Object>> videos = jdbc.queryForList(sql, teacherId);
        model.addAttribute("videos", videos);
        return "managevideos";
    }
    
    @GetMapping("/deletevideo")
    public String deleteVideo(@RequestParam("sl_no") Integer slNo, RedirectAttributes redirectAttributes) {
        if (slNo == null) {
            redirectAttributes.addFlashAttribute("msg", "Invalid video ID");
            return "redirect:/managevideos";
        }
    
        String sql = "DELETE FROM video_master WHERE sl_no = ?";
        jdbc.update(sql, slNo);
        redirectAttributes.addFlashAttribute("msg", "Video deleted successfully");
        return "redirect:/managevideos";
    }
    

    
    @GetMapping("/facultyhome")
    public String facultyhome(){
        return "facultyhome";
    }
    @GetMapping("/add_question")
    public String add_question(){
        return "add_question";
    }
    @GetMapping("/student")
    public String user(Model model){
        List<Map<String, Object>> li=jdbc.queryForList("select * from users where role ='student'");
        model.addAttribute("user_master", li);
        return "student";
    }

    

    @PostMapping("/save_question")
    public String add_question(Model model, @RequestParam("question") String question, @RequestParam("option1") String option1,
                            @RequestParam("option2") String option2, @RequestParam("option3") String option3, @RequestParam("option4") String option4,@RequestParam("answer") String answer) {
        jdbc.execute("insert into question(question,option1,option2,option3,option4,answer) values('"+question+"','"+option1+"','"+option2+"','"+option3+"','"+option4+"','"+answer+"')");
        model.addAttribute("res", "Question added sucessfull");
        return "add_question";
    }

     @GetMapping("/faculty_profile")
    public String faculty_profile(HttpSession session ,Model model){
        String email=(String)session.getAttribute("email");
        String sql="Select name,users.email, role,photo,age from users left join profile on users.email=profile.email where users.email='"+email+"'" ;
        List<Map<String, Object>> userprofile=jdbc.queryForList(sql);
        model.addAttribute("userprofile", userprofile);      
        return "faculty_profile";
    }
}
