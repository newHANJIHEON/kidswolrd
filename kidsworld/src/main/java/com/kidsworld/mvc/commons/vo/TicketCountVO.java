package com.kidsworld.mvc.commons.vo;

import java.util.Date;

public class TicketCountVO {

    private int tNum;           //티켓의 넘버
    private String forWho;      //티켓의 대상자(어른, 아이)
    private String forWhen;     //종일권, 오후권 구분
    private String uName;       //티켓의 구매자 이름
    private String uPhoneNum;   //티켓의 구매자 전화번호  DB에서 외래키로 지정
    private String uId;         //티켓의 구매자 아이디   DB에서 외래키로 지정
    private String market;      //티켓의 구매처(홈페이지)
    private String tArea;       //티켓의 사용가능 지역
    private char used;          //티켓의 사용여부
    private Date sellDate;      //티켓의 구매날짜
    private Date useDate;       //티켓의 사용날짜

    private int count;          //티켓의 매수

    @Override
    public String toString() {
        return "TicketCountVO{" +
                "tNum=" + tNum +
                ", forWho='" + forWho + '\'' +
                ", forWhen='" + forWhen + '\'' +
                ", uName='" + uName + '\'' +
                ", uPhoneNum='" + uPhoneNum + '\'' +
                ", uId='" + uId + '\'' +
                ", market='" + market + '\'' +
                ", tArea='" + tArea + '\'' +
                ", used=" + used +
                ", sellDate=" + sellDate +
                ", useDate=" + useDate +
                ", count=" + count +
                '}';
    }

    public int gettNum() {
        return tNum;
    }

    public void settNum(int tNum) {
        this.tNum = tNum;
    }

    public String getForWho() {
        return forWho;
    }

    public void setForWho(String forWho) {
        this.forWho = forWho;
    }

    public String getForWhen() {
        return forWhen;
    }

    public void setForWhen(String forWhen) {
        this.forWhen = forWhen;
    }

    public String getuName() {
        return uName;
    }

    public void setuName(String uName) {
        this.uName = uName;
    }

    public String getuPhoneNum() {
        return uPhoneNum;
    }

    public void setuPhoneNum(String uPhoneNum) {
        this.uPhoneNum = uPhoneNum;
    }

    public String getuId() {
        return uId;
    }

    public void setuId(String uId) {
        this.uId = uId;
    }

    public String getMarket() {
        return market;
    }

    public void setMarket(String market) {
        this.market = market;
    }

    public String gettArea() {
        return tArea;
    }

    public void settArea(String tArea) {
        this.tArea = tArea;
    }

    public char getUsed() {
        return used;
    }

    public void setUsed(char used) {
        this.used = used;
    }

    public Date getSellDate() {
        return sellDate;
    }

    public void setSellDate(Date sellDate) {
        this.sellDate = sellDate;
    }

    public Date getUseDate() {
        return useDate;
    }

    public void setUseDate(Date useDate) {
        this.useDate = useDate;
    }

    public int getCount() {
        return count;
    }

    public void setCount(int count) {
        this.count = count;
    }
//해당 vo 클래스는

}
