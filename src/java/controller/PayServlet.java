
package controller;

import dal.PitchDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import model.Pitch;

public class PayServlet extends HttpServlet {


    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet PayServlet</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet PayServlet at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

 
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
                PitchDAO pitchDAO = new PitchDAO();
               
                String pitchID = request.getParameter("pitch");
                String date = request.getParameter("date");
                String time = request.getParameter("bookPitch");
                
                Pitch p = pitchDAO.getPitchByID(pitchID);
                
                request.setAttribute("pitchID", pitchID);
                request.setAttribute("date", date);
                request.setAttribute("time", time);
                request.setAttribute("price", p.getPricePitch());
                
                
                //Tao QR
                String paymentLink = "http://localhost:8081/temu/paysuccess.jsp";
                String path = "D:\\B-Day\\FPT\\FA24\\SWP\\TeamTest\\web\\images\\QR.png"; //Co the doi thu muc
                try {
//                    QRCodeWriter writer = new QRCodeWriter();
//                    BitMatrix matrix = writer.encode(paymentLink, BarcodeFormat.QR_CODE, 300, 300);
//
//                    MatrixToImageWriter.writeToFile(matrix, "png", new File(path));
                } catch (Exception e) {
                    throw new ServletException("Error generating QR Code", e);
                }
                request.getRequestDispatcher("confirmPayment.jsp").forward(request, response);
        }
        

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
