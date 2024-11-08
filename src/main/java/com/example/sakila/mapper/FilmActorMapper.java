package com.example.sakila.mapper;

import org.apache.ibatis.annotations.Mapper;

import com.example.sakila.vo.FilmActor;


@Mapper
public interface FilmActorMapper {
	// /on/filmOne
	int insertFilmActor(FilmActor fa);
	// /on/removeFileActor
	int delectFileActor(FilmActor fa);
}
