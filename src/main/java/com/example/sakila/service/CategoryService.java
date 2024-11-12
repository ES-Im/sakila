package com.example.sakila.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.example.sakila.mapper.CategoryMapper;
import com.example.sakila.vo.Category;
import com.example.sakila.vo.FilmCategory;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
@Transactional
public class CategoryService {
	@Autowired CategoryMapper categoryMapper; 
	
	public List<Category> getCategoryList() {
		return categoryMapper.getCategoryList();
	};
	
	// 특정 영화(/on/filmOne)에 카테고리 추가 (on/addCategoryOnFilm)
	public int addCategoryOnFilm(FilmCategory filmCategory) {
		return categoryMapper.insertCategoryOnFilm(filmCategory);
	}
	
	// /on/filmOne에 카테고리 리스트 출력 
	public List<Map<String, Object>> getFilmCategoryList(Integer filmId) {
		return categoryMapper.getFilmCategoryList(filmId);
	}
	
	public int removeCategoryOnFilm(FilmCategory filmCategory) {
		return categoryMapper.deleteCategoryOnFile(filmCategory);
	}

}
