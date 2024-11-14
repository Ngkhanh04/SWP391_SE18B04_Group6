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

@WebServlet("/updateProfileServlet")
public class updateProfileServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        User currentUser = (User) session.getAttribute("currentUser");

        if (currentUser != null) {
            UserDAO userDAO = new UserDAO();
            int userID = currentUser.getId();
            User user = userDAO.getUserByUserId(userID);

            if (user != null) {
                request.setAttribute("user", user);
                request.getRequestDispatcher("updateProfile.jsp").forward(request, response);
            } else {
                request.setAttribute("error", "Không tìm thấy hồ sơ người dùng!");
                request.getRequestDispatcher("error.jsp").forward(request, response);
            }
        } else {
            response.sendRedirect("login.jsp");
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        User currentUser = (User) session.getAttribute("currentUser");

        if (currentUser != null) {
            UserDAO userDAO = new UserDAO();
            int userID = currentUser.getId();

            String newUsername = request.getParameter("username");
            String newEmail = request.getParameter("email");
            String newPassword = request.getParameter("password");
            String newPhoneNumber = request.getParameter("phone");

            if (newEmail == null || newEmail.isEmpty()) {
                request.setAttribute("error", "Email không được để trống!");
                request.getRequestDispatcher("updateProfile.jsp").forward(request, response);
                return;
            }

            User updatedUser = new User(userID, newUsername, newEmail, newPassword, newPhoneNumber);

            boolean success = userDAO.updateUser(updatedUser);
            if (success) {
                currentUser.setEmail(newEmail);
                currentUser.setUsername(newUsername);
                currentUser.setPhoneNumber(newPhoneNumber);
                session.setAttribute("currentUser", currentUser);
                response.sendRedirect("profile");
            } else {
                request.setAttribute("error", "Cập nhật hồ sơ không thành công!");
                request.getRequestDispatcher("updateProfile.jsp").forward(request, response);
            }
        } else {
            response.sendRedirect("login.jsp");
        }
    }

    @Override
    public String getServletInfo() {
        return "Cập nhật thông tin hồ sơ người dùng.";
    }
}
