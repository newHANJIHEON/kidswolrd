package com.kidsworld.mvc.service;


import com.kidsworld.mvc.commons.vo.UserVO;
import com.kidsworld.mvc.dao.TicketDAO;
import com.kidsworld.mvc.dao.UserDAO;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

import javax.inject.Inject;

@Service
public class UserServiceImpl implements UserService {

    @Inject
    UserDAO userDao;

    @Inject
    TicketDAO ticketDAO;

    @Inject
    PasswordEncoder encoder;

    @Override
    public boolean getMemberByID(String uId) throws Exception {
        System.out.println("서비스단에서 뽑은 uId : " + uId);
        UserVO vo = userDao.getMemberByID(uId);
        System.out.println("결과 호출된 UserVO : " + vo);
        return vo == null ? true : false;
    }

    @Override
    public boolean getMemberByPhoneNum(String uPhoneNum) throws Exception {
        System.out.println("서비스단에서 뽑은 uId : " + uPhoneNum);
        UserVO vo = userDao.getMemberByPhoneNum(uPhoneNum);
        System.out.println("결과 호출된 UserVO : " + vo);
        return vo == null ? true : false;
    }

    @Override
    public void signUp(UserVO vo) throws Exception {
        String uPassword = vo.getuPassword();
        String encryptionPassword = encoder.encode(uPassword);
        vo.setuPassword(encryptionPassword);
        userDao.signUp(vo);
        userDao.insertAuth(vo);
    }

    @Override
    public String findId(UserVO vo) {
        try {
            String uId = userDao.findId(vo);
            int end = uId.indexOf("@");
            String frontId = uId.substring(0, end);
            System.out.println("frontId : " + frontId);
            String after = uId.substring(end);
            System.out.println("after : " + after);
            int middle = (end / 2);
            String halfFrontId = frontId.substring(0, middle);
            System.out.println("halfId : " + halfFrontId);
            for (int i = 0; i < middle; i ++) {
                halfFrontId += "*";
            }
            String returnId = halfFrontId.concat(after);
            System.out.println("returnId : " + returnId);
            return returnId;
        } catch (Exception e) {
            return null;
        }
    }

    @Override
    public UserVO findPass(UserVO vo) throws Exception {
        System.out.println("서비스단에서 찾으려는 아이디 vo : " + vo);
        UserVO user = userDao.findPass(vo);
        System.out.println("서비스단에서 찾아온 아이디 vo : " + user);
        return user;
    }

    @Override
    public void changePass(UserVO vo) throws Exception {
        System.out.println("바꾸려는 회원의 번호 : " + vo.getuNum());
        System.out.println("바꾸려는 회원의 비밀번호 :" + vo.getuPassword());
        String encryptionPassword = encoder.encode(vo.getuPassword());
        vo.setuPassword(encryptionPassword);
        System.out.println("바뀐 회원의 비밀번호 :" + vo.getuPassword());
        userDao.changePass(vo);
    }

    @Override
    public void updateVisit(UserVO vo) throws Exception {
        userDao.updateVisit(vo);
    }

    @Override
    public void update(UserVO vo) throws Exception {
        userDao.update(vo);
        ticketDAO.updateTicket(vo);
    }

    @Override
    public void withdraw(UserVO vo) throws Exception {
        userDao.withdraw(vo);
    }
}
