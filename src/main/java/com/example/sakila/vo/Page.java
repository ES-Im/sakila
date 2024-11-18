package com.example.sakila.vo;

import lombok.Data;

@Data
public class Page {
    private Integer currentPage = 1;
    private Integer rowPerPage = 10;
    private Integer numPerPage = 10;
    private Integer lastPage;

    
    public int getBeginRow() {
        return (this.currentPage - 1) * this.rowPerPage;
    }

    public int getStartPagingNum() {
        return (currentPage - 1) / 10 * 10 + 1;
    }

    public int getEndPagingNum() {
        return Math.min((this.getStartPagingNum() + (this.numPerPage - 1)), this.lastPage);
    }
}


