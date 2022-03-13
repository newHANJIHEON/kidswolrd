package com.kidsworld.mvc.dao;

import com.kidsworld.mvc.commons.utils.Criteria;
import com.kidsworld.mvc.commons.vo.NoticeVO;
import com.kidsworld.mvc.commons.vo.QnaVO;
import com.kidsworld.mvc.commons.vo.ReviewVO;

import java.util.List;

public interface CommunityDAO {

    //공지사항 리스트 불러오기
    List<NoticeVO> noticeList(Criteria cri) throws Exception;

    //공지사항 총 갯수 불러오기(pm제작)
    int listNoticeCount(Criteria cri) throws Exception;

    //공지사항 쓰기
    void noticeWrite(NoticeVO vo);

    //공지사항 읽기
    NoticeVO noticeRead(int nNum) throws Exception;

    //공지사항 수정 제출
    void noticeModify(NoticeVO vo);

    //공지사항 삭제
    void noticeDelete(int nNum);

    //질의응답 리스트 불러오기
    List<QnaVO> qnaList(Criteria cri) throws Exception;

    //질의응답 총 갯수 불러오기(pm제작)
    int listQnaCount(Criteria cri) throws Exception;

    //질의 쓰기
    void qnaWrite(QnaVO vo);

    //질의 절대값 설정
    void updateOrigin();

    //질의 & 응답 읽기
    QnaVO qnaRead(int qNum) throws Exception;

    //응답 작성시 답글들을 재정렬해주는 작업을 한 번 거친다.
    void updateReply(QnaVO vo);

    //응답 작성
    void qnaReplyWrite(QnaVO vo);

    //응답 수정 제출
    void qnaModify(QnaVO vo);

    //응답 삭제
    void qnaDelete(int qNum);

    //리뷰 리스트 불러오기
    List<ReviewVO> reviewList(Criteria cri) throws Exception;

    //리뷰 총 갯수불러오기(pm제작)
    int listReviewCount(Criteria cri) throws Exception;

    //리뷰 작성하기
    void reviewWrite(ReviewVO vo);

    //리뷰 보기
    ReviewVO reviewRead(int rNum) throws Exception;

    //리뷰 수정하기
    void reviewModify(ReviewVO vo);

    //리뷰 삭제
    void reviewDelete(int rNum);

    //메인페이지 리뷰 불러오기
    List<ReviewVO> reviewBestList(Criteria cri) throws Exception;
}
