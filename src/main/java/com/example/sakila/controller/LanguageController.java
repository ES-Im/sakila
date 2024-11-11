package com.example.sakila.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.example.sakila.service.LanguageService;
import com.example.sakila.vo.Language;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class LanguageController {
	@Autowired LanguageService languageService;
	
	@GetMapping("/on/addLanguage")
	public String addLanguage(Model model) {
		List<Language> list = languageService.getLanguageList();
		model.addAttribute("list", list);
		return "on/addLanguage";
	}
	
	@PostMapping("/on/addLanguage")
	public String addLanguage(Model model, @RequestParam String name) {
		log.debug("name = " + name);
		int addRow = languageService.addLanguage(name);
		String result = "";
		
		if(addRow != 1) {
			result = "fail"; 
		} else {
			result = "success";
		}
		log.debug(result);
		model.addAttribute("result", result);
		return "/on/addLanguage";
	}
}
