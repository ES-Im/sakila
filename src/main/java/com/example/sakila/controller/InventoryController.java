package com.example.sakila.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;

import com.example.sakila.service.InventoryService;

import lombok.extern.slf4j.Slf4j;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;


@Slf4j
@Controller
public class InventoryController {
	@Autowired InventoryService inventoryService;
	
	@GetMapping("/on/inventoryList")
	public String getInvetoryListByStore(Model model
										, @RequestParam Integer storeId
										, @RequestParam(defaultValue= "1") Integer inStockCurrentPage
										, @RequestParam(defaultValue= "1") Integer notStockCurrentPage
										, @RequestParam(defaultValue= "10") Integer rowPerPage) {
		//log.debug("currentPage = " + currentPage + ", rowperPage = " + rowPerPage);
		// 1) 리턴된 페이징 출력 (재고가 있는 인벤토리)
		log.debug("storeId = " + storeId);
		List<Map<String, Object>> inStockInventoryList = inventoryService.get_Returned_InventoryListByStore(storeId, inStockCurrentPage, rowPerPage);
		//log.debug("컨트롤러의 inventoryList=" +inventoryList.toString());
		// 1-1) 1)의 마지막 페이지
		int inStockLastPage = inventoryService.get_Returned_InventoryTotalRowByStore(storeId, rowPerPage);
		
		
		// 2) 리턴되지 않은 인벤토리의 페이징 출력 (재고가 없는 인벤토리)
		List<Map<String, Object>> notInStockInventoryList = inventoryService.get_UnReturned_InventoryListByStore(storeId, notStockCurrentPage, rowPerPage);
		// 2-1) 2)의 마지막페이지 구하기
		int notInStockLastPage = inventoryService.get_UnReturned_InventoryTotalRowByStore(storeId, rowPerPage);
		
		
		model.addAttribute("storeId", storeId);
		model.addAttribute("inStockCurrentPage", inStockCurrentPage);
		model.addAttribute("notStockCurrentPage", notStockCurrentPage);
		// 인벤토리 재고가 있는걸 출력하는 리스트
		model.addAttribute("inStockInventoryList", inStockInventoryList);
		model.addAttribute("inStockLastPage", inStockLastPage);
		//인벤토리 재고가 없는걸 출력하는 리스트
		model.addAttribute("notInStockInventoryList", notInStockInventoryList);
		model.addAttribute("notInStockLastPage", notInStockLastPage);
		
		return "on/inventoryList";
	}
	

}
