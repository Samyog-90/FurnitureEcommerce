<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>	
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Admin Dashboard</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <!-- FontAwesome (ensure you have it in your project or via CDN) -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css">
    <!-- Your CSS -->
    <link rel="stylesheet" type="text/css"
          href="${pageContext.request.contextPath}/CSS/admindashboard.css"/>
</head>
<body>
    <div class="container">
        <!-- Sidebar -->
        <nav class="sidebar">
            <div class="logo"><h2>Furniture Admin</h2></div>
            <ul class="nav-links">
                <li class="active"><a href="index.html"><i class="fas fa-home"></i> Dashboard</a></li>
                <li><a href="products.html"><i class="fas fa-couch"></i> Products</a></li>
                <li><a href="users.html"><i class="fas fa-users"></i> Users</a></li>
                <li><a href="orders.html"><i class="fas fa-shopping-cart"></i> Orders</a></li>
                <li class="logout"><a href="login.html"><i class="fas fa-sign-out-alt"></i> Logout</a></li>
            </ul>
        </nav>

        <!-- Main Content -->
        <main class="main-content">
            <header>
                <div class="header-title"><h1>Dashboard Overview</h1></div>
                <div class="admin-profile">
                    <span>Admin</span>
                    <img src="${pageContext.request.contextPath}/Images/api/placeholder/40/40" alt="Admin Avatar">
                </div>
            </header>

            <!-- Dashboard Cards -->
            <div class="dashboard-cards">
                <div class="card">
                    <div class="card-icon products-icon"><i class="fas fa-couch"></i></div>
                    <div class="card-info"><h3>Products</h3><p class="count" id="product-count">0</p></div>
                </div>
                <div class="card">
                    <div class="card-icon users-icon"><i class="fas fa-users"></i></div>
                    <div class="card-info"><h3>Users</h3><p class="count" id="user-count">0</p></div>
                </div>
                <div class="card">
                    <div class="card-icon orders-icon"><i class="fas fa-shopping-cart"></i></div>
                    <div class="card-info"><h3>Orders</h3><p class="count" id="order-count">0</p></div>
                </div>
                <div class="card">
                    <div class="card-icon revenue-icon"><i class="fas fa-dollar-sign"></i></div>
                    <div class="card-info"><h3>Revenue</h3><p class="count" id="revenue">$0</p></div>
                </div>
            </div>

            <!-- Recent Orders -->
            <div class="recent-container">
                <div class="recent-orders">
                    <div class="section-header">
                        <h2>Recent Orders</h2>
                        <a href="orders.html" class="view-all">View All</a>
                    </div>
                    <div class="table-container">
                        <table>
                            <thead>
                                <tr>
                                    <th>Order ID</th>
                                    <th>Customer</th>
                                    <th>Product</th>
                                    <th>Amount</th>
                                    <th>Status</th>
                                </tr>
                            </thead>
                            <tbody id="recent-orders-table">
                                <tr><td colspan="5" class="empty-message">No orders yet</td></tr>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </main>
    </div>

    <!-- JS for loading data -->
    <script>
        window.addEventListener('DOMContentLoaded', () => {
            const products = JSON.parse(localStorage.getItem('furnitureProducts')) || [];
            const users = JSON.parse(localStorage.getItem('furnitureUsers')) || [];
            const orders = JSON.parse(localStorage.getItem('furnitureOrders')) || [];

            document.getElementById('product-count').textContent = products.length;
            document.getElementById('user-count').textContent = users.length;
            document.getElementById('order-count').textContent = orders.length;

            let totalRevenue = 0;
            orders.forEach(order => {
                totalRevenue += parseFloat(order.amount.replace('$', ''));
            });
            document.getElementById('revenue').textContent = '$' + totalRevenue.toFixed(2);

            const recentOrdersTable = document.getElementById('recent-orders-table');
            if (orders.length > 0) {
                recentOrdersTable.innerHTML = '';
                const recentOrders = orders.slice(0, 5);
                recentOrders.forEach(order => {
                    const row = document.createElement('tr');
                    row.innerHTML = `
                        <td>${order.id}</td>
                        <td>${order.customer}</td>
                        <td>${order.product}</td>
                        <td>${order.amount}</td>
                        <td><span class="status ${order.status.toLowerCase()}">${order.status}</span></td>
                    `;
                    recentOrdersTable.appendChild(row);
                });
            }
        });
    </script>
</body>
</html>