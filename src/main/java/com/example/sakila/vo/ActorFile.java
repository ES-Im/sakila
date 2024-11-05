package com.example.sakila.vo;

import lombok.Data;

@Data
public class ActorFile {
	private int actorId;
	private int actorFileId;
	private String originName;
	private String fileName;
	private String ext;
	private String contentType;
	private long size;
	private String createDate;
}
