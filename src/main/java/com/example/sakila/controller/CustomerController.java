package com.example.sakila.controller;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.example.sakila.service.CustomerService;
import com.example.sakila.vo.Page;

import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
public class CustomerController {
	@Autowired CustomerService customerService;
	
	@GetMapping("/on/customerList")
	public String customerList(Model model
								, Page page
								, @RequestParam(required = false) String searchWord) {
		
		page.setLastPage(customerService.getCustomerListLastPage(searchWord, page));
		page.getBeginRow();
		
		// currentPage, rowPerPage, lastPage, beginRow, startPagingNum
		log.debug("page 객체 toString =" + page.toString());
		log.debug("page 객체의 beginRow =" + page.getBeginRow());
		log.debug("page 객체의 start ~ end =" + page.getStartPagingNum() + ", " + page.getEndPagingNum());
		
		List<Map<String, Object>> resultMap = customerService.getCustomerList(page, searchWord);
		
		// 1) 페이징 변수와 customerList 포워딩
		model.addAttribute("page", page);
		model.addAttribute("customerList", resultMap);
		
		
		return "on/customerList";
	}
	
	

}
