package com.example.sakila.vo;

import lombok.Data;

@Data
public class Store {
	private int storeId;	
	private int addressId;
	private int managerStaffId;
	private String lastUpdate;
}
