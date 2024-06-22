import java.io.IOException;
import java.io.InputStream;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;

@WebServlet("/ModifierProduitServlet")
public class ModifierProduitServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Récupérer les paramètres du formulaire
        int id = 0;
        try {
            id = Integer.parseInt(request.getParameter("id"));
        } catch (NumberFormatException e) {
            // Gérer le cas où l'identifiant est invalide
            request.setAttribute("message", "L'identifiant du produit est invalide !");
            request.getRequestDispatcher("/admin.jsp").forward(request, response);
            return; // Arrêter le traitement
        }
        String nom = request.getParameter("nom");
        String categorie = request.getParameter("categorie");
        String date = request.getParameter("date");
        Part photoPart = request.getPart("photo");

        // Connexion à la base de données et mise à jour du produit
        Connection conn = null;
        PreparedStatement stmt = null;
        try {
            Class.forName("com.mysql.jdbc.Driver");
            conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/abade_java", "root", "");

            // Préparer la requête SQL pour mettre à jour le produit
            String query = "UPDATE produits SET Nom=?, Categorie=?, Date=?, Photo=? WHERE ID=?";
            stmt = conn.prepareStatement(query);
            stmt.setString(1, nom);
            stmt.setString(2, categorie);
            stmt.setString(3, date);
            
            // Si une nouvelle photo a été fournie, mettre à jour la photo
            if (photoPart != null) {
                InputStream photoInputStream = photoPart.getInputStream();
                stmt.setBlob(4, photoInputStream);
            } else {
                stmt.setNull(4, java.sql.Types.BLOB);
            }

            stmt.setInt(5, id);

            // Exécuter la requête
            int rowsAffected = stmt.executeUpdate();

            // Envoyer un message de succès ou d'échec à la page JSP
            if (rowsAffected > 0) {
                request.setAttribute("message", "Le produit a été mis à jour avec succès !");
            } else {
                request.setAttribute("message", "Échec de la mise à jour du produit !");
            }
        } catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace();
            request.setAttribute("message", "Une erreur s'est produite lors de la mise à jour du produit.");
        } finally {
            // Fermer les ressources
            try {
                if (stmt != null) {
                    stmt.close();
                }
                if (conn != null) {
                    conn.close();
                }
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }

        // Rediriger vers la page affichant la liste des produits
        request.getRequestDispatcher("/admin.jsp").forward(request, response);
    }
}
