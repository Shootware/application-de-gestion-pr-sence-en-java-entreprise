<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Page d'accueil</title>
    <style>
        /* Reset CSS */
        body, h1, p, a {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        /* Global Styles */
        body {
            font-family: Arial, sans-serif;
            background-color: #f0f2f5;
        }

        /* Header Styles */
        header {
            background-color: #3b5998;
            color: #fff;
            padding: 10px 20px;
            text-align: center;
        }

        header h1 {
            font-size: 24px;
            font-weight: 900;
            letter-spacing: -1px;
        }

        /* Content Styles */
        .content {
            padding: 20px;
            max-width: 800px;
            margin: 20px auto;
            background-color: #fff;
            border-radius: 8px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }

        .welcome-text {
            font-size: 18px;
            margin-bottom: 20px;
        }

        .logout-link {
            display: inline-block;
            padding: 10px 20px;
            background-color: #1877f2;
            color: #fff;
            text-decoration: none;
            border-radius: 5px;
            transition: background-color 0.3s ease;
        }

        .logout-link:hover {
            background-color: #0e5a8a;
        }

        /* Footer Styles */
        footer {
            text-align: center;
            margin-top: 20px;
            color: #999;
            font-size: 14px;
        }
    </style>
</head>
<body>
    <!-- Header -->
    <header>
        <h1>Bienvenue</h1>
    </header>

    <!-- Content -->
    <div class="content">
        <p class="welcome-text">Bienvenue sur notre plateforme, <%= session.getAttribute("username") %> !</p>
        <a href="login.jsp" class="logout-link">Se déconnecter</a>
    </div>

    <!-- Footer -->
    <footer>
        © 2024 Plateforme - Confidentialité · Conditions générales · Publicité · Choix publicitaires · Cookies ·
    </footer>
</body>
</html>
