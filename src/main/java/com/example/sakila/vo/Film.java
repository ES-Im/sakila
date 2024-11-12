package com.example.sakila.vo;

import lombok.Data;
@Data
public class Film {
	private Integer filmId;				//PK
	private String title;
	private String description;		// default : null
	private Integer releaseYear;		// default : null
	private Integer languageId;		    // FK(language) // default : null
	private Integer originalLanguageId;	// FK(language) // default : null
	private int rentalDuration;
	private double rentalRate;
	private Integer length;				// default : null
	private double replacementCost;
	private String rating;
	private String specialFeatures;	// default : null
	private String lastUpdate;
	


}




/*


[default : null]
description 
release_year 
original_language_id
length
special_features

*/