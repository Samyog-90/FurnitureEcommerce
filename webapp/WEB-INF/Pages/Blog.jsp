<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
 <link rel="stylesheet" type="text/css"
     href="${pageContext.request.contextPath}/CSS/Blog.css" />
</head>
<body>
  <header>
    <div class="navbar">
      <h1>VINTIQUE</h1>
      <nav>
        <a href="#">Home</a>
        <a href="#">Products</a>
        <a href="#">Blog</a>
        <a href="#">Contact</a>
        <a href="#">About Us</a>
      </nav>
    </div>
    <div class="breadcrumb">
      <p>Home &gt; Blog</p>
    </div>
  </header>

  <main>
    <!-- Blog Post Section -->
    <section class="blog-post fade-in">
      <h2>Why Vintique is a Leading Furniture Brand</h2>
      <img src="${pageContext.request.contextPath}/Images/Furniture image.jpg" alt="Furniture" class="blog-image"/>
      <p>
        At Vintique, we blend quality and innovation, delivering timeless designs that transform homes and offices.
      </p>
      <input type="checkbox" id="toggle" hidden>
      <div class="extra-content">
        <p>
          We take pride in creating furniture that is not only functional but also a statement of elegance. Each piece is designed to enhance your living space while maintaining exceptional comfort.
        </p>
        <p>
          Our artisans pay attention to detail, ensuring every curve, grain, and stitch reflects craftsmanship. Whether you're furnishing a cozy corner or a full living room, Vintique offers options that suit modern lifestyles with a classic touch.
        </p>
      </div>
      <label for="toggle" class="read-more-btn">Read More...</label>
    </section>

    <!-- Why Buy Section -->
    <section class="why-buy fade-in">
      <h3>Why Choose Vintique Furniture?</h3>
      <div class="why-content">
        <p>
          Choosing Vintique means choosing durability, luxury, and impeccable style. Our furniture is crafted to meet the highest standards, ensuring your home reflects the best in design.
        </p>
        <img src="${pageContext.request.contextPath}/Images/Chair image(1).jpg 	" alt="Why Vintique" class="why-image"/>
      </div>
    </section>

    <!-- Testimonials Section -->
<section class="testimonials">
  <h3>What Our Customers Are Saying..</h3>
  <div class="testimonial">
    <p>"Vintique has redefined my home with their unique and quality furniture. My living room now feels more inviting than ever!"</p>
    <p>- Amrita M., Happy Customer</p>
  </div>
  <div class="testimonial">
    <p>"The dining set I bought is beautiful and practical. It fits perfectly in my home, and I get so many compliments!"</p>
    <p>- Samyog B., Satisfied Customer</p>
  </div>
</section>

    <!-- FAQ Section -->
<section class="faq">
  <h3>Frequently Asked Questions</h3>
  <div class="faq-item">
    <h4>1. What makes Vintique different from other furniture brands?</h4>
    <p>Vintique blends classic designs with modern innovation, ensuring that each piece is not only functional but also stylish and durable.</p>
  </div>
  <div class="faq-item">
    <h4>2. Is the furniture customizable?</h4>
    <p>Yes, we offer a range of customization options to fit your unique style and space requirements.</p>
  </div>
  <div class="faq-item">
    <h4>3. How do I care for my Vintique furniture?</h4>
    <p>We recommend following the care guidelines provided with each piece, which include dusting, gentle cleaning, and avoiding direct sunlight.</p>
  </div>
</section>
</body>
</html>