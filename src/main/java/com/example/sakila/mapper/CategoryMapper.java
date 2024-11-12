package com.example.sakila.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.example.sakila.vo.Category;
import com.example.sakila.vo.FilmCategory;

@Mapper
public interface CategoryMapper {
	// /on/filmList : 카테고리 
	List<Category> getCategoryList();

	// 특정 영화(/on/filmOne)에 카테고리 추가 (/on/addCategoryOnFilm)
	int insertCategoryOnFilm(FilmCategory filmCategory);
	
	
	// /on/filmOne 특정 film에 해당하는 카테고리 리스트
	List<Map<String, Object>> getFilmCategoryList(Integer filmId);
	
	// /on/removeCategoryOnFilm
	int deleteCategoryOnFile(FilmCategory filmCategory);
	
	
}

