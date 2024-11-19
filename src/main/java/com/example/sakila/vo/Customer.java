package com.example.sakila.vo;

import lombok.Data;

@Data
public class Customer {
	private Integer customerId;		//PK
	private Integer storeId;		//FK(Store)	
	private String firstName;
	private String lastName;
	private String email;
	private Integer addressId;		//FK(Address)
	private Integer active;
	private String createDate;
	private String lastUpdate;

}
