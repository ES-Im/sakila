package com.example.sakila.vo;

import lombok.Data;

@Data
public class Page {
    private Integer currentPage = 1;
    private Integer rowPerPage = 10;
    private Integer numPerPage = 10;
    private Integer lastPage;
    

    public Integer getBeginRow() {
        return this.currentPage == null? 1 : (this.currentPage - 1) * this.rowPerPage;
    }

    public Integer getStartPagingNum() {
        return this.currentPage == null? 1 : (this.currentPage - 1) / 10 * 10 + 1;
    }

    public Integer getEndPagingNum() {
        return Math.min((this.getStartPagingNum() + (this.numPerPage - 1)), this.lastPage);
    }

}


