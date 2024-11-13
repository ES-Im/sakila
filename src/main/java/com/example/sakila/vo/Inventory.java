package com.example.sakila.vo;

import lombok.Data;

@Data
public class Inventory {
	private Integer inventoryId;
	private Integer filmId;
	private Integer storeId;
	private String lastUpdate;
}
