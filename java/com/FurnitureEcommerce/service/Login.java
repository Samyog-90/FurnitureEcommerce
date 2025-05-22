package com.FurnitureEcommerce.service;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.FurnitureEcommerce.config.dbConfig;
import com.FurnitureEcommerce.model.usermodel;
import com.FurnitureEcommerce.Util.PasswordUtil;

public class Login {

    private Connection dbConn;
    private boolean isConnectionError = false;

    public Login() {
        try {
            dbConn = dbConfig.getDbConnection();
        } catch (SQLException | ClassNotFoundException ex) {
            ex.printStackTrace();
            isConnectionError = true;
        }
    }

    public boolean loginUser(usermodel userModel) {
        if (isConnectionError) {
            System.out.println("Connection Error");
            return false;
        }

        String query = "SELECT username, password FROM user WHERE username = ?";
        try (PreparedStatement stmt = dbConn.prepareStatement(query)) {
            stmt.setString(1, userModel.getUsername());
            ResultSet result = stmt.executeQuery();

            if (result.next()) {
                return validatePassword(result, userModel);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return false;
    }

    private boolean validatePassword(ResultSet result, usermodel userModel) throws SQLException {
        String dbUsername = result.getString("username");
        String dbPassword = result.getString("password");

        // Use your own decryption or hashing validation logic
        return dbUsername.equals(userModel.getUsername()) &&
               PasswordUtil.decrypt(dbPassword, dbUsername).equals(userModel.getPassword());
    }
}