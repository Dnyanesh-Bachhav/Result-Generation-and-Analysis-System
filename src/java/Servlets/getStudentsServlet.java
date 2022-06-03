package Servlets;

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author DELL
 */
@WebServlet(urlPatterns = {"/getStudentsServlet"})
public class getStudentsServlet extends HttpServlet {
    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
            
            HttpSession session = request.getSession();
            PrintWriter out = response.getWriter();
            String sub = request.getParameter("sub");
            if(!"None".equals(sub))
            {
            session.setAttribute("sub", sub);
            response.sendRedirect("InvigilatorsPanel/getStudents2.jsp");
            }
            else
            {
                response.sendRedirect("InvigilatorsPanel/invigilatorPanel.jsp");
            }
            
//          RequestDispatcher rd = request.getRequestDispatcher("getStudents.jsp");
//          rd.forward(request, response);
                
    }
}
