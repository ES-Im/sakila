package com.example.sakila.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.example.sakila.vo.Inventory;

@Mapper
public interface InventoryMapper {
	// /on/removeFilm transactional
	Integer selectCountInventoryByFilm(Integer filmId);
	
	// /on/movieinventoryList inventory List 출력 - _UnReturned_ = 재고가 없는 영화별 인벤토리
	List<Map<String, Object>> select_UnReturned_InventoryListByStore(Map<String, Object> paramMap);
	
	//  /on/movieinventoryList inventory List 출력 - _Returned_ = 재고가 있는 영화별 인벤토리 
	List<Map<String, Object>> select_Returned_InventoryListByStore(Map<String, Object> paramMap);
	
	// /on/movieinventoryList -> _UnReturned_ - 재고가 없을때 (Rentaled) 열의 갯수 구하기
	Integer select_UnReturned_InventoryTotalRowByStore(Map<String, Object> paramMap);
	
	// /on/movieinventoryList -> _Returned_ - 재고가 있을때 (unRentaled) 열의 갯수 구하기
	Integer select_Returned_InventoryTotalRowByStore(Map<String, Object> paramMap);
	
	
	
	// /on/inventoryList  (인벤토리 영화 검색 +)
	List<Map<String, Object>> selectInventoryList(Map<String, Object> paramMap); 
	
	// /on/inventoryList - 라스트 페이지 
	Integer selectInventoryLastPage(Map<String, Object> paramMap);
	
	// /on/addInventory
	Integer insertInventory(Inventory inventory);
	
	// /on/removeInvetoryByKey
	Integer deleteInvetoryByKey(Integer invetoryId);
	
	
}

