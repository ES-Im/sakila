package com.example.sakila.vo;

import java.util.List;

import lombok.Data;

@Data
public class FilmForm {
	private String title;
	private String description;
	private String releaseYear;
	private int languageId;		
	private int originalLanguageId;	
	private int rentalDuration;
	private double rentalRate;
	private int length;
	private double replacementCost;
	private List<String> specialFeatures;	// getValues by CheckBox
	

}