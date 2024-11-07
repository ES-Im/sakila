package com.example.sakila.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.example.sakila.mapper.FilmMapper;
import com.example.sakila.vo.Film;
import com.example.sakila.vo.FilmForm;

@Service
@Transactional
public class FilmService {
	@Autowired FilmMapper filmMapper;
	
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
					springBuilder.append(targetSpecialFeatures.get(i)+", ");
				}
			}
		}
			film.setSpecialFeatures(springBuilder.toString());
		
		return filmMapper.insertFilm(film);
	}

}
