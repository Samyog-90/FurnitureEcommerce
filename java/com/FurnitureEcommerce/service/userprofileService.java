//package com.FurnitureEcommerce.service;
//
//import com.FurnitureEcommerce.model.usermodel;
//
//import java.sql.*;
//
//public class userprofileService {
//
//    // Change these to your actual DB config
//    private static final String DB_URL = "jdbc:mysql://localhost:3306/your_db_name";
//    private static final String DB_USER = "your_db_user";
//    private static final String DB_PASSWORD = "your_db_password";
//
//    // Load driver and get connection
//    private Connection getConnection() throws SQLException {
//        try {
//            Class.forName("com.mysql.cj.jdbc.Driver");  // or your DB driver class
//        } catch (ClassNotFoundException e) {
//            e.printStackTrace();
//        }
//        return DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD);
//    }
//
//    public usermodel getUserByEmail(String email) {
//        usermodel user = null;
//        String sql = "SELECT * FROM users WHERE email = ?";
//
//        try (Connection conn = getConnection();
//             PreparedStatement stmt = conn.prepareStatement(sql)) {
//
//            stmt.setString(1, email);
//            ResultSet rs = stmt.executeQuery();
//
//            if (rs.next()) {
//                user = new usermodel();
//                user.setUsername(rs.getString("username"));  // adjust if your DB columns differ
//                user.setFirstName(rs.getString("firstName"));
//                user.setLastName(rs.getString("lastName"));
//                user.setEmail(rs.getString("email"));
//                user.setPassword(rs.getString("password"));
//                user.setImage(rs.getString("image"));  // adjust type as needed
//            }
//
//        } catch (SQLException e) {
//            e.printStackTrace();
//        }
//        return user;
//    }
//
//    public boolean updateUser(usermodel user) {
//        String sql = "UPDATE users SET firstName = ?, lastName = ?, email = ? WHERE username = ?";
//
//        try (Connection conn = getConnection();
//             PreparedStatement stmt = conn.prepareStatement(sql)) {
//
//            stmt.setString(1, user.getFirstName());
//            stmt.setString(2, user.getLastName());
//            stmt.setString(3, user.getEmail());
//            stmt.setString(4, user.getUsername());
//
//            int rowsUpdated = stmt.executeUpdate();
//            return rowsUpdated > 0;
//
//        } catch (SQLException e) {
//            e.printStackTrace();
//        }
//        return false;
//    }
//}