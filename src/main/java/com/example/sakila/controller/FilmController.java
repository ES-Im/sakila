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
import com.example.sakila.util.TeamColor;
import com.example.sakila.vo.Actor;
import com.example.sakila.vo.Category;
import com.example.sakila.vo.Film;
import com.example.sakila.vo.FilmActor;
import com.example.sakila.vo.FilmCategory;
import com.example.sakila.vo.FilmForm;
import com.example.sakila.vo.Language;
import com.example.sakila.vo.Page;

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
		
		// 3. 카테고리==================================================================================
		// 3-1. 전체 카테고리
		List<Category> allCategoryList = categoryService.getCategoryList();
		// 3-2. 현재 영화의 카테고리 
		List<Map<String, Object>> filmCategoryList = categoryService.getFilmCategoryList(filmId);
		
		//3-3. 현재 영화의 카테고리에서 현재 영화의 카테고리가 있으면 해당 categoryId를 없앤다
		for(int i = 0; i<allCategoryList.size(); i++) {
			for(Map<String, Object> f : filmCategoryList) {
				if(allCategoryList.get(i).getCategoryId().equals(f.get("categoryId"))){
					allCategoryList.remove(i);
				}
			}
		}
		// 3-3 디버그
		//log.debug("현재 film에서 선택할 수 있는 카테고리 = " + allCategoryList.toString());
		
		// 4. 출연진 추가 ( + 검색된 배우 출력 (searchName!= null)
		List<Actor> searchedActorList = new ArrayList<>();
		
		if(searchName != null) {
			log.debug("searchName = " + searchName);
			searchedActorList = actorService.getActorList(searchName);
			model.addAttribute("searchedActorList", searchedActorList);
			log.debug("searchedActorList = " + searchedActorList.size());
		}
		
		// 4-1. 현재 영화에 해당 배우가 출연자로 입력되어있다면 전체 배우 리스트에서 제외시킨다.
		for(int i = 0; i < searchedActorList.size(); i++) {
			for(Actor a : actorList) {
				if(searchedActorList.get(i).getActorId().equals(a.getActorId())){
					searchedActorList.remove(i);
				}
			}
		}

		// log.debug("현재 film에서 검색되는 배우가 있는지 확인 = " + checkSearchActor(searchedActorList, actorList));
		
		
		model.addAttribute("filmCategoryList", filmCategoryList);
		model.addAttribute("searchName", searchName);
		model.addAttribute("film", film);
		model.addAttribute("actorList", actorList);
		model.addAttribute("allCategoryList",allCategoryList);
		//log.debug((String)filmList.get("filmId"));
		return "on/filmOne";
	}
	
	// filmOne의 4-1 디버그 메서드
	private boolean checkSearchActor(List<Actor> allList, List<Actor> inList) {
		for(int i = 0; i < allList.size(); i++) {
			for(Actor a : inList) {
				if(allList.get(i).getActorId().equals(a.getActorId())){
					return true;
				}
			}
		}
		return false;
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
	public String getFilmList(Model model
							, Page page
							, @RequestParam(required = false) String categoryId
							, @RequestParam(required = false) String searchWord
							, @RequestParam(required = false) String rating) {
		
		//log.debug("category 값 = " +  categoryId);
		
		// 페이지 변수 설정
		page.setLastPage(filmService.getFilmListLastPage(page, categoryId, searchWord, rating));
//		log.debug(TeamColor.CyanBack + "page 출력" + page.toString() + TeamColor.reset);
//		log.debug(TeamColor.CyanBack + "page 스타트 넘버 출력" + page.getStartPagingNum() + TeamColor.reset);
		// 필름 리스팅
		List<Map<String, Object>> filmList = filmService.getFilmList(page, categoryId, searchWord, rating);
		
		// 카테고리 종류 출력
		List<Category> categoryList = categoryService.getCategoryList();
		
		// 등급 종류 출력
		List<String> ratingList = new ArrayList<>(); 
		ratingList.add("G");
		ratingList.add("PG");
		ratingList.add("PG-13");
		ratingList.add("R");
		ratingList.add("NC-17");
		 
		//log.debug(TeamColor.CyanBack + "filmList 0번 출력" + filmList.get(0).toString() + TeamColor.reset);
		log.debug(TeamColor.CyanBack + "page 출력" + page.toString() + TeamColor.reset);
		
		
		//log.debug("categoryList = " + categoryList);
		model.addAttribute("filmList", filmList);
		model.addAttribute("categoryList", categoryList);
		model.addAttribute("ratingList", ratingList);
		
		model.addAttribute("page", page);
		
		model.addAttribute("searchWord", searchWord);
		model.addAttribute("categoryId", categoryId);
		model.addAttribute("rating", rating);
		
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
