package com.example.sakila.vo;

import lombok.Data;

// fileList 리스팅시 변수주는 모든 필드 (검색 키워드 + 페이징)
@Data
public class FilmListForm {
	private Integer categoryId;
	private String rating;
	private String searchWord;
	
	private Integer currentPage = 1;
	private Integer rowPerPage = 10;
	private Integer beginRow = (currentPage - 1) * rowPerPage;
}
