package com.kidsworld.mvc.controller;

import com.kidsworld.mvc.commons.utils.Criteria;
import com.kidsworld.mvc.commons.vo.NoticeVO;
import com.kidsworld.mvc.commons.vo.QnaVO;
import com.kidsworld.mvc.commons.vo.ReviewVO;
import com.kidsworld.mvc.service.CommunityService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.inject.Inject;

@Controller
@RequestMapping("/community")
public class CommunityController {

    @Inject
    CommunityService cs;

    //공지사항 목록 보기
    @GetMapping("/notice")
    public String notice(Criteria cri, Model model) throws Exception{
        model.addAttribute("list", cs.noticeList(cri));
        model.addAttribute("pm", cs.getNoticePageMaker(cri));
        return "community/notice";
    }

    //공지사항 보기
    @GetMapping("/noticeRead")
    public String noticeRead(int nNum, Criteria cri, Model model) throws Exception {
        NoticeVO vo = cs.noticeRead(nNum);
        model.addAttribute("notice", vo);
        model.addAttribute("cri", cri);
        return "community/noticeDetail";
    }

    //공지사항 쓰기 페이지 요청
    @GetMapping("/noticeWrite")
    public String noticeWrite() {
        return "community/noticeWrite";
    }

    //공지사항 쓰기 제출
    @PostMapping("/noticeWriteSubmit")
    public String noticeWriteSubmit(NoticeVO vo) {
        cs.noticeWrite(vo);
        return "redirect:/community/notice";
    }

    //공지사항 수정 페이지 요청
    @GetMapping("/noticeModify")
    public String noticeModify(int nNum, @ModelAttribute("cri") Criteria cri, Model model) throws Exception {
        NoticeVO vo = cs.noticeRead(nNum);
        model.addAttribute("notice", vo);
        return "community/noticeModify";
    }

    //공지사항 수정 제출
    @PostMapping("/noticeModify")
    public String noticeModifySubmit(NoticeVO vo, Criteria cri, RedirectAttributes rttr) {
        cs.noticeModify(vo);
        rttr.addAttribute("page", cri.getPage());
        rttr.addAttribute("perPageNum", cri.getPerPageNum());
        rttr.addAttribute("nNum", vo.getnNum());
        return "redirect:/community/noticeRead";
    }

    //공지사항 삭제
    @GetMapping("/noticeDelete")
    public String noticeDelete(int nNum, Criteria cri, RedirectAttributes rttr) {
        cs.noticeDelete(nNum);
        rttr.addAttribute("page", cri.getPage());
        rttr.addAttribute("perPageNum", cri.getPerPageNum());
        return "redirect:/community/notice";
    }

    //질의응답 보기
    @GetMapping("/qna")
    public String qna(Criteria cri, Model model)  throws Exception {
        model.addAttribute("list", cs.qnaList(cri));
        model.addAttribute("pm", cs.getQnaPageMaker(cri));
        return "community/qna";
    }

    //질의 쓰기 페이지 요청
    @GetMapping("/qnaWrite")
    public String qnaWrite() {
        return "community/qnaWrite";
    }

    //질의 쓰기 제출
    @PostMapping("/qnaWriteSubmit")
    public String qnaWriteSubmit(QnaVO vo) {
        cs.qnaWrite(vo);
        return "redirect:/community/qna";
    }

    //질의 & 응답 읽기
    @GetMapping("/qnaRead")
    public String qnaRead(int qNum, Criteria cri, int uNum, Model model, RedirectAttributes rttr) throws Exception {
        QnaVO vo = cs.qnaRead(qNum);
        if (vo.getqUserNum() == uNum || uNum == 1) {
            model.addAttribute("qna", vo);
            model.addAttribute("cri", cri);
            return "community/qnaDetail";
        } else {
            rttr.addFlashAttribute("message", "작성자 본인과 관리자만 열람가능합니다.");
            return "redirect:/community/qna";
        }
    }

    //응답 쓰기
    @GetMapping("/qnaReply")
    public String qnaReply(int qNum, Model model, @ModelAttribute("cri") Criteria cri) throws Exception {
        QnaVO original = cs.qnaRead(qNum);
        model.addAttribute("original", original);
        return "community/qnaReplyWrite";
    }

    //응답 쓰기 제출
    @PostMapping("/qnaReplySubmit")
    public String qnaReplySubmit(QnaVO vo, Criteria cri, RedirectAttributes rttr) {
        cs.qnaReplyWrite(vo);
        rttr.addAttribute("page", cri.getPage());
        rttr.addAttribute("perPageNum", cri.getPerPageNum());
        return "redirect:/community/qna";
    }

    //질의응답 수정 페이지 요청
    @GetMapping("/qnaModify")
    public String qnaModify(int qNum, @ModelAttribute("cri") Criteria cri, Model model) throws Exception {
        QnaVO vo = cs.qnaRead(qNum);
        model.addAttribute("qna", vo);
        return "community/qnaModify";
    }

    //질의응답 수정 제출
    @PostMapping("/qnaModify")
    public String qnaModifySubmit(QnaVO vo, int uNum, Criteria cri, RedirectAttributes rttr) {
        cs.qnaModify(vo);
        rttr.addAttribute("page", cri.getPage());
        rttr.addAttribute("perPageNum", cri.getPerPageNum());
        rttr.addAttribute("uNum", uNum);
        rttr.addAttribute("qNum", vo.getqNum());
        return "redirect:/community/qnaRead";
    }

    //질의응답 삭제
    @GetMapping("/qnaDelete")
    public String qnaDelete(int qNum, Criteria cri, RedirectAttributes rttr) {
        cs.qnaDelete(qNum);
        rttr.addAttribute("page", cri.getPage());
        rttr.addAttribute("perPageNum", cri.getPerPageNum());
        return "redirect:/community/qna";
    }

    //리뷰 목록 보기
    @GetMapping("/review")
    public String review(Criteria cri, Model model) throws Exception {
        cri.setPerPageNum(15);
        model.addAttribute("list", cs.reviewList(cri));
        model.addAttribute("pm", cs.getReviewPageMaker(cri));
        return "community/review";
    }

    //리뷰 쓰기
    @GetMapping("/reviewWrite")
    public String reviewWrite() {
        return "community/reviewWrite";
    }

    //리뷰 쓰기 제출
    @PostMapping("/reviewWriteSubmit")
    public String reviewWriteSubmit(ReviewVO vo, Criteria cri, RedirectAttributes rttr) throws Exception {
        cs.reviewWrite(vo);
        rttr.addAttribute("page", cri.getPage());
        rttr.addAttribute("perPageNum", cri.getPerPageNum());
        return "redirect:/community/review";
    }

    //리뷰 읽기
    @GetMapping("/reviewRead")
    public String reviewRead(int rNum, Criteria cri, Model model) throws Exception {
        ReviewVO vo = cs.reviewRead(rNum);
        model.addAttribute("review", vo);
        model.addAttribute("cri", cri);
        return "community/reviewDetail";
    }

    //리뷰 수정하기 페이지
    //공지사항 수정 페이지 요청
    @GetMapping("/reviewModify")
    public String reviewModify(int rNum, int rUserNum, @ModelAttribute("cri") Criteria cri, Model model) throws Exception {
        ReviewVO vo = cs.reviewRead(rNum);
        if (vo.getrUserNum() == rUserNum) {
            model.addAttribute("review", vo);
            return "community/reviewModify";
        } else {
            model.addAttribute("message", "수정은 작성자 본인만 가능합니다.");
            model.addAttribute("rNum", rNum);
            model.addAttribute("cri", cri);
            return "redirect:/community/reviewRead";
        }
    }

    //리뷰 수정하기 제출
    @PostMapping("/reviewModify")
    public String reviewModifySubmit(ReviewVO vo, Criteria cri, RedirectAttributes rttr) {
        cs.reviewModify(vo);
        rttr.addAttribute("page", cri.getPage());
        rttr.addAttribute("perPageNum", cri.getPerPageNum());
        rttr.addAttribute("rNum", vo.getrNum());
        return "redirect:/community/reviewRead";
    }

    //리뷰 삭제하기
    @GetMapping("/reviewDelete")
    public String reviewDelete(int rNum, Criteria cri, RedirectAttributes rttr) {
        cs.reviewDelete(rNum);
        rttr.addAttribute("page", cri.getPage());
        rttr.addAttribute("perPageNum", cri.getPerPageNum());
        return "redirect:/community/review";
    }

}
