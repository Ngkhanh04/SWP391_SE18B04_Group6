/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import config.VNPayConfig;
import dal.BookingTimeDAO;
import dal.InvoicePitchDAO;
import dal.PitchDAO;
import jakarta.mail.internet.ParseException;
import jakarta.servlet.RequestDispatcher;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.nio.charset.StandardCharsets;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Collections;
import java.util.Date;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.TimeZone;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.BookingTime;
import model.InvoicePitch;
import model.Pitch;

/**
 *
 * @author Admin
 */
public class BookingTimeServlet extends HttpServlet {

    PitchDAO pitchDao = new PitchDAO();
    InvoicePitchDAO ipDao = new InvoicePitchDAO();
    BookingTimeDAO btDao = new BookingTimeDAO();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String pitchID = request.getParameter("pitchID");
        request.setAttribute("pitchID", pitchID);

        // Assuming a method to get available times for a given date and pitchID
        String selectedDate = request.getParameter("date");

        List<BookingTime> availableTimes = getAvailableTimes(selectedDate, pitchID);

        request.setAttribute("availableTimes", availableTimes);

        request.getRequestDispatcher("pitchInfo.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Get the selected times from the form
        String[] selectedTimes = request.getParameterValues("selectedTimes");
        String pitchID = request.getParameter("pitchID");
        String selectedDate = request.getParameter("date");

        if (selectedTimes != null && selectedTimes.length > 0) {
            StringBuilder orderInfor = new StringBuilder("BookingOrder[");
            double totalMoney = 0;  // Initialize total money for all bookings
            Pitch pitch = pitchDao.getPitchByID(pitchID);
// Iterate over the list of selectedBookingTimes (Assuming selectedBookingTimes is a list of BookingTime objects)
            for (String bookingTimeId : selectedTimes) {
                BookingTime bookingTime = btDao.getBookingTimeByID(Integer.parseInt(bookingTimeId));
                totalMoney += pitch.getPricePitch();  // Add price for this booking time

                // Append booking information to the orderInfor string
                orderInfor.append("BookingTimeID:").append(bookingTime.getBookingTimeID())
                        .append(", PitchID:").append(pitchID)
                        .append(", Date:").append(selectedDate) // Assuming 'getTime()' returns a formatted time or string
                        .append(", Price:").append(pitch.getPricePitch())
                        .append("; ");
            }

// Remove the last "; " if present, to clean up the string
            if (orderInfor.length() > 0) {
                orderInfor.setLength(orderInfor.length() - 2);  // Remove the last unnecessary ","
            }

            orderInfor.append("]");

            // Proceed to VNPay or another payment system
            payMoney(request, response, totalMoney, orderInfor);
        } else {
            // Handle case where no times are selected (optional)
            request.setAttribute("error", "Please select at least one booking time.");
            request.getRequestDispatcher("pitchInfo.jsp").forward(request, response);
        }
    }

    private void payMoney(HttpServletRequest req, HttpServletResponse resp, double reqPrice, StringBuilder orderInfor) throws UnsupportedEncodingException, IOException {
        // Calculate total price for multiple selected times
        reqPrice = reqPrice * 23000;
        long amount = (long) (reqPrice * 100);
        String bankCode = req.getParameter("bankCode");
        String vnp_IpAddr = VNPayConfig.getIpAddress(req);

        // VNPay request parameters
        String vnp_Version = "2.1.0";
        String vnp_Command = "pay";
        String orderType = "other";
        String vnp_TxnRef = VNPayConfig.getRandomNumber(8); // Unique transaction reference
        String vnp_TmnCode = VNPayConfig.vnp_TmnCode; // Merchant code

        Map<String, String> vnp_Params = new HashMap<>();
        vnp_Params.put("vnp_Version", vnp_Version);
        vnp_Params.put("vnp_Command", vnp_Command);
        vnp_Params.put("vnp_TmnCode", vnp_TmnCode);
        vnp_Params.put("vnp_Amount", String.valueOf(amount));
        vnp_Params.put("vnp_CurrCode", "VND");

        if (bankCode != null && !bankCode.isEmpty()) {
            vnp_Params.put("vnp_BankCode", bankCode);
        }
        vnp_Params.put("vnp_TxnRef", vnp_TxnRef);
        vnp_Params.put("vnp_OrderInfo", orderInfor.toString());
        vnp_Params.put("vnp_OrderType", orderType);

        String locate = req.getParameter("language");
        if (locate != null && !locate.isEmpty()) {
            vnp_Params.put("vnp_Locale", locate);
        } else {
            vnp_Params.put("vnp_Locale", "vn");
        }
        vnp_Params.put("vnp_ReturnUrl", "http://localhost:8080/swp/ReturnVnPay");
        vnp_Params.put("vnp_IpAddr", vnp_IpAddr);

        Calendar cld = Calendar.getInstance(TimeZone.getTimeZone("Etc/GMT+7"));
        SimpleDateFormat formatter = new SimpleDateFormat("yyyyMMddHHmmss");
        String vnp_CreateDate = formatter.format(cld.getTime());
        vnp_Params.put("vnp_CreateDate", vnp_CreateDate);

        cld.add(Calendar.MINUTE, 15);
        String vnp_ExpireDate = formatter.format(cld.getTime());
        vnp_Params.put("vnp_ExpireDate", vnp_ExpireDate);

        List fieldNames = new ArrayList(vnp_Params.keySet());
        Collections.sort(fieldNames);
        StringBuilder hashData = new StringBuilder();
        StringBuilder query = new StringBuilder();
        Iterator itr = fieldNames.iterator();
        while (itr.hasNext()) {
            String fieldName = (String) itr.next();
            String fieldValue = (String) vnp_Params.get(fieldName);
            if ((fieldValue != null) && (fieldValue.length() > 0)) {
                //Build hash data
                hashData.append(fieldName);
                hashData.append('=');
                hashData.append(URLEncoder.encode(fieldValue, StandardCharsets.US_ASCII.toString()));
                //Build query
                query.append(URLEncoder.encode(fieldName, StandardCharsets.US_ASCII.toString()));
                query.append('=');
                query.append(URLEncoder.encode(fieldValue, StandardCharsets.US_ASCII.toString()));
                if (itr.hasNext()) {
                    query.append('&');
                    hashData.append('&');
                }
            }
        }
        String queryUrl = query.toString();
        String vnp_SecureHash = VNPayConfig.hmacSHA512(VNPayConfig.vnp_HashSecret, hashData.toString());
        queryUrl += "&vnp_SecureHash=" + vnp_SecureHash;
        String paymentUrl = VNPayConfig.vnp_PayUrl + "?" + queryUrl;

//        for (Map.Entry<String, String> entry : vnp_Params.entrySet()) {
//            System.out.println(entry.getKey() + ": " + entry.getValue());
//        }

        resp.sendRedirect(paymentUrl);
    }

    private List<BookingTime> getAvailableTimes(String selectedDate, String pitchID) {
        // Get all available times for the specific pitch
        List<BookingTime> availableTimes = btDao.getAll();
        List<InvoicePitch> invoicePitchs = ipDao.getAll();

        // Iterate over available times and remove booked ones for the selected date and pitch
        Iterator<BookingTime> iterator = availableTimes.iterator();
        while (iterator.hasNext()) {
            BookingTime availableTime = iterator.next();

            // Check if the available time is already booked for the selected date and pitch
            for (InvoicePitch invoicePitch : invoicePitchs) {
                if (invoicePitch.getBookingTimeID().getBookingTimeID() == availableTime.getBookingTimeID()
                        && selectedDate.equals(invoicePitch.getDateOfBooking())
                        && invoicePitch.getPitchID().getPitchID().equals(pitchID)) {
                    // Remove this time from the list
                    iterator.remove();
                    break; // No need to check further once the time is removed
                }
            }
        }
        return availableTimes;  // Return the filtered list of available times
    }

}
