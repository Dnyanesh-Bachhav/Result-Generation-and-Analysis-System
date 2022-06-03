/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Servlets;

import HelpingClasses.SessionFact;
import com.google.gson.Gson;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;

/**
 *
 * @author DELL
 */
@WebServlet(name = "Retrieve", urlPatterns = {"/Retrieve"})
public class Retrieve extends HttpServlet {

    /**
     * Processe@WebServlet(name = "Retrieve", urlPatterns = {"/Retrieve"})s requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        Session session1;
        SessionFactory sf;
        PrintWriter out = response.getWriter();
        Gson gson = new Gson();
        String courseId = (String) request.getParameter("courseId");
        //String courseId = "IF6544";
        response.setContentType("application/json");
        sf = SessionFact.getSessionFact();
        session1 = sf.openSession();
        Transaction tx = session1.beginTransaction();
        List<Object[]> list = session1.createSQLQuery("select t1.regno,t1.course_code,t2.Periodic_Test,t2.Theory,t2.Termwork,t2.Practical,t2.Oral from examreg t1 inner join student_courses t2 on t1.regno = t2.Student_Id and t1.course_code = t2.Course_Code where t1.course_code='"+courseId+"' order by t2.Student_Id").list();
        
        tx.commit();
        session1.close();
        out.print(gson.toJson(list));
        out.flush();

    }
}
