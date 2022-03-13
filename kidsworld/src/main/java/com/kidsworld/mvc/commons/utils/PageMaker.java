package com.kidsworld.mvc.commons.utils;

import lombok.Getter;
import lombok.ToString;
import org.springframework.web.util.UriComponents;
import org.springframework.web.util.UriComponentsBuilder;

@Getter
@ToString
public class PageMaker {

    //계산을 위해 필요한 값
    private int totalCount;
    private int displayPageNum;
    private Criteria cri;

    //내부에서 계산
    private int startPage;
    private int endPage;
    private int maxPage;
    private boolean prev;
    private boolean next;

    public void calc() {
        //displayPageNum = 7
        //page = 1 ~ 7
        //[1][2][3][4][5][6][7]         7 - 6
        //page = 8 ~ 14
        //[8][9][10][11][12][13][14]    14 - 6
        endPage = (int)(Math.ceil(cri.getPage() / (double)displayPageNum) * displayPageNum);
        startPage = (endPage - displayPageNum) + 1;

        maxPage = (int)Math.ceil(totalCount / (double)cri.getPerPageNum());

        if (endPage > maxPage) endPage = maxPage;

        prev = endPage > displayPageNum ? true : false;

        next = (endPage == maxPage) ? false : true;
    }

    //아래의 setter들은 각각 정보가 세팅될 때마다 페이징에 필요한 정보를 계산하도록
    //calc가 메소드를 사용하고 있다.
    public void setTotalCount(int totalCount) {
        this.totalCount = totalCount;
        calc();
    }

    public void setDisplayPageNum(int displayPageNum) {
        this.displayPageNum = displayPageNum;
        calc();
    }

    public void setCri(Criteria cri) {
        this.cri = cri;
        calc();
    }

    //페이지 이동 시 검색정보를 보존하면서 페이지를 이동하기 위한 쿼리스트링
    public String search(int page) {
        UriComponents uri = UriComponentsBuilder.newInstance()
                .queryParam("page", page)
                .queryParam("perPageNum", cri.getPerPageNum())
                .queryParam("searchType", cri.getSearchType())
                .queryParam("uPhoneNum", cri.getUPhoneNum())
                .queryParam("uName", cri.getUName())
                .build();
        String queryString = uri.toString();
        System.out.println("queryString : " + queryString);
        return queryString;
    }

}
