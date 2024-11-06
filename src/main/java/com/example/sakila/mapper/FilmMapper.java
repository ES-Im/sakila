package com.example.sakila.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.example.sakila.vo.Film;

@Mapper
public interface FilmMapper {
	// /on/actorOne
	List<Film> selectFilmTitleListByActor(int actorId);
	
	// /on/FilmOne
	Map<String, Object> selectFilmone(int filmId);
}
