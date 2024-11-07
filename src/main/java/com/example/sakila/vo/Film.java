package com.example.sakila.vo;

import lombok.Data;

@Data
public class Film {
	private int filmId;				//PK
	private String title;
	private String description;
	private String releaseYear;
	private int languageId;		//FK(language)
	private int originalLanguageId;	//FK(language)
	private int rentalDuration;
	private double rentalRate;
	private int length;
	private double replacementCost;
	private String rating;
	private String specialFeatures;
	private String lastUpdate;

}
