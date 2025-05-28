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
@Controller
public class questionController {
    @Autowired
    JdbcTemplate jdbc;
    @GetMapping("/viewquestion")
    public String viewquestion(Model model){
        List<Map<String, Object>> li=jdbc.queryForList("select * from question");
        model.addAttribute("view_question", li);
        return "viewquestion"; 

    }

    @PostMapping("/manage_question")
    public String managequestion(@RequestParam("slno") String slno,@RequestParam("btn") String btn,Model model){
        if(btn.equalsIgnoreCase("delete")){
            String sql="delete from question where slno=?";
            jdbc.update(sql,slno);
            return viewquestion(model);
        }else{
            String sql="select * from question where slno='"+slno+"'";
            List<Map<String, Object>> view_question=jdbc.queryForList(sql);
            model.addAttribute("view_question",view_question);
            return "editquestion";
        }
    }
    @PostMapping("/updatequestion")
    public String updatequestion(@RequestParam("slno")String slno,@RequestParam("question") String question, @RequestParam("option1") String option1, @RequestParam("option2") String option2, @RequestParam("option3") String option3, @RequestParam("option4") String option4, @RequestParam("answer") String answer,Model model){
        String sql="update question set question=?,option1=?,option2=?,option3=?,option4=?, answer=? where slno=?;";
            jdbc.update(sql,question,option1,option2,option3,option4,answer,slno);
            return viewquestion(model);
        
    }
    
}
