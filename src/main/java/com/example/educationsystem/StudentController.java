package com.example.educationsystem;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import jakarta.servlet.http.HttpSession;

@Controller
public class StudentController {
    @Autowired
    JdbcTemplate jdbc;

    @GetMapping("/video")
    public String teacherupload(Model model){
        String sql="select * from video_master";
        List<Map<String,Object>> video_data=jdbc.queryForList(sql);
        model.addAttribute("video_data",video_data );
        return"video";
    }
    @PostMapping("/search_result")
    public String search_result(@RequestParam ("email") String email ,Model model){
        List<Map<String, Object>> sl=jdbc.queryForList("select * from answer where student_email='"+email+"'");
        model.addAttribute("view_result", sl);
        return "viewresult";
    }
    @GetMapping("/viewresult")
    public String viewresult(){
        return "viewresult";
    }
        @GetMapping("/studenthome")
    public String studenthome(){
        return "studenthome";
    }
    @GetMapping("/exam")
    public String exam(Model model){
        List<Map<String,Object>> li=jdbc.queryForList("select * from question limit 3");
        model.addAttribute("question",li);
        return "exam";
    }

    @PostMapping("/saveStudentAnswer")
    public String saveStudentAnswer(@ModelAttribute ExamData ed, HttpSession session, Model model) {
        String email = (String) session.getAttribute("email");

        String sql1 = "select slno, answer FROM question limit 3";
        List<Map<String, Object>> db_answer = jdbc.queryForList(sql1);

        String[] stu_ansArray = ed.getAnsArray();
        int total_mark = 0;
        for (Map<String, Object> rowMap : db_answer) {
            int sl_no = Integer.parseInt(rowMap.get("slno").toString()); 
            int ans = Integer.parseInt(rowMap.get("answer").toString());
            int stu_mark = Integer.parseInt(stu_ansArray[sl_no]);
            if (ans == stu_mark) {
                total_mark++;
            }
        }  
        String json_text = ed.toString();
        String sql = "insert into answer (student_email, student_answer, student_mark) values(?,?,?)";
        jdbc.update(sql, email, json_text, total_mark);
        System.out.println(total_mark);
        model.addAttribute("mark", total_mark);
        return "exam";
    }
}




