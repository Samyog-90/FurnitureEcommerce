package com.FurnitureEcommerce.service;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.FurnitureEcommerce.config.dbConfig;
import com.FurnitureEcommerce.model.usermodel;

/**
 * Register service class that handles user registration and role assignment.
 */
public class register {

    private Connection dbConn;

    /**
     * Constructor initializes the database connection.
     */
    public register() {
        try {
            this.dbConn = dbConfig.getDbConnection();
        } catch (SQLException | ClassNotFoundException ex) {
            System.err.println("Database connection error: " + ex.getMessage());
            ex.printStackTrace();
        }
    }

    /**
     * Adds a new user to the database.
     *
     * @param user the user model object containing user details
     * @return true if the registration is successful, false otherwise
     */
    public Boolean addUser(usermodel user) {
        if (dbConn == null) {
            System.err.println("Database connection is not available.");
            return false;
        }

        String roleQuery = "SELECT Role_ID FROM role WHERE RoleName = ?";
        String insertQuery = "INSERT INTO user (username, email, password, Image, Role_ID, firstName, lastName) VALUES (?, ?, ?, ?, ?, ?, ?)";

        try (
            PreparedStatement roleStmt = dbConn.prepareStatement(roleQuery);
            PreparedStatement insertStmt = dbConn.prepareStatement(insertQuery)
        ) {
            // Get Role_ID based on role name (e.g., "customer")
            roleStmt.setString(1, user.getRole());
            ResultSet result = roleStmt.executeQuery();
            int roleId = result.next() ? result.getInt("Role_ID") : 1; // Default to Role_ID = 1 if not found
            
            // Prepare insert
            insertStmt.setString(1, user.getUsername());
            insertStmt.setString(2, user.getEmail());
            insertStmt.setString(3, user.getPassword());
            insertStmt.setString(4, user.getImage());
            insertStmt.setInt(5, roleId);
            
            insertStmt.setString(6, user.getFirstName());
            insertStmt.setString(7, user.getLastName());
            

            // Debug log
            System.out.println("Registering user:");
            System.out.println("Username: " + user.getUsername());
            System.out.println("Email: " + user.getEmail());
            System.out.println("Role: " + user.getRole() + " => Role_ID: " + roleId);
            System.out.println("Image: " + user.getImage());
            System.out.println("FirstName: " + user.getFirstName());
            System.out.println(": " + user.getLastName());
           
            

            return insertStmt.executeUpdate() > 0;

        } catch (SQLException e) {
            System.err.println("Error during user registration: " + e.getMessage());
            e.printStackTrace();
            return false;
        }
    }
}