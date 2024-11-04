package com.example.sakila.vo;

import lombok.Data;

@Data
public class FilmCategory {
	private int categoryId;		// PK - category FK
	private int filmUId;		// PK - film FK
	private String lastUpdate;
}
