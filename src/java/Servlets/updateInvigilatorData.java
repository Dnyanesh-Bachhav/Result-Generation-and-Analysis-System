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
@WebServlet(name = "updateInvigilatorData", urlPatterns = {"/updateInvigilatorData"})
public class updateInvigilatorData extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        PrintWriter out = response.getWriter();
        Session session1;
        SessionFactory sf;
        String userId = request.getParameter("username");
        String exp = request.getParameter("exp1");
        String qual = request.getParameter("qual1");
        String addr = request.getParameter("addr1");
        String pass = request.getParameter("pass1");
        Integer dept = Integer.parseInt(request.getParameter("dept1"));
        String email = request.getParameter("email1");
        long phoneno = Long.parseLong(request.getParameter("phoneno1"));

        sf = SessionFact.getSessionFact();
        session1 = sf.openSession();
        Transaction tx = session1.beginTransaction();
        String hql2 ="update Invigilator_details ind set ind.experience=?,ind.qualification=?,ind.address=?,ind.invigilatorPassword=?,ind.department=?,ind.emailId=?,ind.contactNumber=?  where ind.invigilatorId=?";
        Query query2=session1.createQuery(hql2);
                         // Set  parameters
                         query2.setParameter(0,exp);
                         query2.setParameter(1,qual);
                         query2.setParameter(2,addr);
                         query2.setParameter(3,pass);
                         query2.setParameter(4,dept);
                         query2.setParameter(5,email);
                         query2.setParameter(6,phoneno);
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
