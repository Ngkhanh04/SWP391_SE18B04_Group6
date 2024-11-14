/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import dal.PitchDAO;
import jakarta.servlet.RequestDispatcher;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.List;
import model.Pitch;

/**
 *
 * @author hokha
 */
@WebServlet(name = "CRUDPitchServlet", urlPatterns = {"/CRUDPitchServlet"})
public class CRUDPitchServlet extends HttpServlet {

     private PitchDAO pitchDAO;

    @Override
    public void init() {
        pitchDAO = new PitchDAO();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if (action == null) {
            action = "list"; // Default action is to list all pitches
        }

        try {
            switch (action) {
                case "new":
                    showNewForm(request, response);
                    break;
                case "insert":
                    insertPitch(request, response);
                    break;
                case "delete":
                    deletePitch(request, response);
                    break;
                case "edit":
                    showEditForm(request, response);
                    break;
                case "update":
                    updatePitch(request, response);
                    break;
                default:
                    listPitches(request, response);
                    break;
            }
        } catch (Exception ex) {
            throw new ServletException(ex);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }

    // List all pitches with pagination
    private void listPitches(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int page = 1;
        int recordsPerPage = 5;
        if (request.getParameter("page") != null) {
            page = Integer.parseInt(request.getParameter("page"));
        }

        List<Pitch> list = pitchDAO.getAll(page, recordsPerPage);
        int noOfRecords = pitchDAO.getNoOfRecords();
        int noOfPages = (int) Math.ceil(noOfRecords * 1.0 / recordsPerPage);

        request.setAttribute("pitchList", list);
        request.setAttribute("noOfPages", noOfPages);
        request.setAttribute("currentPage", page);

        RequestDispatcher dispatcher = request.getRequestDispatcher("pitch-list.jsp");
        dispatcher.forward(request, response);
    }

    // Show form for creating a new pitch
    private void showNewForm(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        RequestDispatcher dispatcher = request.getRequestDispatcher("pitch-form.jsp");
        dispatcher.forward(request, response);
    }

    // Insert a new pitch
    private void insertPitch(HttpServletRequest request, HttpServletResponse response) throws IOException {
        String pitchID = request.getParameter("pitchID");
        int pitchType = Integer.parseInt(request.getParameter("pitchType"));
        int status = Integer.parseInt(request.getParameter("status"));
        String image = request.getParameter("image");
        float pricePitch = Float.parseFloat(request.getParameter("pricePitch"));

        Pitch newPitch = new Pitch(pitchID, pitchType, status, image, pricePitch);
        pitchDAO.insertPitch(newPitch);
        response.sendRedirect("PitchController?action=list");
    }

    // Show form for editing an existing pitch
    private void showEditForm(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String pitchID = request.getParameter("pitchID");
        Pitch existingPitch = pitchDAO.getPitchByID(pitchID);
        RequestDispatcher dispatcher = request.getRequestDispatcher("pitch-form.jsp");
        request.setAttribute("pitch", existingPitch);
        dispatcher.forward(request, response);
    }

    // Update an existing pitch
    private void updatePitch(HttpServletRequest request, HttpServletResponse response) throws IOException {
        String pitchID = request.getParameter("pitchID");
        int pitchType = Integer.parseInt(request.getParameter("pitchType"));
        int status = Integer.parseInt(request.getParameter("status"));
        String image = request.getParameter("image");
        float pricePitch = Float.parseFloat(request.getParameter("pricePitch"));

        Pitch pitch = new Pitch(pitchID, pitchType, status, image, pricePitch);
        pitchDAO.updatePitch(pitch);
        response.sendRedirect("PitchController?action=list");
    }

    // Delete a pitch
    private void deletePitch(HttpServletRequest request, HttpServletResponse response) throws IOException {
        String pitchID = request.getParameter("pitchID");
        pitchDAO.deletePitch(pitchID);
        response.sendRedirect("PitchController?action=list");
    }

}
