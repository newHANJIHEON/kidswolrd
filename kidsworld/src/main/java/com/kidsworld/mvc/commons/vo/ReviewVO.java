package com.kidsworld.mvc.commons.vo;

import java.util.Date;

public class ReviewVO {

    private int rNum;
    private String rTitle;
    private String rWriter;
    private int rPoint;
    private String rContent;
    private Date rDate;
    private String rDelete;
    private int rUserNum;

    public int getrNum() {
        return rNum;
    }

    public void setrNum(int rNum) {
        this.rNum = rNum;
    }

    public String getrTitle() {
        return rTitle;
    }

    public void setrTitle(String rTitle) {
        this.rTitle = rTitle;
    }

    public String getrWriter() {
        return rWriter;
    }

    public void setrWriter(String rWriter) {
        this.rWriter = rWriter;
    }

    public int getrPoint() {
        return rPoint;
    }

    public void setrPoint(int rPoint) {
        this.rPoint = rPoint;
    }

    public String getrContent() {
        return rContent;
    }

    public void setrContent(String rContent) {
        this.rContent = rContent;
    }

    public Date getrDate() {
        return rDate;
    }

    public void setrDate(Date rDate) {
        this.rDate = rDate;
    }

    public String getrDelete() {
        return rDelete;
    }

    public void setrDelete(String rDelete) {
        this.rDelete = rDelete;
    }

    public int getrUserNum() {
        return rUserNum;
    }

    public void setrUserNum(int rUserNum) {
        this.rUserNum = rUserNum;
    }

    @Override
    public String toString() {
        return "ReviewVO{" +
                "rNum=" + rNum +
                ", rTitle='" + rTitle + '\'' +
                ", rWriter='" + rWriter + '\'' +
                ", rPoint=" + rPoint +
                ", rContent='" + rContent + '\'' +
                ", rDate=" + rDate +
                ", rDelete='" + rDelete + '\'' +
                ", rUserNum='" + rUserNum + '\'' +
                '}';
    }

}
