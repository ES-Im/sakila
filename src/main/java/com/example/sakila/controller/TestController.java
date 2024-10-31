package com.example.sakila.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class TestController {
	@GetMapping("/on/staff/staffList")	// onInterceptor 호출
	public String staffList() {
		return "/on/staff/staffList";
	}
	
	@GetMapping("/on/film/addFilm") // onInterceptor 호출
	public String addFilm() {
		return "/on/film/addFilm";
	}
}


// AOP 기법 