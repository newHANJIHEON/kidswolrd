package com.kidsworld.mvc.dao;

import com.kidsworld.mvc.commons.utils.Criteria;
import org.apache.ibatis.jdbc.SQL;

public class TicketProvider {

    public String searchCustomerTicket(Criteria cri) {
        SQL sql = new SQL();

        sql.SELECT("*");
        sql.FROM("kidslandTicket");

        getSearchWhere(cri, sql);

        sql.ORDER_BY("sellDate");
        sql.LIMIT(cri.getPageStart() + ", " + cri.getPerPageNum());

        String query = sql.toString();
        System.out.println("검색된 query : " + query);
        return query;
    }

    public String ticketListCount(final Criteria cri) {
        return new SQL() {
            {
                SELECT("count(*)");
                FROM("kidslandTicket");
                getSearchWhere(cri, this);
            }
        }.toString();
    }

    public void getSearchWhere(Criteria cri, SQL sql) {
        if (cri.getSearchType() != null && !cri.getSearchType().equals("")) {

            //미리 매개변수를 받는 조건절을 만들어두고 switch case로 받는다.

            String common = "used = 'N'";
            String uPhoneNumberQuery = "uPhoneNum LIKE CONCAT('%', '" + cri.getUPhoneNum() + ")";
            String uNameQuery = "uName = " + cri.getUName() + ")";

            if ("p".equals(cri.getSearchType())) {
                sql.WHERE(uPhoneNumberQuery).AND().WHERE(common);
            } else if ("n".equals(cri.getSearchType())) {
                sql.WHERE(uNameQuery).AND().WHERE(common);
            } else if ("pn".equals(cri.getSearchType())) {
                sql.WHERE(uPhoneNumberQuery).AND().WHERE(uNameQuery).AND().WHERE(common);
            }
        }
    }

}
