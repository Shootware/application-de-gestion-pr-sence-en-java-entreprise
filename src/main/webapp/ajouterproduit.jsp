<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="fr">
<head>
  <meta charset="UTF-8" />
  <title>Ajouter un Produit</title>
  <link rel="stylesheet" type="text/css" href="styles.css">
  
  <style>
    /* Votre style CSS ici */
    @import url("https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700;800;900&display=swap");
    * {
      font-family: "Poppins", sans-serif;
      margin: 0;
      padding: 0;
      box-sizing: border-box;
    }
    body {
      display: flex;
      justify-content: center;
      align-items: center;
      min-height: 100vh;
      background: url('pexels-cottonbro-studio-5081399.jpg') no-repeat;
      background-size: cover;
      background-position: center;
    }
    .wrapper {
      width: 420px;
      background: transparent;
      backdrop-filter: blur(20px);
      border: 2px solid rgba(255, 255, 255, 2);
      box-shadow: 0 0 10px rgba(0, 0, 0, .2);
      color: aliceblue;
      border-radius: 10px;
      padding: 30px 40px;
    }
    .wrapper h1 {
      font-size: 36px;
      text-align: center;
    }
    .wrapper .input-box {
      width: 100%;
      height: 50px;
      margin: 30px 0px;
      position: relative;
    }
    .input-box input {
      width: 100%;
      height: 100%;
      background: transparent;
      border: none;
      outline: none;
      border: 2px solid rgba(255, 255, 255, 2);
      border-radius: 40px;
      font-size: 16px;
      color: rgb(15, 15, 15);
      padding: 20px 45px 20px 20px;
    }
    .input-box input::placeholder {
      color: aliceblue;
    }
    .input-box i {
      position: absolute;
      right: 20px;
      top: 50%;
      transform: translateY(-50%);
      font-size: 20px;
    }
    .accueil{
    list-style:none;
    text-align:center;
    background-color:white;
    margin-left:150px;
    text-decoration:none;
    color:black;
    border:1px solid black;
    width:100px
    height:52px;
    }
    .register-link p {
      font-size: 36px;
      color: black;
    }
    .wrapper .btn {
      width: 100%;
      height: 40px;
      background: #fff;
      border: none;
      outline: none;
      border-radius: 40px;
      box-shadow: 0 0 10px rgba(0, 0, 0, .1);
      cursor: pointer;
      font-size: 16px;
      color: #333;
      font-weight: 600;
      transition: all 0.3s;
    }
    .wrapper .btn:hover {
      transform: scale(1.1);
      background-color: black;
    }
    .wrapper .btn p {
      transition: all 0.3s;
    }
    .wrapper .btn p:hover {
      color: white;
    }
    .wrapper .register-link {
      font-size: 14.5px;
      text-align: center;
      margin: 20px 0 15px;
    }
    .error-message {
        color: red;
    }
  </style>
</head>
<body>
    <div class="wrapper">
        <h1>Ajouter un Produit</h1>
        <%-- Affichage des messages d'erreur s'il y en a --%>
        <c:if test="${not empty errorMessage}">
            <p class="error-message">${errorMessage}</p>
        </c:if>
        <form action="AjouterProduitServletBon2" method="post">
           <div class="input-box">
               <input type="text" placeholder="Nom du produit"  name="nom" required>
               <i class='bx bxs-user-circle'></i>
           </div>
           <div class="input-box">
               <input type="text" placeholder="Catégorie" name="categorie" required>
               <i class='bx bxs-user-circle'></i>
            </div>
            <div class="input-box">
               <input type="date" placeholder="Date" name="date" required>
               <i class='bx bxs-user-circle'></i>
            </div>
           <button type="submit" class="btn">Ajouter</button>
         <% if (request.getAttribute("errorMessage") != null) { %>
    <p class="error-message" style="color: red;"><%= request.getAttribute("errorMessage") %></p>
<% } else if (request.getAttribute("successMessage") != null) { %>
    <p class="success-message"><%= request.getAttribute("successMessage") %></p>
<% } %>
<a href="admin.jsp"class="accueil">accueil</a>
        </form>
    </div>
</body>
</html>
