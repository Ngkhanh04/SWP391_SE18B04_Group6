/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import config.VNPayConfig;
import dal.BookingTimeDAO;
import dal.InvoicePitchDAO;
import dal.OrderDao;
import dal.PitchDAO;
import dal.ProductDao;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.net.URLDecoder;
import java.net.URLEncoder;
import java.nio.charset.StandardCharsets;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.Collections;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import model.BookingTime;
import model.Cart;
import model.InvoicePitch;
import model.Item;
import model.Order;
import model.Pitch;
import model.Product;
import model.TotalInvoicePitch;
import model.User;

/**
 *
 * @author Codevn
 */
@WebServlet(name = "ReturnVnPay", urlPatterns = {"/ReturnVnPay"})
public class ReturnVnPay extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet ReturnVnPay</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet ReturnVnPay at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param req
     * @param resp
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession session = req.getSession();
//        User currentUser = (User) session.getAttribute("currentUser");
        User currentUser = new User(1, 1, 1, "abc@123", "", 0);
        String vnp_ResponseCode = req.getParameter("vnp_ResponseCode");
        int totalMoney = Integer.parseInt(req.getParameter("vnp_Amount"));
        if ("00".equals(vnp_ResponseCode)) {
            // Thanh toán thành công
            System.out.println("Thanh toán thành công!");
            // Cập nhật trạng thái đơn hàng vào database hoặc thực hiện các hành động khác
            // Gửi phản hồi cho người dùng
            OrderDao orderDao = new OrderDao();
            LocalDate currentDate = LocalDate.now();
            DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd");
            String dateString = currentDate.format(formatter);
            Order order = new Order(0, dateString, currentUser.getId(), totalMoney);
            if (orderDao.addOrder(order)) {
                String orderInfor = req.getParameter("vnp_OrderInfo");
                orderInfor = URLDecoder.decode(orderInfor, "UTF-8");
                if (orderInfor.contains("BookingOrder")) {
                    processBookingOrder(orderInfor);
                } else {
                    ProductDao productDao = new ProductDao();
                    orderInfor = orderInfor.substring(6, orderInfor.length() - 1);
                    String[] productArray = orderInfor.split(",");
                    for (String productInfo : productArray) {
                        String productIdString = productInfo.replace("Product", "");
                        int pId = Integer.parseInt(productIdString);
                        System.out.println(pId);
                        Product product = productDao.getProductbyid(pId);
                        productDao.updateQuantity(pId, product.getQuantity() - 1);
                    }
                }

            }

            req.setAttribute("paymentStatus", "success");
        } else {
            // Thanh toán thất bại
            System.out.println("Thanh toán thất bại với mã: " + vnp_ResponseCode);
            req.setAttribute("paymentStatus", "failure");
        }
        req.getRequestDispatcher("payment-notice.jsp").forward(req, resp);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

    public boolean processBookingOrder(String bookingOrder) {
        // Assuming 'bookingOrder' is in the format "BookingOrder[BookingTimeID:2, PitchID:F5-1, Date:2024-11-12, Price:8.0; BookingTimeID:3, PitchID:F5-1, Date:2024-11-12, Price:8.0]"

        // Remove "BookingOrder[" at the beginning and "]" at the end
        String orderData = bookingOrder.substring("BookingOrder[".length(), bookingOrder.length() - 1);

        // Split the orderData into individual booking items using ";" as a delimiter
        String[] bookings = orderData.split(";");

        // Initialize the InvoicePitchDAO to add invoice entries
        InvoicePitchDAO invoicePitchDao = new InvoicePitchDAO();

        // Process each booking item
        for (String booking : bookings) {
            // Split each booking item into its properties using "," as a delimiter
            String[] properties = booking.split(",");

            Integer bookingTimeID = null;
            String pitchID = null;
            String date = null;
            Double price = null;

            // Loop through the properties and parse them
            for (String property : properties) {
                String[] keyValue = property.split(":");
                String key = keyValue[0].trim();
                String value = keyValue[1].trim();

                switch (key) {
                    case "BookingTimeID":
                        bookingTimeID = Integer.parseInt(value);
                        break;
                    case "PitchID":
                        pitchID = value;
                        break;
                    case "Date":
                        date = value;
                        break;
                    case "Price":
                        price = Double.parseDouble(value);
                        break;
                }
            }

            // Now that we have the individual properties, create a new InvoicePitch
            if (bookingTimeID != null && pitchID != null && date != null && price != null) {
                // Create the InvoicePitch entry and persist it in the database
                invoicePitchDao.createInvoiceProduct(pitchID, bookingTimeID, date);
                System.out.println("Booking processed: " + bookingTimeID + " " + pitchID + " " + date + " " + price);
            }
        }

        // Return true once all bookings are processed
        return true;
    }

}
