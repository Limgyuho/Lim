package com.koreaIT.demo.util;

public class Util {

	
	public static boolean empty(Object obj) {
		
		if(obj == null) {
			return true;
		}
		
//		if(obj instanceof String == false) {
//			
//		}
		
		String str =(String) obj;
		
		
		
		return str.trim().length() == 0;
	}
}
