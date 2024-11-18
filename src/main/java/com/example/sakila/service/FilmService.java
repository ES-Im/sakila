package com.example.sakila.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.example.sakila.mapper.FilmActorMapper;
import com.example.sakila.mapper.FilmCategoryMapper;
import com.example.sakila.mapper.FilmMapper;
import com.example.sakila.mapper.InventoryMapper;
import com.example.sakila.mapper.LanguageMapper;
import com.example.sakila.vo.Film;
import com.example.sakila.vo.FilmForm;
import com.example.sakila.vo.FilmListForm;

import lombok.extern.slf4j.Slf4j;
@Slf4j
@Service
@Transactional
public class FilmService {
	@Autowired FilmMapper filmMapper;
	@Autowired FilmActorMapper filmActorMapper;
	@Autowired FilmCategoryMapper filmCategoryMapper;
	
	// on/modifyFilm
	public int updateFilm(Film film) {
		return filmMapper.updateFilm(film);
	}
	
	// on/actorOne
	public List<Film> getFilmTitleListByActor(int actorId) {
		return filmMapper.selectFilmTitleListByActor(actorId);
	}
	
	// on/filmOne
	public Map<String, Object> getFilmOne(int filmId) {
		return filmMapper.selectFilmone(filmId);
	}
	
	// on/addFilm
	public int addFilm(FilmForm filmForm) {

		// 커맨드 객체 모양 -> 도메인객체 모양으로 바꾸기
		Film film = new Film();
		film.setTitle(filmForm.getTitle());
		
		film.setDescription(filmForm.getDescription().equals("")? null : filmForm.getDescription());
		film.setReleaseYear(filmForm.getReleaseYear());
		film.setLanguageId(filmForm.getLanguageId());
		film.setOriginalLanguageId(filmForm.getOriginalLanguageId());
		film.setRentalDuration(filmForm.getRentalDuration());
		film.setRentalRate(filmForm.getRentalRate());
		film.setLength(filmForm.getLength());
		film.setReplacementCost(filmForm.getReplacementCost());
		film.setRating(filmForm.getRating());
		
		StringBuilder springBuilder = new StringBuilder();
		List<String> targetSpecialFeatures = filmForm.getSpecialFeatures();
		
		if(targetSpecialFeatures == null) {
			film.setSpecialFeatures(null);
		} else {
			for(int i = 0; i < targetSpecialFeatures.size(); i++) {
				if(i == targetSpecialFeatures.size() - 1) {
					springBuilder.append(targetSpecialFeatures.get(i));
				} else {
					springBuilder.append(targetSpecialFeatures.get(i)+",");
				}
			}
		}
			film.setSpecialFeatures(springBuilder.toString());
		
		return filmMapper.insertFilm(film);
	}

	// on//actorOne for searchFilm + /on/addInventory
	public List<Film> getFilmListByTitle(String searchTitle) {
		
		return filmMapper.selectFilmListByTitle(searchTitle);
	}
	
	// on/filmList
	public List<Map<String, Object>> getFilmList(FilmListForm filmListForm) {
		return filmMapper.selectFilmList(filmListForm);
	}
	
	// on/filmList 라스트 페이지 구하기용
	public int getFilmListLastPage(FilmListForm filmListForm) {
		int getTotalRow = filmMapper.selectTotalRow(filmListForm);
		int lastPage = getTotalRow / filmListForm.getRowPerPage();
		if(getTotalRow % filmListForm.getRowPerPage() != 0) {
			lastPage++;
		}
		
		return lastPage;
	}
	
	// /on/deleteFilm -> (1)film_category에서 film_no 삭제 + film_actor에서 film_no 삭제 (2) film삭제 
	public Integer removeFilmByKey(Integer filmId) {
		//1) 필름배우 삭제(filmActor) 
		filmActorMapper.deleteFilmActorByFilm(filmId);
		//2) 필름 장르 삭제 (film_category)
		filmCategoryMapper.deleteFilmCategoryByFilm(filmId);
		//3) 필름 삭제
		return filmMapper.deleteFilmByKey(filmId);
	}
	
	// /on/modifyFilm
	
	// 
	
}
