package com.example.sakila.vo;

import lombok.Data;

@Data
public class Customer {
	private int customerId;		//PK
	private int storeId;		//FK(Store)	
	private String firstName;
	private String lastName;
	private String email;
	private int addressId;		//FK(Address)
	private int active;
	private String createDate;
	private String lastUpdate;

}
