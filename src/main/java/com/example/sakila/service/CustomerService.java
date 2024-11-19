package com.example.sakila.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.example.sakila.mapper.CustomerMapper;
import com.example.sakila.vo.Customer;
import com.example.sakila.vo.Page;

import lombok.extern.slf4j.Slf4j;
@Service
@Transactional
@Slf4j
public class CustomerService {
	@Autowired CustomerMapper customerMapper;
	//
	public Integer getCustomerListLastPage(String searchWord, Page page) {
		int totalRow = customerMapper.selectCustomerTotalRow(searchWord);
		int lastPage = totalRow / page.getRowPerPage();
		if(totalRow % page.getRowPerPage() != 0) {
			lastPage++;
		}
		
		return lastPage;
	}
	
	// /on/customerList 에서 고객 리스팅용으로 사용
	public List<Map<String, Object>> getCustomerList(Page page, String searchWord) {
		Map<String, Object> paramMap = new HashMap<>();
		paramMap.put("searchWord", searchWord);
		paramMap.put("beginRow", page.getBeginRow());
		paramMap.put("rowPerPage", page.getRowPerPage());
		
		log.debug("paramMap" + paramMap.toString());
		return customerMapper.selectCustomerList(paramMap); 
	}
	
	// /on/addRental 에서 고객 검색용으로 사용
	public List<Map<String, Object>> getCustomerListForRental(String searchWord) {
		Map<String, Object> paramMap = new HashMap<>();
		paramMap.put("searchWord", searchWord);
		
		log.debug("paramMap" + paramMap.toString());
		return customerMapper.selectCustomerList(paramMap); 
	}
	
	// /on/CustomerOne 
	public Map<String, Object> getCustomerListForGetOne(Integer customerId) {
		Map<String, Object> paramMap = new HashMap<>();
		paramMap.put("customerId", customerId);
		Map<String, Object> customerOne = customerMapper.selectCustomerList(paramMap).get(0);
		
		log.debug("customerOne" + customerOne.toString());
		return customerOne; 
	}
}
