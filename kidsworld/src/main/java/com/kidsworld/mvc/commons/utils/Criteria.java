package com.kidsworld.mvc.commons.utils;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

//전체 필드 정보를 넘겨받는 생성자 추가
@AllArgsConstructor
@ToString
public class Criteria {

    @Getter
    private int page;           //요청 페이지 번호

    @Getter
    private int perPageNum;     //한 페이지 출력할 게시물 수

    @Getter
    @Setter
    private String searchType;

    @Getter
    @Setter
    private String uPhoneNum;

    @Getter
    @Setter
    private String uName;

    public Criteria() {
        this(1, 10);
        //그냥 생성되었을 때는 1페이지에 10개를 보여줌
    }

    public Criteria(int page, int perPageNum) {
        this.page = page;
        this.perPageNum = perPageNum;
    }

    public void setPage(int page) {
        if (page <= 0) {
            this.page = 1;
            return;
        }
        this.page = page;
    }

    public void setPerPageNum(int perPageNum) {
        if (perPageNum <= 0 || perPageNum > 10) {
            this.perPageNum = 10;
            return;
        }
        this.perPageNum = perPageNum;
    }

    //limit pageStart, perPageNum
    public int getPageStart() {
        return (this.page -1) * this.perPageNum;
    }

}
