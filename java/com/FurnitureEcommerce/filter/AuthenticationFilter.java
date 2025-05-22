//package com.FurnitureEcommerce.filter;
//
//import jakarta.servlet.Filter;
//import jakarta.servlet.FilterChain;
//import jakarta.servlet.FilterConfig;
//import jakarta.servlet.ServletException;
//import jakarta.servlet.ServletRequest;
//import jakarta.servlet.ServletResponse;
//import jakarta.servlet.annotation.WebFilter;
//import jakarta.servlet.http.HttpServletRequest;
//import jakarta.servlet.http.HttpServletResponse;
//
//import java.io.IOException;
//
//import com.FurnitureEcommerce.Util.CookieUtil;
//import com.FurnitureEcommerce.Util.SessionUtil;
//
//@WebFilter(asyncSupported = true, urlPatterns = "/*")
//public class AuthenticationFilter implements Filter {
//
//    private static final String LOGIN = "/Login";
//    private static final String REGISTER = "/Registration";
//    private static final String HOME = "/Home";
//    private static final String ROOT = "/";
//    private static final String DASHBOARD = "/dashboard";
//
//    // Add these missing constants to avoid compilation errors
//    private static final String MODIFY_STUDENTS = "/modifyStudents";
//    private static final String STUDENT_UPDATE = "/updateStudent";
//    private static final String ADMIN_ORDER = "/adminOrders";
//    private static final String ABOUT = "/about";
//    private static final String CONTACT = "/contact";
//    private static final String ORDER_LIST = "/orders";
//    private static final String CART_LIST = "/cart";
//
//    @Override
//    public void init(FilterConfig filterConfig) throws ServletException {
//        // Initialization logic, if required
//    }
//
//    @Override
//    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
//            throws IOException, ServletException {
//
//        HttpServletRequest req = (HttpServletRequest) request;
//        HttpServletResponse res = (HttpServletResponse) response;
//
//        String uri = req.getRequestURI();
//
//        // Allow static resources
//        if (uri.endsWith(".png") || uri.endsWith(".jpg") || uri.endsWith(".css") || uri.endsWith(".js")) {
//            chain.doFilter(request, response);
//            return;
//        }
//
//        boolean isLoggedIn = SessionUtil.getAttribute(req, "username") != null;
//        String userRole = CookieUtil.getCookie(req, "role") != null
//                ? CookieUtil.getCookie(req, "role").getValue()
//                : null;
//
//        if ("admin".equals(userRole)) {
//            if (uri.endsWith(LOGIN) || uri.endsWith(REGISTER)) {
//                res.sendRedirect(req.getContextPath() + DASHBOARD);
//            } else if (uri.endsWith(DASHBOARD) || uri.endsWith(MODIFY_STUDENTS)
//                    || uri.endsWith(STUDENT_UPDATE) || uri.endsWith(ADMIN_ORDER)
//                    || uri.endsWith(HOME) || uri.endsWith(ROOT)) {
//                chain.doFilter(request, response);
//            } else {
//                res.sendRedirect(req.getContextPath() + DASHBOARD);
//            }
//        } else if ("user".equals(userRole)) {
//            if (uri.endsWith(LOGIN) || uri.endsWith(REGISTER)) {
//                res.sendRedirect(req.getContextPath() + HOME);
//            } else if (uri.endsWith(HOME) || uri.endsWith(ROOT) || uri.endsWith(ABOUT)
//                    || uri.endsWith(ABOUT) || uri.endsWith(CONTACT)
//                    || uri.endsWith(ORDER_LIST) || uri.endsWith(CART_LIST)) {
//                chain.doFilter(request, response);
//            } else {
//                res.sendRedirect(req.getContextPath() + HOME);
//            }
//        } else {
//            // Not logged in
//            if (uri.endsWith(LOGIN) || uri.endsWith(REGISTER) || uri.endsWith(HOME) || uri.endsWith(ROOT)) {
//                chain.doFilter(request, response);
//            } else {
//                res.sendRedirect(req.getContextPath() + LOGIN);
//            }
//        }
//    }
//
//    @Override
//    public void destroy() {
//        // Cleanup logic, if required
//    }
//}