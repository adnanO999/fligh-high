package com.generalfunctions;



public class GeneralFunctions {
	public static String parseDate(String s) {
		//   mm/dd/yyyy --> yyyy-mm-dd
		String fmtDate = null;
		if (s == null) {
            throw new java.lang.IllegalArgumentException();
        }
        
        int firstSlash = s.indexOf('/');
        int secondSlash = s.indexOf('/', firstSlash + 1);
        
        String month = s.substring(0,firstSlash);
        String day = s.substring(firstSlash+1,secondSlash);
        String year = s.substring(secondSlash+1);
        
        fmtDate = year+"-"+month+"-"+day;

        return fmtDate;
	}
}
