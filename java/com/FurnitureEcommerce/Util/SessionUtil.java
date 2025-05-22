package com.FurnitureEcommerce.Util;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;
/*
 * Utility class for managing HTTP sessions in a web application.
 * Provides methods to set, get, remove session attributes and invalidate sessions.
 */
public class SessionUtil {
    
   
	 public static void setAttribute(HttpServletRequest request, String key, Object value) {
	        HttpSession session = request.getSession();
	        session.setAttribute(key, value);
	    }

    public static Object getAttribute(HttpServletRequest request, String key) {
        HttpSession session = request.getSession(false);
        if (session != null) {
            return session.getAttribute(key);
        }
        return null;
    }

    public static void removeAttribute(HttpServletRequest request, String key) {
        HttpSession session = request.getSession(false);
        if (session != null) {
            session.removeAttribute(key);
        }
    }

  
    public static void invalidateSession(HttpServletRequest request) {
        HttpSession session = request.getSession(false);
        if (session != null) {
            session.invalidate();
        }
    }
}