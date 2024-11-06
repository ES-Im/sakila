package com.example.sakila.controller;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.example.sakila.service.ActorService;
import com.example.sakila.service.FilmService;
import com.example.sakila.vo.Actor;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class FilmController {
	@Autowired FilmService filmService;
	@Autowired ActorService actorService;
	
	// filmOne Info
	@GetMapping("/on/filmOne")
	public String filmOne(Model model, @RequestParam() int filmId) {
		Map<String,Object> filmList = filmService.getFilmOne(filmId);
		 List<Actor> actorList = actorService.getActorListByFilm(filmId);
		model.addAttribute("filmList", filmList);
		model.addAttribute("actorList", actorList);
		//log.debug((String)filmList.get("filmId"));
		return "on/filmOne";
	}
	
	// ActorList By filmList
}
