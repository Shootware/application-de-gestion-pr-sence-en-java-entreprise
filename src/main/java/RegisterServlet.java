import java.io.*;
import java.sql.*;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/RegisterServlet")
public class RegisterServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String matricule = request.getParameter("matricule");
        String nom = request.getParameter("nom");
        String prenom = request.getParameter("prenom");
        String password = request.getParameter("password");
        String division = request.getParameter("division");

        // Ajout de messages de log pour le débogage
        System.out.println("matricule: " + matricule);
        System.out.println("nom: " + nom);
        System.out.println("prenom: " + prenom);
        System.out.println("password: " + password);
        System.out.println("division: " + division);

        // Initialisation du message de connexion
        String connectionMessage = "";

        // Tentative de connexion à la base de données
        Connection conn = null;
        PreparedStatement stmt1 = null;
        PreparedStatement stmt2 = null;
        try {
            // Chargement du pilote JDBC
            Class.forName("com.mysql.cj.jdbc.Driver");

            // Connexion à la base de données
            conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/abade_java", "root", "");

            // Vérifier si la connexion est réussie
            if (conn != null) {
                connectionMessage = "Connexion réussie à la base de données.";
                System.out.println(connectionMessage);

                // Préparation de la requête SQL pour insérer dans utilisateurs
                String sql1 = "INSERT INTO utilisateurs (matricule, nom, prenom, division) VALUES (?, ?, ?, ?)";
                stmt1 = conn.prepareStatement(sql1);
                stmt1.setString(1, matricule);
                stmt1.setString(2, nom);
                stmt1.setString(3, prenom);
                stmt1.setString(4, division);

                // Exécution de la requête pour utilisateurs
                int rows1 = stmt1.executeUpdate();

                // Préparation de la requête SQL pour insérer dans daaf
                String sql2 = "INSERT INTO daaf (iddaaf, password) VALUES (?, ?)";
                stmt2 = conn.prepareStatement(sql2);
                stmt2.setString(1, matricule); // assuming iddaaf is the same as matricule
                stmt2.setString(2, password);

                // Exécution de la requête pour daaf
                int rows2 = stmt2.executeUpdate();

                // Vérification si l'insertion a réussi dans les deux tables
                if (rows1 > 0 && rows2 > 0) {
                    // Message de réussite
                    String successMessage = "Inscription réussie pour l'utilisateur : " + nom + " " + prenom;
                    System.out.println(successMessage);
                    // Définir l'attribut pour afficher le message de réussite
                    request.setAttribute("successMessage", successMessage);
                } else {
                    // Affichage du message d'erreur si l'insertion a échoué
                    String errorMessage = "L'inscription a échoué. Veuillez réessayer.";
                    System.err.println(errorMessage);
                    request.setAttribute("errorMessage", errorMessage);
                }
            } else {
                // Connexion à la base de données échouée
                connectionMessage = "Échec de la connexion à la base de données.";
                System.err.println(connectionMessage);
            }
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
            // Gestion de l'erreur de chargement du pilote JDBC
            connectionMessage = "Erreur de chargement du pilote JDBC.";
            System.err.println(connectionMessage);
        } catch (SQLException e) {
            e.printStackTrace();
            // Gestion de l'erreur de base de données
            connectionMessage = "Erreur de base de données : " + e.getMessage();
            System.err.println(connectionMessage);
        } finally {
            // Fermeture des ressources
            try {
                if (stmt1 != null) stmt1.close();
                if (stmt2 != null) stmt2.close();
                if (conn != null) conn.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }

        // Transmission du message de connexion à la page register.jsp
        request.setAttribute("connectionMessage", connectionMessage);
        request.getRequestDispatcher("register.jsp").forward(request, response);
    }
}
