package com.kidsworld.mvc.controller;


import com.kidsworld.mvc.commons.vo.UserVO;
import com.kidsworld.mvc.security.user.CustomUserDetailService;
import com.kidsworld.mvc.service.UserService;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.inject.Inject;
import javax.mail.internet.MimeMessage;

@Controller
@RequestMapping("user")
public class UserController {

    @Inject
    UserService us;

    @Inject
    JavaMailSender mailSender;

    @Inject
    CustomUserDetailService cuds;

    @Inject
    PasswordEncoder encoder;

    //로그인 페이지 이동
    @GetMapping("/login")
    public String signIn(String message, Model model) {
        //아래는 로그인 실패 시
        //로그인 실패 핸들러에서 날아오는 메세지를 받아
        //alert로 표현해주기 위함이다.
        model.addAttribute("message", message);
        return "user/login";
    }

    //회원가입 페이지 이동
    @GetMapping("/join")
    public String SignUp() {
        return "user/join";
    }

    //아이디 중복 체크
    //회원가입시 중복가입 금지를 위한 장치
    //ajax로 기능한다.
    @PostMapping("/uIdCheck")
    @ResponseBody
    public boolean uIdCheck(String uId) throws Exception {
        boolean isChecked = us.getMemberByID(uId);
        System.out.println("입력된 아이디 : " + uId);
        System.out.println("중복여부 : " + isChecked);
        return isChecked;
    }

    //휴대폰 번호 중복 체크
    //티켓 검수 시 휴대폰 번호로 식별되기 때문에 중복되면 안 된다.
    //ajax로 기능한다.
    @PostMapping("/uPhoneNumCheck")
    @ResponseBody
    public boolean uPhoneNumCheck(String uPhoneNum) throws Exception {
        boolean isChcked = us.getMemberByPhoneNum(uPhoneNum);
        System.out.println("입력된 전화번호 : " + uPhoneNum);
        System.out.println("중복여부 : " + isChcked);
        return isChcked;
    }

    //이메일 인증 요청
    //ajax로 기능한다.
    @GetMapping("/emailSend")
    @ResponseBody
    public String emailSend(@RequestParam("uId") String uId) throws Exception {
        String code = "";
        MimeMessage message = mailSender.createMimeMessage();
        MimeMessageHelper messageHelper = new MimeMessageHelper(message, "UTF-8");
        messageHelper.setFrom("shhk0723@naver.com");
        messageHelper.setTo(uId);
        messageHelper.setSubject("상상체험 키즈월드 이메일 인증코드 확인");
        for (int i = 0; i < 5; i ++) {
            code += (int)(Math.random()*10);
        }
        System.out.println("발송된 이메일 인증코드 : " + code);
        String msg = "<h3>상상체험 키즈월드입니다.</h3>" +
                "<h3>고객님의 인증번호는"+ code +"입니다.</h3>" +
                "<p>인증번호를 타인에게 알려주시면 위험할 수 있습니다.</p>" +
                "<p>창을 새로고침하거나 등의 세션이 초기화될 경우 인증을 다시 하셔야 합니다.</p>" +
                "<p>감사합니다.</p>";
        messageHelper.setText(msg, true);
        mailSender.send(message);
        System.out.println("발신완료");
        return code;
    }

    //회원가입 요청
    @PostMapping("/join")
    public String join(UserVO vo) throws Exception {
        System.out.println("가입요청 : " + vo);
        us.signUp(vo);
        return "redirect:/user/login";
    }

    //로그아웃 요청
    @GetMapping("/logout")
    public String logout() {
        return "user/logout";
    }

    //아이디 찾기 페이지 요청
    @GetMapping("/findId")
    public String findId() {
        return "user/findId";
    }

    //아이디 찾기 기능 요청
    @PostMapping("/findId")
    public ResponseEntity<String> findId(@RequestBody UserVO vo) {
        ResponseEntity<String> entity = null;

        try {
            String id = us.findId(vo);
            entity = new ResponseEntity<>(id, HttpStatus.OK);
        } catch (Exception e) {
            e.printStackTrace();
            entity = new ResponseEntity<>(HttpStatus.BAD_REQUEST);
        }

        return entity;
    }

    //비밀번호 찾기 페이지 요청
    @GetMapping("/findPass")
    public String findPass() {
        return "user/findPass";
    }

    //비밀번호 찾기 인증 완료 - 비밀번호 변경페이지로 이동
    @PostMapping("/ChangePass")
    public String ChangePass(UserVO vo, Model model) throws Exception {
        System.out.println("아이디 찾기 vo : " + vo);
        UserVO user = us.findPass(vo);
        if (user != null) {
            model.addAttribute("user", user);
            return "user/ChangePass";
        } else {
            model.addAttribute("message", "등록된 계정이 없습니다.");
            return "user/findPass";
        }
    }

    //비밀번호 변경 from 로그인 된 유저
    @PostMapping("/ChangePassFromUpdate")
    public String changePassFromUpdate(UserVO vo, Model model) throws Exception {
        UserVO user = us.findPass(vo);
        if(encoder.matches(vo.getuPassword(), user.getuPassword())) {
            model.addAttribute("user", user);
            return "user/ChangePass";
        } else {
            model.addAttribute("message", "비밀번호가 일치하지 않습니다.");
            return "user/userUpdate";
        }
    }

    //비빌번호 변경 요청
    @PostMapping("/ChangePassSubmit")
    public String changePassSubmit(UserVO vo) throws Exception {
        System.out.println("패스워스 : " + vo.getuPassword());
        us.changePass(vo);
        return "redirect:/user/login";
    }

    //내 정보 보기
    @GetMapping("/userInfo")
    public String info() throws Exception {
        return "user/userInfo";
    }

    //내 정보 수정하기 페이지
    @GetMapping("/userUpdate")
    public String update() throws Exception {
        return "user/userUpdate";
    }

    //내 정보 수정 제출하기
    @PostMapping("/userUpdate")
    public String updateSubmit(UserVO vo) throws Exception {
        //수정 정보가 로그아웃 후 재로그인 하기 전까지는 반영되지 않음
        //spring security의 세션을 갱신하지 못함
        us.update(vo);
        String name = SecurityContextHolder.getContext().getAuthentication().getName();
        UserDetails user = cuds.loadUserByUsername(name);
        Authentication auth = new UsernamePasswordAuthenticationToken(user, user.getAuthorities());
        SecurityContextHolder.getContext().setAuthentication(auth);
        return "user/userInfo";
    }

}
