package com.example.sakila.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.example.sakila.service.ActorService;
import com.example.sakila.service.CategoryService;
import com.example.sakila.service.FilmService;
import com.example.sakila.service.InventoryService;
import com.example.sakila.service.LanguageService;
import com.example.sakila.vo.Actor;
import com.example.sakila.vo.Category;
import com.example.sakila.vo.Film;
import com.example.sakila.vo.FilmActor;
import com.example.sakila.vo.FilmCategory;
import com.example.sakila.vo.FilmForm;
import com.example.sakila.vo.FilmListForm;
import com.example.sakila.vo.Language;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class FilmController {
	@Autowired FilmService filmService;
	@Autowired ActorService actorService;
	@Autowired LanguageService languageService;
	@Autowired CategoryService categoryService;
	@Autowired InventoryService inventoryService;
	
	// filmOne Info
	@GetMapping("/on/filmOne")
	public String filmOne(Model model, @RequestParam int filmId, @RequestParam(required = false) String searchName) {
		// 1. 현재 필름 정보
		Map<String,Object> film = filmService.getFilmOne(filmId);
		
		// 2. 현재 출연진 정보
		List<Actor> actorList = actorService.getActorListByFilm(filmId);
		
		// 3. 카테고리
		// 3-1. 전체 카테고리
		List<Category> allCategoryList = categoryService.getCategoryList();
		// 3-2. 현재 영화의 카테고리 
		List<Map<String, Object>> filmCategoryList = categoryService.getFilmCategoryList(filmId);
		
		// 4. 출연진 추가 ( + 검색된 배우 출력 (searchName!= null)
		if(searchName != null) {
			log.debug("searchName = " + searchName);
			List<Actor> searchedActorList = actorService.getActorList(searchName);
			model.addAttribute("searchedActorList", searchedActorList);
			log.debug("searchedActorList = " + searchedActorList.size());
		}
		
		model.addAttribute("filmCategoryList", filmCategoryList);
		model.addAttribute("searchName", searchName);
		model.addAttribute("film", film);
		model.addAttribute("actorList", actorList);
		model.addAttribute("allCategoryList",allCategoryList);
		//log.debug((String)filmList.get("filmId"));
		return "on/filmOne";
	}
	
	
	// on/addFilm
	@GetMapping("/on/addFilm")
	public String addFilm(Model model) {
		//languageList list
		List<Language> languageList = languageService.getLanguageList();
		model.addAttribute("languageList", languageList);
		//log.debug("languageList = " + languageList.toString());
		return "on/addFilm";
	}
	
	@PostMapping("/on/addFilm")
	public String addFilm(FilmForm filmForm) {
		//filmService 에서 filmForm을 film 객체로 변환
		log.debug("filmForm = " + filmForm.toString());
		filmService.addFilm(filmForm);
		return "redirect:/on/filmList";
	}
	
	@GetMapping("/on/filmList")
	public String getFilmList(Model model, FilmListForm filmListForm) {
		
		//log.debug("category 값 = " +  categoryId);
		//log.debug("filmList = " + filmList);
		
		//페이징
		filmListForm.setBeginRow((filmListForm.getCurrentPage()-1) * filmListForm.getRowPerPage());
		int lastPage = filmService.getFilmListLastPage(filmListForm);
		
		// 필름 리스팅
		List<Map<String, Object>> filmList = filmService.getFilmList(filmListForm);
		// 카테고리 종류 출력
		List<Category> categoryList = categoryService.getCategoryList();
		List<String> ratingList = new ArrayList<>(); 
		 ratingList.add("G");
		 ratingList.add("PG");
		 ratingList.add("PG-13");
		 ratingList.add("R");
		 ratingList.add("NC-17");
		 
		
		
		//log.debug("categoryList = " + categoryList);
		model.addAttribute("filmList", filmList);
		model.addAttribute("categoryList", categoryList);
		model.addAttribute("ratingList", ratingList);
		
		model.addAttribute("currentPage", filmListForm.getCurrentPage());
		model.addAttribute("rowPerPage", filmListForm.getRowPerPage());
		model.addAttribute("lastPage", lastPage);
		
		model.addAttribute("searchWord", filmListForm.getSearchWord());
		model.addAttribute("categoryId", filmListForm.getCategoryId());
		model.addAttribute("rating", filmListForm.getRating());
		
		return "on/filmList";
	}
	
	@GetMapping("/on/removeFilm")
	public String removeFilm(Model model, @RequestParam Integer filmId) {
		String removeFilmMsg = "";
		
		// 인벤토리에 필름이 있는지 확인 (있으면 삭제 중단, filmOne에 리다이렉트 및 메세지 전송)
		Integer count = inventoryService.getInventoryByFilm(filmId);
		if(count != 0) {
			log.debug("count=" + count);
			removeFilmMsg = "film in inventory remain";
			return("redirect:/on/filmOne?filmId="+filmId+"&removeFilmMsg="+removeFilmMsg);	
		}
		
		// 성공시 filmList로 이동 실패시, 메세지와 함께 삭제 실패 메세지 전송
		int row = filmService.removeFilmByKey(filmId);
		if(row == 0) {
			log.debug("row=" + row);
			removeFilmMsg = "removing film failed";
			return("redirect:/on/filmOne?filmId="+filmId+"&removeFilmMsg="+removeFilmMsg);		
		}
		
		return "redirect:/on/filmList";
	}
	
	@GetMapping("/on/modifyFilm")
	public String modifyFilm(Model model, Integer filmId) {
		// 기본 값 조회 쿼리 -> selectFilmOne (by Key) 단, language_id / originalLanguageId 는 name이 나오도록 special_Features는 체크박스로, 기본값 체크 
		Map<String, Object> filmInfo = filmService.getFilmOne(filmId);
		List<Language> languageList = languageService.getLanguageList();
		// log.debug("filmInfo.get(\"specialFeatures\"); =  " + filmInfo.get("specialFeatures"));
		
		// specialFeatures 리스트로 쪼개기 
		String specialFeaturesStr = (String) filmInfo.get("specialFeatures");
		
		String[] arr = specialFeaturesStr.split(",");
		List<String> specialFeaturesList = new ArrayList<>();
		if(specialFeaturesStr != null) {
			specialFeaturesList =  new ArrayList<>(List.of(arr));
			//log.debug("specialFeaturesList = "+specialFeaturesList.get(0));
		}
		
		
		model.addAttribute("specialFeaturesList", specialFeaturesList);
		model.addAttribute("languageList", languageList);
		model.addAttribute("filmInfo", filmInfo);
		
		return "on/modifyFilm";
	}
	
	// 수정 쿼리 -> updateFilm
	@PostMapping("/on/modifyFilm")
	public String modifyFilm(Film film) {
		filmService.updateFilm(film);
		
		return "redirect:/on/filmOne?filmId="+film.getFilmId();
	}
	
	@PostMapping("/on/addCategoryOnFilm")
	public String addCategoryOnFilm(FilmCategory filmCategory) {
		categoryService.addCategoryOnFilm(filmCategory);
		
		return "redirect:/on/filmOne?filmId="+filmCategory.getFilmId();
	}
	
	@GetMapping("on/removeCategoryOnFilm")
	public String removeCategoryOnFilm(FilmCategory filmCategory) {
		categoryService.removeCategoryOnFilm(filmCategory);
		return "redirect:/on/filmOne?filmId="+filmCategory.getFilmId();
	}
}
