package com.example.sakila.vo;

import lombok.Data;

@Data
public class Store {
	private Integer storeId;	
	private Integer addressId;
	private Integer managerStaffId;
	private String lastUpdate;
}
