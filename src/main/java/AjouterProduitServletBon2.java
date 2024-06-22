import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/AjouterProduitServletBon2")
public class AjouterProduitServletBon2 extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Récupération des données du formulaire
        String nom = request.getParameter("nom");
        String categorie = request.getParameter("categorie");
        String date = request.getParameter("date");

        // Connexion à la base de données
        String jdbcUrl = "jdbc:mysql://localhost:3306/abade_java";
        String username = "root";
        String password = ""; // Mettez votre mot de passe de base de données ici

        try (Connection conn = DriverManager.getConnection(jdbcUrl, username, password)) {
            // Préparation de la requête d'insertion
            String sql = "INSERT INTO produits (nom, categorie, date) VALUES (?, ?, ?)";
            PreparedStatement pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, nom);
            pstmt.setString(2, categorie);
            pstmt.setString(3, date);

            // Exécution de la requête d'insertion
            int rowsAffected = pstmt.executeUpdate();

            // Vérification si l'insertion a réussi
            if (rowsAffected > 0) {
                request.setAttribute("successMessage", "Insertion réussie.");
            } else {
                request.setAttribute("errorMessage", "Échec de l'insertion.");
            }
        } catch (SQLException e) {
            request.setAttribute("errorMessage", "Erreur : " + e.getMessage());
        }
        
        // Redirection vers la page JSP
        request.getRequestDispatcher("ajouterproduit.jsp").forward(request, response);
    }
}
