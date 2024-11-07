package com.example.sakila.controller;

import java.io.File;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.example.sakila.service.ActorFileService;
import com.example.sakila.vo.ActorFile;
import com.example.sakila.vo.ActorForm;

import jakarta.servlet.http.HttpSession;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class ActorFileController {
	@Autowired ActorFileService actorFileService;
	
	@GetMapping("/on/addActorFile")
	public String addActorFile(Model model, @RequestParam int actorId) {
		model.addAttribute("actorId", actorId);
		return "on/addActorFile";
	}
	
	@PostMapping("/on/addActorFile")
	public String addActorFile(Model model, HttpSession session, ActorForm actorForm) {
		
		// 파일 마임타입 제한
		List<MultipartFile> list = actorForm.getActorFile();
		for(MultipartFile i : list) {
			log.debug(i.getContentType());
			if (i.getContentType().equals("image/jpeg") == false && i.getContentType().equals("image/png") == false ) {
				model.addAttribute("msg", "its impossible file's contentType isnt image type");
				model.addAttribute("actorId", actorForm.getActorId());
				return "on/addActorFile";
			}
		}
		
		String path = session.getServletContext().getRealPath("/upload/");
		actorFileService.addActorFile(actorForm, path);
		log.debug("actorForm = "+actorForm.toString());
		return "redirect:/on/actorOne?actorId=" + actorForm.getActorId();
	}

}
