package com.example.sakila.controller;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.example.sakila.service.ActorService;
import com.example.sakila.service.FilmService;
import com.example.sakila.vo.Actor;
import com.example.sakila.vo.ActorFile;
import com.example.sakila.vo.ActorForm;
import com.example.sakila.vo.Film;
import com.example.sakila.vo.Page;
import com.example.sakila.service.ActorFileService;

import jakarta.servlet.http.HttpSession;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class ActorController {
	@Autowired ActorService actorService;
	@Autowired ActorFileService ActorFileService;
	@Autowired FilmService filmService;
	
	@GetMapping("/on/addActor")
	public String addActor(Actor actor) {
		return "on/addActor";
	}
	
	@PostMapping("/on/addActor")	// ActorForm = Comment Entity
	public String addActor(Model model, HttpSession session, ActorForm actorForm) {
		//log.debug(actorForm.toString());
		
		// 파일 마임타입 제한

		List<MultipartFile> list = actorForm.getActorFile();
		if(list !=null && list.size() != 0) {
			for(MultipartFile i : list) {
				log.debug(i.getContentType());
				if (i.getContentType().equals("image/jpeg") == false && i.getContentType().equals("image/png") == false ) {
					model.addAttribute("msg", "its impossible file's contentType isnt image type");
					model.addAttribute("actorId", actorForm.getActorId());
					return "on/addActor";
				}
			}
		}
		
		String path = session.getServletContext().getRealPath("/upload/");
		log.debug(path);
		
		actorService.addActor(actorForm, path);
		return "redirect:/on/actorList";
	}
	
	@GetMapping("/on/actorList")
	public String actorList(Model model, Page page
							, @RequestParam(required = false) String searchWord) {
		log.debug("searchWord : " + searchWord);
		List<Actor> actorList = actorService.getActorList(page.getCurrentPage(), page.getRowPerPage(), searchWord);
		
		page.setLastPage(actorService.getLastPage(page.getRowPerPage(), searchWord));
		
		model.addAttribute("page", page);
		model.addAttribute("actorList", actorList);
		
		return "on/actorList";
	}
	
	@GetMapping("/on/actorOne")
	public String actorone(Model model, 
			@RequestParam() int actorId, @RequestParam(defaultValue = "") String searchTitle) {
		// 1. actor 정보 출력
		Actor actor = actorService.getActorOne(actorId);
		
		// 2. actor에 등록된 파일 출력
		List<ActorFile> actorFileList = ActorFileService.getActorFileListByActor(actorId);
		log.debug("actorId = " + actorId);
		
		// 3. 검색된 영화리스트 출력 
		List<Film> searchFilmList = new ArrayList<>();
		// searchWord가 공백이 아니면 film검색을 통한 포워딩 -> 검색시 FilmList 출력필요
		if(searchTitle.equals("") == false) {
			// Film 검색 결과 리스트 출력
			searchFilmList = filmService.getFilmListByTitle(searchTitle);
		}
		// 3-1. 출연작 리스트 출력 
		List<Film> filmList = filmService.getFilmTitleListByActor(actorId);
		
		// 3-2. 출연작을 검색된 영화리스트에서 삭제 ( 검색 되지 않도록 )
		for(int i = 0; i < searchFilmList.size(); i++) {
			for(Film f : filmList) {
				if(searchFilmList.get(i).getFilmId().equals(f.getFilmId())){
					searchFilmList.remove(i);
				}
			}
		}
		
		// 3-2 디버그 
		//log.debug("출연작이 검색되는지 확인 = " + checkSearchActor(searchFilmList, filmList));
		//log.debug(actor.toString());
		//log.debug(actorFileList.toString());
		//log.debug("filmList=" + filmList.toString());
		
		model.addAttribute("actor", actor);
		model.addAttribute("actorId",actorId);
		model.addAttribute("actorFileList", actorFileList);
		model.addAttribute("filmList", filmList);
		model.addAttribute("searchFilmList", searchFilmList);
		return "on/actorOne";
	}
	
	// actorone의 4-1 디버그 메서드
	private boolean checkSearchActor(List<Film> allList, List<Film> inList) {
		for(int i = 0; i < allList.size(); i++) {
			for(Film a : inList) {
				if(allList.get(i).getFilmId().equals(a.getFilmId())){
					return true;
				}
			}
		}
		return false;
	}
	
	@GetMapping("/on/modifyActor")
	public String modifyActor(Model model, @RequestParam int actorId) {
		Actor actor = actorService.getActorOne(actorId);
		model.addAttribute("actor", actor);
		return "on/modifyActor";
	}
	
	@PostMapping("/on/modifyActor")
	public String modifyActor(Actor actor) {
		log.debug("actor = " + actor.toString());
		actorService.modifyActor(actor);
		return "redirect:/on/actorOne?actorId=" + actor.getActorId();
	}
	
	@GetMapping("/on/removeActor")
	public String removeActor(HttpSession session, @RequestParam int actorId) {
		String path = session.getServletContext().getRealPath("/upload/");
		actorService.deleteActor(actorId, path);
		
		return "redirect:/on/actorList";
	}
	
	

}
