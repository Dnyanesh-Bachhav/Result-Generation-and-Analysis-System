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
 * @author tppat
 */
@WebServlet(name = "RetrieveInvigilator", urlPatterns = {"/RetrieveInvigilator"})
public class RetrieveInvigilator extends HttpServlet {

      @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        Session session1;
        SessionFactory sf;
        PrintWriter out = response.getWriter();
        Gson gson = new Gson();
        int dept_Id  = Integer.parseInt(request.getParameter("dept_code"));
        response.setContentType("application/json");
        sf = SessionFact.getSessionFact();
        session1 = sf.openSession();
        Transaction tx = session1.beginTransaction();
        List<Object[]> list = session1.createSQLQuery("select Invigilator_Id, Invigilator_Name,Invigilator_Base, Qualification, Designation, Specialized_Subject1,Specialized_Subject2,Specialized_Subject3,Specialized_Subject4,Department from invigilator_details where department='"+dept_Id+"'").list();
        
        tx.commit();
        session1.close();
        out.print(gson.toJson(list));
        out.flush();

    }

}
