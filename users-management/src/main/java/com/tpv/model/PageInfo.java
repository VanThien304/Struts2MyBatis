package com.tpv.model;

public class PageInfo {
    private int pageNumber;
    private int pageSize;
    private int totalRecord;

    public PageInfo(int pageNumber, int pageSize, int totalRecord) {
        this.pageNumber = pageNumber;
        this.pageSize = pageSize;
        this.totalRecord = totalRecord;
    }

    public int getPageNumber() {
        return pageNumber;
    }

    public void setPageNumber(int pageNumber) {
        this.pageNumber = pageNumber;
    }

    public int getPageSize() {
        return pageSize;
    }

    public void setPageSize(int pageSize) {
        this.pageSize = pageSize;
    }

    public int getTotalRecord() {
        return totalRecord;
    }

    public void setTotalRecord(int totalRecord) {
        this.totalRecord = totalRecord;
    }

    public int getTotalPage() {
        return (int) Math.ceil((double) totalRecord / pageSize);
    }

    public int getOffset() {
        return (pageNumber - 1) * pageSize;
    }

    public int getLimit() {
        return pageSize;
    }
}

