package com.example.sakila.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

import lombok.extern.slf4j.Slf4j;
@Slf4j
@Controller
public class MainController {
	
	@GetMapping("/on/main")
	public String login() {
		log.debug("/on/main");
		return "on/main";
	}

}
