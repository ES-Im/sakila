package com.example.sakila.vo;

import lombok.Data;

@Data
public class FilmActor {
	private int actorId;		//PK, actor FK
	private int filmId;		//PK, film FK
	private String lastUpdate;

}
