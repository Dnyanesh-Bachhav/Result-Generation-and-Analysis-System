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
 * @author DELL
 */
@WebServlet(name = "updateStatus", urlPatterns = {"/updateStatus"})
public class updateStatus extends HttpServlet {
    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        PrintWriter out = response.getWriter();
        Session session1;
        SessionFactory sf;
        int id = Integer.parseInt(request.getParameter("id"));
        String name = (String) request.getParameter("name");



        sf = SessionFact.getSessionFact();
        session1 = sf.openSession();
        Transaction tx = session1.beginTransaction();
        String hql2 ="update message m set m.status=? where m.receiver=? and m.msgId=?";
        Query query2=session1.createQuery(hql2);
                         // Set  parameters
                         query2.setParameter(0,Boolean.TRUE);
                         query2.setParameter(1,name);
                         query2.setParameter(2,id);


         query2.executeUpdate();
        tx.commit();
        session1.close();
        //response.setContentType("application/json");
        out.print("Updated Succesfully...!!!");
        out.flush();
    }
}
