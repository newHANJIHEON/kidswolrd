package com.kidsworld.mvc.service;

import com.kidsworld.mvc.commons.vo.UserVO;

public interface UserService {

    //아이디 중복 체크
    //겸, 로그인
    boolean getMemberByID(String uId) throws Exception;

    //휴대폰 중복 체크
    boolean getMemberByPhoneNum(String uPhoneNum) throws Exception;

    //회원가입
    void signUp(UserVO vo) throws Exception;

    //로그인
    //void signIn(String uId) throws Exception;
    //시큐리로 작동

    //아이디 찾기
    String findId(UserVO vo) throws Exception;

    //비밀번호 찾기 - 정확히는 바꾸기 페이지
    UserVO findPass(UserVO vo) throws Exception;

    //비밀번호 변경
    void changePass(UserVO vo) throws Exception;

    //방문기록 갱신
    void updateVisit(UserVO vo) throws Exception;

    //회원정보 수정
    void update(UserVO vo) throws Exception;

    //회원탈퇴
    void withdraw(UserVO vo) throws Exception;


}
