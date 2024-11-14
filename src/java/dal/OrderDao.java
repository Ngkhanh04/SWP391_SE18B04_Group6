/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;
import java.security.SecureRandom;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.time.LocalDate;
import model.Cart;
import model.Item;
import model.Order;
import model.User;

/**
 *
 * @author hokha
 */
public class OrderDao extends DBContext{
    Connection conn = null;
    
    ResultSet rs = null;
    public void addOrder(User u, Cart cart){
        LocalDate curDate = java.time.LocalDate.now();  
        String date =curDate.toString();
      
        try {
            //add vo gio hang  
            String query="INSERT INTO orders ([?,?,?)";
            conn = new DBContext().connection;
            PreparedStatement ps = conn.prepareStatement(query);
            ps.setString(1, date);
            ps.setInt(2, u.getId());
            ps.setDouble(3, cart.totalmoney());
            ps.executeUpdate();
            // lay ra id cua order vua add
             String query1="SELECT TOP 1 id_order FROM orders ORDER BY id_order DESC;";
              PreparedStatement ps1 = conn.prepareStatement(query1);
              rs=ps1.executeQuery();
              //add vao bang orderline
              if(rs.next()){
                  int oid=rs.getInt(1);
                  for (Item i :cart.getItems()) {
                      String query2="insert into [orderline]value(?,?,?,?)";
                      PreparedStatement ps2 = conn.prepareStatement(query2);
                      ps2.setInt(1, oid);
                      ps2.setInt(2, i.getProduct().getProduct_id());
                      ps2.setInt(3, i.getQuantity());
                      ps2.setDouble(4, i.getPrice());
                      ps2.executeUpdate();
                  }
              }
        } catch (Exception e) {
        }
    }
    
    public boolean addOrder(Order order){
        String insertOrderQuery = "INSERT INTO orders (order_code, status, payment_type, user_id, order_date) VALUES (?, ?, ?, ?, ?)";        
        try(Connection conn = new DBContext().connection;PreparedStatement ps = conn.prepareStatement(insertOrderQuery)) {
            
            ps.setString(1, generateRandomString());
            ps.setString(2, "Success");
            ps.setString(3, "VNPAY");
            ps.setInt(4, order.getUid());
            ps.setString(5, order.getDate());
            ps.executeUpdate();
            return true;
        } catch (Exception e) {
            System.out.println(e);
        }
        return false;
    }
    
    private static final String CHARACTERS = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789";
    private static final int STRING_LENGTH = 8;

    public static String generateRandomString() {
        SecureRandom random = new SecureRandom();
        StringBuilder sb = new StringBuilder(STRING_LENGTH);

        for (int i = 0; i < STRING_LENGTH; i++) {
            int randomIndex = random.nextInt(CHARACTERS.length());
            sb.append(CHARACTERS.charAt(randomIndex));
        }

        return sb.toString();
    }
}
