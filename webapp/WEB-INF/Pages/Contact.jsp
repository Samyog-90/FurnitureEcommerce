<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
  <title>Contact Us - Vintique</title>
  <link rel="stylesheet" type="text/css"
        href="${pageContext.request.contextPath}/CSS/contactus.css"/>
</head>
<body>
  <header>
    <div class="navbar">
      <h1>VINTIQUE</h1>
      <nav>
        <a href="${pageContext.request.contextPath}/Pages/Home.jsp">Home</a>
        <a href="${pageContext.request.contextPath}/Pages/ProductPage.jsp">PRODUCT</a>
        <a href="${pageContext.request.contextPath}Blog.jsp">BLOG</a>
        <a href="${pageContext.request.contextPath}/Pages/contact.jsp" class="active">CONTACT</a>
        <a href="${pageContext.request.contextPath}/about.jsp">AboutUs</a>
      </nav>
    </div>
    <div class="breadcrumb">
      <p>Home &gt; Contact Us</p>
    </div>
  </header>

  <main>
    <section class="contact-hero fade-in">
      <h2>We’d Love to Hear From You</h2>
      <p>Whether you're looking for product info, need help, or just want to say hello — our team is here for you.</p>
      <!-- ✅ Fixed image path -->
      <img src="${pageContext.request.contextPath}/Images/contact.jpg"
           alt="Warm and cozy Vintique showroom"
           class="contact"/>
    </section>

    <section class="contact-content fade-in">
      <div class="contact-wrapper">
        <div class="contact-details">
          <h3>Contact Information</h3>
          <p><strong>Address:</strong> 123 Vintique Lane, Kathmandu, Nepal</p>
          <p><strong>Email:</strong> <a href="mailto:support@vintique.com">support@vintique.com</a></p>
          <p><strong>Phone:</strong> <a href="tel:+9779840077880">+977 9840077880</a></p>
          <p><strong>Business Hours:</strong> Sunday - Friday, 9AM - 6PM</p>
        </div>

        <form class="contact-form" onsubmit="handleSubmit(event)">
          <h3>Send Us a Message</h3>
          <input type="text" name="name" placeholder="Your Name" required />
          <input type="email" name="email" placeholder="Your Email" required />
          <textarea name="message" rows="5" placeholder="Your Message" required></textarea>
          <button type="submit">Send Message</button>
          <p class="form-success" id="success-message" style="display: none;">
            Thanks for reaching out! We'll get back to you soon.
          </p>
        </form>
      </div>
    </section>

    <section class="contact-map">
      <h3>Find Us On The Map</h3>
      <iframe 
        src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d14179.138208268542!2d85.32723216819718!3d27.70330361845744!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x39eb18a85ab99991%3A0x2c7e9b4b39e72ff1!2sVintique%20Lane!5e0!3m2!1sen!2snp!4v1677327026340!5m2!1sen!2snp" 
        width="100%" height="400" style="border:0;" allowfullscreen="" loading="lazy"
        referrerpolicy="no-referrer-when-downgrade">
      </iframe>
    </section>
  </main>

  <footer>
    <div class="footer-content">
      <div class="footer-links">
        <h4>Quick Links</h4>
        <ul>
          <li><a href="${pageContext.request.contextPath}/index.jsp">Home</a></li>
          <li><a href="${pageContext.request.contextPath}/products.jsp">Products</a></li>
          <li><a href="${pageContext.request.contextPath}/about.jsp">About Us</a></li>
          <li><a href="${pageContext.request.contextPath}/blog.jsp">Blog</a></li>
          <li><a href="${pageContext.request.contextPath}/Pages/contact.jsp">Contact</a></li>
        </ul>
      </div>
      <div class="footer-info">
        <h4>Contact Us</h4>
        <p>123 Vintique Lane, Kathmandu, Nepal</p>
        <p>Email: <a href="mailto:support@vintique.com">support@vintique.com</a></p>
        <p>Phone: <a href="tel:+9779840077880">+977 9840077880</a></p>
      </div>
      <div class="footer-social">
        <h4>Follow Us</h4>
        <ul>
          <li><a href="#">Instagram</a></li>
          <li><a href="#">Facebook</a></li>
          <li><a href="#">Twitter</a></li>
        </ul>
      </div>
    </div>

    <div class="footer-bottom">
      <div class="footer-copy">
        <p>&copy; 2025 Vintique. All rights reserved.</p>
      </div>
    </div>
  </footer>

  <script>
    function handleSubmit(event) {
      event.preventDefault();
      document.getElementById('success-message').style.display = 'block';
    }
  </script>
</body>
</html>