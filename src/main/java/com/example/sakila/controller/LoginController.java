package com.example.sakila.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.example.sakila.mapper.StaffMapper;
import com.example.sakila.vo.Staff;

import jakarta.servlet.http.HttpSession;
import lombok.extern.slf4j.Slf4j;
@Slf4j
@Controller
public class LoginController {
	@Autowired StaffMapper staffMapper;
	
	@GetMapping("/off/login")
	public String login() {
		log.debug("off/login run");
		return "off/login";
	}
	
	@PostMapping("/off/login")
	public String login(Model model, HttpSession session,
							@RequestParam(name="staffId") int staffId, 
							@RequestParam(name = "password") String password) {
		Staff paramStaff = new Staff();
		paramStaff.setStaffId(staffId);
		paramStaff.setPassword(password);
		
		Staff loginStaff = staffMapper.login(paramStaff);
		if(loginStaff == null) {
			log.debug("login failed");
			model.addAttribute("msg", "Login failed");
			return "/off/login";
		}
		session.setAttribute("loginStaff", loginStaff);
		
		return "redirect:on/login";
	}
}
