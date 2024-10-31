package com.example.sakila.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

import lombok.extern.slf4j.Slf4j;

@Slf4j 
@Controller
public class HelloController {
	@GetMapping("/hello")
	public String hello() {
		// loggin 프레임워크 사용
		log.debug("gg");
		
		return "hello";
	}
	
}
