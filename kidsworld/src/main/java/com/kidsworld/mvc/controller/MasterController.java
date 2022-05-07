package com.kidsworld.mvc.controller;

import com.kidsworld.mvc.commons.utils.Criteria;
import com.kidsworld.mvc.service.TicketService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.inject.Inject;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;

@Controller
@RequestMapping("/master")
public class MasterController {

    @Inject
    TicketService ts;

    @GetMapping("/ticketManage")
    public String masterTicket(Criteria cri, Model model) throws Exception {
        model.addAttribute("list", ts.ticketList(cri));
        model.addAttribute("pm", ts.ticketPageMaker(cri));
        return "master/ticketManage";
    }

    @PostMapping("/uesTicket")
    public String uesTicket(int[] tNum) throws Exception {
        ts.useTicket(tNum);
        return "master/ticketManage";
    }

    @GetMapping("/usedTicketInfo")
    public String usedTicketInfo(Criteria cri, Model model) throws Exception {
        model.addAttribute("list", ts.usedTicketList(cri));
        model.addAttribute("pm", ts.usedTicketPageMaker(cri));
        return "master/usedTicketInfo";
    }

    @PostMapping("/rollbackTicket")
    public String rollbackTicket(int[] tNum) throws Exception {
        ts.rollbackTicket(tNum);
        return "master/usedTicketInfo";
    }

    @GetMapping("/refundTicketInfo")
    public String refundTicketInfo(Criteria cri, Model model) throws Exception {
        model.addAttribute("list", ts.refundTicketList(cri));
        model.addAttribute("pm", ts.refundTicketPageMaker(cri));
        return "master/refundTicketInfo";
    }

    @GetMapping("/total")
    public String total(String date, Model model) throws Exception {
        if (date == null || date.equals("")) {
            LocalDate now = LocalDate.now();
            DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd");
            date = formatter.format(now);
        } else if (date.length() == 8) {
            StringBuffer sb = new StringBuffer(date);
            sb.insert(4, '-');
            sb.insert(7, '-');
            date = sb.toString();
        }
        model.addAttribute("selectAllDayAdult", ts.selectAllDayAdult(date));
        model.addAttribute("selectAllDayKid", ts.selectAllDayKid(date));
        model.addAttribute("selectHalfDayAdult", ts.selectHalfDayAdult(date));
        model.addAttribute("selectHalfDayKid", ts.selectHalfDayKid(date));
        model.addAttribute("totalAllDayAdult", ts.totalAllDayAdult());
        model.addAttribute("totalAllDayKid", ts.totalAllDayKid());
        model.addAttribute("totalHalfDayAdult", ts.totalHalfDayAdult());
        model.addAttribute("totalHalfDayKid", ts.totalHalfDayKid());
        return "master/total";
    }

}
