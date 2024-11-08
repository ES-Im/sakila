package com.example.sakila.controller;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.example.sakila.service.ActorService;
import com.example.sakila.service.FilmService;
import com.example.sakila.service.LanguageService;
import com.example.sakila.vo.Actor;
import com.example.sakila.vo.FilmForm;
import com.example.sakila.vo.Language;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class FilmController {
	@Autowired FilmService filmService;
	@Autowired ActorService actorService;
	@Autowired LanguageService languageService;
	
	// filmOne Info
	@GetMapping("/on/filmOne")
	public String filmOne(Model model, @RequestParam int filmId) {
		Map<String,Object> filmList = filmService.getFilmOne(filmId);
		 List<Actor> actorList = actorService.getActorListByFilm(filmId);
		model.addAttribute("filmList", filmList);
		model.addAttribute("actorList", actorList);
		//log.debug((String)filmList.get("filmId"));
		return "on/filmOne";
	}
	
	// on/addFilm
	@GetMapping("/on/addFilm")
	public String addFilm(Model model) {
		//languageList list
		List<Language> languageList = languageService.getLanguageList();
		model.addAttribute("languageList", languageList);
		//log.debug("languageList = " + languageList.toString());
		return "on/addFilm";
	}
	
	@PostMapping("/on/addFilm")
	public String addFilm(FilmForm filmForm) {
		//filmService 에서 filmForm을 film 객체로 변환
		log.debug("filmForm = " + filmForm.toString());
		filmService.addFilm(filmForm);
		return "redirect:/on/filmList";
	}
	
	
}
