<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
  <title>About Us - Vintique</title>
  <link rel="stylesheet" type="text/css"
     href="${pageContext.request.contextPath}/CSS/AboutUs.css"/>
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
      <p>Home &gt; About Us</p>
    </div>
  </header>

  <main>
    <!-- Introduction Section -->
    <section class="about-intro">
      <h2 class="section-title">Timeless Elegance. Modern Comfort.</h2>
      <img src="${pageContext.request.contextPath}/Image/set.jpg" alt="Furniture Set" class="intro-image" />
      <p>
        At VINTIQUE, we believe your home deserves furniture that tells a story. Blending vintage charm with contemporary aesthetics, our pieces are designed to transform any space into a statement.
      </p>
      <p>
        Founded with a passion for premium-quality design, VINTIQUE has become a trusted name in stylish, sustainable furniture. Whether it’s a cozy armchair, a stunning dining table, or a statement sofa, every product is crafted with care and built to last.
      </p>
    </section>

    <!-- What Sets Us Apart Section -->
    <section class="what-sets-us-apart">
      <h3>What Sets Us Apart</h3>
      <p><strong>&#10003; Handpicked Quality:</strong> Each item goes through a strict quality-check process to ensure you get nothing but the best.</p>
      <p><strong>&#10003; Timeless Design:</strong> Our pieces combine classic silhouettes with modern finishes to suit every taste.</p>
      <p><strong>&#10003; Sustainable Choice:</strong> We are committed to eco-friendly materials and ethical sourcing.</p>
    </section>

    <!-- Vision & Mission Section with Sofa Image -->
    <section class="vision-mission">
      <div class="vision-mission-content">
        <div class="vision">
          <h4>Our Vision</h4>
          <p>Every room tells a story—we're here to help you write yours with pieces that bring warmth, soul, and smart design.</p>
        </div>
        <div class="mission">
          <h4>Our Mission</h4>
          <p>To redefine modern interiors with furniture that's not only beautiful but built with purpose and passion.</p>
        </div>
      </div>
      <div class="sofa-visual">
        <img src="${pageContext.request.contextPath}/Image/set2.jpg" alt="Sofa Vision" class="sofa-side-image" />
      </div>
    </section>

    <!-- Explore Products Section -->
    <section class="explore-products">
      <h2 class="explore-heading">Explore Our Products</h2>
      <p>Browse our curated collection of stunning furniture pieces that blend form and function.</p>
      <a href="${pageContext.request.contextPath}/products.jsp" class="explore-btn">Shop Now</a>
    </section>

    <!-- Meet the Team Section -->
    <section class="team-section">
      <h3 class="team-heading">Let's Meet</h3>
      <h2 class="team-subheading">Our Team</h2>
      <div class="team-grid">
        <div class="team-member">
          <img src="${pageContext.request.contextPath}/Image/samyog.png" alt="Samyog Jung Basnet" />
          <p class="name">Samyog Jung Basnet</p>
        </div>
        <div class="team-member">
          <img src="${pageContext.request.contextPath}/Image/amrita.png" alt="Amrita Shahi" />
          <p class="name">Amrita Shahi</p>
        </div>
        <div class="team-member">
          <img src="${pageContext.request.contextPath}/Image/aashika.png" alt="Aashika Lamsal" />
          <p class="name">Aashika Lamsal</p>
        </div>
        <div class="team-member">
          <img src="${pageContext.request.contextPath}/Image/krisal.png" alt="Krishal" />
          <p class="name">Krishal</p>
        </div>
      </div>
    </section>
  </main>
</body>
</html>