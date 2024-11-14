/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import dal.DBContext;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import model.User;
import model.Pitch;
import model.TotalInvoicePitch;

/**
 *
 * @author Admin
 */
public class TotalInvoicePitchDAO extends DBContext{
    public List<TotalInvoicePitch> getAll() {
        List<TotalInvoicePitch> list = new ArrayList<>();
        String sql = "select * from dbo.TotalInvoicePitch";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                UserDAO adao = new UserDAO();
                User a = adao.selectById1(rs.getInt("userID"));
                TotalInvoicePitch c = new TotalInvoicePitch(rs.getInt("totalInvoiceID"),a, rs.getDate("bookTime"));
               
                list.add(c);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }
     public TotalInvoicePitch getTotalInvoicePitchByID(int TotalInvoicePitchID) {
        TotalInvoicePitch c = new TotalInvoicePitch();
        String sql = "SELECT *\n"  
                    + "FROM TotalInvoicePitch p\n"
                + "WHERE p.totalInvoiceID = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, TotalInvoicePitchID);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                
                UserDAO adao = new UserDAO();
                User a = adao.selectById1(rs.getInt("userID"));
                 c = new TotalInvoicePitch(rs.getInt("totalInvoiceID"),a, rs.getDate("bookTime"));
                
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return c;

    }
     public void createTotalInvoiceProduct(TotalInvoicePitch totalInvoicePitch) {
        try {
            String xSql = "INSERT INTO TotalInvoicePitch (  userID, bookTime) "
                    + "VALUES (?, ?);";
            PreparedStatement st = connection.prepareStatement(xSql);
            st.setInt(1, totalInvoicePitch.getUserID().getId());
            st.setDate(2, (Date) totalInvoicePitch.getBookTime());
            st.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}