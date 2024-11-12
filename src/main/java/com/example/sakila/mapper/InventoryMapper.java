package com.example.sakila.mapper;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface InventoryMapper {
	// /on/removeFilm transactional
	Integer selectCountInventoryByFilm(Integer filmId);
}
