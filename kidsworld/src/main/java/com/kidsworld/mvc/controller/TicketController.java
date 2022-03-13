package com.kidsworld.mvc.controller;

import com.kidsworld.mvc.commons.utils.Criteria;
import com.kidsworld.mvc.commons.vo.TicketCountVO;
import com.kidsworld.mvc.commons.vo.TicketVO;
import com.kidsworld.mvc.service.TicketService;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.inject.Inject;

@Controller
@RequestMapping("/ticket")
public class TicketController {

    @Inject
    TicketService ts;

    @GetMapping("/info")
    public String ticketInfo(String tArea, String forWhen, Integer adult, Integer kid, Model model) {
        System.out.println("예약장소 : " + tArea);
        if (tArea != null && forWhen != null) {
            if (forWhen.equals("종일권")) {
                model.addAttribute("AllDayTArea", tArea);
                model.addAttribute("AllDay", forWhen);
                model.addAttribute("AllDayAdult", adult);
                model.addAttribute("AllDayKid", kid);
            }
            if (forWhen.equals("오후권")) {
                model.addAttribute("HalfDayTArea", tArea);
                model.addAttribute("HalfDay", forWhen);
                model.addAttribute("HalfDayAdult", adult);
                model.addAttribute("HalfDayKid", kid);
            }
        }
        return "ticket/ticketInfo";
    }

    @PostMapping(value = "/buyTicket", produces = "application/text; charset=UTF-8")
    public ResponseEntity<String> buyTicket(@RequestBody TicketCountVO vo) {
        //Map<String, Object> map
        ResponseEntity<String> entity = null;
        TicketVO ticketVO = new TicketVO();
        ticketVO.setForWho(vo.getForWho());
        ticketVO.setForWhen(vo.getForWhen());
        ticketVO.setuName(vo.getuName());
        ticketVO.setuPhoneNum(vo.getuPhoneNum());
        ticketVO.setuId(vo.getuId());
        ticketVO.setMarket(vo.getMarket());
        ticketVO.settArea(vo.gettArea());
        int count = vo.getCount();
        System.out.println("티켓 : " + ticketVO);
        System.out.println("횟수 : " + count);
            try {
                boolean message = ts.buyTicket(ticketVO, count);
                entity = new ResponseEntity<>(String.valueOf(message), HttpStatus.OK);
            } catch (Exception e) {
                e.printStackTrace();
                entity = new ResponseEntity<>(e.getMessage(), HttpStatus.BAD_REQUEST);
            }
        return entity;
    }

    @GetMapping("/myTicketInfo")
    public String myTicketInfo(Criteria cri, Model model) throws Exception {
        System.out.println("phone : " + cri.getUPhoneNum());
        model.addAttribute("list", ts.ticketList(cri));
        cri.setSearchType("p");
        model.addAttribute("pm", ts.ticketPageMaker(cri));
        return "ticket/myTicketInfo";
    }

    @GetMapping("/refundTicket")
    public String refundTicket(int tNum, String uPhoneNum, RedirectAttributes rttr) throws Exception {
        ts.refundTicket(tNum);
        rttr.addAttribute("uPhoneNum", uPhoneNum);
        return "redirect:/ticket/myTicketInfo";
    }
}
