<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="fr">
<html>
<head>
    <meta charset="utf_8">
    <meta name="viewport" content="width=divice-width,initial-scale=1.0">
    <link href='https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css' rel='stylesheet'>
    <title>Page d'authentification</title>
    <link rel="stylesheet" href="login.css">

</head>
<body>
     <div class="wrapper">
        <form action="loginservlet" method="post">
            <h1>Login</h1>
            <div class="input-box">
                <input type="text" placeholder="username" name="textName" required>
                <i class='bx bxs-user-circle'></i>
            </div>
            <div class="input-box">
                <input type="password" placeholder="password" name="textPwd" required>
                <i class='bx bxs-lock-alt'></i>
            </div>
            <div class="remember-forgot">
                <label><input type="checkbox">Remember me</label>
                <a href="#">Forget password</a>
            </div>
            <button type="submit" class="btn"><p>Login</p></button>
            <div class="register-link">
            <p>Don't have account? <a href="register.jsp">Register</a></p>
            <div class="error-container">
                <%-- Affichage du message d'erreur --%>
                <% if (request.getAttribute("errorMessage") != null) { %>
                    <p class="error-message"><%= request.getAttribute("errorMessage") %></p>
                <% } %>
            </div>
        </form>
     </div>
</body>
</html>