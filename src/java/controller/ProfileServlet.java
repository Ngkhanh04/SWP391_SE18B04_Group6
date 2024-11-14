package controller;

import dal.UserDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import model.User;

import java.io.IOException;

@WebServlet(name = "ProfileServlet", urlPatterns = {"/profile"})
public class ProfileServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        User currentUser = (User) session.getAttribute("currentUser");

        if (currentUser != null) {
            UserDAO userDAO = new UserDAO();
            // Lấy ID người dùng từ đối tượng currentUser
            int userID = currentUser.getId(); // Thay đổi ở đây

            // Lấy thông tin người dùng từ ID
            User user = userDAO.getUserByUserId(userID);
            if (user != null) {
                request.setAttribute("user", user); // Đảm bảo tên thuộc tính nhất quán
                request.getRequestDispatcher("profile.jsp").forward(request, response);
            } else {
                request.setAttribute("error", "User profile not found!");
                request.getRequestDispatcher("error.jsp").forward(request, response);
            }
        } else {
            response.sendRedirect("login.jsp");
        }
    }

    @Override
    public String getServletInfo() {
        return "Displays user profile information.";
    }
}