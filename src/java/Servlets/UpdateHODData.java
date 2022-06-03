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
@WebServlet(name = "UpdateHODData", urlPatterns = {"/UpdateHODData"})
public class UpdateHODData extends HttpServlet {

@Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        PrintWriter out = response.getWriter();
        Session session1;
        SessionFactory sf;
        String userId = request.getParameter("uname");
        String fname = request.getParameter("name1");
        String lname = request.getParameter("lname1");
        String program = request.getParameter("department");
        String edu = request.getParameter("education1");
        String user = request.getParameter("user");
        int shift = Integer.parseInt(request.getParameter("shift1"));

        sf = SessionFact.getSessionFact();
        session1 = sf.openSession();
        Transaction tx = session1.beginTransaction();
        String hql2 ="update Hod_data hd set hd.fname=?,hd.lname=?,hd.education=?,hd.programme=?,hd.user=?,hd.username=?,hd.shift=?  where hd.username=?";
        Query query2=session1.createQuery(hql2);
                         // Set  parameters
                         query2.setParameter(0,fname);
                         query2.setParameter(1,lname);
                         query2.setParameter(2,edu);
                         query2.setParameter(3,program);
                         query2.setParameter(4,user);
                         query2.setParameter(5,userId);
                         query2.setParameter(6,shift);
                         query2.setParameter(7,userId);


         query2.executeUpdate();
        tx.commit();
        session1.close();
        //response.setContentType("application/json");
        out.print("Updated Succesfully...!!!");
//        out.print(userId);
//        out.print(exp);
    out.flush();

    }
}
