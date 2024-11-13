package com.example.sakila.vo;

import lombok.Data;

@Data
public class FilmActor {
	private Integer actorId;		//PK, actor FK
	private Integer filmId;		//PK, film FK
	private String lastUpdate;

}
