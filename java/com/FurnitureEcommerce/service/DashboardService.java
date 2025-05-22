package com.FurnitureEcommerce.service;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

import com.FurnitureEcommerce.model.RecentOrder;

public class DashboardService {

    private final String url = "jdbc:mysql://localhost:3306/furnitureecommerce";
    private final String user = "root";
    private final String password = "";

    private Connection getConnection() throws SQLException {
        return DriverManager.getConnection(url, user, password);
    }

    public int getTotalProducts() {
        return getCount("SELECT COUNT(*) FROM product");
    }

    public int getTotalUsers() {
        return getCount("SELECT COUNT(*) FROM user");
    }

    public int getTotalOrders() {
        return getCount("SELECT COUNT(*) FROM orders");
    }

    public double getTotalRevenue() {
        String query = "SELECT SUM(total_amount) FROM orders";
        try (Connection conn = getConnection();
             PreparedStatement ps = conn.prepareStatement(query);
             ResultSet rs = ps.executeQuery()) {

            if (rs.next()) {
                return rs.getDouble(1);
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }
        return 0.0;
    }

    public List<RecentOrder> getRecentOrders(int limit) {
        List<RecentOrder> orders = new ArrayList<>();
        String query = """
                SELECT o.order_id, u.firstName, p.name AS product_name, o.total_amount
                FROM orders o
                JOIN user u ON o.user_id = u.user_id
                JOIN product p ON o.product_id = p.product_id
                ORDER BY o.order_date DESC
                LIMIT ?
                """;

        try (Connection conn = getConnection();
             PreparedStatement ps = conn.prepareStatement(query)) {

            ps.setInt(1, limit);

            try (ResultSet rs = ps.executeQuery()) {
                while (rs.next()) {
                    RecentOrder order = new RecentOrder();
                    order.setOrderId(rs.getInt("order_id"));
                    order.setCustomerName(rs.getString("firstName"));
                    order.setProductName(rs.getString("product_name"));
                    order.setAmount(rs.getDouble("total_amount"));
                    order.setStatus("Pending"); // Placeholder, since no status field in DB
                    orders.add(order);
                }
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }

        return orders;
    }

    private int getCount(String query) {
        try (Connection conn = getConnection();
             PreparedStatement ps = conn.prepareStatement(query);
             ResultSet rs = ps.executeQuery()) {

            if (rs.next()) {
                return rs.getInt(1);
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }

        return 0;
    }
}