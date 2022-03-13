package com.kidsworld.mvc.service;

import com.kidsworld.mvc.commons.utils.Criteria;
import com.kidsworld.mvc.commons.utils.PageMaker;
import com.kidsworld.mvc.commons.vo.NoticeVO;
import com.kidsworld.mvc.commons.vo.QnaVO;
import com.kidsworld.mvc.commons.vo.ReviewVO;

import java.util.List;

public interface CommunityService {

    List<NoticeVO> noticeList(Criteria cri) throws Exception;

    PageMaker getNoticePageMaker(Criteria cri) throws Exception;

    void noticeWrite(NoticeVO vo);

    NoticeVO noticeRead(int nNum) throws Exception;

    void noticeModify(NoticeVO vo);

    void noticeDelete(int nNum);

    List<QnaVO> qnaList(Criteria cri) throws Exception;

    PageMaker getQnaPageMaker(Criteria cri) throws Exception;

    void qnaWrite(QnaVO vo);

    QnaVO qnaRead(int qNum) throws Exception;

    void qnaReplyWrite(QnaVO vo);

    void qnaModify(QnaVO vo);

    void qnaDelete(int qNum);

    List<ReviewVO> reviewList(Criteria cri) throws Exception;

    PageMaker getReviewPageMaker(Criteria cri) throws Exception;

    void reviewWrite(ReviewVO vo);

    ReviewVO reviewRead(int rNum) throws Exception;

    void reviewModify(ReviewVO vo);

    void reviewDelete(int rNum);

    List<ReviewVO> reviewListBest(Criteria cri) throws Exception;

}
