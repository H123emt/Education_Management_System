package com.example.educationsystem;


import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

@SpringBootApplication
public class EducationsystemApplication {

	public static void main(String[] args) {
		SpringApplication.run(EducationsystemApplication.class, args);
	}

		@Autowired
	JdbcTemplate jdbc;

	@PostMapping("/getDetails")
	public List getDetails(@RequestParam("email") String email) {
		String sql = "select * from usermaster where (email = ? or uname=?)";
		List<Map<String, Object>> li = jdbc.queryForList(sql, email, email);
		return li;
	}

	// ---------------------------- Forgot password page --------------------------
	@PostMapping("/chkValidAns")
	public List chkValidAns(@RequestParam("email") String email, @RequestParam("ans") String ans,
			@RequestParam("security_qus") String security_qus) {
		String sql = "SELECT * FROM usermaster WHERE (email = ? OR uname = ?) AND ans = ? and security_qus=?";
		List<Map<String, Object>> res = jdbc.queryForList(sql, email, email, ans, security_qus);
		return res;
	}

}
