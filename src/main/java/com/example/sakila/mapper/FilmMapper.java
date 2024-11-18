package com.example.sakila.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.example.sakila.vo.Category;
import com.example.sakila.vo.Film;
import com.example.sakila.vo.FilmListForm;

@Mapper
public interface FilmMapper {
	
	// /on/filmList filmList
	List<Map<String, Object>> selectFilmList(FilmListForm filmListForm);
	
	// /on/actorOne
	List<Film> selectFilmTitleListByActor(int actorId);
	
	// /on/FilmOne
	Map<String, Object> selectFilmone(int filmId);
	
	// /on/addFilm
	int insertFilm(Film film);
	
	// /on/actorOne에서 film 검색시 사용 + addInventory에서 film 검색시 사용
	List<Film> selectFilmListByTitle(String searchTitle);
	
	// 라스트 페이지 구하기용 /on/filmList 매개값 = 검색필터 전부다 (kind, rating, title - searchWord)
	int selectTotalRow(FilmListForm filmListForm);
	
	// /on/removeFilm
	Integer deleteFilmByKey(Integer filmId);
	
	// /on/modifyFilm
	Integer updateFilm(Film film);
	
}
