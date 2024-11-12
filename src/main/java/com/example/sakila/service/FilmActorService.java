package com.example.sakila.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.sakila.mapper.FilmActorMapper;
import com.example.sakila.vo.FilmActor;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
public class FilmActorService {
	@Autowired FilmActorMapper filmActorMapper;

	public int addFilmByActor(FilmActor fa) {
		return filmActorMapper.insertFilmActor(fa);
	}
	
	public int removeFilmActor(FilmActor fa) {
		return filmActorMapper.delectFilmActor(fa);
	}
	
	
	
}
