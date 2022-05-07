package com.kidsworld.mvc.security.user;

import com.kidsworld.mvc.commons.vo.UserVO;
import com.kidsworld.mvc.dao.UserDAO;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;

import javax.inject.Inject;

public class CustomUserDetailService implements UserDetailsService {

    @Inject
    UserDAO dao;

    @Override
    public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
        UserVO vo = null;
        try {
            //아이디로 검색된 사용자가 존재하고 있는지부터 검색
            //username은 시큐리티에서 날아오는 아이디
            vo = dao.getMemberByID(username);
        } catch (Exception e) {
            e.printStackTrace();
        }
        //있을 경우 User를 상속받은 CustomMember로 토스, 그렇지 않을 경우 null
        //CustomMember는 vo를 받은 후 비밀번호까지 비교하고, 인증정보와 함께 Session영역에 저장시켜준다?
        return vo == null ? null : new CustomMember(vo);
    }
}
