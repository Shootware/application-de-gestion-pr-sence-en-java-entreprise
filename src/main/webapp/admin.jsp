<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@page import="java.sql.*, java.util.Base64"%>
<html lang="fr">
<head>
    <meta charset="UTF-8" />
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css"/>
    <link href='https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css' rel='stylesheet'>
    <title>Afficher les produits</title>
    <style>
        @import url("https://fonts.googleapis.com/css2?family=Poppins:wght@400;500;600;700&display=swap");
        @import url("https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700;800;900&display=swap");
        * {
            margin: 0;
            padding: 0;
            outline: none;
            border: none;
            text-decoration: none;
            box-sizing: border-box;
            font-family: "Poppins", sans-serif;
        }

        .titre {
            position: relative;
            display: flex;
            border: none;
            height: 50px;
            background-color: aliceblue;
            box-shadow: none;
            outline: none;
            box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.3);
            border-radius: 15px;
            font-family: "poppins" sans-serif;
            font-size: 20px;
        }

        .message-supprimer {
            color: red;
            font-size: 18px;
            text-align: center;
            margin-top: 20px;
        }
        .titre2 {
            color: aquamarine;
            margin-top: 25px;
            width: 40%;
            margin-left: 250px;
        }

        .bienvenue {
            text-align: center;
        }

        .ajouter {
            top: 15px;
            width: 10%;
            left: 295px;
            margin-right: -1090px;
            box-shadow: 0px 2px 2px 1px;
            justify-content: center;
            transition: all 0.5s;
            text-decoration: none;
            text-transform: uppercase;
            font-size: 15px;
            background-color: black;
            color: aliceblue;
        }

        .ajouter:hover {
            transform: scale(1.1);
            background-color: rgb(8, 9, 9);
        }

        .ajouter a h1 {
            color: aliceblue;
        }

        .search_box {
            left: 900px;
            float: right;
            position: relative;
        }

        .container_tableau {
            color: black;
            left: 2%;
            top: 0px;
            margin: 0px;
            width: 91%;
            box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.3);
        }

        .hae {
            position: relative;
        }

        .ligne_attribu {
            width: 50%;
            font-size: 12px;
            height: 35px !important;
        }

        .ligne_attribu2 {
            width: 90%;
            font-size: 12px;
            text-align: center;
        }

        .container_tableau tr th {
            color: rgb(64, 61, 61);
            font-family: 'Lucida Sans', 'Lucida Sans Regular', 'Lucida Grande', 'Lucida Sans Unicode', Geneva, Verdana, sans-serif;
            justify-content: center;
            background-color: aquamarine;
            height: 35px !important;
            font-size: 15px;
        }

        .container_tableau tr td {
            top: 0px;
            font-size: 12px;
            margin-bottom: 515px;
            width: 10%;
        }

        .action a {
            padding: 0px 30px;
        }

        .m-3 {
            color: brown;
        }

        .m-2 {
            color: rgb(44, 223, 211);
        }

        /* Ajout de styles pour le formulaire de modification */
        .modify-form {
            display: none;
            margin-top: 20px;
        }

        .modify-form input {
            margin: 5px;
            padding: 5px;
            width: 200px;
        }

        .modify-form button {
            margin: 5px;
            padding: 5px 10px;
            background-color: black;
            color: aliceblue;
            border: none;
            cursor: pointer;
        }
         .logout-link {
            display: inline-block;
            padding: 10px 20px;
            background-color: #1877f2;
            color: #fff;
            text-decoration: none;
            border-radius: 5px;
            margin-top:20px;
            transition: background-color 0.3s ease;
        }

        .logout-link:hover {
            background-color: #0e5a8a;
        }
        .modify-form {
  width: 300px;
  margin: 10px;
  padding: 10px;
  background-color: #f2f2f2;
  border: 1px solid #ccc;
  border-radius: 5px;
  margin-left:100px;
}

.modify-form h2 {
  margin-top: 0;
}

.modify-form input[type="text"],
.modify-form input[type="file"] {
  width: 100%;
  padding: 5px;
  margin-bottom: 10px;
}

.modify-form button[type="submit"] {
  padding: 5px 10px;
  background-color: #4caf50;
  color: #fff;
  border: none;
  border-radius: 3px;
  cursor: pointer;
}

.modify-form button[type="submit"]:hover {
  background-color: #45a049;
}
    </style>
</head>
<body>
<nav>
    <!-- Contenu de la barre de navigation -->
</nav>
<section class="main">
    <div class="titre">
        <h1>ABADE Francois</h1>
        <form method="GET" action="">
            <div class="search_box">
                <input type="text" name="search" placeholder="Rechercher">
                <button type="submit">Rechercher</button>
            </div>
        </form>
    </div>
    <h1 class="bienvenue">Bienvenue</h1>
    <p class="bienvenue">Bienvenue, <%= session.getAttribute("username") %> ! Vous êtes connecté en tant administrateur.</p>
    <div class="titre2">
        <h1>Liste des produits</h1>
    </div>
    <div class="message-supprimer">
        <% String message = (String) request.getAttribute("message"); %>
        <%= message %>
    </div>
    <center>
        <div class="ajouter">
            <a href="ajouterproduit.jsp">
                <h1>Ajouter</h1>
            </a>
        </div>
    </center>
    <center>
        <table class="container_tableau">
            <thead>
            <tr class="ligne_attribu">
                <th>ID</th>
                <th>Nom</th>
                <th>Catégorie</th>
                <th>Date</th>
            
                <th>Action</th>
            </tr>
            </thead>
            <tbody>
            <% 
            Connection conn = null;
            Statement st = null;
            ResultSet rs = null;

            try {
                // Chargement du driver JDBC
                Class.forName("com.mysql.jdbc.Driver");

                // Connexion à la base de données
                conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/abade_java", "root", "");

                // Requête SQL pour récupérer les données de la table "produits"
                String query = "SELECT * FROM produits";

                // Création de l'objet Statement
                st = conn.createStatement();

                // Exécution de la requête
                rs = st.executeQuery(query);

                // Boucle pour parcourir les résultats et afficher les lignes dans le tableau HTML
                while (rs.next()) {
                    %>
                    <tr class="ligne_attribu2">
                        <td><%= rs.getInt("ID") %></td>
                        <td><%= rs.getString("Nom") %></td>
                        <td><%= rs.getString("Categorie") %></td>
                        <td><%= rs.getDate("Date") %></td>
                        <td>
                            <a href="#" class="m-2" onclick="showModifyForm(<%= rs.getInt("ID") %>, '<%= rs.getString("Nom") %>', '<%= rs.getString("Categorie") %>', '<%= rs.getDate("Date") %>')">
                                <i class="fa fa-edit fa-2x"></i> Modifier
                            </a>
                            <a href="SupprimerProduit?id=<%= rs.getInt("ID") %>" class="m-3">
                                <i class="fa fa-edit fa-2x"></i> Supprimer
                            </a>
                        </td>
                    </tr>
                    <% 
                }
            } catch (SQLException e) {
                e.printStackTrace();
            } catch (ClassNotFoundException e) {
                e.printStackTrace();
            } finally {
                // Fermeture des ressources
                try {
                    if (rs != null) rs.close();
                    if (st != null) st.close();
                    if (conn != null) conn.close();
                } catch (SQLException e) {
                    e.printStackTrace();
                }
            }
            %>
            </tbody>
        </table>
    </center>

    <!-- Formulaire de modification -->
   <center> <div id="modifyForm" class="modify-form">
        <h2>Modifier le produit</h2>
        <form action="ModifierProduitServlet" method="post" enctype="multipart/form-data">
            <input type="hidden" id="modifyId" name="id">
            Nom: <input type="text" id="modifyNom" name="nom"><br>
            Catégorie: <input type="text" id="modifyCategorie" name="categorie"><br>
            Date: <input type="text" id="modifyDate" name="date"><br>
           
            <button type="submit">Valider</button>
        </form>
    </div>
</section>

<!-- JavaScript pour afficher le formulaire de modification -->
<script>
    function showModifyForm(id, nom, categorie, date) {
        // Afficher le formulaire de modification
        document.getElementById('modifyForm').style.display = 'block';

        // Pré-remplir le formulaire avec les données du produit
        document.getElementById('modifyId').value = id;
        document.getElementById('modifyNom').value = nom;
        document.getElementById('modifyCategorie').value = categorie;
        document.getElementById('modifyDate').value = date;
    }
</script>
 <a href="login.jsp" class="logout-link">Se déconnecter</a>
</body>
</html>
