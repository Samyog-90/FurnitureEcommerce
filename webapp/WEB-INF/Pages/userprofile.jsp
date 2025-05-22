<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.FurnitureEcommerce.model.usermodel" %>
<%
    // Assuming you pass 'user' attribute from servlet as usermodel object
    usermodel user = (usermodel) request.getAttribute("user");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>User Profile</title>
<link rel="stylesheet" type="text/css"
     href="${pageContext.request.contextPath}/CSS/userprofile.css"/>
</head>
<body>
    <div class="container">
        <div class="profile-card">
            <div class="profile-header">
                <h1>User Profile</h1>
                <form action="${pageContext.request.contextPath}/logout" method="post" style="display:inline;">
                    <button type="submit" id="logout-btn">Log Out</button>s
                </form>
            </div>
            
            <div class="profile-content">
                <form action="${pageContext.request.contextPath}/userprofile" method="post" enctype="multipart/form-data">
                    <div class="profile-image-container">
                        <div class="profile-image">
                            <img id="user-photo" 
                                src="<%= (user != null && user.getImage() != null && !user.getImage().isEmpty()) ? user.getImage() : 
                                    (request.getContextPath() + "/api/placeholder/150/150") %>" 
                                alt="User Photo" style="max-width:150px; max-height:150px;">
                        </div>
                        <label for="photo-upload" class="change-photo-btn">Change Photo</label>
                        <input type="file" id="photo-upload" name="image" accept="image/*">
                    </div>
                    
                    <div class="profile-details">
                        <div class="input-group">
                            <label for="first-name">First Name</label>
                            <input type="text" id="first-name" name="firstName" 
                                value="<%= user != null ? user.getFirstName() : "" %>" required>
                        </div>
                        
                        <div class="input-group">
                            <label for="last-name">Last Name</label>
                            <input type="text" id="last-name" name="lastName" 
                                value="<%= user != null ? user.getLastName() : "" %>" required>
                        </div>
                        
                        <div class="input-group">
                            <label for="email">Email</label>
                            <input type="email" id="email" name="email" 
                                value="<%= user != null ? user.getEmail() : "" %>" required>
                        </div>
                        
                        <button type="submit" id="save-btn">Save Changes</button>
                    </div>
                </form>
            </div>
        </div>
    </div>

    <script>
        // Photo upload preview
        document.addEventListener('DOMContentLoaded', function() {
            const photoUpload = document.getElementById('photo-upload');
            const userPhoto = document.getElementById('user-photo');
            
            photoUpload.addEventListener('change', function(event) {
                const file = event.target.files[0];
                if (file) {
                    const reader = new FileReader();
                    reader.onload = function(e) {
                        userPhoto.src = e.target.result;
                    };
                    reader.readAsDataURL(file);
                }
            });
        });
    </script>
</body>
</html>