package com.imut.journal.util;

import java.util.UUID;

public class UuidUtil {
	
    public static void main(String[] args) {        
        System.out.println(UuidUtil.Uuid());
    }
    //得到uuid
    public final static String Uuid() {
    	UUID uuid = UUID.randomUUID();
    	String s = uuid.toString();
    	return s.substring(0,8)+s.substring(9,13)+s.substring(14,18)+s.substring(19,23)+s.substring(24);
    }
}
