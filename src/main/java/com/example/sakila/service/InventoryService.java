package com.example.sakila.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.example.sakila.mapper.InventoryMapper;

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
	public List<Map<String, Object>> get_Returned_InventoryListByStore(Integer storeId, Integer currentPage, Integer rowPerPage) {
		Map<String, Object> paramMap = new HashMap<>();
		
		int beginRow = (currentPage - 1) * rowPerPage; 
		
		paramMap.put("storeId", storeId);
		paramMap.put("beginRow", beginRow);
		paramMap.put("rowPerPage", rowPerPage);
		log.debug("paramMap=" + paramMap.toString());
		//log.debug("서비스의 inventoryList=" +inventoryMapper.selectInventoryListByStore(paramMap).toString());
		return inventoryMapper.select_Returned_InventoryListByStore(paramMap);
	}
	// (마지막 페이지리턴) 영화별 재고가 있는 인벤토리 
	public Integer get_Returned_InventoryTotalRowByStore(Integer storeId, Integer rowPerPage) {
		int totalRow = inventoryMapper.select_Returned_InventoryTotalRowByStore(storeId);
		int lastPage = totalRow / rowPerPage;
		if(totalRow % rowPerPage == 0) {
			lastPage++;
		}
		
		return lastPage;
	}
	
	// (리스팅) 영화별 재고가 없는 인벤토리 리스팅
	public List<Map<String, Object>> get_UnReturned_InventoryListByStore(Integer storeId, Integer currentPage, Integer rowPerPage) {
		Map<String, Object> paramMap = new HashMap<>();
		
		int beginRow = (currentPage - 1) * rowPerPage; 
		
		paramMap.put("storeId", storeId);
		paramMap.put("beginRow", beginRow);
		paramMap.put("rowPerPage", rowPerPage);
		log.debug("paramMap=" + paramMap.toString());
		//log.debug("서비스의 inventoryList=" +inventoryMapper.selectInventoryListByStore(paramMap).toString());
		return inventoryMapper.select_UnReturned_InventoryListByStore(paramMap);
	}
	

	// (마지막 페이지) 영화별 재고가 없는 인벤토리
	public Integer get_UnReturned_InventoryTotalRowByStore(Integer storeId, Integer rowPerPage) {
		int totalRow = inventoryMapper.select_UnReturned_InventoryTotalRowByStore(storeId);
		int lastPage = totalRow / rowPerPage;
		if(totalRow % rowPerPage == 0) {
			lastPage++;
		}
		
		return lastPage;
	}
	
	
}
