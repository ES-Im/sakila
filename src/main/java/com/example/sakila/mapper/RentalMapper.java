package com.example.sakila.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.example.sakila.vo.Rental;

@Mapper
public interface RentalMapper {
	Integer insertRental(Rental rental);
	
	List<Map<String, Object>> selectRentalListByCustomerId(Integer customerId);
}
