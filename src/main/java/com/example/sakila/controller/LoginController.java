package com.example.sakila.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.example.sakila.mapper.StaffMapper;
import com.example.sakila.service.StaffService;
import com.example.sakila.vo.Staff;

import jakarta.servlet.http.HttpSession;
import lombok.extern.slf4j.Slf4j;
@Slf4j
@Controller
public class LoginController {
	@Autowired StaffService staffService;
	
	
	@GetMapping("/off/login")
	public String login() {
		log.debug("off/login getMapping run");
		return "off/login";
	}
	
	@PostMapping("/off/login")
	public String login(Model model, HttpSession session,
							@RequestParam() int staffId, 
							@RequestParam() String password) {
		Staff paramStaff = new Staff();
		paramStaff.setStaffId(staffId);
		paramStaff.setPassword(password);
		
		Staff loginStaff = staffService.login(paramStaff);
		
		if(loginStaff == null) {		// when login failed
			log.debug("login failed");
			//model.addAttribute("msg", "Login failed");
			return "/off/login";
		}
		// when login success
		session.setAttribute("loginStaff", loginStaff);
		log.debug("login success");
		return "redirect:/on/main";
	}
	
	@GetMapping("/on/logout")
	public String logout(HttpSession session) {
		log.debug("/on/logout run");
		session.invalidate();
		return "redirect:/off/login";
	}
}
