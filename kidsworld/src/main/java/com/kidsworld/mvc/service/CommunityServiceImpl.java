package com.kidsworld.mvc.service;

import com.kidsworld.mvc.commons.utils.Criteria;
import com.kidsworld.mvc.commons.utils.PageMaker;
import com.kidsworld.mvc.commons.vo.NoticeVO;
import com.kidsworld.mvc.commons.vo.QnaVO;
import com.kidsworld.mvc.commons.vo.ReviewVO;
import com.kidsworld.mvc.dao.CommunityDAO;
import org.springframework.stereotype.Service;

import javax.inject.Inject;
import java.util.List;

@Service
public class CommunityServiceImpl implements CommunityService {

    @Inject
    CommunityDAO dao;

    //공지사항 불러오기
    @Override
    public List<NoticeVO> noticeList(Criteria cri) throws Exception {
        return dao.noticeList(cri);
    }

    //공지사항 페이지를 구성할 방법 불러오기
    @Override
    public PageMaker getNoticePageMaker(Criteria cri) throws Exception {
        PageMaker pageMaker = new PageMaker();
        pageMaker.setCri(cri);
        pageMaker.setDisplayPageNum(5);
        int totalCount = dao.listNoticeCount(cri);
        pageMaker.setTotalCount(totalCount);
        return pageMaker;
    }

    //공지사항 쓰기
    @Override
    public void noticeWrite(NoticeVO vo) {
        dao.noticeWrite(vo);
    }

    //공지사항 읽기
    @Override
    public NoticeVO noticeRead(int nNum) throws Exception {
        NoticeVO vo = dao.noticeRead(nNum);
        return vo;
    }

    //공지사항 수정 제출
    @Override
    public void noticeModify(NoticeVO vo) {
        dao.noticeModify(vo);
    }

    //공지사항 삭제
    @Override
    public void noticeDelete(int nNum) {
        dao.noticeDelete(nNum);
    }

    //질의응답 리스트 불러오기
    @Override
    public List<QnaVO> qnaList(Criteria cri) throws Exception {
        return dao.qnaList(cri);
    }

    //질의응답 페이지를 구성할 방법 불러오기
    @Override
    public PageMaker getQnaPageMaker(Criteria cri) throws Exception {
        PageMaker pageMaker = new PageMaker();
        pageMaker.setCri(cri);
        pageMaker.setDisplayPageNum(5);
        int totalCount = dao.listQnaCount(cri);
        pageMaker.setTotalCount(totalCount);
        return pageMaker;
    }

    //질의 쓰기
    @Override
    public void qnaWrite(QnaVO vo) {
        //질의 쓰기
        dao.qnaWrite(vo);
        //질의 절대값 설정
        //향후 답변을 달 때에 이것(절대값)을 기준으로 답변들이 쌓이게 된다.
        dao.updateOrigin();
    }

    //질의 & 응답 읽기
    @Override
    public QnaVO qnaRead(int qNum) throws Exception {
        QnaVO vo = dao.qnaRead(qNum);
        return vo;
    }

    //응답 쓰기
    @Override
    public void qnaReplyWrite(QnaVO vo) {
        //기존 글들의 seq 정렬순서 값이 원본글보다 큰 값을 가진 글이 존재하면 1씩 증가한 값으로 조정
        //즉 이전에 작성된 답글들이 뒤로 가야하니, 정렬순서를 위해 1씩 밀어주는 것
        //그래야 당장 들어가는 들어가는 최신 답글이 가장 위로 오게 됨
        dao.updateReply(vo);
        vo.setDepth(vo.getDepth() + 1);
        vo.setSeq(vo.getSeq() + 1);
        //원본글의 origin값, depth + 1, seq + 1한 값으로 답변글 INSERT
        dao.qnaReplyWrite(vo);
    }

    //응답 수정 제출
    @Override
    public void qnaModify(QnaVO vo) {
        dao.qnaModify(vo);
    }

    //응답 삭제
    @Override
    public void qnaDelete(int qNum) {
        dao.qnaDelete(qNum);
    }

    //리뷰리스트 불러오기
    @Override
    public List<ReviewVO> reviewList(Criteria cri) throws Exception {
        return dao.reviewList(cri);
    }

    //리뷰 페이지를 구성할 방법 불러오기
    @Override
    public PageMaker getReviewPageMaker(Criteria cri) throws Exception {
        PageMaker pageMaker = new PageMaker();
        pageMaker.setCri(cri);
        pageMaker.setDisplayPageNum(5);
        int totalCount = dao.listReviewCount(cri);
        pageMaker.setTotalCount(totalCount);
        return pageMaker;
    }

    //리뷰 작성하기
    @Override
    public void reviewWrite(ReviewVO vo) {
        dao.reviewWrite(vo);
    }

    //리뷰 보기
    @Override
    public ReviewVO reviewRead(int rNum) throws Exception {
        return dao.reviewRead(rNum);
    }

    //리뷰 수정하기
    @Override
    public void reviewModify(ReviewVO vo) {
        dao.reviewModify(vo);
    }

    //리뷰 삭제하기
    @Override
    public void reviewDelete(int rNum) {
        dao.reviewDelete(rNum);
    }

    //메인페이지 리뷰 불러오기
    @Override
    public List<ReviewVO> reviewListBest(Criteria cri) throws Exception {
        cri.setPerPageNum(6);
        return dao.reviewBestList(cri);
    }

}
