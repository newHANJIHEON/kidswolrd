package com.kidsworld.mvc.dao;

import com.kidsworld.mvc.commons.utils.Criteria;
import com.kidsworld.mvc.commons.vo.TicketVO;
import com.kidsworld.mvc.commons.vo.UserVO;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.SelectProvider;
import org.apache.ibatis.annotations.Update;

import java.util.List;

public interface TicketDAO {

    //성인용 티켓구매
    void buyTicket(TicketVO vo) throws Exception;

    //(고객 기준)이미 구매한 티켓 반품하기
    //본인이 구매한 티켓목록 보기에서 가능한 기능, 미사용 티켓만 노출된다.
    void refundTicket(TicketVO vo) throws Exception;

    //티켓목록 페이지 구성을 위한 전체 티켓갯수 구하기
    //지정값을 받았을 때, 지정값(고객의 이름이나 번호 + 미사용 티켓일 것)에 의해 티켓갯수가 달라지니
    //동적 쿼리를 사용한다.
    int ticketListCount(Criteria cri) throws Exception;

    //티켓목록 보기
    //위헤서 구성한 페이지 메이커를 토대로 하여,
    //들어갈 정보값 = 즉 지정값의 해당 고객이 구매한 티켓리스트를 구성하여 전달한다.
    //휴대폰 뒷자리, 이름 등으로 검색하여 List를 받는다.
    //아직 '미사용인 티켓 리스트'를 받아야 한다.
    List<TicketVO> ticketList(Criteria cri) throws Exception;

    //티켓 사용처리
    //티켓 번호를 받아 사용처리를 진행한다.
    void useTicket(TicketVO vo) throws Exception;

    //반품처리된 티켓 보기
    List<TicketVO> refundTicketList(Criteria cri) throws Exception;

    //반품처리된 티켓목록 페이지 구성을 위한 전체 티켓갯수 구하기
    int refundTicketListCount(Criteria cri);

    //사용처리된 티켓 보기
    List<TicketVO> usedTicketList(Criteria cri) throws Exception;

    //사용처리된 티켓목록 페이지 구성을 위한 전체 티켓갯수 구하기
    int usedTicketListCount(Criteria cri);

    //사용처리된 티켓 되돌리기
    void rollbackTicket(TicketVO vo) throws Exception;

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
    /////////////////전체 시간대의 티켓 판매수/////////////////
    /////////////////////////////////////////////////////

    ///////////////////////////////////////////////////////////////////////////////////////////////////
    /////////////////////////////////////////아래는 회원정보 변경 시/////////////////////////////////////////
    ///////////////////////////////////////////////////////////////////////////////////////////////////
    ////////////////////////////////////기존 티켓의 회원정보도 같이 변경한다////////////////////////////////////
    ///////////////////////////////////////////////////////////////////////////////////////////////////

    //회원정보 변경에 의한 티켓 정보 변경
    void updateTicket(UserVO vo) throws Exception;

}
