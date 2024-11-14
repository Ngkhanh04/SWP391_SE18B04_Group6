/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import dal.RequestTeamDAO;
import dal.TeamDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Set;
import model.RequestTeam;
import model.RequestTeamWithName;
import model.Team;
import model.User;

/**
 *
 * @author hokha
 */
@WebServlet(name = "ViewRequests", urlPatterns = {"/ViewRequests"})
public class ViewRequests extends HttpServlet {

    private RequestTeamDAO requestTeamDAO = new RequestTeamDAO();
    private TeamDAO teamDAO = new TeamDAO();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Check if the user is logged in
        HttpSession session = request.getSession(false);
        if (session == null || session.getAttribute("currentUser") == null) {
            response.sendRedirect("login.jsp");  // Redirect to login if not logged in
            return;
        }

        int userId = ((User) session.getAttribute("currentUser")).getId();

        // Get the user's team(s)
        List<Team> userTeams = teamDAO.getTeamByUserId(userId);
        Set<Integer> userTeamIds = new HashSet<>();
        for (Team team : userTeams) {
            userTeamIds.add(team.getTeamId());
        }

        // Get all requests that don't involve the user's team
        List<RequestTeam> allRequests = requestTeamDAO.getAllRequestTeams();
        List<RequestTeamWithName> availableRequests = new ArrayList<>();

        // Loop through all requests to get the team names and filter out requests involving the user's teams
        for (RequestTeam requestTeam : allRequests) {
            if (!userTeamIds.contains(requestTeam.getTeamRequestId())) {  // Exclude requests involving the user's teams
                // Fetch the team name for the team_request_id
                String teamName = teamDAO.getTeamNameById(requestTeam.getTeamRequestId());
                // Wrap the RequestTeam with the teamName for easy access in the JSP
                availableRequests.add(new RequestTeamWithName(requestTeam, teamName, teamDAO.getTeamById(requestTeam.getTeamMatchId()).getUserId()));
                
            }
        }

        // Set the list of available requests and the user's teams in the request scope to display in JSP
        request.setAttribute("userTeams", userTeams);
        request.setAttribute("availableRequests", availableRequests);
        request.getRequestDispatcher("/viewRequests.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Handle pairing or canceling pairing action
        int requestId = Integer.parseInt(request.getParameter("requestId"));
        
        int userId = ((User) request.getSession().getAttribute("currentUser")).getId();
        int userTeamId = Integer.parseInt(request.getParameter("userTeamId"));
        System.out.println(userTeamId);
        
        
        // Get the user's team(s)
        List<Team> userTeams = teamDAO.getTeamByUserId(userId);
        if (userTeams.isEmpty()) {
            response.sendRedirect("createTeam.jsp");  // Redirect to create team if no teams exist
            return;
        }

        // Find the request and update the team_match_id with the selected team id
        RequestTeam requestTeam = requestTeamDAO.getRequestTeamById(requestId);

        // If the request is not already paired (team_match_id is 0), update the team_match_id to pair with the selected team
        if (requestTeam.getTeamMatchId() == 1) { // Assuming 0 means not paired yet
            requestTeam.setTeamMatchId(userTeamId);  // Update with the selected team ID
            requestTeamDAO.updateRequestTeam(requestTeam);  // Update the request to reflect the pairing
            // Redirect to the page showing the updated requests
            response.sendRedirect("ViewRequests");
        }
        // If the user is trying to cancel the pairing (requestTeam.getTeamMatchId() matches user's team)
        else if (requestTeam.getTeamMatchId() == userTeamId) {
            // Cancel pairing by resetting team_match_id to 0
            requestTeam.setTeamMatchId(1);
            requestTeamDAO.updateRequestTeam(requestTeam);  // Update the request to reflect cancellation
            response.sendRedirect("ViewRequests");  // Redirect to the same page to show updated status
        } else {
            // If the request is already paired with another team, handle that case (optional)
            response.getWriter().write("This request is already paired with another team.");
        }
    }

}
