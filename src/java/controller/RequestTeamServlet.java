/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import dal.PitchDAO;
import dal.RequestTeamDAO;
import dal.TeamDAO;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.util.List;
import model.RequestTeam;
import java.sql.Date;
import model.Pitch;
import model.Team;
import model.User;

/**
 *
 * @author hokha
 */
@WebServlet(name = "RequestTeamServlet", urlPatterns = {"/requestTeam"})
public class RequestTeamServlet extends HttpServlet {

    private RequestTeamDAO requestTeamDAO = new RequestTeamDAO(); // DAO for RequestTeam

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");

        // Check if the user is logged in by checking session
        HttpSession session = request.getSession();
        if (session == null || session.getAttribute("currentUser") == null) {
            response.sendRedirect("login.jsp"); // Redirect to login page if user is not logged in
            return;
        }

        int userId = ((User) session.getAttribute("currentUser")).getId();

        // Default: Show the list of all requests
        List<RequestTeam> requests = requestTeamDAO.getRequestsByUserId(userId);
        request.setAttribute("requests", requests);

        PitchDAO pitchDao = new PitchDAO();
        List<Pitch> pitchs = pitchDao.getAll(1, 100);
        request.setAttribute("pitchs", pitchs);
        TeamDAO dao = new TeamDAO();
        List<Team> teams = dao.getTeamByUserId(userId);
        request.setAttribute("teamsUser", teams);
        request.getRequestDispatcher("requestTeamList.jsp").forward(request, response);

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Check if the user is logged in by checking session
        HttpSession session = request.getSession();
        if (session == null || session.getAttribute("currentUser") == null) {
            response.sendRedirect("login.jsp"); // Redirect to login page if user is not logged in
            return;
        }

        int userId = ((User) session.getAttribute("currentUser")).getId();

        String action = request.getParameter("action");

        if (action.equals("create")) {
            // Create a new request
//            String status = request.getParameter("status");
            String status = "Pairing";
            Date bookingDate = Date.valueOf(request.getParameter("booking_date"));
            String pitchId = request.getParameter("pitch_id");
            int teamRequestId = Integer.parseInt(request.getParameter("team_request_id"));
            System.out.println(teamRequestId);
//            int teamMatchId = Integer.parseInt(request.getParameter("team_match_id"));
            int teamMatchId = 1;
            RequestTeam newRequest = new RequestTeam(status, bookingDate, pitchId, teamRequestId, teamMatchId);
            requestTeamDAO.createRequestTeam(newRequest);
            response.sendRedirect("/swp/requestTeam");  // Redirect to the list of requests
        } else if (action.equals("update")) {
            // Update an existing request
            int requestTeamId = Integer.parseInt(request.getParameter("request_team_id"));
            String status = request.getParameter("status");
            Date bookingDate = Date.valueOf(request.getParameter("booking_date"));
            String pitchId = request.getParameter("pitch_id");
            int teamRequestId = Integer.parseInt(request.getParameter("team_request_id"));
            int teamMatchId = 0;
            RequestTeam updatedRequest = new RequestTeam(requestTeamId, status, bookingDate, pitchId, teamRequestId, teamMatchId);
            requestTeamDAO.updateRequestTeam(updatedRequest);
            response.sendRedirect("/swp/requestTeam");  // Redirect to the list of requests
        } else if (action.equals("delete")) {
            // Delete a request
            int requestTeamId = Integer.parseInt(request.getParameter("request_team_id"));
            requestTeamDAO.deleteRequestTeam(requestTeamId);
            response.sendRedirect("/swp/requestTeam");  // Redirect to the list of requests
        }
    }

}
