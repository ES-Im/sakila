package com.example.sakila.vo;

import java.util.List;

import lombok.Data;

@Data
public class FilmForm {
	private String title;
	private String description;
	private Integer releaseYear;
	private Integer languageId;		
	private Integer originalLanguageId;	
	private Integer rentalDuration;
	private double rentalRate;
	private String rating;
	private Integer length;
	private double replacementCost;
	private List<String> specialFeatures;	// getValues by CheckBox
	

}