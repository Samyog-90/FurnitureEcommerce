package com.FurnitureEcommerce.config;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class dbConfig {

    private static final String DB_URL = "jdbc:mysql://localhost:3306/furnitureecommerce";
    private static final String DB_USER = "root";
    private static final String DB_PASSWORD = ""; // XAMPP default has no password

    public static Connection getDbConnection() throws SQLException, ClassNotFoundException {
        Class.forName("com.mysql.cj.jdbc.Driver"); // Make sure you have this driver
        return DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD);
    }
}
