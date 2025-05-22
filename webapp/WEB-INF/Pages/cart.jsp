<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
  <link rel="stylesheet" type="text/css"
     href="${pageContext.request.contextPath}/CSS/cart.css"/>
</head>
<body>
<body>
    <header>
        <div class="logo">VINTIQUE</div>
        <nav>
            <ul>
                <li><a href="${pageContext.request.contextPath}/Home.jsp">Home</a></li>
                <li><a href="${pageContext.request.contextPath}/ProductPage.jsp">Product</a></li>
                <li><a href="${pageContext.request.contextPath}/Blog.jsp">Blog</a></li>
                <li><a href="${pageContext.request.contextPath}/AboutUs.jsp">About us</a></li>
                <li><a href="${pageContext.request.contextPath}/Contact.jsp">Contact us</a></li>
                <li><a href="${pageContext.request.contextPath}/cart.jsp"><img src="${pageContext.request.contextPath}/Images/cart.png" alt="Cart" class="cart-icon"></a></li>
            </ul>
        </nav>
    </header>

    <main>
        <div class="cart-container">
            <div class="cart-header">
                <h1 class="cart-title">Shopping Cart</h1>
                <a href="${pageContext.request.contextPath}/products.jsp" class="continue-shopping">← Continue Shopping</a>
            </div>
            
            <c:choose>
                <c:when test="${empty cart.items}">
                    <div class="cart-empty">
                        <h2>Your cart is empty</h2>
                        <p>Looks like you haven't added any items to your cart yet.</p>
                        <a href="${pageContext.request.contextPath}/products.jsp" class="shop-now-btn">Shop Now</a>
                    </div>
                </c:when>
                <c:otherwise>
                    <form action="${pageContext.request.contextPath}/cart" method="post" id="cartForm">
                        <input type="hidden" name="action" value="update">
                        
                        <div class="cart-items">
                            <table class="cart-table">
                                <thead>
                                    <tr>
                                        <th>Product</th>
                                        <th>Price</th>
                                        <th>Quantity</th>
                                        <th>Subtotal</th>
                                        <th></th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <c:forEach var="item" items="${cart.items}">
                                        <tr>
                                            <td data-label="Product">
                                                <div style="display: flex; align-items: center; gap: 15px;">
                                                    <img src="${pageContext.request.contextPath}/Images/${item.product.imageUrl}" alt="${item.product.name}" class="product-thumbnail">
                                                    <span class="product-name">${item.product.name}</span>
                                                </div>
                                            </td>
                                            <td data-label="Price" class="product-price">
                                                $<fmt:formatNumber value="${item.product.price}" pattern="#,##0.00"/>
                                            </td>
                                            <td data-label="Quantity">
                                                <div class="quantity-selector">
                                                    <button type="button" onclick="decrementQuantity(${item.product.id})">-</button>
                                                    <input type="number" name="quantity_${item.product.id}" id="quantity_${item.product.id}" 
                                                           value="${item.quantity}" min="1" max="10" 
                                                           onchange="updateSubtotal(${item.product.id}, ${item.product.price})">
                                                    <button type="button" onclick="incrementQuantity(${item.product.id})">+</button>
                                                </div>
                                            </td>
                                            <td data-label="Subtotal" class="product-subtotal" id="subtotal_${item.product.id}">
                                                $<fmt:formatNumber value="${item.product.price * item.quantity}" pattern="#,##0.00"/>
                                            </td>
                                            <td>
                                                <button type="button" class="remove-item" 
                                                        onclick="removeItem(${item.product.id})">✕</button>
                                            </td>
                                        </tr>
                                    </c:forEach>
                                </tbody>
                            </table>
                        </div>
                        
                        <div class="cart-actions">
                            <div class="coupon-section">
                                <input type="text" name="coupon" placeholder="Coupon code">
                                <button type="button" class="apply-coupon" onclick="applyCoupon()">Apply Coupon</button>
                            </div>
                            
                            <button type="submit" class="update-cart">Update Cart</button>
                            
                            <div class="cart-summary">
                                <h2 class="summary-title">Cart Summary</h2>
                                
                                <div class="summary-row">
                                    <span class="summary-label">Subtotal</span>
                                    <span class="summary-value">$<fmt:formatNumber value="${cart.subtotal}" pattern="#,##0.00"/></span>
                                </div>
                                
                                <c:if test="${not empty cart.discount}">
                                    <div class="summary-row">
                                        <span class="summary-label">Discount</span>
                                        <span class="summary-value">-$<fmt:formatNumber value="${cart.discount}" pattern="#,##0.00"/></span>
                                    </div>
                                </c:if>
                                
                                <div class="summary-row">
                                    <span class="summary-label">Shipping</span>
                                    <span class="summary-value">
                                        <c:choose>
                                            <c:when test="${cart.subtotal >= 500}">Free</c:when>
                                            <c:otherwise>$<fmt:formatNumber value="${cart.shipping}" pattern="#,##0.00"/></c:otherwise>
                                        </c:choose>
                                    </span>
                                </div>
                                
                                <div class="summary-row">
                                    <span class="summary-label">Tax</span>
                                    <span class="summary-value">$<fmt:formatNumber value="${cart.tax}" pattern="#,##0.00"/></span>
                                </div>
                                
                                <div class="summary-row summary-total">
                                    <span class="summary-label">Total</span>
                                    <span class="summary-value">$<fmt:formatNumber value="${cart.total}" pattern="#,##0.00"/></span>
                                </div>
                                
                                <a href="${pageContext.request.contextPath}/checkout.jsp" class="checkout-btn">Proceed to Checkout</a>
                            </div>
                        </div>
                    </form>
                </c:otherwise>
            </c:choose>
        </div>
    </main>
    
    <script>
        function incrementQuantity(productId) {
            const quantityInput = document.getElementById('quantity_' + productId);
            const currentValue = parseInt(quantityInput.value);
            if (currentValue < 10) {
                quantityInput.value = currentValue + 1;
                updateSubtotal(productId);
            }
        }
        
        function decrementQuantity(productId) {
            const quantityInput = document.getElementById('quantity_' + productId);
            const currentValue = parseInt(quantityInput.value);
            if (currentValue > 1) {
                quantityInput.value = currentValue - 1;
                updateSubtotal(productId);
            }
        }
        
        function updateSubtotal(productId, price) {
            const quantityInput = document.getElementById('quantity_' + productId);
            const subtotalElement = document.getElementById('subtotal_' + productId);
            const quantity = parseInt(quantityInput.value);
            const subtotal = quantity * price;
            subtotalElement.textContent = '$' + subtotal.toFixed(2);
        }
        
        function removeItem(productId) {
            if (confirm('Are you sure you want to remove this item from your cart?')) {
                fetch('${pageContext.request.contextPath}/cart', {
                    method: 'POST',
                    headers: {
                        'Content-Type': 'application/x-www-form-urlencoded',
                    },
                    body: `action=remove&productId=${productId}`
                })
                .then(response => {
                    if (response.ok) {
                        window.location.reload();
                    }
                });
            }
        }
        
        function applyCoupon() {
            document.getElementById('cartForm').action = '${pageContext.request.contextPath}/cart?action=applyCoupon';
            document.getElementById('cartForm').submit();
        }
    </script>
</body>
</body>
</html>