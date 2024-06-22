<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href='https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css' rel='stylesheet'>
    <title>Page d'authentification</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f4;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
        }
        .container {
            background-color: #fff;
            padding: 20px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            border-radius: 8px;
        }
        .input-box {
            margin-bottom: 10px;
        }
        .input-box input {
            width: 100%;
            padding: 10px;
            margin-top: 5px;
            border: 1px solid #ccc;
            border-radius: 5px;
        }
        .btn {
            padding: 10px;
            background-color: #007bff;
            color: #fff;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            width: 100%;
        }
        .btn:hover {
            background-color: #0056b3;
        }
        .error-message {
            color: red;
            margin-top: 10px;
        }
        .success-message {
            color: green;
            margin-top: 10px;
        }
    </style>
</head>
<body>
    <div class="container">
        <form action="RegisterServlet" method="post" enctype="multipart/form-data">
            <h1>Register</h1>
            <div class="input-box">
                <input type="text" placeholder="Nom" name="nom" required>
                <i class='bx bxs-user-circle'></i>
            </div>
            <div class="input-box">
                <input type="text" placeholder="Matricule" name="matricule" required>
                <i class='bx bxs-user-circle'></i>
            </div>
            <div class="input-box">
                <input type="text" placeholder="Prénom" name="prenom" required>
                <i class='bx bxs-user-circle'></i>
            </div>
            <div class="input-box">
                <input type="password" placeholder="Mot de passe" name="password" required>
                <i class='bx bxs-lock-alt'></i>
            </div>
            <div class="input-box">
                <p>Division</p>
                <select id="division" name="division">
                    <option value="dep">DEP</option>
                    <option value="del">DEL</option>
                    <option value="dtb">DTB</option>
                    <option value="daaf">DAAF</option>
                    <option value="cid">CID</option>
                    <option value="cig">CIG</option>
                    <option value="cib">CIB</option>
                </select>
            </div>
            <button type="submit" class="btn">Register</button>
            <div class="login-link">
                <p>J'ai déjà un compte! <a href="login.html">Se connecter</a></p>
            </div>
            <div class="error-message">
                <% if (request.getAttribute("errorMessage") != null) { %>
                    <p class="error-message"><%= request.getAttribute("errorMessage") %></p>
                <% } else if (request.getAttribute("successMessage") != null) { %>
                    <p class="success-message"><%= request.getAttribute("successMessage") %></p>
                <% } %>
            </div>
            <div>
                <% if (request.getAttribute("connectionMessage") != null) { %>
                    <p><%= request.getAttribute("connectionMessage") %></p>
                <% } %>
            </div>
        </form>
    </div>
</body>
</html>
