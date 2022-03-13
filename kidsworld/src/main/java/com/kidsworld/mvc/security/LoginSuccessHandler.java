package com.kidsworld.mvc.security;

import com.kidsworld.mvc.commons.vo.UserVO;
import com.kidsworld.mvc.security.user.CustomMember;
import com.kidsworld.mvc.service.UserService;
import org.springframework.security.core.Authentication;
import org.springframework.security.web.authentication.AuthenticationSuccessHandler;

import javax.inject.Inject;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

public class LoginSuccessHandler implements AuthenticationSuccessHandler {
    //이 클래스에 대한 권한은 security-context.xml이 들고 있고, 사용한다.
    //로그인 성공시 자동으로 움직이는 클래스
    //방문시간 갱신, 로그인 후 바로 불러올 화면 요청 등을 하는데 활용하면 좋다.

    @Inject
    UserService us;

    @Override
    public void onAuthenticationSuccess(HttpServletRequest httpServletRequest, HttpServletResponse httpServletResponse, Authentication authentication) throws IOException, ServletException {
        CustomMember member = (CustomMember) authentication.getPrincipal();
        System.out.println("member : " + member);
        UserVO vo = member.getMember();
        System.out.println("vo : " + vo);

        try {
            //방문시간 갱신
            us.updateVisit(vo);
        } catch (Exception e) {
            e.printStackTrace();
        }

        String context = httpServletRequest.getServletContext().getContextPath();
        //아래를 통해 로그인을 완료하면 홈으로 간다.
        httpServletResponse.sendRedirect(context);
    }
}
