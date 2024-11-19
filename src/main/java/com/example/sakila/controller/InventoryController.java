package com.example.sakila.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;

import com.example.sakila.service.FilmService;
import com.example.sakila.service.InventoryService;
import com.example.sakila.vo.Film;
import com.example.sakila.vo.Inventory;

import lombok.extern.slf4j.Slf4j;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;


@Slf4j
@Controller
public class InventoryController {
	@Autowired InventoryService inventoryService;
	@Autowired FilmService filmService;
	
	
	@GetMapping("/on/movieInventoryList")
	public String getInvetoryListByStore(Model model
										, @RequestParam Integer storeId
										, @RequestParam(defaultValue= "1") Integer inStockCurrentPage
										, @RequestParam(defaultValue= "1") Integer notStockCurrentPage
										, @RequestParam(defaultValue= "10") Integer rowPerPage
										, @RequestParam(required = false) String searchWord) {
		//log.debug("currentPage = " + currentPage + ", rowperPage = " + rowPerPage);
		//log.debug(searchWord);
		

		// 0) Map 타입 생성 - 재고 有		
		Map<String, Object> paramMapForInStock = new HashMap<>();
		paramMapForInStock.put("storeId", storeId);
		paramMapForInStock.put("rowPerPage", rowPerPage);
		paramMapForInStock.put("searchWord", searchWord);
		int beginRow1 = (inStockCurrentPage - 1) * rowPerPage;
		paramMapForInStock.put("beginRow", beginRow1);
		
		// 0) Map 타입 생성 - 재고 無
		Map<String, Object> paramMapForNotInStock = new HashMap<>();
		paramMapForNotInStock.put("storeId", storeId);
		paramMapForNotInStock.put("rowPerPage", rowPerPage);
		paramMapForNotInStock.put("searchWord", searchWord);
		int beginRow2 = (notStockCurrentPage - 1) * rowPerPage;
		paramMapForNotInStock.put("beginRow", beginRow2);
		log.debug("paramMapForInStock = " + paramMapForInStock.toString());
		log.debug("paramMapForNotInStock = " + paramMapForNotInStock.toString());
		
		// 1) 리턴된 페이징 출력 (재고가 있는 인벤토리)
		log.debug("storeId = " + storeId);
		List<Map<String, Object>> inStockInventoryList = inventoryService.get_Returned_InventoryListByStore(paramMapForInStock);
		//log.debug("컨트롤러의 inventoryList=" +inventoryList.toString());
		// 1-1) 1)의 마지막 페이지
		int inStockLastPage = inventoryService.get_Returned_InventoryTotalRowByStore(paramMapForInStock);
		
		
		// 2) 리턴되지 않은 인벤토리의 페이징 출력 (재고가 없는 인벤토리)
		List<Map<String, Object>> notInStockInventoryList = inventoryService.get_UnReturned_InventoryListByStore(paramMapForNotInStock);
		// 2-1) 2)의 마지막페이지 구하기
		int notInStockLastPage = inventoryService.get_UnReturned_InventoryTotalRowByStore(paramMapForNotInStock);
		
		model.addAttribute("searchWord", searchWord);
		model.addAttribute("storeId", storeId);
		model.addAttribute("inStockCurrentPage", inStockCurrentPage);
		model.addAttribute("notStockCurrentPage", notStockCurrentPage);
		// 인벤토리 재고가 있는걸 출력하는 리스트
		model.addAttribute("inStockInventoryList", inStockInventoryList);
		model.addAttribute("inStockLastPage", inStockLastPage);
		//인벤토리 재고가 없는걸 출력하는 리스트
		model.addAttribute("notInStockInventoryList", notInStockInventoryList);
		model.addAttribute("notInStockLastPage", notInStockLastPage);
		
		return "on/movieInventoryList";
	}
	
	@GetMapping("/on/inventoryList")
	public String getinventoryList(Model model
			, @RequestParam() String storeId
			, @RequestParam(required = false) String searchWord
			, @RequestParam(defaultValue = "1") int currentPage, @RequestParam(defaultValue = "10") int rowPerPage
			, @RequestParam(required = false) String rentaled) {
		// 0) paramMap
		Map<String, Object> paramMap = new HashMap<>();
		paramMap.put("storeId", storeId);
		paramMap.put("searchWord", searchWord);
		paramMap.put("beginRow", (currentPage-1)*rowPerPage);
		paramMap.put("rowPerPage", rowPerPage);
		paramMap.put("rentaled", rentaled);
		
		// 1) inventoryList 호출
		List<Map<String, Object>> inventoryList = inventoryService.getInventoryList(paramMap);
		
		// 2) lastPage 호출
		Integer lastPage = inventoryService.getInventoryLastPage(paramMap);
		
		model.addAttribute("searchWord", searchWord);
		model.addAttribute("storeId", storeId);
		model.addAttribute("inventoryList", inventoryList);
		model.addAttribute("lastPage", lastPage);
		model.addAttribute("currentPage", currentPage);
		model.addAttribute("rowPerPage", rowPerPage);
		
		return "on/inventoryList";
	}
	
	@GetMapping("/on/addInventory")
	public String addInventory(Model model, @RequestParam(required = false) String searchFilm,  @RequestParam() String storeId) {
		if(searchFilm != null) {
			List<Film> filmList =  filmService.getFilmListByTitle(searchFilm);
			model.addAttribute("filmList", filmList);
		}
		model.addAttribute("storeId", storeId);
		return "on/addInventory";
	}
	
	@PostMapping("/on/addInventory")
	public String addInventory(Model model, Inventory inventory) {
		int checkSuccess = inventoryService.addInventory(inventory);
		
		model.addAttribute("storeId", inventory.getStoreId());
		
		if(checkSuccess != 1) {
			return "on/addInventory?storeId=" + inventory.getStoreId();
		}
		return "redirect:/on/inventoryList?storeId=" + inventory.getStoreId();
	}
	
	@GetMapping("/on/deleteInventory")
	public String removeInventory(Inventory inventory) {
		inventoryService.removeInventory(inventory.getInventoryId());
		return "redirect:/on/inventoryList?storeId=" + inventory.getStoreId();
	}
	
}
