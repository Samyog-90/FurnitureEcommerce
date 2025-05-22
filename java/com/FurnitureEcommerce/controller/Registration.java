package com.FurnitureEcommerce.controller;

import com.FurnitureEcommerce.model.usermodel;
import com.FurnitureEcommerce.service.register;
import com.FurnitureEcommerce.Util.ImageUtil;
import com.FurnitureEcommerce.Util.PasswordUtil;
import com.FurnitureEcommerce.Util.ValidationUtil;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;

import java.io.IOException;

@WebServlet(asyncSupported = true, urlPatterns = { "/Registration" })
@MultipartConfig(
    fileSizeThreshold = 1024 * 1024 * 2,
    maxFileSize = 1024 * 1024 * 10,
    maxRequestSize = 1024 * 1024 * 50
)
public class Registration extends HttpServlet {
    private static final long serialVersionUID = 1L;

    private final register registerService = new register();
    private final ImageUtil imageUtil = new ImageUtil();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.getRequestDispatcher("/WEB-INF/Pages/Registration.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            String validationMessage = validateForm(request);
            if (validationMessage != null) {
                handleError(request, response, validationMessage);
                return;
            }

            usermodel user = extractusermodel(request);
            boolean isRegistered = registerService.addUser(user);
            System.out.println("User registration status: " + isRegistered);

            if (isRegistered) {
                if (uploadImage(request)) {
                    handleSuccess(request, response, "Registration successful! Please login.", "/WEB-INF/Pages/Login.jsp");
                } else {
                    handleError(request, response, "Registration successful, but image upload failed.");
                }
            } else {
                handleError(request, response, "Registration failed. Please try again.");
            }

        } catch (Exception e) {
            e.printStackTrace();
            handleError(request, response, "An unexpected error occurred. Please try again.");
        }
    }

    private String validateForm(HttpServletRequest request) throws IOException, ServletException {
    	//image
        String firstName = request.getParameter("first-name");
        String lastName = request.getParameter("last-name");
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        String confirmPassword = request.getParameter("confirm-password");
        String Image = request.getParameter("Image");
        
        //image khai

        if (ValidationUtil.isNullOrEmpty(firstName)) return "First name is required.";
        if (ValidationUtil.isNullOrEmpty(lastName)) return "Last name is required.";
        if (ValidationUtil.isNullOrEmpty(email)) return "Email is required.";
        if (!ValidationUtil.isValidEmail(email)) return "Invalid email format.";
        if (ValidationUtil.isNullOrEmpty(password)) return "Password is required.";
        if (!ValidationUtil.isValidPassword(password)) return "Password must be at least 8 characters with 1 uppercase, 1 number, and 1 symbol.";
        if (!ValidationUtil.doPasswordsMatch(password, confirmPassword)) return "Passwords do not match.";
        if (!ValidationUtil.isNullOrEmpty(Image)) return "Image required.";
        
        Part image = request.getPart("profile-photo");
        if (!ValidationUtil.isValidImageExtension(image)) return "Invalid image format. Only jpg, jpeg, png, and gif allowed.";

        return null;
    }

    private usermodel extractusermodel(HttpServletRequest request) throws Exception {
        String firstName = request.getParameter("first-name");
        String lastName = request.getParameter("last-name");
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        

        String encryptedPassword = PasswordUtil.encrypt(email, password);
        Part image = request.getPart("profile-photo");
        String imageUrl = imageUtil.getImageNamePart(image);

        usermodel user = new usermodel();
        user.setUsername(firstName + " " + lastName);
        user.setFirstName(firstName);
        user.setLastName(lastName);
        user.setEmail(email);
        user.setPassword(encryptedPassword);
        user.setImage(imageUrl);
        user.setRole("customer");

        return user;
    }

    private boolean uploadImage(HttpServletRequest request) throws IOException, ServletException {
        Part image = request.getPart("profile-photo");
        return imageUtil.uploadImage(image, request.getServletContext().getRealPath("/"), "users");
    }

    private void handleError(HttpServletRequest request, HttpServletResponse response, String message) throws ServletException, IOException {
        request.setAttribute("error", message);
        request.setAttribute("firstName", request.getParameter("first-name"));
        request.setAttribute("lastName", request.getParameter("last-name"));
        request.setAttribute("email", request.getParameter("email"));
        request.setAttribute("Image", request.getParameter("Image"));
        request.getRequestDispatcher("/WEB-INF/Pages/Login.jsp").forward(request, response);
    }

    private void handleSuccess(HttpServletRequest request, HttpServletResponse response, String message, String redirectPage) throws ServletException, IOException {
        request.setAttribute("success", message);
        request.getRequestDispatcher(redirectPage).forward(request, response);
    }
}
