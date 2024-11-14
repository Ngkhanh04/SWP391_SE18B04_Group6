
package dal;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;
import model.Team;
import model.User;

public class TeamDAO extends DBContext {

    // Get all teams from the database
    public List<Team> getAllTeams() { 
        List<Team> teams = new ArrayList<>();
        String sql = "SELECT * FROM team"; // SQL query to select all teams

        try (PreparedStatement st = connection.prepareStatement(sql);
             ResultSet rs = st.executeQuery()) {

            while (rs.next()) {
                // Assuming you have a UserDAO to get User by ID
                UserDAO userDAO = new UserDAO();
                User user = userDAO.getUserByUserId(rs.getInt("userid"));  // Get the User associated with the team
                
                Team team = new Team();
                team.setTeamId(rs.getInt("team_id"));
                team.setTeamName(rs.getString("team_name"));
                team.setUserId(rs.getInt("userid"));  // Assuming 'userid' is part of the Team model
                team.setUserId(user.getId());  // Set the associated User
                
                teams.add(team);  // Add the team to the list
            }
        } catch (SQLException e) {
            e.printStackTrace();  // Handle SQL exceptions
        }
        return teams;
    }

    // Get a team by its ID
    public Team getTeamById(int teamId) {
        String sql = "SELECT * FROM team WHERE team_id = ?";
        try (PreparedStatement st = connection.prepareStatement(sql)) {
            st.setInt(1, teamId);
            try (ResultSet rs = st.executeQuery()) {
                if (rs.next()) {
                    // Assuming you have a UserDAO to get the User by ID
                    UserDAO userDAO = new UserDAO();
                    User user = userDAO.getUserByUserId(rs.getInt("userid"));

                    Team team = new Team();
                    team.setTeamId(rs.getInt("team_id"));
                    team.setTeamName(rs.getString("team_name"));
                    team.setUserId(rs.getInt("userid"));
                    team.setUserId(user.getId());  // Set the associated User
                    
                    return team;  // Return the found team
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();  // Handle SQL exceptions
        }
        return null;  // Return null if no team found
    }

    // Add a new team to the database
    public void createTeam(Team team) {
        String sql = "INSERT INTO team (team_name, userid) VALUES (?, ?)";
        try (PreparedStatement st = connection.prepareStatement(sql)) {
            
            st.setString(1, team.getTeamName());
            st.setInt(2, team.getUserId());  // Assuming 'userid' is the associated User's ID
            st.executeUpdate();  // Execute the insert query
        } catch (SQLException e) {
            e.printStackTrace();  // Handle SQL exceptions
        }
    }

    // Update an existing team in the database
    public void updateTeam(Team team) {
        String sql = "UPDATE team SET team_name = ? WHERE team_id = ?";
        try (PreparedStatement st = connection.prepareStatement(sql)) {
            st.setString(1, team.getTeamName());
            st.setInt(2, team.getTeamId());
            st.executeUpdate();  // Execute the update query
        } catch (SQLException e) {
            e.printStackTrace();  // Handle SQL exceptions
        }
    }

    // Delete a team from the database
    public void deleteTeam(int teamId) {
        String sql = "DELETE FROM team WHERE team_id = ?";
        try (PreparedStatement st = connection.prepareStatement(sql)) {
            st.setInt(1, teamId);
            st.executeUpdate();  // Execute the delete query
        } catch (SQLException e) {
            e.printStackTrace();  // Handle SQL exceptions
        }
    }
    
    public List<Team> getTeamByUserId(int userId) {
        List<Team> teams = new ArrayList<>();
        String sql = "SELECT * FROM team WHERE userid = ?";  // Truy vấn đội có liên quan đến userId

        try (PreparedStatement st = connection.prepareStatement(sql)) {
            st.setInt(1, userId);
            try (ResultSet rs = st.executeQuery()) {
                while (rs.next()) {
                    Team team = new Team(
                            rs.getInt("team_id"),
                            rs.getString("team_name"),
                            rs.getInt("userid")  // userId liên kết với đội
                    );
                    teams.add(team);
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return teams;
    }
    
    public String getTeamNameById(int teamId) {
        String teamName = null;
        String sql = "SELECT team_name FROM team WHERE team_id = ?";
        try (PreparedStatement stmt = connection.prepareStatement(sql)) {
            stmt.setInt(1, teamId);
            ResultSet rs = stmt.executeQuery();
            if (rs.next()) {
                teamName = rs.getString("team_name");
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return teamName;
    }
}
