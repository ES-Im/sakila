package com.example.sakila.mapper;

import org.apache.ibatis.annotations.Mapper;

import com.example.sakila.vo.FilmActor;


@Mapper
public interface FilmActorMapper {
	// /on/removeFilm - 필름 삭제시 film_actor 삭제
	Integer deleteFilmActorByFilm(Integer filmId);
	
	// /on/filmOne
	int insertFilmActor(FilmActor fa);
	// /on/removeFileActor
	int delectFileActor(FilmActor fa);
}
