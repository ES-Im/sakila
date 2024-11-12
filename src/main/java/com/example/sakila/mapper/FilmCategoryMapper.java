package com.example.sakila.mapper;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface FilmCategoryMapper {
	
	Integer deleteFilmCategoryByFilm(Integer filmId);

}
