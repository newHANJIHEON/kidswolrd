package com.kidsworld.mvc;

import org.junit.Test;

public class TestString {

    @Test
    public void testString() {
        String date = "20220310";
        StringBuffer sb = new StringBuffer(date);
        sb.insert(4, '-');
        sb.insert(7, '-');
        date = sb.toString();
        System.out.println(date);
    }

}
