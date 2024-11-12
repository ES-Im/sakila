package com.example.sakila.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import com.example.sakila.service.FilmActorService;
import com.example.sakila.vo.FilmActor;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class FilmActorController {
	@Autowired FilmActorService filmActorService;
	
	@PostMapping("/on/addFilmByActor")
	public String addFilmByActor(FilmActor filmActor) {
		// log.debug("on/addFilmByActor ? " + "filmId= " + filmActor.getFilmId() + "actorId = " + filmActor.getActorId());
		filmActorService.addFilmByActor(filmActor);
		
		return "redirect:/on/actorOne?actorId="+filmActor.getActorId();
	}
	
	@PostMapping("/on/addActorByFilm")
	public String addActorByFilm(FilmActor filmActor) {
		filmActorService.addFilmByActor(filmActor);
		
		return "redirect:/on/filmOne?filmId="+filmActor.getFilmId();
	}
	
	
	@GetMapping("/on/removeFilmActor") // actorOne에서 출연작 삭제시 사용
	public String removeFileActor(FilmActor filmActor) {
		//log.debug("actorId = " + filmActor.getActorId() + " filmId = " + filmActor.getFilmId());
		filmActorService.removeFilmActor(filmActor);
		
		return "redirect:/on/actorOne?actorId=" + filmActor.getActorId();
	}
	
	@GetMapping("/on/removeActorByFilm") // FilmOne에서 출연작 삭제시 사용
	public String removeActorByFilm(FilmActor filmActor) {
		//log.debug("actorId = " + filmActor.getActorId() + " filmId = " + filmActor.getFilmId());
		filmActorService.removeFilmActor(filmActor);
		
		return "redirect:/on/filmOne?filmId=" + filmActor.getFilmId();
	}
}
