package com.kidsworld.mvc.service;

import com.kidsworld.mvc.commons.utils.Criteria;
import com.kidsworld.mvc.commons.utils.PageMaker;
import com.kidsworld.mvc.commons.vo.TicketVO;
import com.kidsworld.mvc.commons.vo.UserVO;

import java.util.List;

public interface TicketService {

    //티켓구매
    boolean buyTicket(TicketVO vo, int count) throws Exception;

    //이미 구매한 티켓 반품하기
    //본인이 구매한 티켓목록 보기에서 가능한 기능, 미사용 티켓만 노출된다.
    void refundTicket(int tNum) throws Exception;

    //티켓목록 보기
    //위헤서 구성한 페이지 메이커를 토대로 하여,
    //들어갈 정보값 = 즉 지정값의 해당 고객이 구매한 티켓리스트를 구성하여 전달한다.
    //휴대폰 뒷자리, 이름 등으로 검색하여 List를 받는다.
    //아직 '미사용인 티켓 리스트'를 받아야 한다.
    List<TicketVO> ticketList(Criteria cri) throws Exception;

    //티켓 사용처리
    //티켓 번호를 받아 사용처리를 진행한다.
    void useTicket(int[] tNum) throws Exception;

    //티켓 페이지 메이킹
    PageMaker ticketPageMaker(Criteria cri) throws Exception;

    //사용된 티켓 목록 보기
    List<TicketVO> usedTicketList(Criteria cri) throws Exception;

    //사용된 티켓 페이지 메이킹
    PageMaker usedTicketPageMaker(Criteria cri) throws Exception;

    //사용처리된 티켓 되돌리기
    void rollbackTicket(int[] tNum) throws Exception;

    //반품된 티켓 목록 보기
    List<TicketVO> refundTicketList(Criteria cri) throws Exception;

    //반품된 티켓 페이지 메이킹
    PageMaker refundTicketPageMaker(Criteria cri) throws Exception;

    /////////////////////////////////////////////////////
    /////////////////특정 시간대의 티켓 판매수/////////////////
    int selectAllDayAdult(String date) throws Exception;
    int selectAllDayKid(String date) throws Exception;
    int selectHalfDayAdult(String date) throws Exception;
    int selectHalfDayKid(String date) throws Exception;
    /////////////////특정 시간대의 티켓 판매수/////////////////
    /////////////////////////////////////////////////////

    /////////////////////////////////////////////////////
    /////////////////전체 시간대의 티켓 판매수/////////////////
    int totalAllDayAdult() throws Exception;
    int totalAllDayKid() throws Exception;
    int totalHalfDayAdult() throws Exception;
    int totalHalfDayKid() throws Exception;
    /////////////////특정 시간대의 티켓 판매수/////////////////
    /////////////////////////////////////////////////////
}
