package com.example.sakila.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.example.sakila.mapper.InventoryMapper;
import com.example.sakila.vo.Inventory;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
@Transactional
public class InventoryService {
	@Autowired InventoryMapper inventoryMapper;
	// /on/removeFilm transactional
	public Integer getInventoryByFilm(Integer filmId) {
		return inventoryMapper.selectCountInventoryByFilm(filmId);
	}
	
	// (리스팅)영화별 재고가 있는 인벤토리 리스팅
	public List<Map<String, Object>> get_Returned_InventoryListByStore(Map<String, Object> paramMap) {
		log.debug(" (리스팅)영화별 재고가 있는 인벤토리 리스팅 = " + paramMap.toString());
		return inventoryMapper.select_Returned_InventoryListByStore(paramMap);
	}
	// (마지막 페이지리턴) 영화별 재고가 있는 인벤토리 
	public Integer get_Returned_InventoryTotalRowByStore(Map<String, Object> paramMap) {
		log.debug(" (마지막 페이지리턴)영화별 재고가 있는 인벤토리 리스팅 = " + paramMap.toString());
		int totalRow = inventoryMapper.select_Returned_InventoryTotalRowByStore(paramMap);
		int rowPerPage = Integer.parseInt(paramMap.get("rowPerPage").toString());
		
		int lastPage = totalRow / rowPerPage;
		if(totalRow % rowPerPage == 0) {
			lastPage++;
		}
		
		return lastPage;
	}
	
	// (리스팅) 영화별 재고가 없는 인벤토리 리스팅
	public List<Map<String, Object>> get_UnReturned_InventoryListByStore(Map<String, Object> paramMap) {
		//log.debug("영화별 재고가 없는 인벤토리 리스팅 paramMap=" + paramMap.toString());
		//log.debug("서비스의 inventoryList=" +inventoryMapper.selectInventoryListByStore(paramMap).toString());
		return inventoryMapper.select_UnReturned_InventoryListByStore(paramMap);
	}
	

	// (마지막 페이지) 영화별 재고가 없는 인벤토리
	public Integer get_UnReturned_InventoryTotalRowByStore(Map<String, Object> paramMap) {
		//log.debug("(마지막 페이지) 영화별 재고가 없는 인벤토리" + paramMap.toString());
		
		int totalRow = inventoryMapper.select_UnReturned_InventoryTotalRowByStore(paramMap);
		
		int rowPerPage = Integer.parseInt(paramMap.get("rowPerPage").toString());
		
		int lastPage = totalRow / rowPerPage;
		if(totalRow % rowPerPage == 0) {
			lastPage++;
		}
		
		return lastPage;
	}
	
	// ./on/inventoryList
	public List<Map<String, Object>> getInventoryList(Map<String, Object> paramMap) {
		
		return inventoryMapper.selectInventoryList(paramMap);
	}
	
	// ./on/inventoryList
	public Integer getInventoryLastPage(Map<String, Object> paramMap) {
		int totalRow = inventoryMapper.selectInventoryLastPage(paramMap);
		int rowPerPage = Integer.parseInt(paramMap.get("rowPerPage").toString());
		int lastPage = totalRow / rowPerPage;
		if(totalRow % rowPerPage != 0) {
			lastPage++;
		}
		
		return lastPage;
	}
	
	// /on/addInventory
	public Integer addInventory(Inventory inventory) {
		return inventoryMapper.insertInventory(inventory);
	}
	
	// /on/deleteInventory
	public Integer removeInventory(Integer inventoryId) {
		return inventoryMapper.deleteInvetoryByKey(inventoryId);
	}
	
	
	
}
