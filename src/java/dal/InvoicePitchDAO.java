/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
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
import model.InvoicePitch;
import model.Pitch;
import model.TotalInvoicePitch;

/**
 *
 * @author Admin
 */
public class InvoicePitchDAO extends DBContext {

    public List<InvoicePitch> getAll() {
        List<InvoicePitch> list = new ArrayList<>();
        String sql = "SELECT * FROM InvoicePitch";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                PitchDAO pdao = new PitchDAO();
                
                TotalInvoicePitchDAO ttdao = new TotalInvoicePitchDAO();
                BookingTimeDAO bkdao = new BookingTimeDAO();
                Pitch p = pdao.getPitchByID(rs.getString("pitchID"));
                
                TotalInvoicePitch tt = ttdao.getTotalInvoicePitchByID(rs.getInt("totalInvoiceID"));
                BookingTime bk = bkdao.getBookingTimeByID(rs.getInt("bookingTimeID"));
                String dateOfBooking = rs.getString("dateOfBooking");
                InvoicePitch c = new InvoicePitch(rs.getInt("invoicePitchID"), p, tt, bk, dateOfBooking);
                list.add(c);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }

    public InvoicePitch getInvoicePitchByID(int InvoicePitchID) {
        InvoicePitch c = new InvoicePitch();
        String sql = "SELECT * FROM InvoicePitch WHERE totalInvoiceID = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, InvoicePitchID);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                PitchDAO pdao = new PitchDAO();
                TotalInvoicePitchDAO ttdao = new TotalInvoicePitchDAO();
                BookingTimeDAO bkdao = new BookingTimeDAO();
                Pitch p = pdao.getPitchByID(rs.getString("pitchID"));
                TotalInvoicePitch tt = ttdao.getTotalInvoicePitchByID(rs.getInt("totalInvoiceID"));
                BookingTime bk = bkdao.getBookingTimeByID(rs.getInt("bookingTimeID"));
                String dateOfBooking = rs.getString("dateOfBooking");
                c = new InvoicePitch(rs.getInt("invoicePitchID"), p, tt, bk, dateOfBooking);

            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return c;

    }
public void RemoveInvoicePitchByID(int InvoicePitchID) {
        String sql = "DELETE FROM InvoicePitch WHERE invoicePitchID =?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, InvoicePitchID);
             int rowsAffected = st.executeUpdate();
        if (rowsAffected > 0) {
            System.out.println("Bảng ghi đã được xóa thành công.");
        } else {
            System.out.println("Không có bản ghi nào được xóa.");
        }
        } catch (SQLException e) {
            System.out.println(e);
        }

    }
    public void createInvoiceProduct(String pitchID, int  bookingTimeID, String dateOfBooking) {
    String sql = "insert into InvoicePitch(pitchID, bookingTimeID, dateOfBooking, totalInvoiceID) values (?, ?, ?, ?)";
    try (PreparedStatement ps = connection.prepareStatement(sql)) {
        ps.setString(1, pitchID);
        ps.setInt(2, bookingTimeID);
        ps.setString(3, dateOfBooking);
        ps.setInt(4, 1);
        ps.executeUpdate();
    } catch (SQLException e) {
        e.printStackTrace();
    }
}
    public List<InvoicePitch> getLatestInvoiceProductInfo() throws SQLException {
    List<InvoicePitch> invoicePitchs = new ArrayList<>();
    String sql = "SELECT P.pitchID, P.pitchType, PP.price, BT.time " +
                 "FROM InvoicePitch IP " +
                 "JOIN Pitch P ON IP.pitchID = P.pitchID " +
                 "JOIN PricePitch PP ON IP.pricePitchID = PP.pricePitchID " +
                 "JOIN BookingTime BT ON IP.bookingTimeID = BT.bookingTimeID " +
                 "WHERE IP.totalInvoiceID = (SELECT MAX(totalInvoiceID) FROM TotalInvoicePitch)";
    try {
        PreparedStatement st = connection.prepareStatement(sql);
        ResultSet rs = st.executeQuery();
        while (rs.next()) {
            PitchDAO pdao = new PitchDAO();
            String pitchID = rs.getString("pitchID");
            String pitchType = rs.getString("pitchType");
            int price = rs.getInt("price");
            String bookTime = rs.getString("time");

            // Tạo đối tượng Pitch từ pitchID
            
            Pitch p = pdao.getPitchByID(rs.getString("pitchID"));

            // Tạo đối tượng InvoiceProduct và thêm vào danh sách
            InvoicePitch invoicePitch = new InvoicePitch(p, price, bookTime, pitchType);
            invoicePitchs.add(invoicePitch);
        }
    } catch (SQLException e) {
        System.out.println(e);
    }
    return invoicePitchs;
}   
    public int getTotalPriceByMonth(int month) {
        String sql = "SELECT SUM(totalPrice) FROM totalInvoicePitch WHERE MONTH(bookTime) = ? and YEAR(bookTime) = YEAR(GETDATE())";

        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, month);
            ResultSet rs = st.executeQuery();
if (rs.next()) {
                return rs.getInt(1);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return 0;
    }
    public int getTotalPriceByYear(int year) {
        String sql = "SELECT SUM(totalPrice) FROM TotalInvoicePitch WHERE YEAR(bookTime) = ?";

        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, year);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                return rs.getInt(1);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return 0;
    }
    public static void main(String[] args) {
        InvoicePitchDAO ivdal = new InvoicePitchDAO();
        System.out.println(ivdal.getTotalPriceByMonth(6));
        System.out.println(ivdal.getTotalPriceByYear(2024));
    }
}
