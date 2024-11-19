package com.example.sakila.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.example.sakila.controller.RentalController;
import com.example.sakila.mapper.RentalMapper;
import com.example.sakila.vo.Rental;

import lombok.extern.slf4j.Slf4j;

@Service
@Transactional
@Slf4j
public class RentalService {
	@Autowired RentalMapper rentalMapper;

	public int addRental(Rental rental) {
		return rentalMapper.insertRental(rental);
	}
	
	public List<Map<String, Object>> getRentalListByCustomerId(Integer customerId) {
		return rentalMapper.selectRentalListByCustomerId(customerId);
	}
}
