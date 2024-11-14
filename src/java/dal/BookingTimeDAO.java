/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import dal.DBContext;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import model.User;
import model.BookingTime;
import model.Pitch;

/**
 *
 * @author Admin
 */
public class BookingTimeDAO extends DBContext{
     public List<BookingTime> getAll() {
        List<BookingTime> list = new ArrayList<>();
        String sql = "select * from dbo.BookingTime";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {

                BookingTime c = new BookingTime(rs.getInt("bookingTimeID"), rs.getString("time"));
                list.add(c);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }
     public BookingTime getBookingTimeByID(int bookingTimeID) {
        BookingTime p = new BookingTime();
        String sql = "SELECT *\n"  
                + "FROM BookingTime p\n"
                + "WHERE p.bookingTimeID = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, bookingTimeID);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                
                p= new BookingTime(rs.getInt("bookingTimeID"), rs.getString("time"));
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return p;

    }
     
     public static void main(String[] args) {
        BookingTimeDAO p = new BookingTimeDAO();
        List<model.BookingTime> list = p.getAll();
        System.out.println(list.get(1).getBookingTimeID());
        int a = list.get(2).getBookingTimeID();
         BookingTime b = p.getBookingTimeByID(a);
         System.out.println(b.getTime());
    }
}
