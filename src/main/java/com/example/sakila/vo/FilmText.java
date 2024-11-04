package com.example.sakila.vo;

import lombok.Data;

@Data
public class FilmText {
	private int filmUId;		//PK
	private String title;
	private String description;
}
