<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Registration</title>
    <link rel="stylesheet" type="text/css"
     href="${pageContext.request.contextPath}/CSS/Registration.css" />
</head>
<body>
    <div class="container">
        <div class="registration-form">
            <h1>REGISTRATION</h1>
            
            <form action="Registration" method="post" enctype="multipart/form-data">
                <div class="photo-upload">
                    <div class="photo-container" id="photo-preview">
                        <img id="profile-image" src="avatar-placeholder.png" alt="Profile Photo">
                    </div>
                    
                    <input type="file" id="profile-photo" name="profile-photo" accept="image/*" style="display: none;">
                </div>
                
                <div class="input-group">
                    <input type="text" id="first-name" name="first-name" required>
                    <label for="firstName">FIRST NAME</label>
                </div>
                
                <div class="input-group">
                    <input type="text" id="last-name" name="last-name" required>
                    <label for= "lastName">LAST NAME</label>
                </div>
                
                <div class="input-group">
                    <input type="email" id="email" name="email" required>
                    <label for="email">EMAIL</label>
                </div>
                
                <div class="input-group">
                    <input type="password" id="password" name="password" required>
                    <label for="password">PASSWORD</label>
                </div>
                
                <div class="input-group">
                    <input type="password" id="confirm-password" name="confirm-password" required>
                    <label for="confirm-password">CONFIRM PASSWORD</label>
                </div>
                
                <button type="submit" class="create-account-btn">CREATE ACCOUNT</button>
            </form>
        </div>
    </div>

    <script>
        document.getElementById('profile-photo').addEventListener('change', function(e) {
            const file = e.target.files[0];
            if (file) {
                const reader = new FileReader();
                reader.onload = function(event) {
                    document.getElementById('profile-image').src = event.target.result;
                };
                reader.readAsDataURL(file);
            }
        });

        document.getElementById('photo-preview').addEventListener('click', function() {
            document.getElementById('profile-photo').click();
        });
    </script>
</body>
</html>