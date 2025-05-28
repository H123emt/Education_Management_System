package com.example.educationsystem;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import javax.sql.DataSource;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class NoticeController {

    private final JdbcTemplate jdbcTemplate;

    @Autowired
    JdbcTemplate jdbc;
    public NoticeController(DataSource dataSource) {
        this.jdbcTemplate = new JdbcTemplate(dataSource);
    }

    @GetMapping("/notice")
    public String getNoticePage(Model model) {
        String sql = "SELECT * FROM notice";
        List<String> notices = jdbcTemplate.query(sql, new RowMapper<String>() {
            @Override
            public String mapRow(ResultSet rs, int rowNum) throws SQLException {
                return rs.getString("content");
            }
        });
        model.addAttribute("notices", notices);
        return "notice";
    }


    @PostMapping("/addnotice")
    public String addnotice(Model model, @RequestParam("notice") String notice) {
        jdbc.execute("insert into notice(content) values('"+notice+"')");
        model.addAttribute("res", "Notice added sucessful");
        return "add_notice";
    }

    @GetMapping("/add_notice")
    public String add_notice(){
        return "add_notice";
    }

    @PostMapping("/managenotice")
    public String managenotice(@RequestParam("id") String id,@RequestParam("btn") String btn,Model model){
        if(btn.equalsIgnoreCase("delete")){
            String sql="delete from notice where id=?";
            jdbc.update(sql,id);
            return viewnotice(model);
        }else{
            String sql="select * from notice where id='"+id+"'";
            List<Map<String, Object>> view_notice=jdbc.queryForList(sql);
            model.addAttribute("view_notice",view_notice);
            return "editnotice";
        }
    }
    
    @PostMapping("/updatenotice")
    public String updatenotice(@RequestParam("id")String id,@RequestParam("content") String content,Model model){
        String sql="update notice set content=? where id=?;";
            jdbc.update(sql,content,id);
            return viewnotice(model);
        
    }


    @GetMapping("/viewnotice")
    public String viewnotice(Model model){
        List<Map<String, Object>> li=jdbc.queryForList("select * from notice");
        model.addAttribute("view_notice", li);
        return "viewnotice";

    }
}
