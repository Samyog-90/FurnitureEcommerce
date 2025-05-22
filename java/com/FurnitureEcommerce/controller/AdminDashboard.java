package com.FurnitureEcommerce.controller;

import com.FurnitureEcommerce.model.RecentOrder;
import com.FurnitureEcommerce.service.DashboardService;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.util.List;

@WebServlet("/AdminDashboard")
public class AdminDashboard extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private DashboardService dashboardService;

    @Override
    public void init() throws ServletException {
        dashboardService = new DashboardService();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            int totalProducts = dashboardService.getTotalProducts();
            int totalUsers = dashboardService.getTotalUsers();
            int totalOrders = dashboardService.getTotalOrders();
            double totalRevenue = dashboardService.getTotalRevenue();
            List<RecentOrder> recentOrders = dashboardService.getRecentOrders(5); // get last 5 orders

            request.setAttribute("totalProducts", totalProducts);
            request.setAttribute("totalUsers", totalUsers);
            request.setAttribute("totalOrders", totalOrders);
            request.setAttribute("totalRevenue", totalRevenue);
            request.setAttribute("recentOrders", recentOrders);

            request.getRequestDispatcher("/WEB-INF/Pages/AdminDashboard.jsp").forward(request, response);
        } catch (Exception e) {
            e.printStackTrace();
            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Error loading dashboard.");
        }
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }
}