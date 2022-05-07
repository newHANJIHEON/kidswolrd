package com.kidsworld.mvc.commons.vo;

import java.util.Date;

public class QnaVO {

    private int qNum;
    private String qTitle;
    private String qWriter;
    private String qContent;
    private int origin;
    private int depth;
    private int seq;
    private Date qDate;
    private String qDelete;
    private int qUserNum;

    public int getqNum() {
        return qNum;
    }

    public void setqNum(int qNum) {
        this.qNum = qNum;
    }

    public String getqTitle() {
        return qTitle;
    }

    public void setqTitle(String qTitle) {
        this.qTitle = qTitle;
    }

    public String getqWriter() {
        return qWriter;
    }

    public void setqWriter(String qWriter) {
        this.qWriter = qWriter;
    }

    public String getqContent() {
        return qContent;
    }

    public void setqContent(String qContent) {
        this.qContent = qContent;
    }

    public int getOrigin() {
        return origin;
    }

    public void setOrigin(int origin) {
        this.origin = origin;
    }

    public int getDepth() {
        return depth;
    }

    public void setDepth(int depth) {
        this.depth = depth;
    }

    public int getSeq() {
        return seq;
    }

    public void setSeq(int seq) {
        this.seq = seq;
    }

    public Date getqDate() {
        return qDate;
    }

    public void setqDate(Date qDate) {
        this.qDate = qDate;
    }

    public String getqDelete() {
        return qDelete;
    }

    public void setqDelete(String qDelete) {
        this.qDelete = qDelete;
    }

    public int getqUserNum() {
        return qUserNum;
    }

    public void setqUserNum(int qUserNum) {
        this.qUserNum = qUserNum;
    }

    @Override
    public String toString() {
        return "QnaVO{" +
                "qNum=" + qNum +
                ", qTitle='" + qTitle + '\'' +
                ", qWroter='" + qWriter + '\'' +
                ", qContent='" + qContent + '\'' +
                ", origin=" + origin +
                ", depth=" + depth +
                ", seq=" + seq +
                ", qDate=" + qDate +
                ", qDelete='" + qDelete + '\'' +
                ", qUserNum=" + qUserNum +
                '}';
    }

}
