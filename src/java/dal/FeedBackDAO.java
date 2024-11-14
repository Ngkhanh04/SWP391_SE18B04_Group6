/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import model.Feedback;
/**
 *
 * @author hokha
 */
public class FeedBackDAO extends DBContext{
    
    
     Connection conn = null;
    PreparedStatement ps = null;
    ResultSet rs = null;

    
    
    
    public List<Feedback> getAllFeedbacks() {
        List<Feedback> feedbacks = new ArrayList<>();
        String query = "SELECT TOP (1000) [name], [rating], [comment] FROM [TSField_4].[dbo].[Feedback]";

        try {
            conn = this.connection; // Use the inherited connection from DBContext
            ps = conn.prepareStatement(query);
            rs = ps.executeQuery();
            while (rs.next()) {
                feedbacks.add(new Feedback(
                        rs.getString("name"),
                        rs.getString("rating"),
                        rs.getString("comment")));
            }
        } catch (SQLException e) {
            e.printStackTrace(); // Log the error
        } finally {
            try {
                if (rs != null) {
                    rs.close();
                }
                if (ps != null) {
                    ps.close();
                }
                if (conn != null) {
                    conn.close();
                }
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
        return feedbacks; // Return the list of feedbacks
    }

    
     public void addFeedback(Feedback feedback) {
        String query = "INSERT INTO Feedback (name, rating, comment) VALUES (?, ?, ?)";
        try {
            conn = this.connection; // Use the connection from DBContext
            ps = conn.prepareStatement(query);
            ps.setString(1, feedback.getName());
            ps.setString(2, feedback.getRating());
            ps.setString(3, feedback.getComment());
            ps.executeUpdate(); // Execute the insert
        } catch (SQLException e) {
            e.printStackTrace(); // Log the error
        } finally {
            // Ensure resources are closed
            try {
                if (ps != null) {
                    ps.close();
                }
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }
    
    
    public static void main(String[] args) {
        FeedBackDAO feedbackDAO = new FeedBackDAO();
        List<Feedback> feedbacks = feedbackDAO.getAllFeedbacks();
        System.out.println(feedbacks);
    }
}   