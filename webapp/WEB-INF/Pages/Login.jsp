<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
 <link rel="stylesheet" type="text/css"
     href="${pageContext.request.contextPath}/CSS/Login.css" />
</head>
<body>
<div class="container">
    <div class="left-side"></div>

    <div class="right-side">
      <h1 class="title">Welcome back to <br>Vintique Login</h1>
      <h2 class="subtitle">Please enter your information below</h2>

      <form>
        <div class="row">
          <label for="Username">Email:</label>
          <input type="text" id="email" name="=email" required />
        </div>

        <div class="row">
          <label for="Password">Password:</label>
          <input type="password" id="Password" name="Password" required />
        </div>

        <div class="checkbox-row">
          <label><input type="checkbox" /> Remember me</label>
          <a href="#">FORGOT PASSWORD?</a>
        </div>

        <div class="login-button">
          <button type="submit">LOGIN</button>
        </div>

        <div class="signup-link">
          Don't have an account? <a href="${pageContext.request.contextPath}/WEB-INF/Pages/Registration.jsp">Sign up</a>
        </div>
      </form>
    </div>
  </div>
</body>
</html>