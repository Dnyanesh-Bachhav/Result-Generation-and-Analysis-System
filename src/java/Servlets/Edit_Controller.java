/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Servlets;

import HelpingClasses.SessionFact;
import beans.StudentCourses;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import mainController.invigilatorsCon;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;

/**
 *
 * @author DELL
 */
@WebServlet(name = "Edit_Controller", urlPatterns = {"/Edit_Controller"})
public class Edit_Controller extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        PrintWriter out = response.getWriter();
        Session session1;
        SessionFactory sf;
        int roll = Integer.parseInt(request.getParameter("sid"));
        String courseId = (String) request.getParameter("courseId");

        String pt = request.getParameter("pt");
        String th = request.getParameter("th");
        int tw = Integer.parseInt(request.getParameter("tw"));
        int pr = Integer.parseInt(request.getParameter("pr"));
        int or = Integer.parseInt(request.getParameter("or"));

        sf = SessionFact.getSessionFact();
        session1 = sf.openSession();
        Transaction tx = session1.beginTransaction();
        String hql2 ="update StudentCourses sc set sc.periodicTest=?,sc.theory=?,sc.termwork=?,sc.practical=?,sc.oral=?   where sc.studentId=? and sc.courseCode=?";
        Query query2=session1.createQuery(hql2);
                         // Set  parameters
                         query2.setParameter(0,pt);
                         query2.setParameter(1,th);
                         query2.setParameter(2,tw);
                         query2.setParameter(3,pr);
                         query2.setParameter(4,or);
                         query2.setParameter(5,roll);
                         query2.setParameter(6,courseId);


         query2.executeUpdate();
        tx.commit();
        session1.close();
        //response.setContentType("application/json");
        out.print("Updated Succesfully...!!!");
        out.flush();

    }

}
