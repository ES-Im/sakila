package com.example.sakila.controller;

import java.time.LocalDate;
import java.time.LocalDateTime;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.example.sakila.service.CustomerService;
import com.example.sakila.service.RentalService;
import com.example.sakila.util.TeamColor;
import com.example.sakila.vo.Rental;

import jakarta.servlet.http.HttpSession;
import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
public class RentalController {
	@Autowired RentalService rentalService;
	@Autowired CustomerService customerService;
	
	@GetMapping("/on/addRental")
	public String addRental(HttpSession session, Model model, @RequestParam(required= false) String searchWord) {
		
		// 고객리스트
		List<Map<String, Object>> customerList = null;
		if(searchWord != null && !searchWord.equals("")) {
			customerList = customerService.getCustomerListForRental(searchWord);
		}
		// rentalDate 기본값인 현재 시각 
		LocalDateTime currentTime = LocalDateTime.now();
		LocalDate curDate = currentTime.toLocalDate(); 
		
		log.debug(TeamColor.CyanBack+curDate.toString()+TeamColor.reset);
		
		model.addAttribute("curDate", curDate);
		model.addAttribute("customerList", customerList);
		return "on/addRental";
	}
	
	@PostMapping("/on/addRental")
	public String addRental(Rental rental) {
		rentalService.addRental(rental);
		return "redirect:/on/customerOne?customerId=" + rental.getCustomerId();
	}
	
	
}
