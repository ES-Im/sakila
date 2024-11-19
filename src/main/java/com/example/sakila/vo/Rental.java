package com.example.sakila.vo;

import lombok.Data;

@Data
public class Rental {
	private Integer rentalId;
	private String rentalDate;
	private Integer inventoryId;
	private Integer customerId;
	private String returnDate;
	private Integer staffId;
	private String lastUpdate;
}
