package com.kidsworld.mvc.security;

import org.springframework.security.core.AuthenticationException;
import org.springframework.security.web.authentication.AuthenticationFailureHandler;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

import static jdk.nashorn.internal.runtime.GlobalFunctions.encodeURI;

public class CustomLoginFailHandler implements AuthenticationFailureHandler {

    @Override
    public void onAuthenticationFailure(
            HttpServletRequest request,
            HttpServletResponse response,
            AuthenticationException exception) throws IOException, ServletException {

        String context = request.getServletContext().getContextPath();
        //메세지 전달
        //user/login 자체가 컨트롤러에서 message를 받고 있다.
        String url = context + "/user/login?message=" + encodeURI("UTF-8", "로그인실패");
        response.sendRedirect(url);

    }
}
