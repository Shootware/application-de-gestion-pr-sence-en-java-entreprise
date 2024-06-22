import java.io.*;
import java.sql.*;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

public class SupprimerProduit extends HttpServlet {
    public void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Récupérer l'ID du produit à supprimer à partir des paramètres de l'URL
        String produitId = request.getParameter("id");

        // Effectuer la logique de suppression dans la base de données
        Connection conn = null;
        PreparedStatement ps = null;
        try {
            // Charger le driver JDBC
            Class.forName("com.mysql.jdbc.Driver");

            // Connexion à la base de données
            conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/abade_java", "root", "");

            // Requête SQL pour supprimer le produit avec l'ID donné
            String query = "DELETE FROM produits WHERE ID = ?";
            ps = conn.prepareStatement(query);
            ps.setString(1, produitId);

            // Exécution de la requête
            int rowsAffected = ps.executeUpdate();

            if (rowsAffected > 0) {
                // Rediriger l'utilisateur vers une page appropriée après la suppression
                request.setAttribute("message", "Produit supprimé avec succès");
            } else {
                // Gérer le cas où aucun produit n'est trouvé avec cet ID
                // Envoyer un message d'erreur à la page JSP
                request.setAttribute("erreurMessage", "Aucun produit trouvé avec cet ID");
            }
        } catch (SQLException | ClassNotFoundException e) {
            e.printStackTrace();
            // Envoyer un message d'erreur à la page JSP
            request.setAttribute("erreurMessage", "Une erreur s'est produite lors de la suppression du produit");
        } finally {
            // Fermer les ressources
            try {
                if (ps != null) ps.close();
                if (conn != null) conn.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }

        // Rediriger vers la page JSP
        request.getRequestDispatcher("admin.jsp").forward(request, response);
    }
}
