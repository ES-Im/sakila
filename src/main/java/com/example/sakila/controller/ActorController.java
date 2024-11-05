package com.example.sakila.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.example.sakila.service.ActorService;
import com.example.sakila.vo.Actor;
import com.example.sakila.vo.ActorForm;

import jakarta.servlet.http.HttpSession;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class ActorController {
	@Autowired ActorService actorService;
	
	@GetMapping("/on/addActor")
	public String addActor(Actor actor) {
		return "on/addActor";
	}
	
	@PostMapping("/on/addActor")	// ActorForm = Comment Entity
	public String addActor(HttpSession session, ActorForm actorForm) {
		log.debug(actorForm.toString());
		
		String path = session.getServletContext().getRealPath("/upload/");
		log.debug(path);
		
		actorService.addActor(actorForm, path);
		return "redirect:/on/actorList";
	}
	
	@GetMapping("/on/actorList")
	public String actorList(@RequestParam(defaultValue="1") int cunrrentPage, 
			@RequestParam(defaultValue = "10") int rowPerPage) {
		
		return "on/actorList";
	}

}
