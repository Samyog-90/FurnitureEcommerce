package com.FurnitureEcommerce.controller;

import com.FurnitureEcommerce.model.usermodel;
import com.FurnitureEcommerce.Util.SessionUtil;
import com.FurnitureEcommerce.Util.CookieUtil;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

/**
 * Login controller for handling user authentication.
 */
@WebServlet(asyncSupported = true, urlPatterns = { "/Login" })
public class Login extends HttpServlet {
	private static final long serialVersionUID = 1L;

	// Removed the problematic line:
	// private final Login loginService;

	public Login() {
		// No instantiation of itself needed.
	}

	/**
	 * Handles GET requests to show the login page.
	 */
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		System.out.println("Entered");
		request.getRequestDispatcher("/WEB-INF/Pages/Login.jsp").forward(request, response);
	}

	/**
	 * Handles POST requests for user login.
	 */
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String email = request.getParameter("email");
		String password = request.getParameter("password");

		usermodel user = new usermodel(email, password);
		Boolean loginSuccess = authenticateUser(user); // ✅ renamed for clarity

		if (loginSuccess != null && loginSuccess) {
			SessionUtil.setAttribute(request, "email", email);

			if ("admin@furniture.com".equalsIgnoreCase(email)) {
				CookieUtil.addCookie(response, "role", "admin", 30 * 5);
				response.sendRedirect(request.getContextPath() + "/admin/dashboard");
			} else {
				CookieUtil.addCookie(response, "role", "customer", 30 * 5);
				response.sendRedirect(request.getContextPath() + "/Home"); 
			}
		} else {
			handleLoginFailure(request, response, loginSuccess);
		}
	}

	/**
	 * Dummy login logic — replace this with actual user authentication logic.
	 */
	private static Boolean authenticateUser(usermodel user) {
		// TODO: Replace this with real logic (e.g., database lookup)
		// For now, we simulate a simple check:
		if ("admin@furniture.com".equals(user.getEmail()) && "admin123".equals(user.getPassword())) {
			return true;
		} else if ("user@furniture.com".equals(user.getEmail()) && "user123".equals(user.getPassword())) {
			return true;
		}
		return false;
	}	

	/**
	 * Handles login failures and sets appropriate error messages.
	 */
	private void handleLoginFailure(HttpServletRequest request, HttpServletResponse response, Boolean loginStatus)
			throws ServletException, IOException {
		String errorMessage;
		if (loginStatus == null) {
			errorMessage = "Server is currently unavailable. Please try again later.";
		} else {
			errorMessage = "Invalid email or password. Please try again.";
		}
		request.setAttribute("error", errorMessage);
		request.getRequestDispatcher("/WEB-INF/Pages/Home.jsp").forward(request, response);
	}
}