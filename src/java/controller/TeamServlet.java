package controller;

import dal.TeamDAO;
import java.io.IOException;
import java.util.List;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import model.Team;
import model.User;

/**
 *
 * @author HoKha
 */
@WebServlet(name = "TeamServlet", urlPatterns = {"/team"})
public class TeamServlet extends HttpServlet {

    private TeamDAO teamDAO = new TeamDAO(); // DAO for Team

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        HttpSession session = request.getSession();
        if (session == null || session.getAttribute("currentUser") == null) {
            response.sendRedirect("login.jsp"); // Redirect to login page if user is not logged in
            return;
        }

        int userId = ((User) session.getAttribute("currentUser")).getId();
        if (action == null) {
            // Default: Show the list of all teams
            List<Team> teams = teamDAO.getTeamByUserId(userId);
            request.setAttribute("teams", teams);
            request.getRequestDispatcher("teamList.jsp").forward(request, response);
        } else if (action.equals("create")) {
            // Show the form to create a new team
            request.getRequestDispatcher("createTeam.jsp").forward(request, response);
        } else if (action.equals("edit")) {
            // Show the form to edit an existing team
            int teamId = Integer.parseInt(request.getParameter("team_id"));
            Team team = teamDAO.getTeamById(teamId);
            request.setAttribute("team", team);
            request.getRequestDispatcher("editTeam.jsp").forward(request, response);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        HttpSession session = request.getSession();
        if (session == null || session.getAttribute("currentUser") == null) {
            response.sendRedirect("login.jsp"); // Redirect to login page if user is not logged in
            return;
        }

        int userId = ((User) session.getAttribute("currentUser")).getId();
        if (action.equals("create")) {
            // Create a new team
            String teamName = request.getParameter("team_name");
//            int userId = Integer.parseInt(request.getParameter("user_id"));
            // Check if the user is logged in by checking session

            Team team = new Team(teamName, userId);
            teamDAO.createTeam(team);
            response.sendRedirect("team");  // Redirect to the list of teams
        } else if (action.equals("update")) {
            // Update an existing team
            int teamId = Integer.parseInt(request.getParameter("team_id"));
            String teamName = request.getParameter("team_name");
            Team team = new Team(teamId, teamName, 0);  // Assume user_id is unchanged, use 0 if not needed
            teamDAO.updateTeam(team);
            response.sendRedirect("team");  // Redirect to the list of teams
        } else if (action.equals("delete")) {
            // Delete a team
            int teamId = Integer.parseInt(request.getParameter("team_id"));
            teamDAO.deleteTeam(teamId);
            System.out.println("hello");
            response.sendRedirect("team");  // Redirect to the list of teams
        }
    }

}
