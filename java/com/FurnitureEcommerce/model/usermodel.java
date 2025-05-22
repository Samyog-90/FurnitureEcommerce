package com.FurnitureEcommerce.model;

public class usermodel {
    private String username;
    private String firstName;
    private String lastName;
    private String email;
    private String password;
    private String image;
    private String role; // ➕ Added role

    public usermodel() {
    }

    // Constructor for login (email + password)
    public usermodel(String email, String password) {
        this.email = email;
        this.password = password;
    }

    // Constructor for full registration (without role, defaults can be handled in service/db)
    public usermodel(String username, String email, String password, String image, String firstName, String lastName) {
        this.username = username;
        this.firstName = firstName;
        this.lastName = lastName;
        this.email = email;
        this.password = password;
        this.image = image;
    }

    // Optional: Full constructor including role
    public usermodel(String username, String email, String password, String image, String role, String lastName, String firstName) {
        this.username = username;
        this.firstName = firstName;
        this.lastName = lastName;
        this.email = email;
        this.password = password;
        this.image = image;
        this.role = role;
    }

    // Getters and Setters
    public String getUsername() {
        return username;
    }
    public void setUsername(String username) {
        this.username = username;
    }

    public String getFirstName() {
        return firstName;
    }
    public void setFirstName(String firstName) {
        this.firstName = firstName;
    }

    public String getLastName() {
        return lastName;
    }
    public void setLastName(String lastName) {
        this.lastName = lastName;
    }

    public String getEmail() {
        return email;
    }
    public void setEmail(String email) {
        this.email = email;
    }

    public String getPassword() {
        return password;
    }
    public void setPassword(String password) {
        this.password = password;
    }

    public String getImage() {
        return image;
    }
    public void setImage(String image) {
        this.image = image;
    }

    public String getRole() {
        return role;
    }
    public void setRole(String role) {
        this.role = role;
    }
}