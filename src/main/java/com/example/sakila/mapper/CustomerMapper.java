package com.example.sakila.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;
@Mapper
public interface CustomerMapper {

	List<Map<String, Object>> selectCustomerList(Map<String, Object> paramMap);
	
	Integer selectCustomerTotalRow(String searchWord);
}
