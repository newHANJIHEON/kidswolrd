package com.kidsworld.mvc.service;

import com.kidsworld.mvc.commons.utils.Criteria;
import com.kidsworld.mvc.commons.utils.PageMaker;
import com.kidsworld.mvc.commons.vo.TicketVO;
import com.kidsworld.mvc.commons.vo.UserVO;
import com.kidsworld.mvc.dao.TicketDAO;
import org.springframework.stereotype.Service;

import javax.inject.Inject;
import java.util.List;

@Service
public class TicketServiceImpl implements TicketService{

    @Inject
    TicketDAO dao;

    @Override
    public boolean buyTicket(TicketVO vo, int count) throws Exception {
        int result = 0;
        if (count > 0) {
            for (int i = 0; i < count; i ++) {
                dao.buyTicket(vo);
                result++;
            }
            return result > 0 ? true : false;
        } else {
            return true;
        }
    }

    @Override
    public void refundTicket(int tNum) throws Exception {
        if (tNum > 0) {
            TicketVO ticket = new TicketVO();
            ticket.settNum(tNum);
            dao.refundTicket(ticket);
        }
    }

    @Override
    public List<TicketVO> ticketList(Criteria cri) throws Exception {
        return dao.ticketList(cri);
    }

    @Override
    public void useTicket(int[] tNum) throws Exception {
        if (tNum != null) {
            for (int tn : tNum) {
                TicketVO ticket = new TicketVO();
                ticket.settNum(tn);
                dao.useTicket(ticket);
            }
        }
    }

    @Override
    public PageMaker ticketPageMaker(Criteria cri) throws Exception {
        PageMaker pageMaker = new PageMaker();
        pageMaker.setCri(cri);
        pageMaker.setDisplayPageNum(5);
        int totalCount = dao.ticketListCount(cri);
        pageMaker.setTotalCount(totalCount);
        return pageMaker;
    }

    @Override
    public List<TicketVO> usedTicketList(Criteria cri) throws Exception {
        return dao.usedTicketList(cri);
    }

    @Override
    public PageMaker usedTicketPageMaker(Criteria cri) throws Exception {
        PageMaker pageMaker = new PageMaker();
        pageMaker.setCri(cri);
        pageMaker.setDisplayPageNum(5);
        int totalCount = dao.usedTicketListCount(cri);
        pageMaker.setTotalCount(totalCount);
        return pageMaker;
    }

    @Override
    public void rollbackTicket(int[] tNum) throws Exception {
        if (tNum != null) {
            for (int tn : tNum) {
                TicketVO ticket = new TicketVO();
                ticket.settNum(tn);
                dao.rollbackTicket(ticket);
            }
        }
    }

    @Override
    public List<TicketVO> refundTicketList(Criteria cri) throws Exception {
        return dao.refundTicketList(cri);
    }

    @Override
    public PageMaker refundTicketPageMaker(Criteria cri) throws Exception {
        PageMaker pageMaker = new PageMaker();
        pageMaker.setCri(cri);
        pageMaker.setDisplayPageNum(5);
        int totalCount = dao.refundTicketListCount(cri);
        pageMaker.setTotalCount(totalCount);
        return pageMaker;
    }

    @Override
    public int selectAllDayAdult(String date) throws Exception {
        return dao.selectAllDayAdult(date);
    }

    @Override
    public int selectAllDayKid(String date) throws Exception {
        return dao.selectAllDayKid(date);
    }

    @Override
    public int selectHalfDayAdult(String date) throws Exception {
        return dao.selectHalfDayAdult(date);
    }

    @Override
    public int selectHalfDayKid(String date) throws Exception {
        return dao.selectHalfDayKid(date);
    }

    @Override
    public int totalAllDayAdult() throws Exception {
        return dao.totalAllDayAdult();
    }

    @Override
    public int totalAllDayKid() throws Exception {
        return dao.totalAllDayKid();
    }

    @Override
    public int totalHalfDayAdult() throws Exception {
        return dao.totalHalfDayAdult();
    }

    @Override
    public int totalHalfDayKid() throws Exception {
        return dao.totalHalfDayKid();
    }
}
