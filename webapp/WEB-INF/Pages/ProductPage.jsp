<!DOCTYPE html>
<html lang="en">
<head>
     <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Vintique - Shopping Cart</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/CSS/Product.css">
    <script src="${pageContext.request.contextPath}/js/cart.js"></script>
</head>
<body>
    <header>
        <div class="logo">VINTIQUE</div>
        <nav>
            <ul>
                <li>Home </li>
                <li>Product</li>
                <li>Blog</li>
                <li>About us </li>
                <li>Contact us </li>
                <li><img src="${pageContext.request.contextPath}/Images/cart.png" alt="Cart" class="cart-icon"></li>
            </ul>
        </nav>
    </header>

    <main>
        <h1>Our Products</h1>
        <div class="sofa-container">
            <div class="sofa">
                <img src="${pageContext.request.contextPath}/Images/sofa1.png" alt="Sofa 1">
                <p>Price: $499</p>
                <button class="add-to-cart">Add to Cart</button>
            </div>
            <div class="sofa">
                <img src="${pageContext.request.contextPath}/Images/chair2.png" alt="Sofa 2">
                <p>Price: $202</p>
                <button class="add-to-cart">Add to Cart</button>
            </div>
            <div class="sofa">
                <img src="${pageContext.request.contextPath}/Images/chair1.png" alt="Sofa 3">
                <p>Price: $322</p>
                <button class="add-to-cart">Add to Cart</button>
            </div>
            <div class="sofa">
                <img src="${pageContext.request.contextPath}/Images/dining1.png" alt="Sofa 4">
                <p>Price: $799</p>
                <button class="add-to-cart">Add to Cart</button>
            </div>
            <div class="sofa">
                <img src="${pageContext.request.contextPath}/Images/table1.png" alt="Sofa 5">
                <p>Price: $419</p>
                <button class="add-to-cart">Add to Cart</button>
            </div>
            <div class="sofa">
                <img src="${pageContext.request.contextPath}/Images/bed3.png" alt="Sofa 6">
                <p>Price: $999</p>
                <button class="add-to-cart">Add to Cart</button>
            </div>
            <div class="sofa">
                <img src="${pageContext.request.contextPath}/Images/sofa4.png" alt="Sofa 6">
                <p>Price: $789</p>
                <button class="add-to-cart">Add to Cart</button>
            </div>
            <div class="sofa">
                <img src="${pageContext.request.contextPath}/Images/sofa3.png" alt="Sofa 6">
                <p>Price: $899</p>
                <button class="add-to-cart">Add to Cart</button>
            </div>
            <div class="sofa">
                <img src="${pageContext.request.contextPath}/Images/table6.png" alt="Sofa 6">
                <p>Price: $209</p>
                <button class="add-to-cart">Add to Cart</button>
            </div>
            <div class="sofa">
                <img src="${pageContext.request.contextPath}/Images/dining6.png" alt="Sofa 6">
                <p>Price: $889</p>
                <button class="add-to-cart">Add to Cart</button>
            </div>
            <div class="sofa">
                <img src="${pageContext.request.contextPath}/Images/table5.png" alt="Sofa 6">
                <p>Price: $219</p>
                <button class="add-to-cart">Add to Cart</button>
            </div>
            <div class="sofa">
                <img src="${pageContext.request.contextPath}/Images/table2.png" alt="Sofa 6">
                <p>Price: $301</p>
                <button class="add-to-cart">Add to Cart</button>
            </div>
        </div>
    </main>
    <script>
    // Let's create a simple interactive example showing how "Add to Cart" functionality works in JSP

// This is the JavaScript function that would handle the "Add to Cart" button click
function addToCart(productId, productName, price) {
  // 1. Create form to submit data to server
  const form = document.createElement('form');
  form.method = 'POST';
  form.action = '${pageContext.request.contextPath}/cart';
  
  // 2. Add hidden fields with product information
  const actionField = document.createElement('input');
  actionField.type = 'hidden';
  actionField.name = 'action';
  actionField.value = 'add';
  form.appendChild(actionField);
  
  const idField = document.createElement('input');
  idField.type = 'hidden';
  idField.name = 'productId';
  idField.value = productId;
  form.appendChild(idField);
  
  const nameField = document.createElement('input');
  nameField.type = 'hidden';
  nameField.name = 'productName';
  nameField.value = productName;
  form.appendChild(nameField);
  
  const priceField = document.createElement('input');
  priceField.type = 'hidden';
  priceField.name = 'productPrice';
  priceField.value = price;
  form.appendChild(priceField);
  
  // 3. Append form to body and submit
  document.body.appendChild(form);
  form.submit();
  

}

// Example usage with your HTML structure:
document.addEventListener('DOMContentLoaded', function() {
  // Get all "Add to Cart" buttons
  const addToCartButtons = document.querySelectorAll('.add-to-cart');
  
  // Add click event listeners to each button
  addToCartButtons.forEach(button => {
    button.addEventListener('click', function() {
      // Get product information from the parent element
      const productContainer = this.closest('.sofa');
      const productImage = productContainer.querySelector('img');
      const productId = productImage.src.split('/').pop().split('.')[0]; // Extract ID from image name
      const productName = productImage.alt;
      const price = parseFloat(productContainer.querySelector('p').textContent.replace('Price: $', ''));
      
      // Call the addToCart function
      addToCart(productId, productName, price);
    });
  });
});
</script>
</body>
</html>