<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page import="java.util.Date" %>

<%
    // Fallback values in case attributes are not set
    String orderNumber = (String) request.getAttribute("orderNumber");
    if (orderNumber == null) {
        orderNumber = "ORD-" + System.currentTimeMillis();
    }

    String paymentMethod = (String) request.getAttribute("paymentMethod");
    if (paymentMethod == null) {
        paymentMethod = "Credit Card";
    }

    String shippingAddress = (String) request.getAttribute("shippingAddress");
    if (shippingAddress == null) {
        shippingAddress = "Your shipping address will be displayed here";
    }

    Date now = new Date();
    Date deliveryDate = new Date(now.getTime() + 5 * 24 * 60 * 60 * 1000); // 5 days later
%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Order Confirmation - VINTIQUE</title>
    <link rel="stylesheet" type="text/css"
     href="${pageContext.request.contextPath}/CSS/checkout.css" />
 
    <style>
        /* Minimal styles for clarity */
        .confirmation-container {
            padding: 30px;
            text-align: center;
        }
        .info-group {
            margin: 10px 0;
        }
        .info-label {
            font-weight: bold;
        }
        .btn {
            padding: 10px 15px;
            text-decoration: none;
            margin: 5px;
        }
        .btn-primary { background-color: #4CAF50; color: white; }
        .btn-secondary { background-color: #f1f1f1; color: black; }
        .cart-icon {
            width: 24px;
            height: 24px;
        }
    </style>
</head>

<body>
    <header>
        <div class="logo">VINTIQUE</div>
        <nav>
            <ul>
                <li><a href="${pageContext.request.contextPath}/index.jsp">Home</a></li>
                <li><a href="${pageContext.request.contextPath}/products.jsp">Product</a></li>
                <li><a href="${pageContext.request.contextPath}/blog.jsp">Blog</a></li>
                <li><a href="${pageContext.request.contextPath}/about.jsp">About us</a></li>
                <li><a href="${pageContext.request.contextPath}/contact.jsp">Contact us</a></li>
                <li><a href="${pageContext.request.contextPath}/cart.jsp"><img src="${pageContext.request.contextPath}/Images/cart.png" alt="Cart" class="cart-icon"></a></li>
            </ul>
        </nav>
    </header>

    <main>
        <div class="confirmation-container">
            <div class="success-icon">
                <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" width="48" height="48">
                    <path d="M9 16.17L4.83 12l-1.42 1.41L9 19 21 7l-1.41-1.41L9 16.17z"/>
                </svg>
            </div>
            <h1 class="confirmation-title">Order Successfully Placed!</h1>
            <p class="confirmation-message">
                Thank you for your purchase. Your order has been received and is being processed.
                A confirmation email has been sent to your registered email address.
            </p>

            <div class="order-details">
                <h2>Order Details</h2>
                <div class="order-info">
                    <div class="info-group">
                        <div class="info-label">Order Number:</div>
                        <div class="info-value">#<%= orderNumber %></div>
                    </div>
                    <div class="info-group">
                        <div class="info-label">Order Date:</div>
                        <div class="info-value"><fmt:formatDate value="<%= now %>" pattern="MMMM dd, yyyy"/></div>
                    </div>
                    <div class="info-group">
                        <div class="info-label">Payment Method:</div>
                        <div class="info-value"><%= paymentMethod %></div>
                    </div>
                    <div class="info-group">
                        <div class="info-label">Shipping Address:</div>
                        <div class="info-value"><%= shippingAddress %></div>
                    </div>
                    <div class="info-group">
                        <div class="info-label">Estimated Delivery:</div>
                        <div class="info-value"><fmt:formatDate value="<%= deliveryDate %>" pattern="MMMM dd, yyyy"/></div>
                    </div>
                </div>

                <div class="info-group">
                    <div class="info-label">Order Summary:</div>
                    <div class="info-value">
                        <c:choose>
                            <c:when test="${not empty cart && not empty cart.total}">
                                Total: $<fmt:formatNumber value="${cart.total}" pattern="#,##0.00"/><br>
                                Items: ${cart.itemCount}
                            </c:when>
                            <c:otherwise>
                                Your order summary will be displayed here.
                            </c:otherwise>
                        </c:choose>
                    </div>
                </div>
            </div>

            <div class="action-buttons">
                <a href="${pageContext.request.contextPath}/index.jsp" class="btn btn-primary">Continue Shopping</a>
                <a href="${pageContext.request.contextPath}/orders.jsp" class="btn btn-secondary">View My Orders</a>
            </div>
        </div>
    </main>

    <script>
        if (!sessionStorage.getItem('orderConfirmed')) {
            sessionStorage.setItem('orderConfirmed', 'true');
            sessionStorage.setItem('orderNumber', 'ORD-' + Date.now().toString().substring(3));
        }
        sessionStorage.removeItem('cartItems');
    </script>
</body>
</html>