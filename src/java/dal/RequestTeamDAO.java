/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

/**
 *
 * @author hokha
 */
import java.sql.*;
import java.util.ArrayList;
import java.util.List;
import model.RequestTeam;
import model.Team;

public class RequestTeamDAO extends DBContext {

    // Get all request teams from the database
    public List<RequestTeam> getAllRequestTeams() {
        List<RequestTeam> requestTeams = new ArrayList<>();
        String sql = "SELECT * FROM request_team";  // SQL query to select all request teams

        try (PreparedStatement st = connection.prepareStatement(sql);
             ResultSet rs = st.executeQuery()) {

            while (rs.next()) {
                // Assuming you have a TeamDAO to get Team by ID
                TeamDAO teamDAO = new TeamDAO();
                Team teamRequest = teamDAO.getTeamById(rs.getInt("team_request_id"));
                Team teamMatch = teamDAO.getTeamById(rs.getInt("team_match_id"));

                RequestTeam requestTeam = new RequestTeam();
                requestTeam.setRequestTeamId(rs.getInt("request_team_id"));
                requestTeam.setStatus(rs.getString("status"));
                requestTeam.setBookingDate(rs.getDate("booking_date"));
                requestTeam.setPitchId(rs.getString("pitchID"));
                requestTeam.setTeamRequestId(teamRequest.getTeamId());  // Set the teamRequest object
                requestTeam.setTeamMatchId(teamMatch.getTeamId());      // Set the teamMatch object
                
                requestTeams.add(requestTeam);  // Add to the list
            }
        } catch (SQLException e) {
            e.printStackTrace();  // Handle SQL exceptions
        }
        return requestTeams;
    }

    // Get a request team by its ID
    public RequestTeam getRequestTeamById(int requestTeamId) {
        String sql = "SELECT * FROM request_team WHERE request_team_id = ?";
        try (PreparedStatement st = connection.prepareStatement(sql)) {
            st.setInt(1, requestTeamId);
            try (ResultSet rs = st.executeQuery()) {
                if (rs.next()) {
                    TeamDAO teamDAO = new TeamDAO();
                    Team teamRequest = teamDAO.getTeamById(rs.getInt("team_request_id"));
                    Team teamMatch = teamDAO.getTeamById(rs.getInt("team_match_id"));

                    RequestTeam requestTeam = new RequestTeam();
                    requestTeam.setRequestTeamId(rs.getInt("request_team_id"));
                    requestTeam.setStatus(rs.getString("status"));
                    requestTeam.setBookingDate(rs.getDate("booking_date"));
                    requestTeam.setPitchId(rs.getString("pitchID"));
                    requestTeam.setTeamRequestId(teamRequest.getTeamId());  // Set the teamRequest object
                    requestTeam.setTeamMatchId(teamMatch.getTeamId());      // Set the teamMatch object
                    
                    return requestTeam;  // Return the found request team
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();  // Handle SQL exceptions
        }
        return null;  // Return null if no matching request team is found
    }

    // Add a new request team to the database
    public void createRequestTeam(RequestTeam requestTeam) {
        String sql = "INSERT INTO request_team (status, booking_date, pitchID, team_request_id, team_match_id) VALUES (?, ?, ?, ?, ?)";
        try (PreparedStatement st = connection.prepareStatement(sql)) {
            System.out.println(requestTeam.toString());
            st.setString(1, requestTeam.getStatus());
            st.setDate(2, requestTeam.getBookingDate());
            st.setString(3, requestTeam.getPitchId());
            st.setInt(4, requestTeam.getTeamRequestId());  // Set the teamRequest object
            st.setInt(5, requestTeam.getTeamMatchId());
            st.executeUpdate();  // Execute the insert query
        } catch (SQLException e) {
            e.printStackTrace();  // Handle SQL exceptions
        }
    }

    // Update an existing request team in the database
    public void updateRequestTeam(RequestTeam requestTeam) {
        String sql = "UPDATE request_team SET status = ?, booking_date = ?, pitchID = ?, team_request_id = ?, team_match_id = ? WHERE request_team_id = ?";
        try (PreparedStatement st = connection.prepareStatement(sql)) {
            st.setString(1, requestTeam.getStatus());
            st.setDate(2, requestTeam.getBookingDate());
            st.setString(3, requestTeam.getPitchId());
            st.setInt(4, requestTeam.getTeamRequestId());  // Set the teamRequest object
            st.setInt(5,requestTeam.getTeamMatchId()); 
            st.setInt(6, requestTeam.getRequestTeamId());
            st.executeUpdate();  // Execute the update query
        } catch (SQLException e) {
            e.printStackTrace();  // Handle SQL exceptions
        }
    }

    // Delete a request team from the database
    public void deleteRequestTeam(int requestTeamId) {
        String sql = "DELETE FROM request_team WHERE request_team_id = ?";
        try (PreparedStatement st = connection.prepareStatement(sql)) {
            st.setInt(1, requestTeamId);
            st.executeUpdate();  // Execute the delete query
        } catch (SQLException e) {
            e.printStackTrace();  // Handle SQL exceptions
        }
    }

    public List<RequestTeam> getRequestsByUserId(int userId) {
        List<RequestTeam> requests = new ArrayList<>();
        String sql = "SELECT * FROM request_team join team on request_team.team_request_id = team.team_id join users on users.userid = team.userid where users.userid = ?";  // Giả sử team_request_id hoặc team_match_id liên kết với user_id

        try (PreparedStatement st = connection.prepareStatement(sql)) {
            st.setInt(1, userId);
            
            try (ResultSet rs = st.executeQuery()) {
                while (rs.next()) {
                    RequestTeam request = new RequestTeam(
                            rs.getInt("request_team_id"),
                            rs.getString("status"),
                            rs.getDate("booking_date"),
                            rs.getString("pitchID"),
                            rs.getInt("team_request_id"),
                            rs.getInt("team_match_id")
                    );
                    requests.add(request);
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return requests;
    }
}
