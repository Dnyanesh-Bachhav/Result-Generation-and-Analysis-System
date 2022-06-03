/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Servlets;

import HelpingClasses.SessionFact;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;

/**
 *
 * @author tppat
 */
@WebServlet(name = "Hod_Controller1", urlPatterns = {"/Hod_Controller1"})
public class Hod_Controller1 extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        PrintWriter out = resp.getWriter();
        Session session1;
        SessionFactory sf;
        String uname = req.getParameter("uname");
        String fname = req.getParameter("name1");
        String lname = req.getParameter("lname1");
        String education = req.getParameter("education1");
        String user = req.getParameter("user");
        String department = req.getParameter("department");
        int shift = Integer.parseInt(req.getParameter("shift1"));
        out.println("username"+uname);
        out.println("First Name"+fname);
        sf = SessionFact.getSessionFact();
        session1 = sf.openSession();
        Transaction tx = session1.beginTransaction();
        String hql2 = "update hod_data hd set hd.firstname=?,hd.lastname=?,hd.education=?,hd.user=?,hd.programme=?,hd.shift=?   where hd.username=?";
        Query query2 = session1.createSQLQuery(hql2);
        // Set  parameters
        query2.setParameter(0, fname);
        query2.setParameter(1, lname);
        query2.setParameter(2, education);
        query2.setParameter(3, user);
        query2.setParameter(4, department);
        query2.setParameter(5, shift);
        query2.setParameter(6,uname);

        query2.executeUpdate();
        tx.commit();
        session1.close();
        //response.setContentType("application/json");
        out.print("Updated Succesfully...!!!");
        out.flush();

    }

}
