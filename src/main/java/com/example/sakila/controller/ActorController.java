package com.example.sakila.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.example.sakila.service.ActorService;
import com.example.sakila.service.FilmService;
import com.example.sakila.vo.Actor;
import com.example.sakila.vo.ActorFile;
import com.example.sakila.vo.ActorForm;
import com.example.sakila.vo.Film;
import com.example.sakila.service.ActorFileService;

import jakarta.servlet.http.HttpSession;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class ActorController {
	@Autowired ActorService actorService;
	@Autowired ActorFileService ActorFileService;
	@Autowired FilmService filmService;
	
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
	public String actorList(@RequestParam(defaultValue="1") int currentPage, 
							@RequestParam(defaultValue = "10") int rowPerPage,
							@RequestParam(required = false) String searchWord,
							Model model) {
		log.debug("searchWord : " + searchWord);
		List<Actor> actorList = actorService.getActorList(currentPage, rowPerPage, searchWord);
		
		int lastPage = actorService.getLastPage(rowPerPage, searchWord);
		
		model.addAttribute("currentPage", currentPage);
		model.addAttribute("lastPage", lastPage);
		model.addAttribute("actorList", actorList);
		
		return "on/actorList";
	}
	
	@GetMapping("/on/actorOne")
	public String actorone(Model model, @RequestParam int actorId) {
		Actor actor = actorService.getActorOne(actorId);
		List<ActorFile> actorFileList = ActorFileService.getActorFileListByActor(actorId);
		List<Film> filmList = filmService.getFilmTitleListByActor(actorId);
		
		model.addAttribute("actor", actor);
		model.addAttribute("actorFileList", actorFileList);
		model.addAttribute("filmList", filmList);
		
		log.debug(actor.toString());
		log.debug(actorFileList.toString());
		log.debug(filmList.toString());
		
		return "on/actorOne";
	}

}
