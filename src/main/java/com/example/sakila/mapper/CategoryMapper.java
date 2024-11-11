package com.example.sakila.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.example.sakila.vo.Category;

@Mapper
public interface CategoryMapper {
	// /on/filmList : 카테고리 
	List<Category> getCategoryList();
}
