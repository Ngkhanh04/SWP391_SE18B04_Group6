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
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.List;
import model.Pitch;

/**
 *
 * @author Admin
 */
public class PitchServlet extends HttpServlet {
   
    
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    int page = 1;
        int recordsPerPage = 4;
        if(request.getParameter("page") != null){
            page = Integer.parseInt(request.getParameter("page"));
        }

        PitchDAO dal = new PitchDAO();
        List<Pitch> list = dal.getAll(page, recordsPerPage);
        int noOfRecords = dal.getNoOfRecords();
        int noOfPages = (int) Math.ceil(noOfRecords * 1.0 / recordsPerPage);
        System.out.println("nghia");
        System.out.println(list.size());
        for(int i=0;i<list.size();i++){
        System.out.println(list.get(i).getPitchID());}
        System.out.println("nghia");
        System.out.println(noOfPages +"              "+page);
        request.setAttribute("pitchList", list);
        request.setAttribute("noOfPages", noOfPages);
        request.setAttribute("currentPage", page);

        RequestDispatcher dispatcher = request.getRequestDispatcher("listPitch.jsp");
        dispatcher.forward(request, response);
    }
    
    

}