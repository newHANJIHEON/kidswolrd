package com.kidsworld.mvc.dao;

import com.kidsworld.mvc.commons.vo.UserVO;
import org.apache.ibatis.annotations.Update;

public interface UserDAO {

    //아이디 중복 체크 + 아이디 가져오기(로그인 시 이용)
    //2가지 기능
    UserVO getMemberByID(String uId) throws Exception;

    //휴대폰 중복 체크
    UserVO getMemberByPhoneNum(String uPhoneNum) throws Exception;

    //회원가입
    void signUp(UserVO vo) throws Exception;

    //가입된 회원에게 기본권한 부여
    void insertAuth(UserVO vo) throws Exception;

    //회원 아이디 찾기
    String findId(UserVO vo) throws Exception;

    //회원 비밀번호 찾기 - 정확히는 변경 페이지로
    UserVO findPass(UserVO vo) throws Exception;

    //비밀번호 변경
    void changePass(UserVO vo) throws Exception;

    //회원정보 수정
    void update(UserVO vo) throws Exception;

    //방문기록 갱신
    void updateVisit(UserVO vo) throws Exception;

    //회원탈퇴
    @Update("UPDATE kidslandUser SET member = 'N' WHERE uId = #{uId}")
    void withdraw(UserVO vo) throws Exception;


}
