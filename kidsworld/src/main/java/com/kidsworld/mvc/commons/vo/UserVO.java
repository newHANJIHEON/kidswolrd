package com.kidsworld.mvc.commons.vo;

import java.util.Date;
import java.util.List;

public class UserVO {

    private int uNum;
    private String uId;
    private String uPassword;
    private String uName;
    private String uPhoneNum;
    private String uBirth;
    private String uPostCode;
    private String uAddr;
    private String uDetailAddr;
    private Date regdate;
    private Date updatedate;
    private Date visitdate;
    private String member;
    private List<AuthVO> uAuthList;

    public int getuNum() {
        return uNum;
    }

    public void setuNum(int uNum) {
        this.uNum = uNum;
    }

    public String getuId() {
        return uId;
    }

    public void setuId(String uId) {
        this.uId = uId;
    }

    public String getuPassword() {
        return uPassword;
    }

    public void setuPassword(String uPassword) {
        this.uPassword = uPassword;
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

    public String getuBirth() {
        return uBirth;
    }

    public void setuBirth(String uBirth) {
        this.uBirth = uBirth;
    }

    public String getuPostCode() {
        return uPostCode;
    }

    public void setuPostCode(String uPostCode) {
        this.uPostCode = uPostCode;
    }

    public String getuAddr() {
        return uAddr;
    }

    public void setuAddr(String uAddr) {
        this.uAddr = uAddr;
    }

    public String getuDetailAddr() {
        return uDetailAddr;
    }

    public void setuDetailAddr(String uDetailAddr) {
        this.uDetailAddr = uDetailAddr;
    }

    public Date getRegdate() {
        return regdate;
    }

    public void setRegdate(Date regdate) {
        this.regdate = regdate;
    }

    public Date getUpdatedate() {
        return updatedate;
    }

    public void setUpdatedate(Date updatedate) {
        this.updatedate = updatedate;
    }

    public Date getVisitdate() {
        return visitdate;
    }

    public void setVisitdate(Date visitdate) {
        this.visitdate = visitdate;
    }

    public String getMember() {
        return member;
    }

    public void setMember(String member) {
        this.member = member;
    }

    public List<AuthVO> getuAuthList() {
        return uAuthList;
    }

    public void setuAuthList(List<AuthVO> uAuthList) {
        this.uAuthList = uAuthList;
    }

    @Override
    public String toString() {
        return "UserVO{" +
                "uNum=" + uNum +
                ", uId='" + uId + '\'' +
                ", uPassword='" + uPassword + '\'' +
                ", uName='" + uName + '\'' +
                ", uPhoneNum='" + uPhoneNum + '\'' +
                ", uBirth='" + uBirth + '\'' +
                ", uPostCode='" + uPostCode + '\'' +
                ", uAddr='" + uAddr + '\'' +
                ", uDetailAddr='" + uDetailAddr + '\'' +
                ", regdate=" + regdate +
                ", updatedate=" + updatedate +
                ", visitdate=" + visitdate +
                ", member=" + member +
                ", uAuthList=" + uAuthList +
                '}';
    }
}
