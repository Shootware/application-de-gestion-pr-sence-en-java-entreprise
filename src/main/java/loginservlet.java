import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/loginservlet")
public class loginservlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String username = request.getParameter("textName");
        String password = request.getParameter("textPwd");
        
        // Tentative de connexion à la base de données
        Connection con = null;
        PreparedStatement ps = null;
        ResultSet rs = null;

        try {
            // Chargement du pilote JDBC
            Class.forName("com.mysql.jdbc.Driver");
            
            // Connexion à la base de données
            con = DriverManager.getConnection("jdbc:mysql://localhost:3306/abade_java", "root", "");

            // Vérification si la connexion est réussie
            if (con != null) {
                // Préparation de la requête SQL
                ps = con.prepareStatement("SELECT role FROM users WHERE username = ? AND password = ?");
                ps.setString(1, username);
                ps.setString(2, password);

                // Exécution de la requête
                rs = ps.executeQuery();
                if (rs.next()) {
                    String role = rs.getString("role");
                    // Création de la session
                    HttpSession session = request.getSession();
                    // Ajout des informations de l'utilisateur à la session
                    session.setAttribute("username", username);
                    session.setAttribute("role", role);
                    // Redirection en fonction du rôle de l'utilisateur
                    if ("admin".equals(role)) {
                        response.sendRedirect("admin.jsp");
                    } else {
                        response.sendRedirect("welcome.jsp");
                    }
                    return; // Sortir de la méthode doPost après la redirection
                } else {
                    // Mauvaises informations de connexion, définir un attribut d'erreur et rediriger vers la page login.jsp
                    request.setAttribute("errorMessage", "Nom d'utilisateur ou mot de passe incorrect.");
                    request.getRequestDispatcher("login.jsp").forward(request, response);
                }
            } else {
                // La base de données n'est pas disponible, définir un attribut d'erreur et rediriger vers la page login.jsp
                request.setAttribute("errorMessage", "La base de données n'est pas disponible.");
                request.getRequestDispatcher("login.jsp").forward(request, response);
            }
        } catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace();
            // Rediriger vers la page login.jsp avec un message d'erreur en cas d'exception
            request.setAttribute("errorMessage", "Erreur lors de la connexion à la base de données.");
            request.getRequestDispatcher("login.jsp").forward(request, response);
        } finally {
            try {
                if (rs != null) {
                    rs.close();
                }
                if (ps != null) {
                    ps.close();
                }
                if (con != null) {
                    con.close();
                }
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }
}
